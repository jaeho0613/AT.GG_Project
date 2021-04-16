use atgg;
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

select accountId from summoner where name = '정재호임';

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
-- insert
insert into MatchRef values();

-- select
select * from MatchRef where gameId = '51205277534';
select * from Teams where gameId = '5120527754';
select * from Participant where gameId = '5120527754';
select * from ParticipantStats where gameId = '5120527754';
select * from Timeline where gameId = '5120527754';

-- check
select ifnull(gameId, 1) null_check
from MatchRef
where gameId = '5120307891';

-- totalCount
select count(gameId) from MatchRef;

-- select
select count(summoner) from Participant where summoner = '정재호임';

-- match pagsing
select mt.gameId
from MatchRef mt join Participant pt on mt.gameId = pt.gameId
where pt.summoner = '정재호임'
order by mt.gameCreation desc
limit 0,5;

select *
from MatchRef mt join Participant pt on mt.gameId = pt.gameId
where pt.summoner = '정재호임'
order by mt.gameCreation desc
limit 0,5;

select *
from ParticipantStats ps join participant p on ps.gameId = p.gameId
where p.summoner like '정재호임';