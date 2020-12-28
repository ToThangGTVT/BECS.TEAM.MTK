package fa.tranning.becs.controller.customer;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import fa.tranning.becs.entity.Customer;
import fa.tranning.becs.repository.impl.CustomerRepositoryImpl;
import fa.tranning.becs.services.CustomerService;
import fa.tranning.becs.services.impl.CustomerServiceImpl;
import fa.tranning.becs.utility.ReportContent;
import fa.tranning.becs.validate.GroupLoginValidate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@PropertySource(value = "classpath:ValidationMessages.properties")
//@ImportResource(value = "classpath:ValidationMessages.properties")
public class LoginController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private Environment env;

//    @Autowired
//    public LoginController(CustomerServiceImpl customerService, Environment env) {
//        this.customerService = customerService;
//        this.env = env;
//    }

    // xử lý request và trả về trang login

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getFormLogin() {
        Customer customer = new Customer();
        ModelAndView mav = new ModelAndView();
        mav.addObject("customer", customer);
        mav.setViewName("/customer/login");
        return mav;
    }

    // xủ lý dữ liệu người dùng gửi lên

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView processLogin(@Validated(value = GroupLoginValidate.class)
                                     @ModelAttribute(value = "customer") Customer customer,
                                     BindingResult bindingResult, HttpServletRequest request,
                                     RedirectAttributes redirectAttributes) throws JsonProcessingException {

        ModelAndView mav = new ModelAndView();

        // kiểm tra dữ liệu gửi lên có phù hợp
        if (bindingResult.hasErrors()) {
            mav.setViewName("customer/login");
        } else {

            // kiểm tra tài khoản có tồn tại
            Customer resultCus = ((CustomerServiceImpl)customerService).checkLoginSuccess(customer);

            if (resultCus != null) {

                // thêm thông tin người dùng vào session
                HttpSession session = request.getSession();
                session.setAttribute("cusInfor", resultCus);

                // report content là đối dùng để lưu thông báo người dùng
                ReportContent report = new ReportContent(env.getProperty("cus.success.title"),
                        env.getProperty("cus.success.content"));

                // chuyển từ object sang json rồi trả về client
                ObjectMapper mapper=new ObjectMapper();
                String jsonReport=mapper.writeValueAsString(report);
                redirectAttributes.addFlashAttribute("success",jsonReport);
                mav.setViewName("redirect:/");
            } else {

                // report content là đối dùng để lưu thông báo người
                ReportContent report = new ReportContent(env.getProperty("cus.fail.title"),
                        env.getProperty("cus.fail.content"));

                // chuyển từ object sang json rồi trả về client
                ObjectMapper mapper=new ObjectMapper();
                String jsonReport=mapper.writeValueAsString(report);
                mav.addObject("error",jsonReport);
                mav.setViewName("customer/login");
            }
        }
        return mav;
    }
}
