package com.jaeho.atgg.controller;

import java.io.IOException;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.MiniSeriesVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.dto.SummonerDTO;
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
	public String summoner(@RequestParam("summonerName") String summonerName, @RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			Model model) throws IOException {

		String summonerInfo = RestAPIUtility.syncRestAPI("http://localhost:8080/lol/summoner/" + summonerName);
		
		SummonerDTO initSummonerInfo = new Gson().fromJson(summonerInfo, SummonerDTO.class);

		log.info("=========initSummonerInfo==========");
		log.info(initSummonerInfo);
		for (LeagueEntryVO league : initSummonerInfo.getLeagueEntryVO()) {
			if (league.getQueueType().contains("SOLO")) {

				if (league.getMiniSeries() != null) {
					String[] proArr = league.getMiniSeries().getProgress().split("");
					model.addAttribute("soloPro", proArr);
				}

				model.addAttribute("soloLeague", league);
			} else if (league.getQueueType().contains("FLEX")) {

				if (league.getMiniSeries() != null) {
					String[] proArr = league.getMiniSeries().getProgress().split("");
					model.addAttribute("flexPro", proArr);
				}

				model.addAttribute("flexLeague", league);
			}
		}
		log.info("===================================");

		model.addAttribute("summoner", initSummonerInfo.getSummonerVO());

		return "summoner";
	}
}
