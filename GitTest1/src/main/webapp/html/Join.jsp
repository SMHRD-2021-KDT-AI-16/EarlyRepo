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
	<title>회원정보 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="jGLq6DHesX" id="">
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
							<span>동네채팅</span>
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
				</div>
			</div>
		</div>

	</header>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main ">
		<!-- [S]campland-N25 -->
		<!-- 회원 가입 페이지-->
		<form method="post" action="http://localhost:8083/GitTest1/Join.do">
			
		<div class="campland-N25" data-bid="EJlQ6DHEUz" id="">
			<div class="contents-inner">
				<div class="contents-container">
					<div class="textset textset-sub textset-center">
						<h2 class="textset-tit">회원가입​<br></h2>
					</div>
					<ul class="contents-list">
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>아이디
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input name="id"  id="inputE" type="text" class="inputset-input form-control" aria-label="내용"
										placeholder="아이디를 입력해주세요." >
								</div>
								<input type="button"  class="btnset btnset-round" onclick="checkE()" value="중복확인">
							</div>
						</li>
						
						<script src="jquery-3.7.1.min.js"></script>
						<script>
						
							function checkE() {
							var inputE = $("#inputE").val();
							console.log(inputE);
					
							$.ajax( {
								// 어디로 요청할건지?
								url :'http://localhost:8083/GitTest1/IdCheckService.do',		
								// 요청할 데이터(json,{key : value})
					
					    		data : {'inputE': inputE},
					   		 // 요청방식
					   		 type : 'get',
					    		// 요청 성공할 경우 무엇을할지?
					    		success : function (data) {
									if(data=='true'){
										alert("사용 할 수 없는 아이디입니다")
									}else if(data=='false'){
										alert("사용 할 수 있는 아이디입니다")
									}
								},
								// 요청 실패시
								error : function () {
									alert("통신 실패");
								}
						
							});
							}
							</script>
						
						
			
			
			
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>비밀번호
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input name="pw" type="password" class="inputset-input form-control" aria-label="내용"
										placeholder="비밀번호를 입력해주세요">
								</div>
							</div>
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>비밀번호 확인
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input type="password" class="inputset-input form-control" aria-label="내용"
										placeholder="비밀번호를 다시 입력해주세요.">
								</div>
							</div>
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>닉네임
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input name="nick" type="text" class="inputset-input form-control" aria-label="내용"
										placeholder="닉네임을 입력해주세요.">
								</div>
							</div>
						</li>
						<div class="contents-bottom">
							<div class="checkset">
								<input id="checkset-a-1-1" class="checkset-input input-fill input-round" type="checkbox"
									value="">
							</div>
						</div>
						<div class="contents-confirm">
							<a href="login.jsp" class="btnset btnset-round btnset-line btnset-black">돌아가기</a>
							
							<input type="submit" class="btnset btnset-round" value="회원가입">
						</div>
				</div>
			</div>
		</div>
		
		</form>
		<!-- [E]campland-N25 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="oolq6dhEvp">
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