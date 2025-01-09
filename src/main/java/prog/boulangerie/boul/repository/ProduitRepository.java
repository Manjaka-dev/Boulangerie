package prog.boulangerie.boul.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Produit;

@Repository
public interface ProduitRepository extends JpaRepository<Produit, Long> {

    @Query("SELECT p FROM Produit p WHERE p.categorie.id = :typeId AND p.id IN :produitIds")
    List<Produit> findByTypeAndIds(@Param("typeId") Integer typeId, @Param("produitIds") List<Integer> produitIds);
}
