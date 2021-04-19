package com.jaeho.atgg.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.service.MatchService;
import com.jaeho.atgg.service.SummonerService;
import com.jaeho.atgg.utility.RiotStaticDataUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/lol")
@Log4j
public class RiotAPIController {

	@Setter(onMethod_ = @Autowired)
	private SummonerService summonerService;

	@Setter(onMethod_ = @Autowired)
	private MatchService matchService;

	@InitBinder
	public void initBinder(HttpServletRequest request) throws IOException {

		// full url
		String[] urlSplit = request.getServletPath().split("/");

		// url target
		String pageNum = request.getParameter("pageNum");
		String endPoint = urlSplit[2];
		String summonerName = urlSplit[3];

		// pagsing index
		int endIndex = 0;
		int beginIndex = 0;

		if (pageNum != null) {
			endIndex = Integer.parseInt(pageNum) * 5;
			beginIndex = endIndex - 5;

			if (pageNum.equals("0")) {
				endIndex = 5;
				beginIndex = 0;
			}
		}

		log.info("full path : " + request.getServletPath());
		log.info("endPoint : " + endPoint);
		log.info("summonerName : " + summonerName);
		log.info("beginIndex :" + beginIndex);
		log.info("endIndex : " + endIndex);

		switch (endPoint) {
		case "summoner":
			RiotAPIUtility.initSummonerInfo(summonerService, summonerName);
			// 소환사 매칭 정보 초기화 (최초 5개)
//			if (matchService.totalMatchRefCount(summonerName) <= 0) {
//				RiotAPIUtility.initMatchInfo(matchService, summonerService.getSummonerAccountId(summonerName),
//						beginIndex, endIndex);
//			}
			break;
		case "matchs":
			RiotAPIUtility.initMatchInfo(matchService, summonerService.getSummonerAccountId(summonerName), beginIndex,
					endIndex);
			break;
		}
	}

	@GetMapping(value = "/summoner/{summonerName}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getSummoner(@PathVariable("summonerName") String summonerName)
			throws IOException {

		Map<String, Object> map = summonerService.getSummonerInfoAll(summonerName);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	@GetMapping(value = "/match/{gameId}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MatchDTO> getMatch(@PathVariable("gameId") String gameId) throws IOException {

		MatchDTO match = matchService.selectMatchRef(gameId);

		return new ResponseEntity<MatchDTO>(match, HttpStatus.OK);
	}

	@GetMapping(value = "/matchs/{summonerName}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<MatchDTO>> getMatch(@PathVariable("summonerName") String summonerName,
			@RequestParam("pageNum") String pageNum) throws IOException {

		int endIndex = Integer.parseInt(pageNum) * 5;
		int beginIndex = endIndex - 5;

		if (pageNum.equals("0")) {
			endIndex = 5;
			beginIndex = 0;
		}

		List<MatchDTO> matchs = matchService.selectMatchByPagsing(summonerName, beginIndex, endIndex);

		matchs.forEach(match -> {
			match.getParticipants().forEach(partici -> {
				if (partici.getSummoner().equals(summonerName)) {
					match.setParticipantId(partici.getParticipantId());
				}
			});
		});

		return new ResponseEntity<List<MatchDTO>>(matchs, HttpStatus.OK);
	}
}