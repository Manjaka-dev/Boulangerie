package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Vente;

@Repository
public interface VenteRepository extends JpaRepository<Vente,Long> {

}
