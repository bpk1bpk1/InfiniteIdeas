package com.infiniteideas.web;

import com.infiniteideas.model.User;
import com.infiniteideas.model.UserPersonalDetails;
import com.infiniteideas.service.SecurityService;
import com.infiniteideas.service.UserPersonalDetailsService;
import com.infiniteideas.service.UserService;
import com.infiniteideas.validator.UserValidator;
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
    private final UserValidator userValidator;
    private final UserPersonalDetailsService userPersonalDetailsService;

    @Autowired
    public LoginController(SecurityService securityService, UserValidator userValidator,
                          UserService userService, UserPersonalDetailsService userPersonalDetailsService) {
        this.securityService = securityService;
        this.userValidator = userValidator;
        this.userService = userService;
        this.userPersonalDetailsService = userPersonalDetailsService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "common/registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "common/registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/userDetails";
    }

    @RequestMapping(value = "/userDetails", method = RequestMethod.GET)
    public String userDetails(Model model){
        model.addAttribute("details", new UserPersonalDetails());
        return "common/userDetails";
    }

    @RequestMapping(value = "/userDetails", method = RequestMethod.POST)
    public String userDetails(@ModelAttribute("details") UserPersonalDetails form, BindingResult bindingResult,
                              Principal principal) {
        userValidator.validatePersonalData(form, bindingResult);

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
}
