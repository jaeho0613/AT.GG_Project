package com.jaeho.atgg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;
import com.jaeho.atgg.service.SummonerService;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/lol")
@Log4j
public class RiotAPIController {

	@Setter(onMethod_ = @Autowired)
	private SummonerService summonerSerivce;
	// private SummonerMapper summonerMapper;

	@GetMapping(value = "/summoner/{summonerName}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<SummonerVO> getSummoner(HttpServletRequest request,
			@PathVariable("summonerName") String summonerName) throws IOException {

		return new ResponseEntity<SummonerVO>(RiotAPIUtility.getSummonerByName(summonerSerivce, summonerName),
				HttpStatus.OK);
	}
}
