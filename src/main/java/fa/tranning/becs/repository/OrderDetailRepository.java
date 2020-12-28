package fa.tranning.becs.repository;

import fa.tranning.becs.entity.OrderDetail;

import java.io.Serializable;

public interface OrderDetailRepository {

    Serializable save(OrderDetail orderDetail);
}
