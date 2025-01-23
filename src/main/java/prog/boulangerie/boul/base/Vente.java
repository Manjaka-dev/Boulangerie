package prog.boulangerie.boul.base;

import java.math.BigDecimal;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "vente")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vente")
    private Long id;

    @Column(name = "date_vente", nullable = false)
    private Timestamp dateVente;

    @Column(name = "prix_total", nullable = false)
    private BigDecimal prixTotal;

    @ManyToOne
    @JoinColumn(name = "id_client", nullable = true) // Peut être null si aucun client
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_vendeur", nullable = false)
    private Vendeur vendeur;
}