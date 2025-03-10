package com.enomyfinances.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("login");
		return "redirect:login";
		
	}
}