package com.infiniteideas.web;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.Idea;
import com.infiniteideas.service.HistoryService;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.security.Principal;
import java.util.Map;

@Controller
public class HistoryController {

    private final HistoryService historyService;
    private final UserService userService;

    @Autowired
    public HistoryController(HistoryService historyService, UserService userService) {
        this.historyService = historyService;
        this.userService = userService;
    }

    @RequestMapping(value = "/investor/history", method = RequestMethod.GET)
    public String history(Model model, Principal principal){
        Map<Funding, Idea> fundingHistory = historyService.findAllTransactions(principal.getName());
        model.addAttribute("history", fundingHistory);
        model.addAttribute("role", userService.findByUsername(principal.getName()).getSelectedRole());
        return "common/history";
    }
}
