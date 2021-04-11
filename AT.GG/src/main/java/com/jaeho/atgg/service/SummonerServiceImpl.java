package com.jaeho.atgg.service;

import java.util.HashMap;
import java.util.List;
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
		List<LeagueEntryVO> leagueEntryList = summonerMapper.getLeagueEntryList(summonerName);
		List<MiniSeriesVO> miniSeriesList = summonerMapper.getMiniSeriesList(summonerName);

		log.info(leagueEntryList);
		log.info(miniSeriesList);

		// 승급전 데이터 저장
		for (int i = 0; i < leagueEntryList.size(); i++) {
			// 승급전이 존재 한다면
			if (miniSeriesList != null) {

				// 솔랭 승급전
				if (leagueEntryList.get(i).getQueueType().contains("SOLO")) {
					// log.info("SOLO");
					for (int j = 0; j < miniSeriesList.size(); j++) {
						if (miniSeriesList.get(j).getType().contains("SOLO")) {
							// log.info("SOLO INSERT");
							leagueEntryList.get(i).setMiniSeries(miniSeriesList.get(j));
						}
					}
				}

				// 팀랭 승급전
				if (leagueEntryList.get(i).getQueueType().contains("FLEX")) {
					// log.info("FLEX");
					for (int j = 0; j < miniSeriesList.size(); j++) {
						if (miniSeriesList.get(j).getType().contains("FLEX")) {
							// log.info("FLEX INSERT");
							leagueEntryList.get(i).setMiniSeries(miniSeriesList.get(j));
						}
					}
				}
			}
		}

		summonerInfo.put("summonerVO", summonerMapper.getSummonerByName(summonerName));
		summonerInfo.put("leagueEntryVO", leagueEntryList);

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
