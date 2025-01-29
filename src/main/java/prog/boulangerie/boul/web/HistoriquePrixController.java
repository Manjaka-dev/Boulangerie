package prog.boulangerie.boul.web;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import prog.boulangerie.boul.base.HistoriquePrix;
import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.repository.HistoriquePrixRepository;
import prog.boulangerie.boul.repository.ProduitRepository;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HistoriquePrixController {

    @Autowired
    private ProduitRepository produitRepository;

    @Autowired
    private HistoriquePrixRepository historiquePrixRepository;

    @GetMapping("/get-historique-produit")
    public String getHistoriqueProduit(Model model) {
        List<HistoriquePrix> historiquePrixs = historiquePrixRepository.findAll();
        model.addAttribute("historiquePrixs", historiquePrixs);

        List<Produit> produits = produitRepository.findAll();
        model.addAttribute("produits", produits);

        return "historique-produit";
    }

    @PostMapping("/get-historique-produit")
    public String getFiltredHistoriqueProduit(
            @RequestParam("produit") long idProduit,
            @RequestParam(value = "date", required = false) LocalDate date,
            Model model) {
        if (idProduit != -1 && date == null) {
            List<Produit> produits = produitRepository.findAll();
            model.addAttribute("produits", produits);

            Produit produit = produitRepository.findById(idProduit).get();

            List<HistoriquePrix> historiquePrixs = historiquePrixRepository.findByProduit(produit);
            model.addAttribute("historiquePrixs", historiquePrixs);
            return "historique-produit";
        } else if (idProduit == -1 && date != null) {
            List<Produit> produits = produitRepository.findAll();
            model.addAttribute("produits", produits);
            List<HistoriquePrix> historiquePrixs = historiquePrixRepository.findByDateModifBefore(date);
            model.addAttribute("historiquePrixs", historiquePrixs);
            return "historique-produit";
        } else if (idProduit != -1 && date != null){
            List<Produit> produits = produitRepository.findAll();
            model.addAttribute("produits", produits);
            List<HistoriquePrix> historiquePrixs = historiquePrixRepository.findByProduitDate(idProduit, date);
            model.addAttribute("historiquePrixs", historiquePrixs);
            return "historique-produit";
        }
        List<Produit> produits = produitRepository.findAll();
        model.addAttribute("produits", produits);
        List<HistoriquePrix> historiquePrixs = historiquePrixRepository.findAll();
        model.addAttribute("historiquePrixs", historiquePrixs);
        return "historique-produit";
    }

}
