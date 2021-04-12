package com.jaeho.atgg.dto;

import java.util.List;

import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;

import lombok.Data;

// My RestAPI를 담을 객체
@Data
public class SummonerDTO {

	private List<LeagueEntryVO> leagueEntryVO;
	private SummonerVO summonerVO;
	
}
