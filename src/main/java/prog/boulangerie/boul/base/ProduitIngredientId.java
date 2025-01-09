package prog.boulangerie.boul.base;

import java.io.Serializable;
import java.util.Objects;

public class ProduitIngredientId implements Serializable {
    private Long produit; // Doit correspondre au type de l'ID de Produit
    private Long ingredient; // Doit correspondre au type de l'ID d'Ingredient

    // Constructeurs par défaut, equals() et hashCode()
    public ProduitIngredientId() {}

    public ProduitIngredientId(Long produit, Long ingredient) {
        this.produit = produit;
        this.ingredient = ingredient;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProduitIngredientId that = (ProduitIngredientId) o;
        return Objects.equals(produit, that.produit) && Objects.equals(ingredient, that.ingredient);
    }

    @Override
    public int hashCode() {
        return Objects.hash(produit, ingredient);
    }
}
