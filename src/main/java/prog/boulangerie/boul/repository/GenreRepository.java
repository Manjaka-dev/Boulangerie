package prog.boulangerie.boul.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import prog.boulangerie.boul.base.Genre;

@Repository
public interface GenreRepository extends JpaRepository<Genre, Long> {

}
