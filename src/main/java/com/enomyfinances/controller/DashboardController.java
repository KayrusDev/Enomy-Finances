package com.enomyfinances.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
public class DashboardController {
    @Autowired
    private UserService userService;

    @Autowired
    private CurrencyExchangeService exchangeService;

    @Autowired
    private SavingsAndInvestmentsService investmentService;

    @GetMapping("/userdash")
    public ModelAndView showDashboard() {
        ModelAndView modelAndView = new ModelAndView("userdash");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        User user = userService.findByEmail(email);

        List<CurrencyExchange> exchanges = exchangeService.findExchangesByUser(user);
        List<SavingsAndInvestments> investments = investmentService.findInvestmentsByUser(user);

        modelAndView.addObject("user", user);
        modelAndView.addObject("exchanges", exchanges);
        modelAndView.addObject("investments", investments);

        return modelAndView;
    }
} 