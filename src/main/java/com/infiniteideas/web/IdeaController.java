package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
@RequestMapping("/Ideas")
public class IdeaController {

    private final IdeaService ideaService;
    private final UserService userService;

    @Autowired
    public IdeaController(IdeaService service, UserService userService){
        this.ideaService = service;
        this.userService = userService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model, Principal principal){
        model.addAttribute("ideas", ideaService.findAll());
        model.addAttribute("role", userService.findByUsername(principal.getName()).getSelectedRole().toLowerCase());
        return "listIdeas";
    }


    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model){
        model.addAttribute("Idea",ideaService.findById(id));
        return "editIdea";
    }


    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Long id, Model model){
        model.addAttribute("Idea",ideaService.findById(id));
        return "viewIdea";
    }


    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(Idea idea){
        ideaService.save(idea);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "create",  method = RequestMethod.GET)
    public String create(){
        return "createIdea";
    }


    @RequestMapping(value = "header",  method = RequestMethod.GET)
    public String header(){
        return "header";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Idea idea){
        ideaService.save(idea);
        return "redirect:/welcome";
    }

}
