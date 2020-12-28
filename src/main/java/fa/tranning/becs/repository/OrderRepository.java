package fa.tranning.becs.repository;

import fa.tranning.becs.entity.Order;

import java.io.Serializable;

public interface OrderRepository {

    Serializable save(Order order);
}
