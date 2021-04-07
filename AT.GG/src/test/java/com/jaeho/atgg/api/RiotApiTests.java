package com.jaeho.atgg.api;

import java.io.IOException;
import java.util.Iterator;

import javax.sound.midi.MidiDevice.Info;

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
		
		for (int i = 0; i < 1000; i++) {
			log.info(RiotAPIUtility.getSummonerByName("정재호임"));
		}
	}
}
