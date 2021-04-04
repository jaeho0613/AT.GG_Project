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
	<title>AT.GG</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

	<!-- Jquery JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- main CSS -->
	<link rel="stylesheet" href="${ path }/resources/css/custom.css">
</head>

<body>

	<!-- Navbar -->
	<header class="navbar navbar-dark navbar-expand-lg fixed-top shadow-lg" style="background-color: #5383E8;">
		<nav class="container flex-wrap flex-md-nowrap">
			<a class="navbar-brand" href="#">AT.GG</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" href="#">Home</a>
					<a class="nav-link" href="#">챔피언 분석</a>
					<a class="nav-link" href="#">통계</a>
					<a class="nav-link" href="#">랭킹</a>
				</div>
			</div>
		</nav>
	</header>

	<!-- Main Container -->
	<main class="container mt-5">

		<!-- Main Logo -->
		<div class="text-center">
			<img src="${ path }/resources/img/AT.GG_Logo_Blue.png" class="img-fluid" alt="...">
		</div>

		<!-- Search Bar -->
		<div class="m-auto" style="max-width: 600px;">
			<form action="#" method="post" class="d-flex">
				<input type="text" class="form-control" name="userName" placeholder="소환사, 소환사명..." autocomplete="off">
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</main>

	<!-- Footer -->
	<footer class="text-center">
		<div class="container ">
			<ul>
				<li class="d-inline-block">
					<a href="#" class="text-white">GitHub</a>
				</li>
				<li class="d-inline-block">
					<a href="#" class="text-white">GitHub</a>
				</li>
				<li class="d-inline-block">
					<a href="#" class="text-white">GitHub</a>
				</li>
				<li class="d-inline-block">
					<a href="#" class="text-white">GitHub</a>
				</li>
			</ul>
		</div>
	</footer>

</body>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</html>