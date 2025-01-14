package prog.boulangerie.boul.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.ProduitMois;

@Repository
public interface ProduitMoisRepository extends JpaRepository<ProduitMois,Long> {

    public List<ProduitMois> findByDateConseil(LocalDate date);
}
