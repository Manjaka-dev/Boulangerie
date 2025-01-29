package prog.boulangerie.boul.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.HistoriquePrix;
import prog.boulangerie.boul.base.Produit;

@Repository
public interface HistoriquePrixRepository extends JpaRepository<HistoriquePrix, Long> {

    public List<HistoriquePrix> findByProduit(Produit produit);

    List<HistoriquePrix> findByDateModifBefore(LocalDate date);

    @Query("SELECT h FROM HistoriquePrix h WHERE h.produit.id = :produit AND h.dateModif <= :date ORDER BY h.dateModif DESC")
    public List<HistoriquePrix> findByProduitDate(Long produit, LocalDate date);
}
