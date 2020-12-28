package fa.tranning.becs.exception.handler;

import fa.tranning.becs.exception.CategoryNotFound;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerGlobal {

    @ExceptionHandler(value = CategoryNotFound.class)
    public ModelAndView show404(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/ExceptionCategoryNotfound");
        return mav;
    }

}
