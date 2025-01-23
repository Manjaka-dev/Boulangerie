package prog.boulangerie.boul.base;

import java.util.List;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "genre")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_genre")
    private Long id;

    @Column(name = "nom_genre", nullable = false, unique = true)
    private String nomGenre;

    @OneToMany(mappedBy = "genre")
    private List<Vendeur> vendeurs;
}
