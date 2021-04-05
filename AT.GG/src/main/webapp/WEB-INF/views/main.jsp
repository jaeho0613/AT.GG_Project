<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>AT.GG - Visual Studio</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<!-- Jquery JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- Fontawesome JS -->
	<script src="https://kit.fontawesome.com/7d6b56a039.js" crossorigin="anonymous"></script>

	<!-- Global CSS -->
	<link rel="stylesheet" href="${ path }/resources/css/global.css">
	<!-- <link rel="stylesheet" href="global.css"> -->

	<!-- main page css -->
	<link rel="stylesheet" href="${ path }/resources/css/main.css">
	<!-- <link rel="stylesheet" href="main.css"> -->
</head>

<body>

	<!-- Navbar -->
	<header class="fixed-top shadow-lg">
		<nav class="navbar navbar-expand-lg navbar-dark px-2" style="background-color: #5383E8;">
			<div class="container-fluid">

				<!-- Main Logo -->
				<a class="navbar-brand" href="#">AT.GG</a>

				<!-- Nav Menu Button -->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
					aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Nav Content -->
				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">

					<!-- Link -->
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="#">홈</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="#">전적 검색</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="#">챔피언 정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="#">아이템 정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">다운로드</a>
						</li>
					</ul>

					<!-- Nav Search Bar -->
					<form class="d-flex m-0" action="#" method="GET">
						<input class="form-control me-2 px-2 py-0" type="search" name="userName" placeholder="소환사, 소환사명..."
							autocomplete="off">
						<button type="button" class="btn btn-primary me-2">.GG</button>
					</form>

					<!-- Nav LogIn Btn -->
					<button type="button" class="logInBtn btn btn-primary active">로그인</button>
				</div>
			</div>
		</nav>
	</header>

	<!-- Main Container -->
	<main class="container d-flex flex-column justify-content-center">

		<!-- Main Logo -->
		<div class="text-center">
			<img src="${ path }/resources/img/AT.GG_Logo_Blue.png" class="img-fluid" alt="...">
			<!-- <img src="/img/AT.GG_Logo_Blue.png" class="img-fluid"> -->
		</div>

		<!-- Search Bar -->
		<div class="searchBar mx-auto my-5">
			<form action="search.html" method="GET" class="d-flex m-0">
				<input type="search" class="form-control me-2" name="userName" placeholder="소환사, 소환사명..." autocomplete="off">
				<button type="button" class="btn btn-primary">.GG</button>
			</form>
		</div>
	</main>

	<!-- Footer -->
	<footer class="text-center pb-3">
		<div class="container">
			<!-- Link -->
			<ul class="footer_link">
				<li class="d-inline-block">
					<a href="#" class="text-white">About AT.GG</a>
				</li>
				<li class="d-inline-block">
					<a href="#" class="text-white">도움말</a>
				</li>
				<li class="d-inline-block">
					<a href="#" class="text-white">문의/피드백</a>
				</li>
			</ul>
			<!-- Copy -->
			<div class="footer_copyright">
				<p class="text-white">
					© 2012-2021
					OP.GG.
					OP.GG isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone
					officially
					involved in producing or managing
					League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games,
					Inc.
					League of Legends © Riot Games, Inc.
				</p>
			</div>
			<!-- sns icon -->
			<div class="footer_sns d-flex justify-content-center">
				<ul class="list-group list-group-horizontal">
					<li class="icon list-group-item">
						<i class="fab fa-instagram-square"></i>
					</li>
					<li class="icon list-group-item">
						<i class="fab fa-twitter-square"></i>
					</li>
					<li class="icon list-group-item">
						<i class="fab fa-facebook-square"></i>
					</li>
				</ul>
			</div>
		</div>
	</footer>

</body>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</html>