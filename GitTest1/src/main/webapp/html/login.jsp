<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="imagetoolbar" content="no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="title" content="웹사이트">
	<meta name="description" content="웹사이트입니다.">
	<meta name="keywords" content="키워드,키워드,키워드">
	<meta property="og:title" content="웹사이트">
	<meta property="og:description" content="웹사이트입니다">
	<meta property="og:image" content="https://웹사이트/images/opengraph.png">
	<meta property="og:url" content="https://웹사이트">
	<title>로그인 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="RMlQ6deKn4" id="">
		<div class="header-container container-lg">
			<div class="header-left">
				<h1 class="header-title">
					<a href="MainPage.jsp">
						<img src="../resources/images/img_logo.png" alt="로고">
					</a>
				</h1>
			</div>
			<div class="header-center">
				<ul class="header-gnblist">
					<li class="header-gnbitem">
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="MainPage.jsp">
							<span>홈</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="board.jsp">
							<span>부동산 게시판</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="Chat.jsp">
							<span>동네 채팅</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="header-right">
				<div class="header-utils">
					<a href="login.jsp" class="btn-profile header-utils-btn">
						<img src="../resources/icons/ico_profile_black.svg" alt="검색">
					</a>
					<button class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" alt="검색">
					</button>
	</header>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main ">
		<!-- [S]campland-N24 -->
		<form method="post" action="http://localhost:8083/GitTest1/Login.do">
			
		<div class="campland-N24" data-bid="oULq6dgKXB">
			<div class="contents-inner">
				<div class="contents-container">
					<div class="contents-top">
						<div class="textset textset-center">
							<h2 class="textset-tit">일반 로그인</h2>
						</div>
						<div class="inputset inputset-round">
							<input name="user_id" type="text" class="inputset-input form-control" aria-label="내용"
								placeholder="아이디를 입력해주세요.">
						</div>
						<div class="inputset inputset-round">
							<input name="user_pw" type="password" class="inputset-input form-control" aria-label="내용"
								placeholder="비밀번호를 입력해주세요.">
						</div>
						<div class="checkset">
							<input id="checkset-a-1-1" class="checkset-input input-fill input-round" type="checkbox"
								value="">
						</div>
							
						<input type="submit" class="btnset btnset-round" value="로그인">
						</form>
						
						<ul class="contents-list">
							<li class="contents-item">
								<a href="javascipt:void(0);">아이디 찾기</a>
							</li>
							<li class="contents-item">
								<a href="javascipt:void(0);">비밀번호 찾기</a>
							</li>
							<li class="contents-item">
								<a href="Join.jsp">회원가입</a>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<!-- [E]campland-N24 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="Ojlq6dgkyD">
		<div class="footer-container container-lg">
			<div class="footer-bottom">
				<h2 class="footer-logo">
				</h2>
				<div class="footer-txt">
					<p> 전남 목포시 산정로212번길 13 (구, 청호중학교) </p>
					<p>
						<span>T. 062-655-3510</span>
						<span>E. smhrd@smhrd.or.kr</span>
					</p>
				</div>
				<div class="footer-txt">
					<p>2023 BY TEMPLATEHOUSE. ALL RIGHTS RESEVED</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- [E]campland-N2 -->
	<script src="../resources/js/setting.js"></script>
	<script src="../resources/js/plugin.js"></script>
	<script src="../resources/js/template.js"></script>
	<script src="../resources/js/common.js"></script>
	<script src="../resources/js/script.js"></script>
</body>
</html>