package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserPersonalDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/investor")
public class InvestorController {
    private final UserPersonalDetailsService userPersonalDetailsService;
    private final IdeaService ideaService;

    @Autowired
    public InvestorController(UserPersonalDetailsService userPersonalDetailsService, IdeaService ideaService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.ideaService = ideaService;
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String test(Model model){
        model.addAttribute("locations", userPersonalDetailsService.getCustomerLocations());
        return "map";
    }

    @RequestMapping(value = {"", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, Principal principal) {
        List<Idea> recommendation = ideaService.getRecommendations();
        model.addAttribute("locations", userPersonalDetailsService.getUsersNearMe(principal.getName()));
        if (recommendation.size() > 4) {
            model.addAttribute("recommendation1", recommendation.subList(0, 4));
            model.addAttribute("recommendation2", recommendation.subList(4, recommendation.size()));
        }
        else
            model.addAttribute("recommendation1", recommendation);
        return "investor/welcome";
    }
}
