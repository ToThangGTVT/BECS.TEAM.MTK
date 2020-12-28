package fa.tranning.becs.services;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Address;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.entity.Promotion;
import fa.tranning.becs.exception.NegativeNumberException;

import java.math.BigDecimal;
import java.util.List;

public interface CheckOutService {

    BigDecimal checkOutTotalPrice(List<Cart> carts, Promotion promotion);

    void saveOrder(List<Cart> carts, Address address, Customer customer, Promotion promotion) throws NegativeNumberException;
}
