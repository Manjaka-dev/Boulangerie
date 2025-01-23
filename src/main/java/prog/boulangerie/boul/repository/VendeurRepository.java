package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Vendeur;

@Repository
public interface VendeurRepository extends JpaRepository<Vendeur, Long> {
}
