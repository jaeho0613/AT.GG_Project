package com.jaeho.atgg.controller;

import java.io.IOException;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jaeho.atgg.domain.LeagueEntryVO;
import com.jaeho.atgg.domain.MiniSeriesVO;
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

		String summonerInfo = RestAPIUtility.restAPI("http://localhost:8080/lol/summoner/" + userName);

		JsonElement jelement = new JsonParser().parse(summonerInfo);

		JsonObject j_summoner = (JsonObject) jelement.getAsJsonObject().get("summonerVO");
		JsonArray j_leagueEntry = (JsonArray) jelement.getAsJsonObject().get("leagueEntryVO");
		JsonArray j_miniseries = (JsonArray) jelement.getAsJsonObject().get("miniSeriesVO");

		SummonerVO summoner = new Gson().fromJson(j_summoner, SummonerVO.class);
		LeagueEntryVO[] leagueEntry = new Gson().fromJson(j_leagueEntry, LeagueEntryVO[].class);
		MiniSeriesVO[] miniSeries = new Gson().fromJson(j_miniseries, MiniSeriesVO[].class);

		model.addAttribute("summoner", summoner);
		model.addAttribute("leagueEntry", leagueEntry);
		model.addAttribute("miniSeries", miniSeries);

		return "summoner";
	}
}
