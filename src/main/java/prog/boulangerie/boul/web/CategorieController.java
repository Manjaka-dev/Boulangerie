package prog.boulangerie.boul.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import prog.boulangerie.boul.base.Categorie;
import prog.boulangerie.boul.repository.CategorieRepository;
import prog.boulangerie.boul.repository.IngredientRepository;

// @Controller
// public class CategorieController {

//     @Autowired
//     private CategorieRepository categorieRepository;

//     // Méthode pour traiter les requêtes POST venant du formulaire
//     @PostMapping("/ajout-type")
//     public String ajouterType(@RequestParam List<Long> ingredientIds, Model model) {
//         // Récupération de toutes les catégories
//         List<Categorie> types = categorieRepository.findAll();

//         // Ajout des données au modèle pour les passer à la vue
//         model.addAttribute("ingredients", ingredientIds);
//         model.addAttribute("types", types);

//         // Retourner la vue "list-type-ingredient"
//         return "list-type-ingredient";
//     }

//     @GetMapping("/index")
//     public String index(Model model) {
//         return "index";
//     }
// }

@Controller
public class CategorieController {

    @Autowired
    private CategorieRepository categorieRepository;

    @Autowired
    private IngredientRepository ingredientRepository;

    @PostMapping("/ajout-type")
    public String ajouterType(@RequestParam("ingredientIds") List<String> ingredientIds, Model model) {
        // Convertir les IDs reçus en List<Long>
        List<Integer> ingredientIdsList = new ArrayList<>();
        for (String id : ingredientIds) {
            ingredientIdsList.add(Integer.parseInt(id));
        }

        List<Long> ingredientIdsListLong = new ArrayList<>();
        for (String id : ingredientIds) {
            ingredientIdsListLong.add(Long.parseLong(id));
        }

        // Récupérer les catégories (types)
        List<Categorie> types = categorieRepository.findAll();

        // Ajouter les données au modèle
        model.addAttribute("ingredients", ingredientRepository.findAllById(ingredientIdsList));
        model.addAttribute("ingredientId", ingredientIdsListLong);
        model.addAttribute("types", types);

        return "list-categorie-ingredient";
    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }
}
