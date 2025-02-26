package com.enomyfinances.controller;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.User;
import com.enomyfinances.repository.UserRepository;
import com.enomyfinances.service.CurrencyExchangeService;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CurrencyExchangeController {

	@Autowired
	private UserRepository userRepository;
	private final CurrencyExchangeService currencyExchangeService;

	public CurrencyExchangeController(CurrencyExchangeService currencyExchangeService) {
		this.currencyExchangeService = currencyExchangeService;
	}

	@GetMapping("/currencyexchange")
	public ModelAndView showCurrencyExchange(@AuthenticationPrincipal User user) {
		ModelAndView mv = new ModelAndView("currency");
		mv.addObject("currencyExchange", new CurrencyExchange());
		List<String> currencies = List.of("USD", "EUR", "GBP", "JPY", "TRY", "BRL");
		mv.addObject("currencies", currencies);
		return mv;
	}

	@PostMapping("/exchange")
	public String processCurrencyExchange(@ModelAttribute("currencyExchange") CurrencyExchange currencyExchange,
			BindingResult result, Principal principal, Model model) {

		if (result.hasErrors()) {
			List<String> currencies = List.of("USD", "EUR", "GBP", "JPY", "TRY", "BRL");
			model.addAttribute("currencies", currencies);
			return "currency";
		}

		User user = userRepository.findByEmail(principal.getName());
		currencyExchange.setUser(user);
		currencyExchange.setTransactionDate(LocalDateTime.now());

		CurrencyExchange savedExchange = currencyExchangeService.processExchange(currencyExchange);

		List<String> currencies = List.of("USD", "EUR", "GBP", "JPY", "TRY", "BRL");
		model.addAttribute("currencies", currencies);
		model.addAttribute("exchange", savedExchange);

		return "currency";
	}

}