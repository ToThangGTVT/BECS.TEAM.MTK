package fa.tranning.becs.repository;

import fa.tranning.becs.entity.Promotion;

import java.util.List;

public interface PromotionRepository {
    List<Promotion> findPromotionByCoulpon(String coulpon);
}
