package prog.boulangerie.boul.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import prog.boulangerie.boul.base.Client;
import prog.boulangerie.boul.repository.CLientRepository;


@Controller
public class ClientController {

    private CLientRepository cLientRepository;

    @GetMapping("/ajouter-client")
    public String afficherFormulaireAjoutClient() {
        return "formulaire-ajout-client"; // Nom de la vue Thymeleaf
    }

    @PostMapping("/ajouter-client")
    public String ajouterClient(@RequestParam("nomClient") String nomClient) {
        Client client = new Client();
        client.setNomClient(nomClient);
        cLientRepository.save(client); // Enregistrement du client en base de données

        return "redirect:/ajout-client"; // Redirection vers la liste des clients
    }
    
}
