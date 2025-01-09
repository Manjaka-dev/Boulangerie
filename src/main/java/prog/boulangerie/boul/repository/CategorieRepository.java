package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Categorie;

@Repository
public interface CategorieRepository extends JpaRepository<Categorie, Integer> {

}
