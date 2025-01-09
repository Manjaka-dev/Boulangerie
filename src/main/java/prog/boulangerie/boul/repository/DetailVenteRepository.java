package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.DetailVente;

@Repository
public interface DetailVenteRepository extends JpaRepository<DetailVente,Long> {

}
