package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.DetailVente;
import java.util.List;
import java.util.Date;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface DetailVenteRepository extends JpaRepository<DetailVente,Long> {
    // @Query("SELECT dv FROM DetailVente dv WHERE dv.vente.date = :date AND dv.vente.vendeur.id = :vendeurId")
    // List<DetailVente> findByDateAndVendeurId(@Param("date") Date date, @Param("vendeurId") Long vendeurId);
}
