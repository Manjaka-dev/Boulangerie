package prog.boulangerie.boul.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import prog.boulangerie.boul.base.Genre;
import prog.boulangerie.boul.base.Vendeur;
import prog.boulangerie.boul.repository.GenreRepository;
import prog.boulangerie.boul.repository.VendeurRepository;

@Controller
public class VendeurController {

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private VendeurRepository vendeurRepository;

    @GetMapping("/form-insert-vendeur")
    public String getFormInsertVendeur(Model model) {

        List<Genre> genres = genreRepository.findAll();
        model.addAttribute("genres", genres);

        return "form-insert-vendeur";
    }

    @PostMapping("/ajouter-vendeur")
    public String ajouterVendeur(
            @RequestParam("nomVendeur") String nomVendeur,
            @RequestParam("idGenre") Long idGenre) {
        Vendeur vendeur = new Vendeur();
        vendeur.setNomVendeur(nomVendeur);
        Genre genre = genreRepository.findById(idGenre).get();
        vendeur.setGenre(genre);

        vendeurRepository.save(vendeur);
        return "redirect:/liste-vendeurs";
    }

}
