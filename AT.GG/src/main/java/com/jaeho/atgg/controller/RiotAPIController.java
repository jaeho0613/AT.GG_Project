package com.jaeho.atgg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/lol")
@Log4j
public class RiotAPIController {

	@Setter(onMethod_ = @Autowired)
	private SummonerMapper summonerMapper;

	@GetMapping(value = "/getlist", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<SummonerVO>> getList() {
		return new ResponseEntity<List<SummonerVO>>(summonerMapper.getList(), HttpStatus.OK);
	}
}
