<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Prison</title>
</head>
<body class="bg-danger">
	<div>
		<div class="d-flex justify-content-between">
			<div class="m-5 d-flex">
				<h3 class="me-3">Your Gold:</h3>
				<input type="text" value="${gold}" disabled />
			</div>
			<a class="btn btn-success btn-outline-dark playAgain m-5 text-light" type="button"
				href="/reset">Play Again?</a>
		</div>
		<div class="d-flex justify-content-evenly">
			<div class="border border-dark border-2 p-3 location">
				<form class="d-flex flex-column" action="/process" method="post">
					<input name="location" value="farm" hidden="true" />
					<h3 class="mx-auto">Farm</h3>
					<p class="mx-auto">(earns 10-20 gold)</p>
					<input class="btn btn-warning btn-outline-dark" type="submit"
						value="Find Gold!" disabled/>
				</form>
			</div>
			<div class="border border-dark border-2 p-3 location">
				<form class="d-flex flex-column" action="/process" method="post">
					<input name="location" value="cave" hidden="true" />
					<h3 class="mx-auto">Cave</h3>
					<p class="mx-auto">(earns 5-10 gold)</p>
					<input class="btn btn-warning btn-outline-dark" type="submit"
						value="Find Gold!" disabled/>
				</form>
			</div>
			<div class="border border-dark border-2 p-3 location">
				<form class="d-flex flex-column" action="/process" method="post">
					<input name="location" value="house" hidden="true" />
					<h3 class="mx-auto">House</h3>
					<p class="mx-auto">(earns 2-5 gold)</p>
					<input class="btn btn-warning btn-outline-dark" type="submit"
						value="Find Gold!" disabled/>
				</form>
			</div>
			<div class="border border-dark border-2 p-3 location">
				<form class="d-flex flex-column" action="/process" method="post">
					<input name="location" value="quest" hidden="true" />
					<h3 class="mx-auto">Quest</h3>
					<p class="mx-auto">(earns/takes 0 - 50 gold)</p>
					<input class="btn btn-warning btn-outline-dark" type="submit"
						value="Find Gold!" disabled/>
				</form>
			</div>
			<div class="border border-dark border-2 p-3 location">
				<form class="d-flex flex-column" action="/process" method="post">
					<input name="location" value="spa" hidden="true" />
					<h3 class="mx-auto">Spa</h3>
					<p class="mx-auto">(takes 5 - 20 gold)</p>
					<input class="btn btn-primary btn-outline-dark spaBtn" type="submit"
						value="Relax!" disabled/>
				</form>
			</div>
		</div>
		<div class="m-5 d-flex flex-column">
			<h3 class="mb-4">Activities:</h3>
			<div class="border border-2 border-dark mt-1  bg-light" id="activites">
				<c:forEach var="oneMessage" items="${messages}">
					${oneMessage}
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>