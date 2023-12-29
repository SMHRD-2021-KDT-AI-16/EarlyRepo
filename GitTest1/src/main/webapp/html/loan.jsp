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
	<title>대출결과</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	<style>
.container {
	display: flex;
	justify-content: center;
	/*align-items: center;*/
	height: 10hv;
}

.container img {
	max-width: 8%;
	max-height: 8%;
}

.color-change {
	color: blue;
	font-weight: bold;
}

.text_result {
	font-size: 20px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

table { /* 테이블 css영역*/
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #e6e6e6;
}
</style>


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
		<!-- [S]campland-N25 -->
		<div class="campland-N25" data-bid="EJlQ6DHEUz" id="">
			<div class="contents-inner">
				<div class="contents-container">
					<div class="textset textset-sub textset-center">
						<h2 class="textset-tit">판단 결과​<br></h2>
						<h4>당신이 대출받을 수 있는 금액은... </h4>
					</div>					
     				<div class="container">
     					<img src="../resources/icons/check-icon.png" alt="체크마크">
     				</div>
     				<p class="text_result"><span class="color-change">신생아 특례대출</span>상품을 이용하시면</p>     <!-- 대출상품이름 적용하기 -->
					<p class="text_result">최대&nbsp;<span class="color-change"> 5억원&nbsp; </span> 입니다.</p>      <!-- profile에서 판단한 대출 금액으로 바꾸기 -->
					<table>
						<thead>
							<tr>
								<th></th>
								<th>대출상품에 따른 금리</th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>행 1, 열 1</td>
								<td>행 1, 열 2</td>
								<td>행 1, 열 3</td>
								<td>행 1, 열 4</td>
								<td>행 1, 열 5</td>
							</tr>
							<tr>
								<td>행 2, 열 1</td>
								<td>행 2, 열 2</td>
								<td>행 2, 열 3</td>
								<td>행 2, 열 4</td>
								<td>행 2, 열 5</td>
							</tr>
							
						</tbody>
					</table>



					<div class="contents-confirm">
						<a href="Profile.jsp" class="btnset btnset-round">다시하기</a>
						<a href="searchMap.jsp" class="btnset btnset-round">결과보기</a>
					</div>
				</div>
			</div>
		</div>
					</form>
		<!-- [E]campland-N25 -->
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
	<!-- [E]campland-N2 -->
	<script src="../resources/js/setting.js"></script>
	<script src="../resources/js/plugin.js"></script>
	<script src="../resources/js/template.js"></script>
	<script src="../resources/js/common.js"></script>
	<script src="../resources/js/script.js"></script>
</body>
</html>
<!-- 
	<h1>결과</h1>
	<br>
	<%for(int i=0;i<4;i++){%>
		
	<h3>${loanVOs[i]}</h3>
		
	
	
	<%} %>
 -->