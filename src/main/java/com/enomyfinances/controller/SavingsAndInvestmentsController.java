package com.enomyfinances.controller;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.SavingsAndInvestments;
import com.enomyfinances.entity.User;
import com.enomyfinances.repository.UserRepository;
import com.enomyfinances.service.SavingsAndInvestmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.enomyfinances.service.UserService;
import com.enomyfinances.service.CurrencyExchangeService;
import java.security.Principal;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
public class SavingsAndInvestmentsController {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private CurrencyExchangeService currencyExchangeService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private SavingsAndInvestmentsService investmentsService;

    @GetMapping("/investment")
    public ModelAndView showInvestmentPage() {
        ModelAndView mv = new ModelAndView("investment");
        mv.addObject("investment", new SavingsAndInvestments());
        return mv;
    }

    @PostMapping("/investmentsCalculate")
    public ModelAndView calculateInvestment(@RequestParam String investmentType,
                                          @RequestParam BigDecimal initialLumpSum,
                                          @RequestParam BigDecimal monthlyInvestment) {
        ModelAndView mv = new ModelAndView("investment");
        
        try {
            Map<String, Object> calculations = investmentsService.calculateInvestment(
                investmentType, 
                initialLumpSum, 
                monthlyInvestment
            );
            
            mv.addObject("calculationResult", calculations);
            mv.addObject("investment", new SavingsAndInvestments());
            mv.addObject("selectedType", investmentType);
            mv.addObject("selectedInitial", initialLumpSum);
            mv.addObject("selectedMonthly", monthlyInvestment);
            
        } catch (IllegalArgumentException e) {
            mv.addObject("error", e.getMessage());
        }
        
        return mv;
    }

    @PostMapping("/investmentsSave")
    public String saveInvestment(@RequestParam String investmentType,
                                @RequestParam BigDecimal initialLumpSum,
                                @RequestParam BigDecimal monthlyInvestment,
                                Principal principal,
                                RedirectAttributes redirectAttributes) {
        try {
            User user = userRepository.findByEmail(principal.getName());
            
            Map<String, Object> calculations = investmentsService.calculateInvestment(
                investmentType, 
                initialLumpSum, 
                monthlyInvestment
            );
            
            investmentsService.saveInvestment(user, investmentType, initialLumpSum, monthlyInvestment, calculations);
            
            redirectAttributes.addFlashAttribute("success", "Investment plan saved successfully!");
            return "redirect:/investment";
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/investment";
        }
    }

}
