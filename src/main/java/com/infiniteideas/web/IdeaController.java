package com.infiniteideas.web;

import com.infiniteideas.model.Idea;
import com.infiniteideas.service.CheckoutService;
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
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/Ideas")
public class IdeaController {

    private final IdeaService ideaService;
    private final UserService userService;
    private final ObjectValidator objectValidator;
    private final CheckoutService checkoutService;
    private RoleGetter roleGetter = new RoleGetter();

    @Autowired
    public IdeaController(IdeaService service, UserService userService, ObjectValidator objectValidator, CheckoutService checkoutService){
        this.ideaService = service;
        this.userService = userService;
        this.objectValidator = objectValidator;
        this.checkoutService = checkoutService;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String index(Model model, Principal principal){
        List<Idea> ideas = ideaService.findAll();
        HashSet<String> categories = new HashSet<>();
        HashSet<String>subcategories = new HashSet<>();
        HashSet<Double>funds  = new HashSet<>();

        for(Idea I :ideas) {
            categories.add(I.getCategory());
            subcategories.add(I.getSubCategory());
            funds.add(I.getFundsRequired());
        }

        model.addAttribute("ideas", ideas);
        model.addAttribute("categories",categories);
        model.addAttribute("subcategories",subcategories);
        model.addAttribute("funds",funds);

        model.addAttribute("ideas", ideaService.findAll());
        return "investor/listIdeas";
    }


    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("ideaForm",ideaService.findById(id));
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/editIdea";
    }


    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Long id, Model model, Principal principal){
        model.addAttribute("Idea",ideaService.findById(id));
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/viewIdea";
    }


    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(@ModelAttribute("ideaForm") Idea ideaForm){
        try {
            ideaService.updateAndSave(ideaForm);
        }
        catch (Exception e){
            System.out.println("Ignoring exception");
        }
        return "redirect:/welcome";
    }

    @RequestMapping(value = "create",  method = RequestMethod.GET)
    public String create(Model model, Principal principal) {
        model.addAttribute("ideaForm", new Idea());
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/createIdea";
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

    @RequestMapping(value = "return/{id}")
    public String cancelFund(@PathVariable Long id){
        try {
            checkoutService.deleteTransaction(id);
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return "redirect:/investor/history";
    }

}
