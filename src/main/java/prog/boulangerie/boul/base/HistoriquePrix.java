package prog.boulangerie.boul.base;

import java.time.LocalDate;

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
@Table(name = "historique_prix")
@Data @AllArgsConstructor @NoArgsConstructor
public class HistoriquePrix {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historique_prix")
    private Long id;

    @Column(name = "prix", nullable = false)
    private Double prix;

    @Column(name = "date_modif", nullable = false)
    private LocalDate dateModif;

    @ManyToOne
    @JoinColumn(name = "id_produit", nullable = false)
    private Produit produit;
}