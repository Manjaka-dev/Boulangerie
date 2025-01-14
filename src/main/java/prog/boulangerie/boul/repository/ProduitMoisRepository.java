package prog.boulangerie.boul.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.ProduitMois;

@Repository
public interface ProduitMoisRepository extends JpaRepository<ProduitMois,Long> {

    public List<ProduitMois> findByDateConseil(LocalDate date);

    @Query("SELECT p FROM ProduitMois p WHERE YEAR(p.dateConseil) = :annee AND MONTH(p.dateConseil) = :mois")
    List<ProduitMois> findByDateConseilYearAndMonth(@Param("annee") int annee, @Param("mois") int mois);
}
