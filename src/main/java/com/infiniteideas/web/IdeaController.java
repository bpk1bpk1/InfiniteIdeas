package com.infiniteideas.web;

import com.infiniteideas.service.IdeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/listIdeas")
public class IdeaController {

    private final IdeaService ideaService;

    @Autowired
    public IdeaController(IdeaService service){
        this.ideaService = service;
    }

    @RequestMapping(value = "")
    public String index(Model model){
        System.out.println(ideaService.findAll());
        model.addAttribute("ideas", ideaService.findAll());
        return "listIdeas";
    }
}
