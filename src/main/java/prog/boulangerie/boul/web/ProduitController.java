package prog.boulangerie.boul.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import prog.boulangerie.boul.service.ProduitService;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class ProduitController {

    @Autowired
    private ProduitService produitService;

    @PostMapping("/submit")
    public String findProduitsByTypeAndIngredients( @RequestParam Long typeId, @RequestParam List<Long> ingredientIds, Model model) {
        model.addAttribute("produits", produitService.findProduitsByTypeAndIngredients(typeId, ingredientIds));
        return "affiche-liste";
    }

    @PostMapping("/afficher-liste")
    public String getMethodName(@RequestParam List<Long> ingredientIds, @RequestParam Long categorieId, Model model) {
        model.addAttribute("liste.produit", produitService.findProduitsByTypeAndIngredients(categorieId, ingredientIds));
        return "affiche-liste";
    }
    
}