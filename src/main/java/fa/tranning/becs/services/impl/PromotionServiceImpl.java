package fa.tranning.becs.services.impl;

import fa.tranning.becs.entity.Promotion;
import fa.tranning.becs.repository.PromotionRepository;
import fa.tranning.becs.services.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PromotionServiceImpl implements PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;

    @Override
    public Promotion checkCoulpon(String coulpon) {
        Promotion promotion=null;
        List<Promotion> listPromotion = promotionRepository.findPromotionByCoulpon(coulpon);
        if(listPromotion!=null && listPromotion.size()>0){
            promotion=listPromotion.get(0);
        }
        return promotion;
    }
}
