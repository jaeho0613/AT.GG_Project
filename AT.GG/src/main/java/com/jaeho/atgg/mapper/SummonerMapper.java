package com.jaeho.atgg.mapper;

import java.util.List;
import com.jaeho.atgg.domain.SummonerVO;

public interface SummonerMapper {

	public List<SummonerVO> getList();

	public SummonerVO getSummonerByName(String summonerName);

	public String checkSummonerName(String summonerName);

	public void insertSummoner(SummonerVO summonerVO);
}
