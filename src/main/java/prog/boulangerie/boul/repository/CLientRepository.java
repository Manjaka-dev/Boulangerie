package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Client;

@Repository
public interface CLientRepository extends JpaRepository<Client, Long> {

}
