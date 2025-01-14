package prog.boulangerie.boul.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.repository.ProduitRepository;
import prog.boulangerie.boul.service.VenteService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class VenteController {

    @Autowired
    private ProduitRepository produitRepository;

    @Autowired
    private VenteService venteService;

    // Afficher la liste des produits
    @GetMapping("/ajout-produit-panier")
    public String getListProduit(Model model) {
        List<Produit> produits = produitRepository.findAll();
        model.addAttribute("produits", produits);
        return "ajout-panier"; // Assurez-vous que cette vue existe dans le dossier 'templates'
    }

    // Ajouter un produit au panier
    @PostMapping("/add-chart")
    public String ajouterPanier(
            @RequestParam("produitId") Long idProduit,
            @RequestParam("quantite") Integer quantite,
            HttpSession session,
            Model model) {

        // Chercher le produit dans la base de données
        Produit produit = produitRepository.findById(idProduit).orElse(null);
        if (produit == null) {
            // Si le produit n'est pas trouvé, afficher une erreur
            session.setAttribute("error", "Produit non trouvé.");
            return "erreur"; // Assurez-vous que la vue 'erreur.html' existe
        }

        // Récupérer le panier existant dans la session
        @SuppressWarnings("unchecked")
        Map<Produit, Integer> panierSession = (Map<Produit, Integer>) session.getAttribute("panier");

        // Si le panier existe déjà, mettre à jour la quantité ou l'ajouter s'il
        // n'existe pas
        if (panierSession == null) {
            panierSession = new HashMap<>(); // Si le panier n'existe pas, initialiser un nouveau panier
        }

        // Ajouter ou mettre à jour le produit dans le panier
        panierSession.put(produit, panierSession.getOrDefault(produit, 0) + quantite);

        // Enregistrer le panier dans la session
        session.setAttribute("panier", panierSession);

        List<Produit> produits = produitRepository.findAll();
        model.addAttribute("produits", produits);

        return "ajout-panier"; // Assurez-vous que cette vue existe et est bien configurée
    }

    @GetMapping("/annulation-panier")
    public String annulationPanier(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/afficher-panier")
    public String afficherPanier(HttpSession session, Model model) {
        // Récupérer le panier depuis la session
        @SuppressWarnings("unchecked")
        Map<Produit, Integer> panier = (Map<Produit, Integer>) session.getAttribute("panier");

        // Vérifier si le panier est vide
        if (panier == null || panier.isEmpty()) {
            model.addAttribute("message", "Votre panier est vide.");
        } else {
            model.addAttribute("panier", panier);

            // Calcul du total à payer
            double total = panier.entrySet().stream()
                    .mapToDouble(entry -> entry.getKey().getPrixUnitaire() * entry.getValue())
                    .sum();
            model.addAttribute("total", total);
        }

        return "panier"; // Assurez-vous que la vue "panier.html" existe
    }

    @PostMapping("/validation-panier")
    public String validationPanier(HttpSession session, RedirectAttributes redirectAttributes) {
        @SuppressWarnings("unchecked")
        Map<Produit, Integer> panier = (Map<Produit, Integer>) session.getAttribute("panier");

        try {
            venteService.validationPanier(panier);

            // Vider le panier après validation
            session.removeAttribute("panier");

            redirectAttributes.addFlashAttribute("message", "Vente validée avec succès !");
            return "redirect:/afficher-panier";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la validation du panier : " + e.getMessage());
            return "redirect:/afficher-panier";
        }
    }

}
