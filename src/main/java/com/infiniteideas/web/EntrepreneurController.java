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
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

@Controller
@RequestMapping("/entrepreneur")
public class EntrepreneurController {
    private final UserPersonalDetailsService userPersonalDetailsService;
    private final IdeaService ideaService;
    private RoleGetter roleGetter = new RoleGetter();
    private final UserService userService;

    @Autowired
    public EntrepreneurController(UserPersonalDetailsService userPersonalDetailsService , IdeaService ideaService, UserService userService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.ideaService = ideaService;
        this.userService = userService;
    }

    @RequestMapping(value = {"", "/welcome", "/"}, method = RequestMethod.GET)
    public String welcome(Model model, Principal principal) {
        Hashtable<String, String> location = userPersonalDetailsService.getUsersNearMe(principal.getName());
        model.addAttribute("locations", location);
        return "entrepreneur/welcome";
    }


    @RequestMapping(value = {"/eWishList"}, method = RequestMethod.GET)
    public String wishlist(Model model, Principal principal) {
        List<Idea> allIdeas = ideaService.findAll();


        List<Idea> ideas = new ArrayList<Idea>();


        for (Idea idea:allIdeas)
        {
            //String status = idea.getStatus();
            //String funds = "created";

            if(idea.getFundsRequired() == 0)
            {
                ideas.add(idea);
            }
        }

        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        model.addAttribute("ideas",ideas);

        return "entrepreneur/eWishList";
    }


}
