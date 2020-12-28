package fa.tranning.becs.services.impl;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.*;
import fa.tranning.becs.exception.NegativeNumberException;
import fa.tranning.becs.repository.OrderDetailRepository;
import fa.tranning.becs.repository.OrderRepository;
import fa.tranning.becs.services.BookSerivice;
import fa.tranning.becs.services.CheckOutService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

@Service
public class CheckOutServiceImpl implements CheckOutService {

    @Autowired
    private BookSerivice bookSerivice;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public BigDecimal checkOutTotalPrice(List<Cart> carts, Promotion promotion) {
        if (carts != null) {
            BigDecimal totalPrice = new BigDecimal(0);
            for (Cart cart : carts) {
                totalPrice = totalPrice.add(bookSerivice.getBookById(cart.getId()).getPrice().multiply(new BigDecimal(cart.getQuantityBuy())));
            }
            if (promotion != null) {
                return totalPrice.multiply(new BigDecimal(promotion.getDiscount() / 100.0));
            } else {
                return totalPrice;
            }

        }
        return null;
    }

    @Override
    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public void saveOrder(List<Cart> carts, Address address, Customer customer, Promotion promotion) throws NegativeNumberException {

        Order order = new Order();
        order.setOrderDate(Calendar.getInstance().getTime());
        order.setPromotion(promotion);
        BeanUtils.copyProperties(customer, order);
        BeanUtils.copyProperties(address, order);
        order.setStutus(1);
        orderRepository.save(order);

        for (Cart cart : carts) {
            Book book = bookSerivice.find(cart.getId());
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setBook(book);
            int quantity = cart.getQuantityBuy();
            if (quantity <= 0) {
                throw new NegativeNumberException();
            }
            if (quantity > book.getQuantity()) {
                throw new NegativeNumberException();
            }
            orderDetail.setQuantity(quantity);
            orderDetail.setPrice(book.getPrice().multiply(new BigDecimal(quantity)));
            orderDetail.setOrder(order);
            orderDetailRepository.save(orderDetail);

            book.setQuantity(book.getQuantity() - quantity);
            bookSerivice.update(book);
        }

    }
}
