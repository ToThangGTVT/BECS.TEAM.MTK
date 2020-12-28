package fa.tranning.becs.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditProfileContoller {

    @GetMapping(value = "/edit-profile")
    private ModelAndView showEditProfile(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("edit-profile");
        return mav;
    }
}
