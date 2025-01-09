package prog.boulangerie.boul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;

import prog.boulangerie.boul.service.ProduitService;


@SpringBootApplication
public class BoulApplication implements CommandLineRunner {

	@Autowired
	private ProduitService produitService;

	public static void main(String[] args) {
		SpringApplication.run(BoulApplication.class, args);
	}

	@Transactional
	@Override
	public void run(String... args) throws Exception {
		// System.out.println(ingredientRepository.findAll());
		
		// System.out.println(categorieRepository.findAll());
	}

}
