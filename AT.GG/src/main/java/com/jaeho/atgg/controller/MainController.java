package com.jaeho.atgg.controller;

import java.io.IOException;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.utility.RestAPIUtility;

import lombok.extern.log4j.Log4j;
import okhttp3.Request;

@Controller
@RequestMapping("/at.gg")
@Log4j
public class MainController {

	@RequestMapping("")
	public String main() {
		return "main";
	}

	@GetMapping("/summoner")
	public String summoner(@ModelAttribute("userName") String userName, Model model) throws IOException {
		Gson gson = new Gson();

		SummonerVO summoner = gson.fromJson(RestAPIUtility.restAPI("http://localhost:8080/lol/summoner/" + userName),
				SummonerVO.class);
		log.info(summoner);
		model.addAttribute("summoner", summoner);

		return "summoner";
	}
}
