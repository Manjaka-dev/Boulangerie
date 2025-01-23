package prog.boulangerie.boul.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prog.boulangerie.boul.base.Client;
import prog.boulangerie.boul.base.DetailVente;
import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.base.Vente;
import prog.boulangerie.boul.repository.CLientRepository;
import prog.boulangerie.boul.repository.DetailVenteRepository;
import prog.boulangerie.boul.repository.VenteRepository;

@Service
public class VenteService {

    @Autowired
    private VenteRepository venteRepository;

    @Autowired
    private DetailVenteRepository detailVenteRepository;

    @Autowired
    private CLientRepository cLientRepository;

    public void validationPanier(Map<Produit, Integer> panier, Long clientId) {
        // Vérifier si le panier est vide
        if (panier == null || panier.isEmpty()) {
            throw new IllegalArgumentException("Le panier est vide.");
        }

        // Récupérer le client depuis la base de données
        Client client = cLientRepository.findById(clientId)
                .orElseThrow(() -> new IllegalArgumentException("Client non trouvé avec l'ID : " + clientId));

        // Calculer le prix total de la vente
        double prixTotal = panier.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrixUnitaire().doubleValue() * entry.getValue())
                .sum();

        // Créer une nouvelle vente
        Vente vente = new Vente();
        vente.setDateVente(Timestamp.valueOf(LocalDateTime.now())); // Date actuelle
        vente.setPrixTotal(BigDecimal.valueOf(prixTotal));
        vente.setClient(client); // Associer le client à la vente

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

            // Enregistrer chaque détail de vente
            detailVenteRepository.save(detailVente);
        }
    }

    public float calculCommition(Vente vente){
        return vente.getPrixTotal().floatValue() * 0.1f;
    }

}
