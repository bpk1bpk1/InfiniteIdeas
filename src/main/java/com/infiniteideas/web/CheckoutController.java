package com.infiniteideas.web;

import com.infiniteideas.model.ShoppingCartItem;
import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.security.Principal;
import java.util.Map;

@Controller
@RequestMapping(value = "/cart")
public class CheckoutController {

    private CheckoutService checkoutService;

    @Autowired
    public CheckoutController(CheckoutService checkoutService){
        this.checkoutService = checkoutService;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String view(){
        return "checkout";
    }

    @ResponseBody
    @RequestMapping(value = "/fund", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    public JsonResponse fund(@RequestBody Map<String, ShoppingCartItem> cart, Principal principal){
        checkoutService.makeTransactions(cart, principal.getName());
        return new JsonResponse("OK", "");
    }
}
