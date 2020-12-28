package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.Promotion;
import fa.tranning.becs.repository.PromotionRepository;
import fa.tranning.becs.services.PromotionService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PromotionRepositoryImpl implements PromotionRepository {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(value = "transactionManager")
    public List<Promotion> findPromotionByCoulpon(String coulpon) {
        SessionFactory sFactory = hibernateTemplate.getSessionFactory();
        Session session = sFactory.getCurrentSession();
        NativeQuery query = session.createSQLQuery
                ("select * from Promotion where code=:coulpon").addEntity(Promotion.class);
        query.setParameter("coulpon", coulpon);
        List<Promotion> listPromotion=query.list();
        return listPromotion;
    }
}
