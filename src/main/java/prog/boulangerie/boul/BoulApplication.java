package prog.boulangerie.boul;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;


@SpringBootApplication
public class BoulApplication implements CommandLineRunner {


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
