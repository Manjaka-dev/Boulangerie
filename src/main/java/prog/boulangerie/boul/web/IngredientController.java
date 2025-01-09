package prog.boulangerie.boul.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import prog.boulangerie.boul.base.Ingredient;
import prog.boulangerie.boul.repository.IngredientRepository;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IngredientController {
    @Autowired
    private IngredientRepository ingredientRepository;

    
    @GetMapping("/")
    public String getChoixIngredients(Model model) {
        List<Ingredient> ingredients = ingredientRepository.findAll();
        model.addAttribute("ingredients", ingredients);
        return "choix-ingredients";
    }


}
