package fa.tranning.becs.controller.customer;


import fa.tranning.becs.dto.Cart;
import fa.tranning.becs.entity.Book;
import fa.tranning.becs.services.BookSerivice;
import fa.tranning.becs.services.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/cart")
public class CartManagerController {

    private BookSerivice bookService;

    @Autowired
    public CartManagerController(BookSerivice bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public ResponseEntity<List<Cart>> addBookToCart(@RequestParam(value = "itemId") String itemId,
                                                    @RequestParam(value = "quantityAddMore") int quantityAddMore,
                                                    HttpServletRequest request) {
        ResponseEntity responseEntity;
        List<Cart> listCart = null;
        HttpSession session = request.getSession();
        int idBook = Integer.parseInt(itemId);
        listCart = (List<Cart>) session.getAttribute("cartItem");
        if (listCart == null) {
            listCart = new ArrayList<>();
            session.setAttribute("cartItem", listCart);
        }
        boolean result = bookService.getCartConvertFromBook(idBook, listCart,quantityAddMore);
        if (result) {
            responseEntity = new ResponseEntity(listCart, HttpStatus.CREATED);
        } else {
            responseEntity = new ResponseEntity(listCart, HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @RequestMapping(value = "/deleteCartItem", method = RequestMethod.POST)
    public ResponseEntity<List<Cart>> deleteCartItem(@RequestParam(value = "itemId") String itemId, HttpServletRequest request) {
        ResponseEntity responseEntity;
        List<Cart> listCart = null;
        HttpSession session = request.getSession();
        int idBook = Integer.parseInt(itemId);
        listCart = (List<Cart>) session.getAttribute("cartItem");
        boolean result = false;
        if (listCart == null) {
            listCart = new ArrayList<>();
            session.setAttribute("cartItem", listCart);
        } else {
            for (Cart cart : listCart) {
                if (cart.getId() == idBook) {
                    result = true;
                    listCart.remove(cart);
                    break;
                }
            }
        }
        if (result) {
            responseEntity = new ResponseEntity(listCart, HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity(listCart, HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }

    @RequestMapping(value = "/cartDetail")
    public ModelAndView showAllCartDetail(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Cart> listCart = (List<Cart>) session.getAttribute("cartItem");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/customer/CartDetail");
        mav.addObject("listCart", listCart);
        return mav;
    }

    @RequestMapping(value = "/reduceQuantity")
    public ResponseEntity reduceQuantityItem(@RequestParam(value = "itemId") String itemId,@RequestParam(value = "quantityAddMore") int  quantityAddMore, HttpServletRequest request) {
        ResponseEntity responseEntity;
        List<Cart> listCart = null;
        HttpSession session = request.getSession();
        int idBook = Integer.parseInt(itemId);
        listCart = (List<Cart>) session.getAttribute("cartItem");
        boolean result = false;
        System.out.println(quantityAddMore);
        if (listCart == null) {
            listCart = new ArrayList<>();
            session.setAttribute("cartItem", listCart);
        } else {
            result = bookService.getCartConvertFromBook(idBook, listCart,quantityAddMore);
        }
        if (result) {
            responseEntity = new ResponseEntity(listCart, HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity(listCart, HttpStatus.NOT_FOUND);
        }
        return responseEntity;

    }

    @RequestMapping(value = "/showAllCart",method = RequestMethod.POST)
    public ResponseEntity getAllCartItem(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Cart> listCart = (List<Cart>) session.getAttribute("cartItem");
        ResponseEntity responseEntity;
        if (listCart != null) {
            responseEntity = new ResponseEntity(listCart, HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity(listCart, HttpStatus.NOT_FOUND);
        }
        return responseEntity;

    }


//    @ExceptionHandler(NumberFormatException.class)
//    public
}

