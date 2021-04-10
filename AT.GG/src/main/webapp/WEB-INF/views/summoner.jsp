<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"></c:set>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!-- Summoner -->
<main class="container ">
  <div class="content d-flex justify-content-between row">
    <!-- 왼쪽 컨테이너 -->
    <div class="summoner_info_container col-xl-2">
      <!-- 소환사 정보 -->
      <div class="card shadow mb-2 col">
        <div class="card-body d-flex flex-column justify-content-start align-content-center">
          <img class="summoner_icon mx-auto"
            src="http://ddragon.leagueoflegends.com/cdn/11.7.1/img/profileicon/${ summoner.profileIconId }.png"
            width="100" height="100">
          <div class="summoner_info d-flex flex-column text-center mt-2">
            <span>${ summoner.name }</span>
            <span>LV : ${ summoner.summonerLevel } ${ path }</span>
            <span>
              <button type="button" class="btn btn-primary">업데이트</button>
            </span>
          </div>
        </div>
      </div>
      <!--랭크 정보 컨테이너 -->
      <div class="d-flex flex-xl-column mb-2 col">
        <c:choose>
          <c:when test="${not empty isFull }">
            <c:forEach items="${ leagues }" var="league">
              <c:choose>
                <c:when test="${ fn:contains(league.queueType, 'SOLO') }">
                  <div class="card shadow" style="min-width: 50%;">
                    <div class="summoner_solo card-body d-flex flex-column text-center">
                      <img class=" mx-auto d-block" src="${ path }/resources/img/${ league.tier }.png" width="90"
                        height="90">
                      <span>솔로랭크</span>
                      <span>${ league.tier }${ league.rank } / ${ league.leaguePoints }LP</span>
                      <span>${ league.wins }승 ${ league.losses }패</span>
                    </div>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="card shadow" style="min-width: 50%;">
                    <div class="summoner_solo card-body d-flex flex-column text-center">
                      <img class=" mx-auto d-block" src="${ path }/resources/img/${ league.tier }.png" width="90"
                        height="90">
                      <span>자유랭크</span>
                      <span>${ league.tier }${ league.rank } / ${ league.leaguePoints }LP</span>
                      <span>${ league.wins }승 ${ league.losses }패</span>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </c:when>
          <c:when test="${not empty isHalf }">
            <c:choose>
              <c:when test="${ not empty isSolo }">
                <div class="card shadow" style="min-width: 50%;">
                  <div class="summoner_solo card-body d-flex flex-column text-center">
                    <img class=" mx-auto d-block" src="${ path }/resources/img/${ leagues[0].tier }.png" width="90"
                      height="90">
                    <span>솔로랭크</span>
                    <span>${ leagues[0].tier }${ leagues[0].rank } / ${ leagues[0].leaguePoints }LP</span>
                    <span>${ leagues[0].wins }승 ${ leagues[0].losses }패</span>
                  </div>
                </div>
                <div class="card shadow" style="min-width: 50%;">
                  <div class="summoner_team card-body d-flex flex-column text-center">
                    <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                    <span>자유랭크</span>
                  </div>
                </div>
              </c:when>
              <c:when test="${ not empty isFlex }">
                <div class="card shadow" style="min-width: 50%;">
                  <div class="summoner_solo card-body d-flex flex-column text-center">
                    <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                    <span>솔로랭크</span>
                  </div>
                </div>
                <div class="card shadow" style="min-width: 50%;">
                  <div class="summoner_team card-body d-flex flex-column text-center">
                    <img class=" mx-auto d-block" src="${ path }/resources/img/${ leagues[0].tier }.png" width="90"
                      height="90">
                    <span>자유랭크</span>
                    <span>${ leagues[0].tier }${ leagues[0].rank } / ${ leagues[0].leaguePoints }LP</span>
                    <span>${ leagues[0].wins }승 ${ leagues[0].losses }패</span>
                  </div>
                </div>
              </c:when>
            </c:choose>
          </c:when>
          <c:when test="${not empty isUnrank }">
            <div class="card shadow" style="min-width: 50%;">
              <div class="summoner_solo card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>솔로랭크</span>
              </div>
            </div>
            <div class="card shadow" style="min-width: 50%;">
              <div class="summoner_team card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>자유랭크</span>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
    </div>
    <!-- 오른쪽 컨테이너 -->
    <div class="summoner_match_container col-xl-10 d-flex flex-column">
      <!-- 한개 게임 데이터 컨테이너 -->
      <div class="accordion" id="match_list">
        <div class="accordion-item">
          <!-- 타이틀 -->
          <h2 class="accordion-header">
            <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
              data-bs-target="#match_1" style="background-color: #A3CFEC;">
              자유 랭크 · 4일전 / 28분 / 승리
            </button>
          </h2>
          <!-- 중앙 컨텐츠 -->
          <div class="accordion-body">
            <div class="d-flex justify-content-evenly my-1">
              <!-- 캐릭터 초상화 -->
              <div class="champion_icon my-auto me-xl-4">
                <img class="rounded-circle" src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
              </div>
              <!-- 룬 스펠 -->
              <div class="rune_speli d-flex me-xl-4">
                <div class="rune_spell_icon d-flex flex-column justify-content-center">
                  <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                </div>
                <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                  <img
                    src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                </div>
              </div>
              <!-- KDA -->
              <div class="d-flex flex-column justify-content-center text-center lh-1 me-xl-4">
                <span>12 / 2 / 10</span>
                <span>11.00 : 1</span>
                <div class="rounded-pill bg-danger text-center text-white">
                  <span>더블킬</span>
                </div>
              </div>
              <!-- KDA -->
              <div class="d-flex flex-column justify-content-center text-center lh-sm me-xl-4">
                <span>레벨 16</span>
                <span>201 (7) CS</span>
                <span>킬관여 48%</span>
              </div>
              <!-- 아이템 -->
              <div class="item_icon d-flex me-xl-4">
                <div class="item_icon d-flex flex-column justify-content-center">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                </div>
                <div class="item_icon d-flex flex-column justify-content-center">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                </div>
                <div class="item_icon d-flex flex-column justify-content-center">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
              </div>
            </div>
          </div>
          <!-- 숨김 컨텐츠 -->
          <div id="match_1" class="hidden-content accordion-collapse collapse">
            <!-- 승리팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>승리 (레드팀)</span>
                <span>46 / 26 / 71</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-b.png">
                  <span>2</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-b.png">
                  <span>2</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-b.png">
                  <span>2</span>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 패배팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>패배 (레드팀)</span>
                <span>46 / 26 / 71</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-r.png">
                  <span>2</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-r.png">
                  <span>2</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-r.png">
                  <span>2</span>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 소환사 한명 -->
            <div class="summoner accordion-body d-flex justify-content-around align-content-center">
              <!-- 왼쪽 정보 -->
              <div class="d-flex">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-1">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
                </div>
                <!-- 룬 스펠 -->
                <div class="rune_speli d-flex">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src=" https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerFlash.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/spell/SummonerDot.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                    <img
                      src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/7201_Precision.png">
                  </div>
                </div>
                <!-- 매칭 소환사 정보 -->
                <div class="summoner_info d-flex flex-column">
                  <div class="summoner_tier d-flex">
                    <div class="tier me-1 my-auto rounded-circle text-center" style="background-color: silver;">
                      <span>S1</span>
                    </div>
                    <div class="summoner_name">
                      <span>정재호임</span>
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex justify-content- text-center">
                    <span>12/2/10</span>&nbsp;
                    <span style="color: red;">11.00:1</span>
                  </div>
                </div>
              </div>
              <!-- 오른쪽 정보 -->
              <div class="d-flex flex-column  text-center">
                <!-- 아이템 -->
                <div class="item_icon d-flex">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                </div>
                <!-- 딜량, cs-->
                <div class="d-flex row row-cols-2">
                  <span class="p-0 col-5">198/1.4만</span>
                  <div class="progress p-0">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%;" aria-valuemin="0"
                      aria-valuemax="100">22053</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>