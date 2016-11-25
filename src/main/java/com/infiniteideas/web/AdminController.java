package com.infiniteideas.web;

import com.infiniteideas.service.CheckoutService;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserPersonalDetailsService userPersonalDetailsService;
    private final UserService userService;
    private final CheckoutService checkoutService;

    @Autowired
    public AdminController(UserPersonalDetailsService userPersonalDetailsService, UserService userService, CheckoutService checkoutService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.userService = userService;
        this.checkoutService = checkoutService;
    }

    @RequestMapping(value = {"", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        model.addAttribute("locations", userPersonalDetailsService.getCustomerLocations());
        model.addAttribute("signUps", userService.getSignUps());
        model.addAttribute("revenue", checkoutService.getRevenue());
        return "admin/welcome";
    }
}
