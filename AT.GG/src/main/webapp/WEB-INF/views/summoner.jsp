<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${ pageContext.request.contextPath }"></c:set>
<c:set var="version" value="11.8.1"></c:set>
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
            src="http://ddragon.leagueoflegends.com/cdn/${version}/img/profileicon/${ summoner.profileIconId }.png"
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
          <c:when test="${not empty soloLeague && not empty flexLeague}">
            <div class="card shadow py-2" style="min-width: 50%;">
              <!-- 랭크 정보 -->
              <div class="summoner_solo d-flex flex-column text-center mb-2">
                <img class=" mx-auto d-block" src="${ path }/resources/img/${ soloLeague.tier }.png" width="90"
                  height="90">
                <span>솔로랭크</span>
                <span>${ soloLeague.tier }${ soloLeague.rank } / ${ soloLeague.leaguePoints }LP</span>
                <span>${ soloLeague.wins }승 ${ soloLeague.losses }패</span>
              </div>
              <!-- 승급전 진행 상태 -->
              <c:if test="${ not empty soloLeague.miniSeries }">
                <div class="summoner_solo d-flex flex-column justify-content-center align-content-center text-center">
                  <div class="mini_series_title">
                    승급전 진행중
                  </div>
                  <div class="mini_series_wl d-flex justify-content-center align-content-center">
                    <c:forEach items="${ soloPro }" var="pro">
                      <c:choose>
                        <c:when test="${ pro == 'L' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/lose.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'W' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/win.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'N' }">
                          <div class="position-relative mini_series border rounded-circle">
                          </div>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </div>
                </div>
              </c:if>
            </div>
            <div class=" card shadow py-2" style="min-width: 50%;">
              <div class="summoner_solo card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/${ flexLeague.tier }.png" width="90"
                  height="90">
                <span>자유랭크</span>
                <span>${ flexLeague.tier }${ flexLeague.rank } / ${ flexLeague.leaguePoints }LP</span>
                <span>${ flexLeague.wins }승 ${ flexLeague.losses }패</span>
              </div>
              <!-- 승급전 진행 상태 -->
              <c:if test="${ not empty flexLeague.miniSeries }">
                <div class="summoner_solo d-flex flex-column justify-content-center align-content-center text-center">
                  <div class="mini_series_title">
                    승급전 진행중
                  </div>
                  <div class="mini_series_wl d-flex justify-content-center align-content-center">
                    <c:forEach items="${ flexPro }" var="pro">
                      <c:choose>
                        <c:when test="${ pro == 'L' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/lose.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'W' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/win.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'N' }">
                          <div class="position-relative mini_series border rounded-circle">
                          </div>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </div>
                </div>
              </c:if>
            </div>
          </c:when>
          <c:when test="${not empty soloLeague && empty flexLeague}">
            <div class="card shadow py-2" style="min-width: 50%;">
              <!-- 랭크 정보 -->
              <div class="summoner_solo d-flex flex-column text-center mb-2">
                <img class=" mx-auto d-block" src="${ path }/resources/img/${ soloLeague.tier }.png" width="90"
                  height="90">
                <span>솔로랭크</span>
                <span>${ soloLeague.tier }${ soloLeague.rank } / ${ soloLeague.leaguePoints }LP</span>
                <span>${ soloLeague.wins }승 ${ soloLeague.losses }패</span>
              </div>
              <!-- 승급전 진행 상태 -->
              <c:if test="${ not empty soloLeague.miniSeries }">
                <div class="summoner_solo d-flex flex-column justify-content-center align-content-center text-center">
                  <div class="mini_series_title">
                    승급전 진행중
                  </div>
                  <div class="mini_series_wl d-flex justify-content-center align-content-center">
                    <c:forEach items="${ soloPro }" var="pro">
                      <c:choose>
                        <c:when test="${ pro == 'L' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/lose.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'W' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/win.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'N' }">
                          <div class="position-relative mini_series border rounded-circle">
                          </div>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </div>
                </div>
              </c:if>
            </div>
            <div class=" card shadow py-2" style="min-width: 50%;">
              <div class="summoner_solo card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>자유랭크</span>
                <span>Unranked</span>
              </div>
            </div>
          </c:when>
          <c:when test="${empty soloLeague && not empty flexLeague}">
            <div class="card shadow py-2" style="min-width: 50%;">
              <!-- 랭크 정보 -->
              <div class="summoner_solo d-flex flex-column text-center mb-2">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>솔로랭크</span>
                <span>Unranked</span>
              </div>
            </div>
            <div class=" card shadow py-2" style="min-width: 50%;">
              <div class="summoner_solo card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/${ flexLeague.tier }.png" width="90"
                  height="90">
                <span>자유랭크</span>
                <span>${ flexLeague.tier }${ flexLeague.rank } / ${ flexLeague.leaguePoints }LP</span>
                <span>${ flexLeague.wins }승 ${ flexLeague.losses }패</span>
              </div>
              <!-- 승급전 진행 상태 -->
              <c:if test="${ not empty flexLeague.miniSeries }">
                <div class="summoner_solo d-flex flex-column justify-content-center align-content-center text-center">
                  <div class="mini_series_title">
                    승급전 진행중
                  </div>
                  <div class="mini_series_wl d-flex justify-content-center align-content-center">
                    <c:forEach items="${ flexPro }" var="pro">
                      <c:choose>
                        <c:when test="${ pro == 'L' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/lose.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'W' }">
                          <div class="position-relative mini_series border rounded-circle">
                            <img class="position-absolute top-50 start-50 translate-middle"
                              src="${ path }/resources/img/win.png">
                          </div>
                        </c:when>
                        <c:when test="${ pro == 'N' }">
                          <div class="position-relative mini_series border rounded-circle">
                          </div>
                        </c:when>
                      </c:choose>
                    </c:forEach>
                  </div>
                </div>
              </c:if>
            </div>
          </c:when>
          <c:when test="${empty soloLeague && empty flexLeague}">
            <div class="card shadow py-2" style="min-width: 50%;">
              <!-- 랭크 정보 -->
              <div class="summoner_solo d-flex flex-column text-center mb-2">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>솔로랭크</span>
                <span>Unranked</span>
              </div>
            </div>
            <div class=" card shadow py-2" style="min-width: 50%;">
              <div class="summoner_solo card-body d-flex flex-column text-center">
                <img class=" mx-auto d-block" src="${ path }/resources/img/UNRANK.png" width="90" height="90">
                <span>자유랭크</span>
                <span>Unranked</span>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
    </div>
    <!-- 오른쪽 컨테이너 -->
    <div id="match_cap" class="col-xl-10">
      <div id="match_container" class="summoner_match_container d-flex flex-column">
        <c:forEach items="${ matchs }" var="match">
          <!-- 한개 게임 데이터 컨테이너 -->
          <div class="accordion" id="match_list">
            <div class="accordion-item">
              <!-- 타이틀 -->
              <h2 class="accordion-header">
                <c:if test="${(match.participants[match.participantId - 1].stats.win) == '승리'}">
                  <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                    data-bs-target="#match_${ match.gameId }" style="background-color: #A3CFEC;">
                    ${ match.queueId } / ${ match.createTimeString } / ${ match.durationTimeString } /
                    ${match.participants[match.participantId - 1].stats.win}
                  </button>
                </c:if>
                <c:if test="${(match.participants[match.participantId - 1].stats.win) == '패배'}">
                  <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                    data-bs-target="#match_${ match.gameId }" style="background-color: #E2B6B3;">
                    ${ match.queueId } / ${ match.createTimeString } / ${ match.durationTimeString } /
                    ${match.participants[match.participantId - 1].stats.win}
                  </button>
                </c:if>
              </h2>
              <!-- 중앙 컨텐츠 -->
              <div class="accordion-body">
                <div class="d-flex justify-content-evenly my-1">
                  <!-- 캐릭터 초상화 -->
                  <div class="champion_icon my-auto me-xl-4">
                    <img class="rounded-circle"
                      src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${match.participants[match.participantId - 1].championId}.png">
                  </div>
                  <!-- 룬 스펠 -->
                  <div class="rune_speli d-flex me-xl-4">
                    <div class="rune_spell_icon d-flex flex-column justify-content-center">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${match.participants[match.participantId - 1].spell1Id}.png">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${match.participants[match.participantId - 1].spell2Id}.png">
                    </div>
                    <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                      <img
                        src="https://opgg-static.akamaized.net/images/lol/perk/${match.participants[match.participantId - 1].stats.perk0}.png">
                      <img
                        src="https://opgg-static.akamaized.net/images/lol/perkStyle/${match.participants[match.participantId - 1].stats.perkSubStyle}.png">
                    </div>
                  </div>
                  <!-- KDA -->
                  <div class="d-flex flex-column justify-content-center text-center lh-1 me-xl-4">
                    <span>${match.participants[match.participantId - 1].stats.kills} /
                      ${match.participants[match.participantId - 1].stats.deaths} /
                      ${match.participants[match.participantId - 1].stats.assists}</span>
                    <div class="rounded-pill bg-danger text-center text-white p-1">
                      <c:choose>
                        <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill <= 1}">
                        </c:when>
                        <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 2}">
                          <span>더블킬</span>
                        </c:when>
                        <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 3}">
                          <span>트리플킬</span>
                        </c:when>
                        <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 4}">
                          <span>쿼드라킬</span>
                        </c:when>
                        <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 5}">
                          <span>펜타킬</span>
                        </c:when>
                      </c:choose>
                    </div>
                  </div>
                  <!-- Info -->
                  <div class="d-flex flex-column justify-content-center text-center lh-sm me-xl-4">
                    <span>레벨 ${match.participants[match.participantId - 1].stats.champLevel}</span>
                    <span>${ match.participants[match.participantId - 1].stats.totalMinionsKilled +
                      match.participants[match.participantId - 1].stats.neutralMinionsKilled } CS</span>
                  </div>
                  <!-- 아이템 -->
                  <div class="item_icon d-flex me-xl-4">
                    <div class="item_icon d-flex flex-column justify-content-center">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item0 }.png">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item3 }.png">
                    </div>
                    <div class="item_icon d-flex flex-column justify-content-center">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item1 }.png">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item4 }.png">
                    </div>
                    <div class="item_icon d-flex flex-column justify-content-center">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item2 }.png">
                      <img
                        src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item5 }.png">
                    </div>
                  </div>
                </div>
              </div>
              <!-- 숨김 컨텐츠 -->
              <div id="match_${ match.gameId }" class="hidden-content accordion-collapse collapse">
                <c:forEach items="${ match.teams }" var="team">
                  <!-- 승리팀 = Blue -->
                  <c:if test="${ team.win == 'Win' && team.teamId == 100 }">
                    <!-- 승리팀 라벨 -->
                    <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
                      <div class="team_kda">
                        <span>승리 (블루팀)</span>
                        <span>${ team.totalKills } / ${ team.totalDeaths } / ${ team.totalAssists }</span>
                      </div>
                      <div class="team_object d-flex">
                        <div class="baron">
                          <img src="${ path }/resources/img/icon-baron-b.png">
                          <span>${ team.baronKills }</span>
                        </div>
                        <div class="dragon">
                          <img src="${ path }/resources/img/icon-dragon-b.png">
                          <span>${ team.dragonKills }</span>
                        </div>
                        <div class="tower">
                          <img src="${ path }/resources/img/icon-tower-b.png">
                          <span>${ team.towerKills }</span>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${ match.participants }" begin="0" end="4" var="pp">
                      <!-- 소환사 한명 -->
                      <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                        <!-- 왼쪽 정보 -->
                        <div class="d-flex left_info">
                          <!-- 캐릭터 초상화 -->
                          <div class="champion_icon my-auto me-1">
                            <img class="rounded-circle"
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                          </div>
                          <!-- 룬 스펠 -->
                          <div class="rune_speli d-flex">
                            <div class="rune_spell_icon d-flex flex-column justify-content-center">
                              <img
                                src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                              <img
                                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                            </div>
                            <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                              <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                              <img
                                src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                            </div>
                          </div>
                          <!-- 매칭 소환사 정보 -->
                          <div class="summoner_info d-flex flex-column">
                            <div class="summoner_tier d-flex">
                              <div class="summoner_name">
                                <span>${ pp.summoner }</span>
                              </div>
                            </div>
                            <!-- KDA -->
                            <div class="d-flex justify-content- text-center">
                              <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                              <!-- <span style="color: red;">11.00:1</span> -->
                            </div>
                          </div>
                        </div>
                        <!-- 오른쪽 정보 -->
                        <div class="d-flex flex-column text-center">
                          <!-- 아이템 -->
                          <div class="item_icon d-flex">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                          </div>
                          <!-- 딜량, cs-->
                          <div class="d-flex row row-cols-2">
                            <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                              pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                            <div class="progress p-0">
                              <div class="progress-bar bg-danger" role="progressbar"
                                style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                                aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                    <!-- 패배팀 라벨 -->
                    <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
                      <div class="team_kda">
                        <span>패배 (레드팀)</span>
                        <span>${ match.teams[1].totalKills } / ${ match.teams[1].totalDeaths } / ${
                          match.teams[1].totalAssists }</span>
                      </div>
                      <div class="team_object d-flex">
                        <div class="baron">
                          <img src="${ path }/resources/img/icon-baron-r.png">
                          <span>${ match.teams[1].baronKills }</span>
                        </div>
                        <div class="dragon">
                          <img src="${ path }/resources/img/icon-dragon-r.png">
                          <span>${ match.teams[1].dragonKills }</span>
                        </div>
                        <div class="tower">
                          <img src="${ path }/resources/img/icon-tower-r.png">
                          <span>${ match.teams[1].towerKills }</span>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${ match.participants }" begin="5" end="9" var="pp">
                      <!-- 소환사 한명 -->
                      <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                        <!-- 왼쪽 정보 -->
                        <div class="d-flex left_info">
                          <!-- 캐릭터 초상화 -->
                          <div class="champion_icon my-auto me-1">
                            <img class="rounded-circle"
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                          </div>
                          <!-- 룬 스펠 -->
                          <div class="rune_speli d-flex">
                            <div class="rune_spell_icon d-flex flex-column justify-content-center">
                              <img
                                src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                              <img
                                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                            </div>
                            <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                              <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                              <img
                                src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                            </div>
                          </div>
                          <!-- 매칭 소환사 정보 -->
                          <div class="summoner_info d-flex flex-column">
                            <div class="summoner_tier d-flex">
                              <div class="summoner_name">
                                <span>${ pp.summoner }</span>
                              </div>
                            </div>
                            <!-- KDA -->
                            <div class="d-flex justify-content- text-center">
                              <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                              <!-- <span style="color: red;">11.00:1</span> -->
                            </div>
                          </div>
                        </div>
                        <!-- 오른쪽 정보 -->
                        <div class="d-flex flex-column  text-center">
                          <!-- 아이템 -->
                          <div class="item_icon d-flex">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                          </div>
                          <!-- 딜량, cs-->
                          <div class="d-flex row row-cols-2">
                            <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                              pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                            <div class="progress p-0">
                              <div class="progress-bar bg-danger" role="progressbar"
                                style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                                aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </c:if>
                  <!-- 승리팀 = Red -->
                  <c:if test="${ team.win == 'Win' && team.teamId == 200 }">
                    <!-- 승리팀 라벨 -->
                    <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
                      <div class="team_kda">
                        <span>승리 (레드팀)</span>
                        <span>${ team.totalKills } / ${ team.totalDeaths } / ${ team.totalAssists }</span>
                      </div>
                      <div class="team_object d-flex">
                        <div class="baron">
                          <img src="${ path }/resources/img/icon-baron-b.png">
                          <span>${ team.baronKills }</span>
                        </div>
                        <div class="dragon">
                          <img src="${ path }/resources/img/icon-dragon-b.png">
                          <span>${ team.dragonKills }</span>
                        </div>
                        <div class="tower">
                          <img src="${ path }/resources/img/icon-tower-b.png">
                          <span>${ team.towerKills }</span>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${ match.participants }" begin="0" end="4" var="pp">
                      <!-- 소환사 한명 -->
                      <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                        <!-- 왼쪽 정보 -->
                        <div class="d-flex left_info">
                          <!-- 캐릭터 초상화 -->
                          <div class="champion_icon my-auto me-1">
                            <img class="rounded-circle"
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                          </div>
                          <!-- 룬 스펠 -->
                          <div class="rune_speli d-flex">
                            <div class="rune_spell_icon d-flex flex-column justify-content-center">
                              <img
                                src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                              <img
                                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                            </div>
                            <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                              <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                              <img
                                src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                            </div>
                          </div>
                          <!-- 매칭 소환사 정보 -->
                          <div class="summoner_info d-flex flex-column">
                            <div class="summoner_tier d-flex">
                              <div class="summoner_name">
                                <span>${ pp.summoner }</span>
                              </div>
                            </div>
                            <!-- KDA -->
                            <div class="d-flex justify-content- text-center">
                              <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                              <!-- <span style="color: red;">11.00:1</span> -->
                            </div>
                          </div>
                        </div>
                        <!-- 오른쪽 정보 -->
                        <div class="d-flex flex-column  text-center">
                          <!-- 아이템 -->
                          <div class="item_icon d-flex">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                          </div>

                          <!-- 딜량, cs-->
                          <div class="d-flex row row-cols-2">
                            <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                              pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                            <div class="progress p-0">
                              <div class="progress-bar bg-danger" role="progressbar"
                                style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                                aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                    <!-- 패배팀 라벨 -->
                    <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
                      <div class="team_kda">
                        <span>패배 (블루팀)</span>
                        <span>${ match.teams[0].totalKills } / ${ match.teams[0].totalDeaths } / ${
                          match.teams[0].totalAssists }</span>
                      </div>
                      <div class="team_object d-flex">
                        <div class="baron">
                          <img src="${ path }/resources/img/icon-baron-r.png">
                          <span>${ match.teams[0].baronKills }</span>
                        </div>
                        <div class="dragon">
                          <img src="${ path }/resources/img/icon-dragon-r.png">
                          <span>${ match.teams[0].dragonKills }</span>
                        </div>
                        <div class="tower">
                          <img src="${ path }/resources/img/icon-tower-r.png">
                          <span>${ match.teams[0].towerKills }</span>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${ match.participants }" begin="5" end="9" var="pp">
                      <!-- 소환사 한명 -->
                      <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                        <!-- 왼쪽 정보 -->
                        <div class="d-flex left_info">
                          <!-- 캐릭터 초상화 -->
                          <div class="champion_icon my-auto me-1">
                            <img class="rounded-circle"
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                          </div>
                          <!-- 룬 스펠 -->
                          <div class="rune_speli d-flex">
                            <div class="rune_spell_icon d-flex flex-column justify-content-center">
                              <img
                                src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                              <img
                                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                            </div>
                            <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                              <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                              <img
                                src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                            </div>
                          </div>
                          <!-- 매칭 소환사 정보 -->
                          <div class="summoner_info d-flex flex-column">
                            <div class="summoner_tier d-flex">
                              <div class="summoner_name">
                                <span>${ pp.summoner }</span>
                              </div>
                            </div>
                            <!-- KDA -->
                            <div class="d-flex justify-content- text-center">
                              <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                              <!-- <span style="color: red;">11.00:1</span> -->
                            </div>
                          </div>
                        </div>
                        <!-- 오른쪽 정보 -->
                        <div class="d-flex flex-column  text-center">
                          <!-- 아이템 -->
                          <div class="item_icon d-flex">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                            <img
                              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                          </div>
                          <!-- 딜량, cs-->
                          <div class="d-flex row row-cols-2">
                            <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                              pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                            <div class="progress p-0">
                              <div class="progress-bar bg-danger" role="progressbar"
                                style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                                aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </c:if>
                </c:forEach>
              </div>
            </div>
          </div>
        </c:forEach> <!-- match end foreach -->
        <button type="button" class="match_btn btn btn-secondary mt-2">더보기</button>
      </div>
    </div>
  </div>
</main>

<!-- 템플릿 -->
<script id="template" type="text/x-handlebars-template">
  <!-- 한개 게임 데이터 컨테이너 -->
  <div class="accordion" id="match_list">
    <div class="accordion-item">
      <!-- 타이틀 -->
      <h2 class="accordion-header">
        {{#if (isWin participants)}}
        <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
          data-bs-target="#match_{{ gameId }}" style="background-color: #A3CFEC;">
          {{ queueId }} / {{ createTimeString }} / {{ durationTimeString }} /
          {{ isWinString participants}}
        </button>
        {{else}}
        <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
          data-bs-target="#match_{{ gameId }}" style="background-color: #E2B6B3;">
          {{ queueId }} / {{ createTimeString }} / {{ durationTimeString }} /
          {{ isWinString participants}}
        </button>
        {{/if}}
      </h2>
      <!-- 중앙 컨텐츠 -->
      <div class="accordion-body">
        <div class="d-flex justify-content-evenly my-1">
          <!-- 캐릭터 초상화 -->
          <div class="champion_icon my-auto me-xl-4">
            <img class="rounded-circle"
              src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${match.participants[match.participantId - 1].championId}.png">
          </div>
          <!-- 룬 스펠 -->
          <div class="rune_speli d-flex me-xl-4">
            <div class="rune_spell_icon d-flex flex-column justify-content-center">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${match.participants[match.participantId - 1].spell1Id}.png">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${match.participants[match.participantId - 1].spell2Id}.png">
            </div>
            <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
              <img
                src="https://opgg-static.akamaized.net/images/lol/perk/${match.participants[match.participantId - 1].stats.perk0}.png">
              <img
                src="https://opgg-static.akamaized.net/images/lol/perkStyle/${match.participants[match.participantId - 1].stats.perkSubStyle}.png">
            </div>
          </div>
          <!-- KDA -->
          <div class="d-flex flex-column justify-content-center text-center lh-1 me-xl-4">
            <span>${match.participants[match.participantId - 1].stats.kills} /
              ${match.participants[match.participantId - 1].stats.deaths} /
              ${match.participants[match.participantId - 1].stats.assists}</span>
            <div class="rounded-pill bg-danger text-center text-white p-1">
              <c:choose>
                <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill <= 1}">
                </c:when>
                <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 2}">
                  <span>더블킬</span>
                </c:when>
                <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 3}">
                  <span>트리플킬</span>
                </c:when>
                <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 4}">
                  <span>쿼드라킬</span>
                </c:when>
                <c:when test="${match.participants[match.participantId - 1].stats.largestMultiKill == 5}">
                  <span>펜타킬</span>
                </c:when>
              </c:choose>
            </div>
          </div>
          <!-- Info -->
          <div class="d-flex flex-column justify-content-center text-center lh-sm me-xl-4">
            <span>레벨 ${match.participants[match.participantId - 1].stats.champLevel}</span>
            <span>${ match.participants[match.participantId - 1].stats.totalMinionsKilled +
              match.participants[match.participantId - 1].stats.neutralMinionsKilled } CS</span>
          </div>
          <!-- 아이템 -->
          <div class="item_icon d-flex me-xl-4">
            <div class="item_icon d-flex flex-column justify-content-center">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item0 }.png">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item3 }.png">
            </div>
            <div class="item_icon d-flex flex-column justify-content-center">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item1 }.png">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item4 }.png">
            </div>
            <div class="item_icon d-flex flex-column justify-content-center">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item2 }.png">
              <img
                src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ match.participants[match.participantId - 1].stats.item5 }.png">
            </div>
          </div>
        </div>
      </div>
      <!-- 숨김 컨텐츠 -->
      <div id="match_${ match.gameId }" class="hidden-content accordion-collapse collapse">
        <c:forEach items="${ match.teams }" var="team">
          <!-- 승리팀 = Blue -->
          <c:if test="${ team.win == 'Win' && team.teamId == 100 }">
            <!-- 승리팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>승리 (블루팀)</span>
                <span>${ team.totalKills } / ${ team.totalDeaths } / ${ team.totalAssists }</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-b.png">
                  <span>${ team.baronKills }</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-b.png">
                  <span>${ team.dragonKills }</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-b.png">
                  <span>${ team.towerKills }</span>
                </div>
              </div>
            </div>
            <c:forEach items="${ match.participants }" begin="0" end="4" var="pp">
              <!-- 소환사 한명 -->
              <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                <!-- 왼쪽 정보 -->
                <div class="d-flex left_info">
                  <!-- 캐릭터 초상화 -->
                  <div class="champion_icon my-auto me-1">
                    <img class="rounded-circle"
                      src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                  </div>
                  <!-- 룬 스펠 -->
                  <div class="rune_speli d-flex">
                    <div class="rune_spell_icon d-flex flex-column justify-content-center">
                      <img src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                      <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                    </div>
                    <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                      <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                      <img src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                    </div>
                  </div>
                  <!-- 매칭 소환사 정보 -->
                  <div class="summoner_info d-flex flex-column">
                    <div class="summoner_tier d-flex">
                      <div class="summoner_name">
                        <span>${ pp.summoner }</span>
                      </div>
                    </div>
                    <!-- KDA -->
                    <div class="d-flex justify-content- text-center">
                      <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                      <!-- <span style="color: red;">11.00:1</span> -->
                    </div>
                  </div>
                </div>
                <!-- 오른쪽 정보 -->
                <div class="d-flex flex-column text-center">
                  <!-- 아이템 -->
                  <div class="item_icon d-flex">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                  </div>
                  <!-- 딜량, cs-->
                  <div class="d-flex row row-cols-2">
                    <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                      pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                    <div class="progress p-0">
                      <div class="progress-bar bg-danger" role="progressbar"
                        style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                        aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
            <!-- 패배팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>패배 (레드팀)</span>
                <span>${ match.teams[1].totalKills } / ${ match.teams[1].totalDeaths } / ${
                  match.teams[1].totalAssists }</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-r.png">
                  <span>${ match.teams[1].baronKills }</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-r.png">
                  <span>${ match.teams[1].dragonKills }</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-r.png">
                  <span>${ match.teams[1].towerKills }</span>
                </div>
              </div>
            </div>
            <c:forEach items="${ match.participants }" begin="5" end="9" var="pp">
              <!-- 소환사 한명 -->
              <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                <!-- 왼쪽 정보 -->
                <div class="d-flex left_info">
                  <!-- 캐릭터 초상화 -->
                  <div class="champion_icon my-auto me-1">
                    <img class="rounded-circle"
                      src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                  </div>
                  <!-- 룬 스펠 -->
                  <div class="rune_speli d-flex">
                    <div class="rune_spell_icon d-flex flex-column justify-content-center">
                      <img src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                      <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                    </div>
                    <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                      <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                      <img src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                    </div>
                  </div>
                  <!-- 매칭 소환사 정보 -->
                  <div class="summoner_info d-flex flex-column">
                    <div class="summoner_tier d-flex">
                      <div class="summoner_name">
                        <span>${ pp.summoner }</span>
                      </div>
                    </div>
                    <!-- KDA -->
                    <div class="d-flex justify-content- text-center">
                      <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                      <!-- <span style="color: red;">11.00:1</span> -->
                    </div>
                  </div>
                </div>
                <!-- 오른쪽 정보 -->
                <div class="d-flex flex-column  text-center">
                  <!-- 아이템 -->
                  <div class="item_icon d-flex">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                  </div>
                  <!-- 딜량, cs-->
                  <div class="d-flex row row-cols-2">
                    <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                      pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                    <div class="progress p-0">
                      <div class="progress-bar bg-danger" role="progressbar"
                        style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                        aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:if>
          <!-- 승리팀 = Red -->
          <c:if test="${ team.win == 'Win' && team.teamId == 200 }">
            <!-- 승리팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>승리 (레드팀)</span>
                <span>${ team.totalKills } / ${ team.totalDeaths } / ${ team.totalAssists }</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-b.png">
                  <span>${ team.baronKills }</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-b.png">
                  <span>${ team.dragonKills }</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-b.png">
                  <span>${ team.towerKills }</span>
                </div>
              </div>
            </div>
            <c:forEach items="${ match.participants }" begin="0" end="4" var="pp">
              <!-- 소환사 한명 -->
              <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                <!-- 왼쪽 정보 -->
                <div class="d-flex left_info">
                  <!-- 캐릭터 초상화 -->
                  <div class="champion_icon my-auto me-1">
                    <img class="rounded-circle"
                      src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                  </div>
                  <!-- 룬 스펠 -->
                  <div class="rune_speli d-flex">
                    <div class="rune_spell_icon d-flex flex-column justify-content-center">
                      <img src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                      <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                    </div>
                    <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                      <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                      <img src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                    </div>
                  </div>
                  <!-- 매칭 소환사 정보 -->
                  <div class="summoner_info d-flex flex-column">
                    <div class="summoner_tier d-flex">
                      <div class="summoner_name">
                        <span>${ pp.summoner }</span>
                      </div>
                    </div>
                    <!-- KDA -->
                    <div class="d-flex justify-content- text-center">
                      <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                      <!-- <span style="color: red;">11.00:1</span> -->
                    </div>
                  </div>
                </div>
                <!-- 오른쪽 정보 -->
                <div class="d-flex flex-column  text-center">
                  <!-- 아이템 -->
                  <div class="item_icon d-flex">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                  </div>

                  <!-- 딜량, cs-->
                  <div class="d-flex row row-cols-2">
                    <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                      pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                    <div class="progress p-0">
                      <div class="progress-bar bg-danger" role="progressbar"
                        style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                        aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
            <!-- 패배팀 라벨 -->
            <div class="team_label accordion-body d-flex justify-content-around" style="background: #b4b4b4;">
              <div class="team_kda">
                <span>패배 (블루팀)</span>
                <span>${ match.teams[0].totalKills } / ${ match.teams[0].totalDeaths } / ${
                  match.teams[0].totalAssists }</span>
              </div>
              <div class="team_object d-flex">
                <div class="baron">
                  <img src="${ path }/resources/img/icon-baron-r.png">
                  <span>${ match.teams[0].baronKills }</span>
                </div>
                <div class="dragon">
                  <img src="${ path }/resources/img/icon-dragon-r.png">
                  <span>${ match.teams[0].dragonKills }</span>
                </div>
                <div class="tower">
                  <img src="${ path }/resources/img/icon-tower-r.png">
                  <span>${ match.teams[0].towerKills }</span>
                </div>
              </div>
            </div>
            <c:forEach items="${ match.participants }" begin="5" end="9" var="pp">
              <!-- 소환사 한명 -->
              <div class="summoner accordion-body d-flex justify-content-around align-content-center">
                <!-- 왼쪽 정보 -->
                <div class="d-flex left_info">
                  <!-- 캐릭터 초상화 -->
                  <div class="champion_icon my-auto me-1">
                    <img class="rounded-circle"
                      src="https://ddragon.leagueoflegends.com/cdn/${version}/img/champion/${ pp.championId }.png">
                  </div>
                  <!-- 룬 스펠 -->
                  <div class="rune_speli d-flex">
                    <div class="rune_spell_icon d-flex flex-column justify-content-center">
                      <img src=" https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell1Id }.png">
                      <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/spell/${ pp.spell2Id }.png">
                    </div>
                    <div class="rune_spell_icon d-flex flex-column justify-content-center me-2">
                      <img src="https://opgg-static.akamaized.net/images/lol/perk/${pp.stats.perk0}.png">
                      <img src="https://opgg-static.akamaized.net/images/lol/perkStyle/${pp.stats.perkSubStyle}.png">
                    </div>
                  </div>
                  <!-- 매칭 소환사 정보 -->
                  <div class="summoner_info d-flex flex-column">
                    <div class="summoner_tier d-flex">
                      <div class="summoner_name">
                        <span>${ pp.summoner }</span>
                      </div>
                    </div>
                    <!-- KDA -->
                    <div class="d-flex justify-content- text-center">
                      <span>${ pp.stats.kills }/${ pp.stats.deaths }/${ pp.stats.assists }</span>&nbsp;
                      <!-- <span style="color: red;">11.00:1</span> -->
                    </div>
                  </div>
                </div>
                <!-- 오른쪽 정보 -->
                <div class="d-flex flex-column  text-center">
                  <!-- 아이템 -->
                  <div class="item_icon d-flex">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item0 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item1 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item2 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item3 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item4 }.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${ pp.stats.item5 }.png">
                  </div>
                  <!-- 딜량, cs-->
                  <div class="d-flex row row-cols-2">
                    <span class="p-0 col-5">${ pp.stats.totalMinionsKilled +
                      pp.stats.neutralMinionsKilled}CS<%-- <fmt:formatNumber value="${ pp.stats.totalDamageDealtToChampions / 10000 }" pattern=".0"/>만 --%></span>
                    <div class="progress p-0">
                      <div class="progress-bar bg-danger" role="progressbar"
                        style="width: ${(pp.stats.totalDamageDealtToChampions * 100) / match.maxDamage}%;"
                        aria-valuemin="0" aria-valuemax="100">${ pp.stats.totalDamageDealtToChampions }</div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:if>
        </c:forEach>
      </div>
    </div>
  </div>
</script>

<!-- 더보기 버튼 -->
<script>
  var pageNum = ${pageNum};

  $('.match_btn').on('click', function () {
    var html = '';
    $.ajax({
      type: 'GET',
      url: '/lol/matchs/${ summoner.name }?pageNum=${ pageNum }',
      success: function (data) {
        data.forEach(function (item, index) {
          var source = $("#template").html();
          var template = Handlebars.compile(source);
          console.log(item);

          // var obj = JSON.parse(item);
          var participantId = item.participantId;
          console.log("participantId : " + participantId);

          // 승리 boolean 반환
          Handlebars.registerHelper('isWin', function (value) {
            if (value[participantId - 1].stats.win == '승리') {
              return true;
            } else {
              return false;
            }
          });

          // 승리 String 반환
          Handlebars.registerHelper('isWinString', function (value) {
            if (value[participantId - 1].stats.win == '승리') {
              return '승리';
            } else {
              return '패배';
            }
          });

          html += template(item);
        });

        $("#match_cap").append(html);
      },
      error: function () {
        console.log('통신 오류');
      }
    });
    // $('#match_cap').load(window.location.href + ' #match_container');
  });
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>