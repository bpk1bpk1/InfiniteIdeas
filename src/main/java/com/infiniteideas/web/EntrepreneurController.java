package com.infiniteideas.web;

import com.infiniteideas.service.UserPersonalDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.Hashtable;

@Controller
@RequestMapping("/entrepreneur")
public class EntrepreneurController {
    private final UserPersonalDetailsService userPersonalDetailsService;

    @Autowired
    public EntrepreneurController(UserPersonalDetailsService userPersonalDetailsService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String test(Model model){
        model.addAttribute("locations", userPersonalDetailsService.getCustomerLocations());
        return "map";
    }

    @RequestMapping(value = {"", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, Principal principal) {
        Hashtable<String, String> location = userPersonalDetailsService.getUsersNearMe(principal.getName());
        model.addAttribute("locations", location);
        return "entrepreneur/welcome";
    }
}
