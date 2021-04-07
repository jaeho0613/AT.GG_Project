package com.jaeho.atgg.api;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.utility.RiotAPIUtility;
import com.mysql.cj.xdevapi.Client;

import lombok.extern.log4j.Log4j;
import okhttp3.Call;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RiotApiTests {

	@Test
	public void getSummoner() throws IOException {
		SummonerVO summoner1 = RiotAPIUtility.getSummonerByName("정재호임");
		SummonerVO summoner2 = RiotAPIUtility.getSummonerByName("정재호");
		SummonerVO summoner3 = RiotAPIUtility.getSummonerByName("정재호2");
		SummonerVO summoner4 = RiotAPIUtility.getSummonerByName("정재호4");
		log.info(summoner1);
		log.info(summoner2);
		log.info(summoner3);
		log.info(summoner4);
	}
}
