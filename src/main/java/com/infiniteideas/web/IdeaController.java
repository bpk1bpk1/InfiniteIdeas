package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.RoleGetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/Ideas")
public class IdeaController {

    private final IdeaService ideaService;
    private final UserService userService;
    private RoleGetter roleGetter = new RoleGetter();

    @Autowired
    public IdeaController(IdeaService service, UserService userService){
        this.ideaService = service;
        this.userService = userService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model, Principal principal){
        String role = roleGetter.getRoles(userService, principal.getName());
        List<Idea> ideas = ideaService.findAll();
        HashSet<String> categories = new HashSet<>();
        HashSet<String>subcategories = new HashSet<>();
        HashSet<Double>funds  = new HashSet<>();

        for(Idea I :ideas)
        {
            categories.add(I.getCategory());
            subcategories.add(I.getSub_category());
            funds.add(I.getFundsRequired());
        }

        model.addAttribute("ideas", ideas);
        model.addAttribute("categories",categories);
        model.addAttribute("subcategories",subcategories);
        model.addAttribute("funds",funds);
        model.addAttribute("role", role);
        if (role.equals("investor"))
            return "investor/listIdeas";
        else
            return "entrepreneur/listIdeas";
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
