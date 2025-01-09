package prog.boulangerie.boul.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.ProduitIngredient;
import prog.boulangerie.boul.base.ProduitIngredientId;

@Repository
public interface ProduitIngredientRepository extends JpaRepository<ProduitIngredient, ProduitIngredientId> {

    @Query("SELECT pi.produit.id " +
            "FROM ProduitIngredient pi " +
            "WHERE pi.ingredient.id IN :ingredientIds " +
            "GROUP BY pi.produit.id " +
            "HAVING COUNT(pi.ingredient.id) = :size")
    List<Integer> findProduitsByIngredientIds(@Param("ingredientIds") List<Integer> ingredientIds,
            @Param("size") int size);

}
