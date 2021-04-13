-- 유저 정보 테이블 검색
select * from summoner;
select * from leagueEntry;
select * from miniSeries;

-- 매칭 정보 테이블 검색
select * from MatchRef;
select * from Teams;
select * from Participant;
select * from ParticipantStats;
select * from Timeline;

-- ------------------------------[Summoner Mapper]--------------------------------------------------------------------------
-- getSummonerByName
select * from summoner where name = '정재호임';

-- getLeagueEntryList
select * from leagueEntry where summonerName = '정재호임';

-- getMiniSeriesList
select * from miniSeries where name = '정재호임';

-- insertSummoner
-- insert into summoner values(#{id},#{accountId},#{puuid},#{name},#{profileIconId},#{revisionDate},#{summonerLevel});

-- insertLeagueEntry
-- insert into leagueEntry values(#{summonerName},#{queueType},#{tier},#{rank},#{leaguePoints},#{wins},#{losses});

-- insertMiniSeries
-- insert into miniSeries values(#{name},#{target},#{wins},#{losses},#{progress},#{type});

-- checkSummonerName
select name from summoner where name = '정재호임';
-- ------------------------------------------------------------------------------------------------------

-- ------------------------------[Match Mapper]--------------------------------------------------------------------------
-- insertMatchRef
insert into MatchRef values();