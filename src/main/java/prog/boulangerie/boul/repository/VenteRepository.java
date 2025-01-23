package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Genre;
import prog.boulangerie.boul.base.Vendeur;
import prog.boulangerie.boul.base.Vente;

import java.sql.Timestamp;
import java.util.List;


@Repository
public interface VenteRepository extends JpaRepository<Vente, Long> {

    List<Vente> findByClientId(Long clientId);

    @Query("SELECT v FROM Vente v WHERE v.vendeur = :vendeur AND v.dateVente BETWEEN :startDate AND :endDate")
    List<Vente> findVentesByVendeurAndDateRange(@Param("vendeur") Vendeur vendeur, @Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);

    @Query("SELECT v FROM Vente v WHERE v.vendeur.genre = :genre AND v.dateVente BETWEEN :startDate AND :endDate")
    List<Vente> findVentesByVendeurGenreAndDateRange(@Param("genre") Genre genre, @Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);
    
    @Query("SELECT v FROM Vente v WHERE v.dateVente BETWEEN :startDate AND :endDate")
    List<Vente> findByDateVenteBetween(Timestamp startDate, Timestamp endDate);

}

