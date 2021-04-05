package com.jaeho.atgg.controller;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MainController {
	
	@RequestMapping("/")
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	@GetMapping("/summoner")
	public String summoner(String userName) {
		System.out.println("userName : " + userName);
		return "summoner";
	}
}
