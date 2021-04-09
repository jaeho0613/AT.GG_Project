<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"></c:set>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- Main Container -->
	<main class="container d-flex flex-column justify-content-center">

		<!-- Main Logo -->
		<div class="text-center">
			<img src="${ path }/resources/img/AT.GG_Logo_Blue.png" class="img-fluid">
			<!-- <img src="/img/AT.GG_Logo_Blue.png" class="img-fluid"> -->
		</div>

		<!-- Search Bar -->
		<div class="searchBar mx-auto my-5">
			<form action="/at.gg/summoner" method="GET" class="d-flex m-0">
				<input type="search" class="form-control me-2" name="summonerName" placeholder="소환사, 소환사명..." autocomplete="off">
				<button type="submit" class="btn btn-primary">.GG</button>
			</form>
		</div>
	</main>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>