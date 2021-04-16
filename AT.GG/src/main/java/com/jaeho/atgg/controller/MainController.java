package com.jaeho.atgg.controller;

import java.io.IOException;
import java.sql.Timestamp;
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
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.MiniSeriesVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.dto.SummonerDTO;
import com.jaeho.atgg.service.MatchService;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.TimeCalculate;

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
	public String summoner(@RequestParam("summonerName") String summonerName,
			@RequestParam(value = "pageNum", defaultValue = "0") String pageNum, Model model) throws IOException {

		String summonerInfo = RestAPIUtility.syncRestAPI("http://localhost:8080/lol/summoner/" + summonerName);

		SummonerDTO initSummonerInfo = new Gson().fromJson(summonerInfo, SummonerDTO.class);

//		log.info("=========initSummonerInfo==========");
//		log.info(initSummonerInfo);
//		log.info("===================================");

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

		String matchInfos = RestAPIUtility
				.syncRestAPI("http://localhost:8080/lol/matchs/" + summonerName + "?pageNum=" + pageNum);

		MatchDTO[] matchs = new Gson().fromJson(matchInfos, MatchDTO[].class);
//		log.info("=========matchInfos==========");
		for (int i = 0; i < matchs.length; i++) {

			matchs[i].setCreateTimeString(TimeCalculate.createTimeByDateToString(matchs[i].getGameCreation()));
			matchs[i].setDurationTimeString(TimeCalculate.durationTimeByDateToString(matchs[i].getGameDuration()));

			log.info(matchs[i]);
		}
//		log.info("===================================");

		model.addAttribute("summoner", initSummonerInfo.getSummonerVO());
		model.addAttribute("matchs", matchs);

		return "summoner";
	}
}
