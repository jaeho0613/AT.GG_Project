<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${ pageContext.request.contextPath }"></c:set>
<c:set var="currentUrl" value="${ pageContext.request.requestURL }"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>AT.GG</title>

	<!-- Handlebars JS -->
	<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

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

	<!-- 경로 계산후 CSS import -->
	<c:choose>

		<c:when test="${ fn:contains(currentUrl, 'main') }">
			<link rel="stylesheet" href="${ path }/resources/css/main.css">
		</c:when>

		<c:when test="${ fn:contains(currentUrl, 'summoner') }">
			<link rel="stylesheet" href="${ path }/resources/css/summoner.css">
		</c:when>

	</c:choose>
</head>

<body>

	<!-- Navbar -->
	<header class="fixed-top shadow-lg">
		<nav class="navbar navbar-expand-lg navbar-dark px-2" style="background-color: #5383E8;">
			<div class="container-fluid">

				<!-- Main Logo -->
				<a class="navbar-brand" href="/at.gg">AT.GG</a>

				<!-- Nav Menu Button -->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
					aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Nav Content -->
				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">

					<!-- Link -->
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" aria-current="page" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page" href="#">전적 검색</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page" href="#">챔피언 정보</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page" href="#">아이템 정보</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page" href="#">다운로드</a></li>
					</ul>

					<!-- Nav Search Bar -->
					<form class="d-flex m-0" action="/at.gg/summoner" method="GET">
						<input class="form-control me-2 px-2 py-0" type="search" name="summonerName" placeholder="소환사, 소환사명..."
							autocomplete="off">
						<button type="submit" class="btn btn-primary me-2">.GG</button>
					</form>

					<!-- Nav LogIn Btn -->
					<button type="button" class="logInBtn btn btn-primary active">로그인</button>
				</div>
			</div>
		</nav>
	</header>