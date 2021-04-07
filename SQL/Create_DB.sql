-- mysql 8.x 버전 부터 권한 설정을 변경해야 연결 가능하다.
-- use mysql;
-- select * from user;
-- alter user 'root'@'localhost' identified with mysql_native_password by '123456';

drop database if exists atgg;

create database atgg;
use atgg;

drop table if exists summoner;

create table summoner(
	id varchar(60) not null,
    accountId varchar(60) not null,
    puuid varchar(100) not null,
    name varchar(20) primary key,
    profileIconId varchar(60) not null,
    revisionDate varchar(60) not null,
    summonerLevel varchar(60) not null
);

select * from summoner;
insert into summoner values('a','b','c','정재호4','e','f','g');