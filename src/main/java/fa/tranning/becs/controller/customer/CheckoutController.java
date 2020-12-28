package fa.tranning.becs.controller.customer;

import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Address;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.entity.Promotion;
import fa.tranning.becs.exception.CartNullException;
import fa.tranning.becs.exception.NegativeNumberException;
import fa.tranning.becs.services.CheckOutService;
import fa.tranning.becs.services.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class CheckoutController {

    private CheckOutService checkOutService;

    private PromotionService promotionService;

    @Autowired
    public CheckoutController(CheckOutService checkOutService, PromotionService promotionService) {
        this.checkOutService = checkOutService;
        this.promotionService = promotionService;
    }

    @GetMapping(value = "/checkout", produces = "application/x-www-form-urlencoded;charset=UTF-8")
    private ModelAndView showCheckout(HttpServletRequest request,
                                      @RequestParam(required = false) String coulpon)
            throws CartNullException {

        HttpSession session = request.getSession();
        List<Cart> carts = (List<Cart>) session.getAttribute("cartItem");
        if (carts == null || carts.isEmpty()) {
            throw new CartNullException();
        }

        Promotion promotion = promotionService.checkCoulpon(coulpon);

        ModelAndView mav = new ModelAndView();
        mav.addObject("customer", (Customer) session.getAttribute("cusInfor"));
        mav.addObject("promotion", promotion);
        mav.addObject("bookList", carts);
        mav.addObject("totalPrice", checkOutService.checkOutTotalPrice(carts, promotion));

        mav.setViewName("customer/checkout");
        return mav;
    }

    @PostMapping("/checkout")
    private ResponseEntity checkOut(HttpServletRequest request,
                                    @Valid Address address,
                                    @Valid Customer customer,
                                    BindingResult result,
                                    @RequestParam(value = "codePromotion", required = false) String codePromotion)
            throws CartNullException, NegativeNumberException {

        if (result.hasErrors()) {
            return new ResponseEntity(HttpStatus.BAD_GATEWAY);
        }

        HttpSession session = request.getSession();
        List<Cart> carts = (List<Cart>) session.getAttribute("cartItem");
        if (carts == null || carts.isEmpty()) {
            throw new CartNullException();
        }

        Promotion promotion = promotionService.checkCoulpon(codePromotion);
        checkOutService.saveOrder(carts, address, customer, promotion);
        session.removeAttribute("cartItem");

        return new ResponseEntity(HttpStatus.OK);
    }

    @ExceptionHandler(value = CartNullException.class)
    private ModelAndView handleEmailAlreadyUse() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/ExceptionCheckout");
        return mav;
    }
}
