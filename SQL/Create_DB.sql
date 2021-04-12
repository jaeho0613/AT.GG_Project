-- mysql 8.x 버전 부터 권한 설정을 변경해야 연결 가능하다.
-- use mysql;
-- select * from user;
-- alter user 'root'@'localhost' identified with mysql_native_password by '123456';

drop database if exists atgg;

create database atgg;
use atgg;

drop table if exists Summoner;
drop table if exists LeagueEntry;
drop table if exists MiniSeries;
drop table if exists MatchReference;
drop table if exists ParticipantStats;
drop table if exists TeamStats;


-- 소환사 정보 
create table Summoner(
	id 				varchar(60) not null,
    accountId 		varchar(60) not null,
    puuid 			varchar(100) not null,
    name 			varchar(20) primary key,
    profileIconId 	varchar(60) not null,
    revisionDate 	varchar(60) not null,
    summonerLevel 	varchar(60) not null
);

-- 소환사 티어 정보
create table LeagueEntry(
	summonerName varchar(20) primary key,
    queueType 	 varchar(20) not null,
    tier 		 varchar(20) not null,
    `rank` 		 varchar(20) not null,
    leaguePoints integer not null,
    wins 		 integer not null,
    losses 		 integer not null,
    foreign key (summonerName) references summoner(name) on update cascade on delete cascade
);

-- 승급전일 경우
create table MiniSeries(
	name 		varchar(20) primary key,
	target 		integer,
    wins 		integer,
    losses 		integer,
    progress	varchar(10),
    `type`		varchar(20),
    foreign key (name) references summoner(name) on update cascade on delete cascade
);

-- 소환사 전적 리스트
create table MatchReference (
	name		varchar(20) primary key,
	platformId 	varchar(20) not null,
    gameId 	 	long not null,
    champion 	integer not null,
    queue 		integer not null,
    season 		integer not null,
    timestamp 	long not null,
    role 		varchar(20) not null,
    lane 		varchar(20) not null,
    foreign key (name) references summoner(name) on update cascade on delete cascade
);

-- 게임 데이터
create table ParticipantStats(
	totalDamageDealtToChampions long not null,
	gameId 						integer not null,
	totalMinionsKilled	 		integer not null,
    neutralMinionsKilled 		integer not null,    
    kills 						integer not null,
    deaths 						integer not null,
    assists 					integer not null,
    largestMultiKill 			integer not null,
    goldEarned 					integer not null,
    visionWardsBoughtInGame 	integer not null,
    wardsPlaced 				integer not null,
    wardsKilled 				integer not null
);

create table TeamStats(
	gameId 		integer not null,
	towerKills 	integer not null,
    dragonKills integer not null,
    baronKills 	integer not null
);
