package prog.boulangerie.boul.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prog.boulangerie.boul.base.Produit;
import prog.boulangerie.boul.repository.ProduitIngredientRepository;
import prog.boulangerie.boul.repository.ProduitRepository;

@Service
public class ProduitService {

    @Autowired
    private ProduitRepository produitRepository;

    @Autowired
    private ProduitIngredientRepository produitIngredientRepository;

    public List<Produit> findProduitsByTypeAndIngredients(Long typeId, List<Integer> ingredientIds) {
        // Étape 1 : Récupérer les IDs des produits correspondant aux ingrédients
        List<Long> produitIds = produitIngredientRepository.findProduitsByIngredientIds(ingredientIds, (int) ingredientIds.size());

        if (produitIds.isEmpty()) {
            return List.of(); // Aucun produit correspondant
        }

        // Étape 2 : Filtrer les produits par type
        return produitRepository.findByTypeAndIds(typeId, produitIds);
    }
}