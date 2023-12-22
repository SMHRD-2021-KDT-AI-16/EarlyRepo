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
	<title>게시판 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	<style>
		li {
			list-style: none;
		}

		img {
			width: 200px;
			height: 200px;
		}

		.real-upload {
			display: none;
		}

		.upload {
			width: 200px;
			height: 200px;
			background-color: antiquewhite;
		}

		.image-preview {
			width: 1300px;
			height: 200px;
			background-color: aquamarine;
			display: flex;
			gap: 20px;
		}
	</style>
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="RMlQ6deKn4" id="">
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
					<a href="login.jsp" class="btn-profile header-utils-btn">
						<img src="../resources/icons/ico_profile_black.svg" alt="검색">
					</a>
					<button class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" alt="검색">
					</button>


	</header>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main ">
		<!-- [S]campland-N8 -->
		<div class="campland-N8" data-bid="pXlq6deKP1">
			<div class="contents-container">
				<img class="contents-visual img-pc" src="../resources/images/img_subvisual_1.png" alt="서브 비주얼 PC 이미지">
				<img class="contents-visual img-mobile" src="../resources/images/img_subvisual_mobile_1.png"
					alt="서브 비주얼 모바일 이미지">
				<div class="contents-body container-md">
					<div class="textset textset-visual">
						<h2 class="textset-tit">게시판</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N8 -->
		<!-- [S]campland-N15 -->
		<div class="contents-confirm"align ="center">
			<a href="Write.jsp" class="btnset btnset-round btnset-line btnset-black">게시글 작성</a>
		</div>
		<script>
			let currentPage = 1; // 현재 페이지
			const pageSize = 10; // 한 페이지에 표시될 게시글 수

			// 초기 로딩 상황에서 데이터를 불러오는 함수
			function initialLoadData() {
				// 여기에 초기 데이터를 불러오는 로직을 추가

				// 예시: 초기 데이터를 로컬 스토리지에서 가져와서 화면에 추가
				let initialData = JSON.parse(localStorage.getItem("initialData")) || [];
				// TODO: 화면에 데이터 추가하는 로직을 여기에 추가

				console.log("초기 데이터를 불러왔습니다.");
			}

			// 데이터를 불러와서 화면에 추가하는 함수
			function loadMoreData() {
				// 여기에 다음 페이지의 데이터를 불러오는 로직을 추가

				// 예시: 다음 페이지의 데이터를 로컬 스토리지에서 가져와서 화면에 추가
				let nextData = JSON.parse(localStorage.getItem("nextData")) || [];
				// TODO: 화면에 데이터 추가하는 로직을 여기에 추가

				console.log("다음 페이지의 데이터를 불러왔습니다.");

				// 현재 페이지 증가
				currentPage++;
			}

			// 스크롤 이벤트
			$(document).scroll(function () {
				// 문서의 높이
				var documentHeight = $(document).height();
				// 스크롤 위치
				var scrollPosition = $(window).height() + $(window).scrollTop();

				// 스크롤이 문서의 90% 이상에 도달하면 다음 페이지의 데이터를 불러옴
				if (scrollPosition / documentHeight > 0.9) {
					loadMoreData();
				}
			});

			// 초기 로딩 상황에서 데이터 불러오기
			initialLoadData();
		</script>
		<!-- [E]campland-N15 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="mMlq6dEKQC">
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