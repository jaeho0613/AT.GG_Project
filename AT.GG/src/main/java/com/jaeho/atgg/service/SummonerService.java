package com.jaeho.atgg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SummonerService implements ISummonerService {

	@Setter(onMethod_ = @Autowired)
	private SummonerMapper summonerMapper;

	@Override
	public SummonerVO getSummoner(String summonerName) {
		log.info("getSummoner - Database 접근");
		return summonerMapper.getSummonerByName(summonerName);
	}

	@Override
	public void insertSummoner(SummonerVO summoner) {
		log.info("insertSummoner - Database 접근");
		summonerMapper.insertSummoner(summoner);
	}

	@Override
	public boolean isDuplicateDateCheck(String summonerName) {
		log.info("isDuplicateDateCheck - Database 접근");
		if (summonerMapper.checkSummonerName(summonerName) != null) {
			return true;
		} else {
			return false;
		}
	}
}
