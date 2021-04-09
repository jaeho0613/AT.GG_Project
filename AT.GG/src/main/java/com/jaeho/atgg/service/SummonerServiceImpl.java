package com.jaeho.atgg.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.jaeho.atgg.domain.LeagueEntryVO;
import com.jaeho.atgg.domain.MiniSeriesVO;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//@EnableTransactionManagement(proxyTargetClass = true)
@Service
@Log4j
public class SummonerServiceImpl implements SummonerService {

	@Setter(onMethod_ = @Autowired)
	private SummonerMapper summonerMapper;

	@Override
	public Map<String, Object> getSummonerInfoAll(String summonerName) {
		log.info("==============================");
		log.info("getSummoner - Database 접근 :" + summonerName);
		log.info("==============================");
		
		Map<String, Object> summonerInfo = new HashMap<String, Object>();
		
		summonerInfo.put("summonerVO", summonerMapper.getSummonerByName(summonerName));
		summonerInfo.put("leagueEntryVO", summonerMapper.getLeagueEntryList(summonerName));
		summonerInfo.put("miniSeriesVO", summonerMapper.getMiniSeriesList(summonerName));
		
		return summonerInfo;
	}

	@Override
	public void insertLeagueInfo(LeagueEntryVO leagueEntry) {
		log.info("==============================");
		log.info("insertLeagueInfo - Database 접근");
		log.info(leagueEntry);
		log.info("==============================");

		summonerMapper.insertLeagueEntry(leagueEntry);
	}

	@Override
	public void insertMiniseries(MiniSeriesVO miniSeries) {
		log.info("==============================");
		log.info("insertMiniseries - Database 접근 :" + miniSeries);
		log.info("==============================");

		summonerMapper.insertMiniSeries(miniSeries);

	}

	@Override
	public void insertSummonerInfo(SummonerVO summoner) {
		log.info("==============================");
		log.info("insertSummoner - Database 접근");
		log.info(summoner);
		log.info("==============================");

		summonerMapper.insertSummoner(summoner);
	}

	@Override
	public boolean isDuplicateDateCheck(String summonerName) {
		log.info("==============================");
		log.info("isDuplicateDateCheck - Database 접근 :" + summonerName);
		log.info("==============================");

		// 데이터가 존재
		if (summonerMapper.checkSummonerName(summonerName) != null) {
			return true;
		} else {
			return false;
		}
	}

}
