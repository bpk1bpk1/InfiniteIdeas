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
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

@Controller
@RequestMapping("/entrepreneur")
public class EntrepreneurController {
    private final UserPersonalDetailsService userPersonalDetailsService;
    private final IdeaService ideaService;

    @Autowired
    public EntrepreneurController(UserPersonalDetailsService userPersonalDetailsService , IdeaService ideaService) {
        this.userPersonalDetailsService = userPersonalDetailsService;
        this.ideaService = ideaService;
    }

    @RequestMapping(value = {"", "/welcome", "/"}, method = RequestMethod.GET)
    public String welcome(Model model, Principal principal) {
        Hashtable<String, String> location = userPersonalDetailsService.getUsersNearMe(principal.getName());
        model.addAttribute("locations", location);
        return "entrepreneur/welcome";
    }


    @RequestMapping(value = {"/eWishList"}, method = RequestMethod.GET)
    public String wishlist(Model model, Principal principal) {
        List<Idea> ideas = ideaService.findAll();

        List<Idea> newIdeas = new ArrayList<Idea>();


        for (Idea idea:ideas)
        {
            String status = idea.getStatus();
            String createdStatus = "created";

            if(status != null && status.compareToIgnoreCase(createdStatus) == 0)
            {
                newIdeas.add(idea);
            }
        }

        model.addAttribute(newIdeas);

        return "entrepreneur/eWishList";
    }


}
