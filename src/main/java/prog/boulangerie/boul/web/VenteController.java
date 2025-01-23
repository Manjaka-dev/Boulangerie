package prog.boulangerie.boul.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import prog.boulangerie.boul.base.Client;
import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.base.Vendeur;
import prog.boulangerie.boul.base.Vente;
import prog.boulangerie.boul.repository.CLientRepository;
import prog.boulangerie.boul.repository.ProduitRepository;
import prog.boulangerie.boul.repository.VendeurRepository;
import prog.boulangerie.boul.repository.VenteRepository;
import prog.boulangerie.boul.service.VenteService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class VenteController {

    @Autowired
    private ProduitRepository produitRepository;

    @Autowired
    private VenteService venteService;

    @Autowired
    private CLientRepository clientRepository;

    @Autowired
    private VenteRepository venteRepository;

    @Autowired
    private VendeurRepository vendeurRepository;

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
        @SuppressWarnings("unchecked")
        Map<Produit, Integer> panier = (Map<Produit, Integer>) session.getAttribute("panier");

        // Charger tous les clients
        List<Client> clients = clientRepository.findAll();
        model.addAttribute("clients", clients);

        // Vérifier si le panier est vide
        if (panier == null || panier.isEmpty()) {
            model.addAttribute("message", "Votre panier est vide.");
        } else {
            model.addAttribute("panier", panier);

            // Calculer le total
            double total = panier.entrySet().stream()
                    .mapToDouble(entry -> entry.getKey().getPrixUnitaire() * entry.getValue())
                    .sum();
            model.addAttribute("total", total);
        }

        return "panier";
    }

    @PostMapping("/validation-panier")
    public String validationPanier(
            @RequestParam("clientId") Long clientId,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        @SuppressWarnings("unchecked")
        Map<Produit, Integer> panier = (Map<Produit, Integer>) session.getAttribute("panier");

        try {
            // Appeler le service pour valider le panier
            venteService.validationPanier(panier, clientId);

            // Vider le panier après validation
            session.removeAttribute("panier");

            redirectAttributes.addFlashAttribute("message", "Vente validée avec succès !");
            return "redirect:/ajout-produit-panier";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la validation du panier : " + e.getMessage());
            return "redirect:/afficher-panier";
        }
    }

    @GetMapping("/formulaire-recherche-client")
    public String getVenteParClient(Model model) {

        List<Client> clients = clientRepository.findAll();
        model.addAttribute("clients", clients);

        return "form-vente-client";
    }

    @GetMapping("/rechercher-ventes-client")
    public String rechercherVentesClient(@RequestParam("clientId") Long clientId, Model model) {
        List<Vente> ventes = venteRepository.findByClientId(clientId); // Suppose une méthode dans le repository
        model.addAttribute("ventes", ventes);
        return "resultats-ventes-client"; // Une vue pour afficher les résultats
    }

    @GetMapping("/liste-vente-commition")
    public String getVEnteCommition(Model model) {

        List<Vente> ventes = venteRepository.findAll();
        model.addAttribute("ventes", ventes);

        List<Float> commission = new ArrayList<>();

        for (Vente vente : ventes) {
            commission.add(venteService.calculCommition(vente));
        }

        model.addAttribute("commitions", commission);

        List<Vendeur> vendeurs  =vendeurRepository.findAll();
        model.addAttribute("vendeurs", vendeurs);

        return "liste-vente-commision";
    }

    @PostMapping("/liste-vente-commition")
    public String postMethodName(
        @RequestParam("dateFin") String dateFin, 
        @RequestParam("dateDebut") String dateDebut, 
        @RequestParam("vendeurId") Long vendeurId,
        Model model) {
        Vendeur vendeur = vendeurRepository.findById(vendeurId).get();

        Timestamp timestampFin = Timestamp.valueOf(dateFin + " 00:00:00");
        Timestamp timestampDebut = Timestamp.valueOf(dateDebut + " 00:00:00");

        List<Vente> ventes = venteRepository.findVentesByVendeurAndDateRange(vendeur, timestampDebut, timestampFin);
        model.addAttribute("ventes", ventes);

        List<Float> commitions = new ArrayList<>();

        for (Vente vente : ventes) {
            commitions.add(venteService.calculCommition(vente));
        }
        model.addAttribute("commitions", commitions);

        List<Vendeur> vendeurs = vendeurRepository.findAll();
        model.addAttribute("vendeurs", vendeurs);

        
        return "liste-vente-commision";
    }
    
    

}
