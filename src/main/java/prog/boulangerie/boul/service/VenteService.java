package prog.boulangerie.boul.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prog.boulangerie.boul.base.DetailVente;
import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.base.Vente;
import prog.boulangerie.boul.repository.DetailVenteRepository;
import prog.boulangerie.boul.repository.ProduitRepository;
import prog.boulangerie.boul.repository.VenteRepository;

@Service
public class VenteService {

    @Autowired
    private VenteRepository venteRepository;

    @Autowired
    private DetailVenteRepository detailVenteRepository;

    @Autowired
    private ProduitRepository produitRepository;

    public void validationPanier(Map<Produit, Integer> panier) {
        // Vérifier si le panier est vide
        if (panier == null || panier.isEmpty()) {
            throw new IllegalArgumentException("Le panier est vide.");
        }

        // Calculer le prix total de la vente
        double prixTotal = panier.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrixUnitaire().doubleValue() * entry.getValue())
                .sum();

        // Créer une nouvelle vente
        Vente vente = new Vente();
        vente.setDateVente(Timestamp.valueOf(LocalDateTime.now())); // Conversion LocalDateTime en Timestamp
        vente.setPrixTotal(BigDecimal.valueOf(prixTotal));

        // Enregistrer la vente dans la base de données
        vente = venteRepository.save(vente);

        // Ajouter les détails de la vente
        for (Map.Entry<Produit, Integer> entry : panier.entrySet()) {
            Produit produit = entry.getKey();
            Integer quantite = entry.getValue();

            DetailVente detailVente = new DetailVente();
            detailVente.setVente(vente);
            detailVente.setProduit(produit);
            detailVente.setQuantite(quantite);

            // Enregistrer le détail de la vente
            detailVenteRepository.save(detailVente);

            produitRepository.save(produit);
        }
    }
}
