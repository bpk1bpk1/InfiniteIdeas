package com.infiniteideas.web;

import com.infiniteideas.model.ContactForm;
import com.infiniteideas.model.User;
import com.infiniteideas.model.UserPersonalDetails;
import com.infiniteideas.service.SecurityService;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.utils.RoleGetter;
import com.infiniteideas.validator.ObjectValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class LoginController {

    private final UserService userService;
    private final SecurityService securityService;
    private final ObjectValidator objectValidator;
    private final UserPersonalDetailsService userPersonalDetailsService;
    private RoleGetter roleGetter = new RoleGetter();

    @Autowired
    public LoginController(SecurityService securityService, ObjectValidator objectValidator,
                           UserService userService, UserPersonalDetailsService userPersonalDetailsService) {
        this.securityService = securityService;
        this.objectValidator = objectValidator;
        this.userService = userService;
        this.userPersonalDetailsService = userPersonalDetailsService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "common/registration";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "accessDenied";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        objectValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "common/registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/userDetails";
    }

    @RequestMapping(value = "/contactus", method = RequestMethod.GET)
    public String contactus(Model model, Principal principal) {
        model.addAttribute("contactForm", new ContactForm());
        model.addAttribute("role", roleGetter.getRoles(userService, principal.getName()));
        return "common/contactus";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String contact(@ModelAttribute("contactForm") ContactForm contactForm, Model model, Principal principal) {
        System.out.println(contactForm);
        userService.sendMail(contactForm);
        String role = roleGetter.getRoles(userService, principal.getName());
        model.addAttribute("role", role);
        return "redirect:/" + role + "/welcome";
    }

    @RequestMapping(value = "/userDetails", method = RequestMethod.GET)
    public String userDetails(Model model){
        model.addAttribute("details", new UserPersonalDetails());
        return "common/userDetails";
    }

    @RequestMapping(value = "/userDetails", method = RequestMethod.POST)
    public String userDetails(@ModelAttribute("details") UserPersonalDetails form, BindingResult bindingResult,
                              Principal principal) {
        objectValidator.validatePersonalData(form, bindingResult);

        if (bindingResult.hasErrors()) {
            return "common/userDetails";
        }

        String userSelectedRole = userPersonalDetailsService.save(form, principal.getName());

        return "redirect:/"+ userSelectedRole.toLowerCase() + "/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "common/login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String home(Principal principal){

        String role = roleGetter.getRoles(userService, principal.getName());
        return "redirect:/" + role + "/welcome";
    }
}
