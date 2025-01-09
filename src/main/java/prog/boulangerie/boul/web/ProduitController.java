package prog.boulangerie.boul.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.service.ProduitService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @PostMapping("/submit")
    public String findProduitsByTypeAndIngredients(@RequestParam Integer typeId,
            @RequestParam List<Integer> ingredientIds, Model model) {
        model.addAttribute("produits", produitService.findProduitsByTypeAndIngredients(typeId, ingredientIds));
        return "affiche-liste";
    }

    @PostMapping("/afficher-liste")
    public String afficheListe(
            @RequestParam(required = false) String ingredientIds,
            @RequestParam(required = false) String categorieId,
            Model model) {

        Integer parsedCategorieId = null;
        List<Integer> parsedIngredientIds = new ArrayList<>();

        try {
            if (categorieId != null) {
                parsedCategorieId = Integer.parseInt(categorieId);
            }
        } catch (NumberFormatException e) {
            model.addAttribute("error", "Le paramètre catégorie est invalide.");
            return "erreur";
        }

        if (ingredientIds != null && !ingredientIds.isEmpty()) {
            try {
                parsedIngredientIds = Arrays.stream(ingredientIds.replace("[", "").replace("]", "").split(","))
                        .map(String::trim)
                        .map(Integer::parseInt)
                        .collect(Collectors.toList());
            } catch (NumberFormatException e) {
                model.addAttribute("error", "Un ou plusieurs ingrédients sont invalides : " + e.getMessage());
                return "erreur";
            }
        }

        // Validation des paramètres après parsing
        if (parsedCategorieId == null) {
            model.addAttribute("error", "La catégorie est obligatoire.");
            return "erreur";
        }

        if (parsedIngredientIds.isEmpty()) {
            model.addAttribute("error", "Veuillez fournir au moins un ingrédient.");
            return "erreur";
        }

        // Récupération des produits (assurez-vous que `produitService` fonctionne
        // correctement)
        List<Produit> produits = produitService.findProduitsByTypeAndIngredients(parsedCategorieId,
                parsedIngredientIds);

        if (produits == null || produits.isEmpty()) {
            model.addAttribute("error", "Aucun produit trouvé pour cette catégorie et ces ingrédients.");
            return "erreur";
        }

        // Ajouter les produits au modèle
        model.addAttribute("liste", Map.of("produit", produits));
        return "affiche-liste";
    }

}