package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.IdeaService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.RoleGetter;
import com.infiniteideas.validator.ObjectValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
@RequestMapping("/Ideas")
public class IdeaController {

    private final IdeaService ideaService;
    private final UserService userService;
    private final ObjectValidator objectValidator;
    private RoleGetter roleGetter = new RoleGetter();

    @Autowired
    public IdeaController(IdeaService service, UserService userService, ObjectValidator objectValidator){
        this.ideaService = service;
        this.userService = userService;
        this.objectValidator = objectValidator;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model, Principal principal){
        String role = roleGetter.getRoles(userService, principal.getName());
        model.addAttribute("role", role);
        if (role.equals("entrepreneur")){
            model.addAttribute("ideas", ideaService.findAll());
            return "entrepreneur/listIdeas";
        }
        else{
            model.addAttribute("ideas", ideaService.findAll());
            return "investor/listIdeas";
        }
    }


    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("Idea",ideaService.findById(id));
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        model.addAttribute("mode", "edit");
        return "common/createIdea";
    }


    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("Idea",ideaService.findById(id));
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/viewIdea";
    }


    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(Idea idea, Principal principal){
        ideaService.save(idea, principal.getName());
        return "redirect:/welcome";
    }

    @RequestMapping(value = "create",  method = RequestMethod.GET)
    public String create(Model model, Principal principal) {
        model.addAttribute("ideaForm", new Idea());
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        model.addAttribute("mode", "create");
        return "common/createIdea";
    }


    @RequestMapping(value = "header",  method = RequestMethod.GET)
    public String header(){
        return "header";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String save(@ModelAttribute("ideaForm") Idea ideaForm, BindingResult bindingResult, Principal principal,
                       Model model){
        objectValidator.IdeaValidator(ideaForm, bindingResult);
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        if (bindingResult.hasErrors()) {
            return "common/createIdea";
        }

        ideaService.save(ideaForm, principal.getName());
        return "redirect:/welcome";
    }

}
