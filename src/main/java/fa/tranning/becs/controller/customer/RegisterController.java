package fa.tranning.becs.controller.customer;

import fa.tranning.becs.entity.Address;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.exception.EmailAlreadyUseException;
import fa.tranning.becs.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class RegisterController {

    private Customer customer;

    @Autowired
    private CustomerService customerService;

    @GetMapping("/register")
    private ModelAndView showRegister(){
        ModelAndView mav = new ModelAndView();
        mav.addObject(new Customer());
        mav.setViewName("customer/register");
        return mav;
    }

    @PostMapping(value = "/register")
    private ModelAndView postRegister(@Valid @ModelAttribute("customer") Customer customer,
                                      BindingResult bindingResult
    )
            throws EmailAlreadyUseException {

        this.customer = customer;
        ModelAndView mav = new ModelAndView();
        if (bindingResult.hasErrors()){
            mav.setViewName("customer/register");
        } else {
            Address address = customer.getAddress();
            customerService.save(customer,address);
            mav.setViewName("customer/login");
        }
        return mav;
    }

    @ExceptionHandler(value = EmailAlreadyUseException.class)
    private ModelAndView handleEmailAlreadyUse() {
        ModelAndView mav = new ModelAndView();
        mav.addObject(this.customer);
        mav.addObject("emailMsg","Email Already Use!");
        mav.setViewName("customer/register");
        return mav;
    }
}
