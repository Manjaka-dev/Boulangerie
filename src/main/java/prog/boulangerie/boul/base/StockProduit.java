package prog.boulangerie.boul.base;

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
@Table(name = "stock_produit")
@Data @AllArgsConstructor @NoArgsConstructor
public class StockProduit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_stock_produit")
    private Long id;

    @Column(name = "quantite_produit", nullable = false)
    private Integer quantiteProduit;

    @ManyToOne
    @JoinColumn(name = "id_produit", nullable = false)
    private Produit produit;
}