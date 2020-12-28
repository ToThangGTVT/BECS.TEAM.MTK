package fa.tranning.becs.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LogOutController {

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        HttpSession session = request.getSession();
        session.invalidate();

        mav.setViewName("redirect:/");
        return mav;
    }
}
