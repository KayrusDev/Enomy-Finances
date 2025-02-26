package com.enomyfinances.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.SavingsAndInvestments;
import com.enomyfinances.entity.User;
import com.enomyfinances.service.CurrencyExchangeService;
import com.enomyfinances.service.SavingsAndInvestmentsService;
import com.enomyfinances.service.UserService;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    
    @Autowired
    private SavingsAndInvestmentsService investmentsService;
    
    @Autowired
    private CurrencyExchangeService exchangeService;

    @GetMapping("/adminpage")
    public ModelAndView showAdminPage() {
        ModelAndView modelAndView = new ModelAndView("adminpage");
        
        // Get all users
        List<User> users = userService.findAllUsers();
        modelAndView.addObject("users", users);
        modelAndView.addObject("totalUsers", users.size());
        
        // Get all investments
        List<SavingsAndInvestments> investments = investmentsService.getAllInvestments();
        modelAndView.addObject("investments", investments);
        modelAndView.addObject("totalInvestments", investments.size());
        
        // Get all currency exchanges
        List<CurrencyExchange> exchanges = exchangeService.getAllExchanges();
        modelAndView.addObject("exchanges", exchanges);
        
        return modelAndView;
    }
}

