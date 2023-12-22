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
	<title>마이페이지 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	<style type="text/css">
	
		#test{
			display: inline-block;
		}
	</style>
	
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
				</li>
				</ul>
			</div>
			<div class="header-right">
				<div class="header-utils">
					<button class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" alt="검색">
					</button>
				</div>
			</div>
		</div>
		</header>
		<!-- [E]campland-N1 -->
		<main class="th-layout-main ">
			<!-- [S]campland-N23 -->
			<div class="campland-N23" data-bid="edlqfW2o0K" id="">
				<div class="contents-inner">
					<div class="contents-container">
						<div class="textset textset-sub textset-center">
							<h2 class="textset-tit">My Page</h2>
						</div>
						<ul class="contents-group contents-profile">
							<li class="contents-profile-item">
								<p class="contents-name">${nick}</p>
							</li>
						</ul>
						<div class="contents-group contents-reservation">
							<div class="cardset cardset-hor cardset-sm">
								<figure class="cardset-figure">
									<img class="cardset-img" src="../resources/images/img_campland_N19_3.png"
										alt="카드 이미지">
								</figure>
								<div class="cardset-body">
									<div class="badgeset-wrap">
										<div class="badgeset-group">
											<div
												class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary">
												이용완료</div>
										</div>
										<p class="cardset-txt">예약번호 2023010120230101</p>
									</div>
									<h2 class="cardset-tit">캠핑장 C구역</h2>
									<p class="cardset-desc"> 2023.01.09(월) ~ 2023.01.12(목) ㅣ <br class="br-mo"> 3박 4일 ㅣ
										성인 2명, 어린이 1명 </p>
								</div>
							</div>
						</div>
						<form method="post" action="http://localhost:8083/GitTest1/Update.do">
							<h6 class="form-tit form-tit-deco">
							<span></span>회원정보수정
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input name="user_nick" type="text" class="inputset-input form-control" aria-label="내용"
										placeholder="닉네임을 입력해주세요.">
									<input name="user_pw" type="password" class="inputset-input form-control" aria-label="내용"
										placeholder="비밀번호를 입력해주세요.">
									<input type="submit" value="회원정보수정" class="btnset btnset-round">
								</div>
							</div>
							</form>

						<div class="contents-button">
						<form action="http://localhost:8083/GitTest1/Logout.do" id="test">
							<input class="btnset btnset-round" type="submit" value="로그아웃">
						</form>
						<form action="http://localhost:8083/GitTest1/DeleteMember.do">
							<input class="btnset btnset-round" type="submit" value="회원탈퇴">
						</form>
							
							
						</div>
					</div>
				</div>
			</div>
			<!-- [E]campland-N23 -->
		</main>
		<!-- [S]campland-N2 -->
		<footer class="campland-N2" data-bid="hAlQFW2O1B">
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
						<a href="javascript:void(0)">
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