package com.infiniteideas.web;

import com.infiniteideas.service.UserPersonalDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserPersonalDetailsService userPersonalDetailsService;

    @Autowired
    public AdminController(UserPersonalDetailsService userPersonalDetailsService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
    }

    @RequestMapping(value = {"", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        model.addAttribute("locations", userPersonalDetailsService.getCustomerLocations());
        return "admin/welcome";
    }
}
