-- 전체 테이블 검색
select * from summoner;
select * from leagueEntry;
select * from MiniSeries;

-- 특정 소환사 검색
select * from summoner where name = '정재호임';
	
-- 특정 소환사 티어 정보 검색
select * from leagueEntry where name = '정재호임';

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
