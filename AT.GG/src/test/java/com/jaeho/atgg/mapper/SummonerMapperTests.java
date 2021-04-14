package com.jaeho.atgg.mapper;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SummonerMapperTests {

	@Setter(onMethod_ = @Autowired)
	private SummonerMapper summonerMapper;

	@Test
	public void getsummonerByColumn() {
		log.info(summonerMapper.getSummonerByAccountId("정재호임"));
	}

//	@Test
	public void getSummonerByName() {
		log.info(summonerMapper.getSummonerByName("정재호임"));
	}

//	@Test
	public void checkSummonerName() {

		log.info(summonerMapper.checkSummonerName("정재호1"));
		if (summonerMapper.checkSummonerName("정재호1") != null) {
			log.info("==================not null");
		} else {
			log.info("==================null");
		}
	}

//	@Test
	public void insertSummoner() {

		if (summonerMapper.checkSummonerName("test") == null) {
			// SummonerVO summoner = new SummonerVO("test", "test", "test", "test", "test",
			// "test", "test");

			// summonerMapper.insertSummoner(summoner);
		} else {
			log.info("이미 데이터가 있습니다.");
		}
	}
}
