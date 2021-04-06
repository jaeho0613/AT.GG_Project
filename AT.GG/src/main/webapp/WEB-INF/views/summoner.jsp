<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<main class="container ">
    <div class="content d-flex justify-content-between row">
      <!-- 왼쪽 컨테이너 -->
      <div class="summoner_info_container col-xl-2">
        <!-- 소환사 정보 -->
        <div class="card shadow mb-2 col">
          <div class="card-body d-flex flex-column justify-content-start align-content-center">
            <img class="summoner_icon mx-auto" src="https://tinyurl.com/yhjlx9bv" width="100" height="100">
            <div class="summoner_info d-flex flex-column text-center mt-2">
              <span>정재호임</span>
              <span>LV : 228</span>
              <span>
                <button type="button" class="btn btn-primary">업데이트</button>
              </span>
            </div>
          </div>
        </div>
        <!--랭크 정보 컨테이너 -->
        <div class="d-flex flex-xl-column mb-2 col">
          <!-- 솔로 랭크 -->
          <div class="card shadow" style="min-width: 50%;">
            <div class="summoner_solo card-body d-flex flex-column text-center">
              <img class=" mx-auto d-block" src="https://tinyurl.com/yj3zxotf" width="90" height="90">
              <span>솔로랭크</span>
              <span>Gold2 / 85LP</span>
              <span>24승 28패</span>
              <span>승률 46% </span>
            </div>
          </div>
          <!-- 자유 랭크 -->
          <div class="card shadow" style="min-width: 50%;">
            <div class="summoner_team card-body d-flex flex-column text-center">
              <img class=" mx-auto d-block" src="https://tinyurl.com/yfrumq6e" width="90" height="90">
              <span>자유랭크</span>
              <span>Silver1 / 85LP</span>
              <span>24승 28패</span>
              <span>승률 46% </span>
            </div>
          </div>
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
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_1" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_2" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_2" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_3" style="background-color: #A3CFEC;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_3" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
        <!-- 한개 게임 데이터 컨테이너 -->
        <div class="accordion" id="match_list">
          <div class="accordion-item">
            <!-- 타이틀 -->
            <h2 class="accordion-header">
              <button class="accordion-button collapsed text-dark" type="button" data-bs-toggle="collapse"
                data-bs-target="#match_4" style="background-color: #E2B6B3;">
                자유 랭크 · 4일전 / 28분 / 승리
              </button>
            </h2>
            <!-- 중앙 컨텐츠 -->
            <div class="accordion-body">
              <div class="d-flex justify-content-evenly">
                <!-- 캐릭터 초상화 -->
                <div class="champion_icon my-auto me-xl-4">
                  <img class="rounded-circle"
                    src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/Azir.png">
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
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>12 / 2 / 10</span>
                  <span>11.00 : 1</span>
                  <div class="rounded-pill bg-danger text-center text-white">
                    <span>더블킬</span>
                  </div>
                </div>
                <!-- KDA -->
                <div class="d-flex flex-column justify-content-center text-center me-xl-4">
                  <span>레벨 16</span>
                  <span>201 (7) CS</span>
                  <span>킬관여 48%</span>
                </div>
                <!-- 아이템 -->
                <div class="rune_speli d-flex me-xl-4">
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/4630.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3157.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/3115.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                  </div>
                  <div class="rune_spell_icon d-flex flex-column justify-content-center">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/1026.png">
                    <img src="https://ddragon.leagueoflegends.com/cdn/11.7.1/img/item/6653.png">
                  </div>
                </div>
              </div>
            </div>
            <!-- 숨김 컨텐츠 -->
            <div id="match_4" class="accordion-collapse collapse">
              <div class="accordion-body">
                <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse
                plugin adds the appropriate classes that we use to style each element. These classes control the overall
                appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with
                custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go
                within the <code>.accordion-body</code>, though the transition does limit overflow.
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>