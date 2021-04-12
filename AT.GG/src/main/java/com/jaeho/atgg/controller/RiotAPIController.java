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
import org.springframework.web.bind.annotation.RestController;

import com.jaeho.atgg.service.SummonerService;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/lol")
@Log4j
public class RiotAPIController {

	@Setter(onMethod_ = @Autowired)
	private SummonerService summonerService;

	@InitBinder
	public void initBinder(HttpServletRequest request) throws IOException {

		String endPoint = "";
		String summonerName = "";
		String[] urlSplit = request.getServletPath().split("/");
		endPoint = urlSplit[2];
		summonerName = urlSplit[3];

		log.info("endPoint : " + endPoint);
		log.info("summonerName : " + summonerName);

		RiotAPIUtility.initSummonerInfo(summonerService, summonerName);
	}

	@GetMapping(value = "/summoner/{summonerName}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getSummoner(@PathVariable("summonerName") String summonerName)
			throws IOException {

		Map<String, Object> map = summonerService.getSummonerInfoAll(summonerName);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}
}