package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.RoleGetter;
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
    private final UserService userService;
    private RoleGetter roleGetter = new RoleGetter();

    @Autowired
    public InvestorController(UserPersonalDetailsService userPersonalDetailsService, IdeaService ideaService, UserService userService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.ideaService = ideaService;
        this.userService = userService;
    }

    @RequestMapping(value = "/wishlist", method = RequestMethod.GET)
    public String wishlist(Model model,Principal principal)
    {
         model.addAttribute("ideaForm", new Idea());
         model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
         return "investor/wishlist";
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
