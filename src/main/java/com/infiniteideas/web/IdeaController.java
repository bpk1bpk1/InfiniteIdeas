package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Ideas")
public class IdeaController {

    private final IdeaService ideaService;

    @Autowired
    public IdeaController(IdeaService service){
        this.ideaService = service;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model){
        System.out.println(ideaService.findAll());
        model.addAttribute("ideas", ideaService.findAll());
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

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Idea idea){
        ideaService.save(idea);
        return "redirect:/welcome";
    }

}
