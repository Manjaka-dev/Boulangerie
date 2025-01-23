package prog.boulangerie.boul.base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "vendeur")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vendeur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vendeur")
    private Long id;

    @Column(name = "nom_vendeur", nullable = false, unique = true)
    private String nomVendeur;
}