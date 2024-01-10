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
	<title>회원정보 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
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
						<a class="header-gnblink" href="MainPage.jsp">
							<span>홈</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="AllgetBoardService.do">
							<span>부동산 게시판</span>
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
                </div>
           </div>
       </div>
	</header>
	<main class="th-layout-main ">
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
									<input name="user_id" maxlength="20" id="inputE" type="text" class="inputset-input form-control" aria-label="내용"
										placeholder="아이디를 입력해주세요." oninput="checkInputLength()">
								</div>
								<input type="button"  class="btnset btnset-round" onclick="checkE()" value="중복확인">
							</div>
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>비밀번호
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input name="user_pw" type="password" class="inputset-input form-control" aria-label="내용"
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
									<input id="user_nick" name="user_nick" type="text" class="inputset-input form-control" aria-label="내용"
										placeholder="닉네임을 입력해주세요." oninput="checkInputLength2()">
								</div>
							</div>
						</li>
					</ul>
						<div class="contents-bottom">
							<div class="checkset">
								<input id="checkset-a-1-1" class="checkset-input input-fill input-round" type="checkbox"
									value="">
							</div>
						</div>
						<div class="contents-confirm">
							<a href="login.jsp" class="btnset btnset-round">돌아가기</a>
							
							<input type="submit" class="btnset btnset-round" value="회원가입">
						</div>
				</div>
			</div>
		</div>
		
		</form>
		<script src="jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
		function checkE() {
			var inputE = $("#inputE").val();
	
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
			function checkInputLength() {
			      var inputElement = document.getElementById("inputE");
			      var inputValue = inputElement.value;

			      // 문자열을 UTF-8로 인코딩하여 바이트 수 계산
			      var byteLength = new TextEncoder().encode(inputValue).length;

			      // 예를 들어, 6글자 이상을 허용하지 않도록 설정
			      if (byteLength > 3 * 6) {
			        alert("한글은 6글자 이상 입력할 수 없습니다.");
			        // 입력 값을 초기화하거나 다른 조치를 취할 수 있습니다.
			        inputElement.value = "";
			      }
			    }
		function checkInputLength2() {
		      var inputElement = document.getElementById("user_nick");
		      var inputValue = inputElement.value;

		      // 문자열을 UTF-8로 인코딩하여 바이트 수 계산
		      var byteLength = new TextEncoder().encode(inputValue).length;

		      // 예를 들어, 6글자 이상을 허용하지 않도록 설정
		      if (byteLength > 3 * 6) {
		        alert("한글은 6글자 이상 입력할 수 없습니다.");
		        // 입력 값을 초기화하거나 다른 조치를 취할 수 있습니다.
		        inputElement.value = "";
		      }
		    }</script>
	</main>
	<footer class="campland-N2" data-bid="oolq6dhEvp">
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
	<script src="../resources/js/setting.js"></script>
	<script src="../resources/js/plugin.js"></script>
	<script src="../resources/js/template.js"></script>
	<script src="../resources/js/common.js"></script>
	<script src="../resources/js/script.js"></script>
</body>
</html>