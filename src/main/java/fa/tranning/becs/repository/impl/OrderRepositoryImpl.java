package fa.tranning.becs.repository.impl;

import fa.tranning.becs.entity.Order;
import fa.tranning.becs.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public class OrderRepositoryImpl implements OrderRepository {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Serializable save(Order order) {
        return hibernateTemplate.save(order);
    }
}
