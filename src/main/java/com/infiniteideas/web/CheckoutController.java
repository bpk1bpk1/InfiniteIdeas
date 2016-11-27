package com.infiniteideas.web;

import com.infiniteideas.model.ShoppingCartItem;
import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.JsonResponse;
import com.infiniteideas.utils.RoleGetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private UserService userService;
    private RoleGetter roleGetter;

    @Autowired
    public CheckoutController(CheckoutService checkoutService, UserService userService){
        this.checkoutService = checkoutService;
        this.userService = userService;
        this.roleGetter = new RoleGetter();
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String view(Model model, Principal principal){
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/checkout";
    }

    @ResponseBody
    @RequestMapping(value = "/fund", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    public JsonResponse fund(@RequestBody Map<String, ShoppingCartItem> cart, Principal principal){
        checkoutService.makeTransactions(cart, principal.getName());
        return new JsonResponse("OK", "");
    }
}
