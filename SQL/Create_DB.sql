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
drop table if exists Teams;
drop table if exists Participant;
drop table if exists ParticipantStats;

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
create table MiniSeries(
	name 		varchar(20) not null,
	target 		integer,
    wins 		integer,
    losses 		integer,
    progress	varchar(10),
    `type`		varchar(20),
    foreign key (name) references summoner(name) on update cascade on delete cascade
);

-- 게임 기본 정보
create table MatchReference (
	matchId		integer 	primary key auto_increment,
	name 		varchar(20) not null,
	gameId 		long,
    timestamp 	long,
    role 		varchar(20),
    lane 		varchar(20),
    champion 	integer,
    queue 		integer,
    foreign key (name) references summoner(name) on update cascade on delete cascade
);

-- 게임 정보 팀 정보
create table Teams(
	gameId 		long,
	towerKills 	integer,
    dragonKills integer,
    baronKills 	integer,
    teamId 		integer,
    win 		varchar(10)
);

-- 게임 참여자(소환사) 상세 정보
create table  Participant(
	gameId 			long,
	participantId 	integer,
    championId 		integer,
    teamId 			integer,
    spell1Id 		integer,
    spell2Id 		integer,
    summoner 		varchar(20)
);

-- 게임 참여자(소환사) 상세 정보 스텟
create table ParticipantStats(
	gameId 						long,
    participantId 				integer,
    totalDamageDealtToChampions long,
	item0 						integer,
    item1 						integer,
    item2 						integer,
    item3 						integer,
    item4 						integer,
    item5 						integer,
    largestMultiKill 			integer,
    goldEarned 					integer,
    wardsKilled 				integer,
    wardsPlaced 				integer,
    totalMinionsKilled 			integer,
    visionWardsBoughtInGame 	integer,
    kills 						integer,
    deaths 						integer,
    assists 					integer,
    neutralMinionsKilled 		integer,
    perk0 						integer,
    perk1 						integer,
    perk2 						integer,
    perk3 						integer,
    perk4 						integer,
    perk5 						integer,
    perkPrimaryStyle 			integer,
    perkSubStyle 				integer,
    statPerk0 					integer,
    statPerk1 					integer,
    statPerk2 					integer,
    win 						boolean
);