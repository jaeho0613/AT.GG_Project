-- mysql 8.x 버전 부터 권한 설정을 변경해야 연결 가능하다.
-- use mysql;
-- select * from user;
-- alter user 'root'@'localhost' identified with mysql_native_password by '123456';

drop database if exists atgg;

create database atgg;
use atgg;

drop table if exists summoner;
drop table if exists leagueEntry;
drop table if exists MiniSeries;

-- 소환사 정보 
create table summoner(
	id 				varchar(60) not null,
    accountId 		varchar(60) not null,
    puuid 			varchar(100) not null,
    name 			varchar(20) primary key,
    profileIconId 	varchar(60) not null,
    revisionDate 	varchar(60) not null,
    summonerLevel 	varchar(60) not null
);

-- 소환사 티어 정보
create table leagueEntry(
	summonerName varchar(20) not null,
    queueType 	 varchar(20) not null,
    tier 		 varchar(20) not null,
    `rank` 		 varchar(20) not null,
    leaguePoints integer not null,
    wins 		 integer not null,
    losses 		 integer not null,
    foreign key (summonerName) references summoner(name) on update cascade on delete cascade
);

-- 승급전일 경우
create table miniSeries(
	name 		varchar(20),
	target 		integer,
    wins 		integer,
    losses 		integer,
    progress	varchar(10),
    foreign key (name) references leagueEntry(summonerName) on update cascade on delete cascade
);