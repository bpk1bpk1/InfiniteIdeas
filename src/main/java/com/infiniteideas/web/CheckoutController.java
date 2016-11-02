package com.infiniteideas.web;

import com.infiniteideas.model.ShoppingCart;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.utils.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping(value = "/cart")
public class CheckoutController {

    private IdeaService ideaService;

    @Autowired
    public CheckoutController(IdeaService ideaService){
        this.ideaService = ideaService;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String view(){
        return "checkout";
    }

    @ResponseBody
    @RequestMapping(value = "/fund", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    public JsonResponse fund(@RequestBody Map<String, ShoppingCart> cart){
        System.out.println(cart);
        return new JsonResponse("OK", "");
    }
}
