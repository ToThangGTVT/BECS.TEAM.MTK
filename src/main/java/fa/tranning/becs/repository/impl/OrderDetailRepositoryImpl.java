package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.OrderDetail;
import fa.tranning.becs.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public class OrderDetailRepositoryImpl implements OrderDetailRepository {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Serializable save(OrderDetail orderDetail) {
        return hibernateTemplate.save(orderDetail);
    }
}
