package com.infiniteideas.web;

import com.infiniteideas.model.Funding;
import com.infiniteideas.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class HistoryController {

    private HistoryService historyService;

    @Autowired
    public HistoryController(HistoryService historyService) {
        this.historyService = historyService;
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String history(Model model, Principal principal){
        List<Funding> test = historyService.findAllTransactions(principal.getName());
        model.addAttribute("history", test);
        System.out.println(test);
        return "history";
    }
}
