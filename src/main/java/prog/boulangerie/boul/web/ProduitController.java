package prog.boulangerie.boul.web;

import java.time.LocalDate;
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
import prog.boulangerie.boul.base.ProduitMois;
import prog.boulangerie.boul.repository.ProduitMoisRepository;
import prog.boulangerie.boul.repository.ProduitRepository;
import prog.boulangerie.boul.service.ProduitService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @Autowired
    private ProduitRepository produitRepository;

    @Autowired
    private ProduitMoisRepository produitMoisRepository;

    @PostMapping("/chercher")
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

    @GetMapping("/form-insert-produit")
    public String getMethodName() {
        return "insertion-produit";
    }

    @PostMapping("/insert-produit")
    public String postMethodName(
            @RequestParam String nom,
            @RequestParam Double prixUnitaire,
            @RequestParam Boolean nature) {

        produitRepository.save(new Produit(null, nom, prixUnitaire, nature, null, null));

        return "redirect:/form-insert-produit";
    }

    @GetMapping("/form-inserer-produit-moi")
    public String getInsertProduitMois(Model model) {

        List<Produit> produits = produitRepository.findAll();

        // Passer la liste des produits et la date actuelle au modèle
        model.addAttribute("produits", produits);
        model.addAttribute("dateActuelle", LocalDate.now());

        return "insert-produit-mois";
    }

    @PostMapping("/insert-produit-moi")
    public String insertProduitMoi(
            @RequestParam Long produitId,
            @RequestParam String dateProduitMoi) {
        // Convertir la chaîne de date en LocalDate
        LocalDate dateProduit = LocalDate.parse(dateProduitMoi);

        // Récupérer le produit
        Produit produit = produitRepository.findById(produitId).get();

        // Sauvegarder le produit du mois avec la date
        produitMoisRepository.save(new ProduitMois(null, produit, dateProduit));

        return "redirect:/form-inserer-produit-moi";
    }

    @GetMapping("/afficher-produit-mois")
public String afficherProduitMoi(Model model) {
    // Obtenir l'année et le mois actuels
    LocalDate today = LocalDate.now();
    int annee = today.getYear();
    int mois = today.getMonthValue();

    // Chercher les produits qui correspondent à l'année et au mois
    List<ProduitMois> produitMois = produitMoisRepository.findByDateConseilYearAndMonth(annee, mois);

    model.addAttribute("produitMois", produitMois);

    return "afficher-liste-produit-mois";
}


    @GetMapping("/liste-produits")
    public String getListeProduit(Model model) {

        List<Produit> produits = produitRepository.findAll();

        model.addAttribute("produits", produits);
        return "liste-produit";
    }

}