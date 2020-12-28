package fa.tranning.becs.controller.admin;

import org.hibernate.cfg.PropertyHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

@Controller
@RequestMapping(value = "/admin")
public class AdminLoginController {

    @Autowired
    HttpSession session;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLogin() {
        ModelAndView view = new ModelAndView("admin/admLogin");
        session.setAttribute("adminInfo", null );
        return view;
    }
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout() {
        ModelAndView view = new ModelAndView("admin/admLogin");
        return view;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("user") String user, @RequestParam("password") String password) throws IOException {
        ModelAndView view;
        try (InputStream input = AdminLoginController.class
                .getClassLoader().getResourceAsStream("admin.properties");) {

            Properties properties = new Properties();

            // load a properties file
            properties.load(input);

            // load properties
            String adminUser = properties.getProperty("admin.username");
            String adminPassword = properties.getProperty("admin.password");

            if (adminUser.equals(user) && adminPassword.equals(password)) {
                System.out.println("ok");
                session.setAttribute("adminInfo", user );
                view = new ModelAndView("redirect:/admin/book/manage");
            } else {
                view = new ModelAndView("admin/admLogin");
                view.addObject("message", "Username or password incorrect!");
            }
        }
        return view;
    }

    @ExceptionHandler(IOException.class)
    public ModelAndView handleEmployeeNotFoundException(HttpServletRequest request, Exception ex){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/IOExceptionError");
        return modelAndView;
    }
}
