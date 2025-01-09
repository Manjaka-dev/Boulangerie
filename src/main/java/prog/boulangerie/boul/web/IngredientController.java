package prog.boulangerie.boul.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import prog.boulangerie.boul.base.Categorie;
import prog.boulangerie.boul.base.Ingredient;
import prog.boulangerie.boul.repository.CategorieRepository;
import prog.boulangerie.boul.repository.IngredientRepository;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IngredientController {
    @Autowired
    private IngredientRepository ingredientRepository;

    @Autowired
    private CategorieRepository categorieRepository;

    
    @GetMapping("/")
    public String getChoixIngredients(Model model) {
        List<Ingredient> ingredients = ingredientRepository.findAll();
        model.addAttribute("ingredients", ingredients);

        List<Categorie> categories = categorieRepository.findAll();
        model.addAttribute("categories", categories);
        return "formulaire";
    }

    


}
