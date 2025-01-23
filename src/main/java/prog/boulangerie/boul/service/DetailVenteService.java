package prog.boulangerie.boul.service;

import org.springframework.stereotype.Service;

import prog.boulangerie.boul.base.DetailVente;

@Service
public class DetailVenteService {
    public static float calculCommition(DetailVente detailVente) {
        return (float) (detailVente.getVente().getPrixTotal().floatValue() * 0.05);
    }
}
