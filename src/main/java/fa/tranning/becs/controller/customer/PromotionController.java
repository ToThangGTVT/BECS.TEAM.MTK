package fa.tranning.becs.controller.customer;

import fa.tranning.becs.entity.Promotion;
import fa.tranning.becs.services.impl.PromotionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ListIterator;

@RequestMapping(value = "/promotion")
@Controller
public class PromotionController {
    @Autowired
    private PromotionServiceImpl promotionService;

    @RequestMapping(value = "/checkCoulpon",method = RequestMethod.POST)
    public ResponseEntity
    checkCoulpon(@RequestParam("coulpon") String coulpon, HttpServletRequest request){

        Promotion promotion=promotionService.checkCoulpon(coulpon);

        HttpSession session = request.getSession();
        session.setAttribute("coupon",promotion);

        ResponseEntity responseEntity=null;
        if(promotion!=null){
            responseEntity=new ResponseEntity(promotion,HttpStatus.OK);
        }else{
            responseEntity=new ResponseEntity(promotion,HttpStatus.NOT_FOUND);
        }
        return responseEntity;
    }
}
