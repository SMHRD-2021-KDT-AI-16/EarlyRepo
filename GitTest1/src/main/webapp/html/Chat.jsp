<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>채팅 | 핵심프로젝트</title>
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
					 <c:if test="${member==null }">
                        <a href="login.jsp"><img src="../resources/icons/LOGIN.png"></a>
                     </c:if>
                     <c:if test="${member!=null }">
                           <c:if test="${member.user_id!='admin' }">
                              <a href="Mypage.jsp"><img src="../resources/icons/ico_profile_black.png" ></a>
                           </c:if>
                           <c:if test="${member.user_id!='admin' }">
                              <a href="http://localhost:8083/GitTest1/Logout.do"><img src="../resources/icons/LOGOUT.png" ></a>
                           </c:if>
                           <c:if test="${member.user_id=='admin' }">
                              <a href="SelectAll.do">회원관리</a>
                           </c:if>   
                     </c:if>
					<button class="btn-search header-utils-btn">
						<a href ="Profile.jsp"><img src="../resources/icons/ico_search_black.svg"></a>
					</button>
	</header>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main ">
		<!-- [S]campland-N8 -->
		<div class="campland-N8" data-bid="fGLQ6DNtyW">
			<div class="contents-container">
				<img class="contents-visual img-pc" src="../resources/images/img_subvisual_1.png" alt="서브 비주얼 PC 이미지">
				<img class="contents-visual img-mobile" src="../resources/images/img_subvisual_mobile_1.png"
					alt="서브 비주얼 모바일 이미지">
				<div class="contents-body container-md">
					<div class="textset textset-visual">
						<h2 class="textset-tit">동네채팅</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N8 -->
		<!-- [S]campland-N17 -->
		<div class="campland-N17" data-bid="QolQ6dnTZH" id="">
			<div class="contents-inner">
				<div class="contents-container container-md">
					<div class="textset textset-sub">
						<h2 class="textset-tit">동네채팅​<br></h2>
					</div>
					<div class="contents-body">
						<!-- * 카카오맵 - 지도퍼가기 -->
						<!-- 1. 지도 노드 -->
						<div id="daumRoughmapContainer1690352447500"
							class="root_daum_roughmap root_daum_roughmap_landing"></div>
						<!--
      2. 설치 스크립트
      * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
    -->
						<script charset="UTF-8" class="daum_roughmap_loader_script"
							src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
						<!-- 3. 실행 스크립트 -->
						<script charset="UTF-8">
							new daum.roughmap.Lander({
								"timestamp": "1690352447500",
								"key": "2fnib",
							}).render();
						</script>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N17 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="GjLQ6dNu06" id="">
		<div class="footer-container container-lg">
			<div class="footer-bottom">
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