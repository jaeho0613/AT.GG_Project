-- 전체 테이블 검색
select * from summoner;
select * from leagueEntry;
select * from MiniSeries;

-- 테이블 join
-- select sm.name, sm.profileIconId, sm.summonerLevel, le.queueType, le.tier, le.rank, le.leaguePoints, mi.target, mi.
-- from summoner as sm
-- left join leagueEntry as le
-- on sm.name = le.summonerName
-- left join miniseries as mi
-- on sm.name = mi.name;

select *
from summoner as sm
join leagueEntry as le
on sm.name = le.summonerName;
	 
-- 특정 소환사 검색
select * from summoner where name = '정재호임';
	
-- 특정 소환사 티어 정보 검색
select * from leagueEntry where summonerName = '정재호임';

-- 특정 소환사 승급전 정보 검색
select * from miniSeries where name = '정재호임';

-- 소환사 정보 입력	
insert into summoner values();
	
-- 소환사 리그 정보 입력
insert into leagueEntry values();

-- 소환사 승급전 정보 입력
insert into miniSeries values();

-- 데이터 베이스 정보 검색
select name
from summoner
where name = '정재호임';
