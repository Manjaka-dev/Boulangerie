package prog.boulangerie.boul.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import prog.boulangerie.boul.base.DetailVente;
import prog.boulangerie.boul.repository.DetailVenteRepository;
import prog.boulangerie.boul.service.DetailVenteService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class DetailVenteController {

    @Autowired
    DetailVenteRepository detailVenteRepository ;

    @GetMapping("/liste-detail-vente")
    public String getListDetailVente(Model model) {

        List<DetailVente> detailVentes = detailVenteRepository.findAll();

        List<Float> commision = new ArrayList<>();
        model.addAttribute("detailVentes", detailVentes);
        
        for (DetailVente detailVente : detailVentes) {
            commision.add(DetailVenteService.calculCommition(detailVente));
        }
        model.addAttribute("commition", commision);

        return "liste-detail-Vente";
    }

    // @PostMapping("/liste-detail-vente")
    // public String getFiltredDEtailVente(@RequestBody String date, @RequestBody Long vendeurId, Model model) {
    //     List<DetailVente> detailVentes = 
        
    //     // return "liste-detail-Vente";
    // }
    
    
}
