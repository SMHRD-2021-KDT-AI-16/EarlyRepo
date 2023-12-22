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
	<title>첫페이지 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<!-- [S]campland-N1 -->
	<div class="campland-N1" data-bid="uyLQ6D9nXU" id="">
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
					<li class="header-gnbitem">
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
				
				
			</div>
			<div class="header-right">
				<div class="header-utils">
					<!--로그인 아이콘 위치-->
				
					<c:if test="${member==null }">
								<a href="login.jsp" class="btnset btnset-round">로그인</a>
							</c:if>
								<c:if test="${member!=null }">
									<c:if test="${member.user_id!='admin' }">
										<a href="Mypage.jsp" class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary" >개인정보수정</a>
									</c:if>
									
									<c:if test="${member.user_id=='admin' }">
										<a href="SelectAll.jsp" class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary">회원관리</a>
									</c:if>	
							</c:if>
									
											
					<button class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" alt="검색">
					</button>

					<button class="btn-moclose header-utils-btn">
						<img src="../resources/icons/ico_close_m_black.svg" alt="닫기">
					</button>
				</div>
			</div>
		</div>
		<button class="fullmenu-close">
			<img src="../resources/icons/ico_close_m_white.svg" alt="닫기">
		</button>
	</div>
	</div>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main ">
		<!-- [S]campland-N3 -->
		<div class="campland-N3" data-bid="dsLQ6cqkcE">
			<div class="contents-container">
				<div class="contents-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img class="contents-backimg img-pc" src="../resources/images/main1.png"
								alt="PC 메인 비주얼 이미지">
							<img class="contents-backimg img-mobile"
								src="../resources/images/img_mainvisual_mobile_1.png" alt="모바일 메인 비주얼 이미지">
							<div class="contents-slide-group container-md">
								<div class="textset textset-visual">
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<img class="contents-backimg img-pc" src="../resources/images/img_mainvisual_1.png"
								alt="PC 메인 비주얼 이미지">
							<img class="contents-backimg img-mobile"
								src="/api/t-a/64/1702627200/resources/images/img_mainvisual_mobile_1.png"
								alt="모바일 메인 비주얼 이미지">
							<div class="contents-slide-group container-md">
								<div class="textset textset-visual">
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<img class="contents-backimg img-pc" src="../resources/images/img_mainvisual_1.png"
								alt="PC 메인 비주얼 이미지">
							<img class="contents-backimg img-mobile"
								src="/api/t-a/64/1702627200/resources/images/img_mainvisual_mobile_1.png"
								alt="모바일 메인 비주얼 이미지">
							<div class="contents-slide-group container-md">
								<div class="textset textset-visual">
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="contents-control">
						<div class="swiper-pagination"></div>
						<div class="swiper-button-pause">
							<img src="../resources/icons/ico_pause_white.svg" alt="스와이퍼 멈춤버튼">
						</div>
						<div class="swiper-button-play">
							<img src="../resources/icons/ico_play_white.svg" alt="스와이퍼 재생버튼">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N3 -->
		<!-- [S]campland-N4 -->
		<div class="campland-N4" data-bid="kilq6cqkd6" id="">
		</div>
		<!-- [E]campland-N4 -->
		<!-- [S]campland-N5 -->
		<div class="campland-N5" data-bid="yrlQ6CQKDN" id="">
			<div class="contents-inner">
				<div class="contents-container container-md">
					<div class="cardset-wrap">
						<div class="cardset cardset-center">
							<a href="map.jsp">
								<figure class="cardset-figure">
									<img class="cardset-img" src="../resources/icons/icons8-부동산-48.png" alt="캠핑장 아이콘">
								</figure>
								<div class="cardset-body">
									<h2 class="cardset-tit">집 찾기</h2>
									<p class="cardset-desc"> 당신의 능력으로 구매 가능한 집
										<br>
										딱 맞춰 보여드립니다.
									</p>
								</div>
							</a>
						</div>
						<div class="cardset cardset-center">
							<a href="board.jsp">
								<figure class="cardset-figure">
									<img class="cardset-img" src="../resources/icons/icons8-게시판-48.png" alt="카라반 아이콘">
								</figure>
								<div class="cardset-body">
									<h2 class="cardset-tit">부동산 게시판</h2>
									<p class="cardset-desc">
										나만 알기 아까운 이야기
										<br> 함께 나누어요.
									</p>
								</div>
							</a>
						</div>
						<div class="cardset cardset-center">
							<a href="Chat.jsp">
								<figure class="cardset-figure">
									<img class="cardset-img" src="../resources/icons/icons8-채팅-48.png" alt="캠핑카 아이콘">
								</figure>
								<div class="cardset-body">
									<h2 class="cardset-tit">동네 채팅</h2>
									<p class="cardset-desc"> 그 동네에 궁금한점 <br> 주민에게 물어보세요. </p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N5 -->
		<!-- [S]campland-N6 -->
		<div class="campland-N6" data-bid="GpLQ6CqkE7" id="">
		</div>
		<!-- [E]campland-N6 -->
		<!-- [S]campland-N7 -->
		<div class="campland-N7" data-bid="EdLQ6CqKET">
			<div class="contents-container">
				<!-- * 카카오맵 - 지도퍼가기 -->
				<!-- 1. 지도 노드 -->
				<div align="center" id="daumRoughmapContainer1690352447500" class="root_daum_roughmap root_daum_roughmap_landing">
				</div>
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
		<!-- [E]campland-N7 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="ZblQ6CQKFd" id="">
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