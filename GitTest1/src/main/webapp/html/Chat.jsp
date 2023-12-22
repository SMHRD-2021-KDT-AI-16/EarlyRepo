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
	<title>채팅 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="RslQ6DntxK">
		<div class="header-container container-lg">
			<div class="header-left">
				<h1 class="header-title">
					<a href="Main.jsp">
						<img src="../resources/images/img_logo.png" alt="로고">
					</a>
				</h1>
			</div>
			<div class="header-center">
				<ul class="header-gnblist">
					<li class="header-gnbitem">
						</li>
						<a class="header-gnblink" href="map.jsp">
							<span>집찾기</span>
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
				</div>
			</div>
		</div>
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
			<div class="footer-top">
				<h1 class="footer-logo">
					<a href="javascript:void(0)">
						<img src="../resources/images/img_logo_white.png" alt="로고">
					</a>
				</h1>
				<ul class="footer-menulist">
					<li class="footer-menuitem">
						<a href="javascript:void(0)">
							<span>이용약관</span>
						</a>
					</li>
					<li class="footer-menuitem">
						<a href="javascript:void(0)">
							<span>개인정보처리방침</span>
						</a>
					</li>
					<li class="footer-menuitem">
						<a href="javascript:void(0)">
							<span>푸터메뉴1</span>
						</a>
					</li>
					<li class="footer-menuitem">
						<a href="javascript:void(0)">
							<span>푸터메뉴2</span>
						</a>
					</li>
				</ul>
				<ul class="footer-snslist">
					<li class="footer-snsitem">
						<a class="footer-snslink" href="javascript:void(0)">
							<img src="../resources/icons/ico_instagram_lightgrey.svg" alt="인스타그램">
						</a>
					</li>
					<li class="footer-snsitem">
						<a class="footer-snslink" href="javascript:void(0)">
							<img src="../resources/icons/ico_youtube_lightgrey.svg" alt="유튜브">
						</a>
					</li>
					<li class="footer-snsitem">
						<a class="footer-snslink" href="javascript:void(0)">
							<img src="../resources/icons/ico_facebook_lightgrey.svg" alt="페이스북">
						</a>
					</li>
					<li class="footer-snsitem">
						<a class="footer-snslink" href="javascript:void(0)">
							<img src="../resources/icons/ico_kakao_lightgrey.svg" alt="카카오톡">
						</a>
					</li>
				</ul>
			</div>
			<div class="footer-bottom">
				<h2 class="footer-logo">
					<a href="Main.jsp">
						<img src="../resources/images/img_logo_white.png" alt="로고">
					</a>
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