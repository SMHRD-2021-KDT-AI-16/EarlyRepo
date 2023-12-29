<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" href="<%=cp%>/imageTest/css/style.css"
	type="text/css" />
<script type="text/javascript" src="<%=cp%>/imageTest/data/image.js"></script>
<script type="text/javascript">
</script>
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="RMlQ6deKn4" id="">
	<div class="header-container container-lg">
		<div class="header-left">
			<h1 class="header-title">
				<a href="MainPage.jsp"> <img
					src="../resources/images/img_logo.png" alt="로고">
				</a>
			</h1>
		</div>
		<div class="header-center">
			<ul class="header-gnblist">
				<li class="header-gnbitem"></li>
				<li class="header-gnbitem"><a class="header-gnblink"
					href="MainPage.jsp"> <span>홈</span>
				</a></li>
				<li class="header-gnbitem"><a class="header-gnblink"
					href="board.jsp"> <span>부동산 게시판</span>
				</a></li>
				<li class="header-gnbitem"><a class="header-gnblink"
					href="Chat.jsp"> <span>동네 채팅</span>
				</a></li>
			</ul>
		</div>
		<div class="header-right">
			<div class="header-utils">
				<c:if test="${member==null }">
					<a href="login.jsp"><img src="../resources/icons/LOGIN.png"></a>
				</c:if>
				<c:if test="${member!=null }">
					<c:if test="${member.user_id!='admin' }">
						<a href="Mypage.jsp"><img
							src="../resources/icons/ico_profile_black.png"></a>
					</c:if>
					<c:if test="${member.user_id!='admin' }">
						<a href="http://localhost:8083/GitTest1/Logout.do"><img
							src="../resources/icons/LOGOUT.png"></a>
					</c:if>
					<c:if test="${member.user_id=='admin' }">
						<a href="SelectAll.do">회원관리</a>
					</c:if>
				</c:if>
				<button class="btn-search header-utils-btn">
					<a href="Profile.jsp"><img
						src="../resources/icons/ico_search_black.svg"></a>
				</button>
	</header>
	<!-- [E]campland-N1 -->
	<main class="th-layout-main "> <!-- [S]campland-N8 -->
	<div class="campland-N8" data-bid="fGLQ6DNtyW">
		<div class="contents-container">
			<img class="contents-visual img-pc"
				src="../resources/images/img_subvisual_1.png" alt="서브 비주얼 PC 이미지">
			<img class="contents-visual img-mobile"
				src="../resources/images/img_subvisual_mobile_1.png"
				alt="서브 비주얼 모바일 이미지">
		</div>
	</div>
	<!-- [E]campland-N8 --> 
	<!-- [S]campland-N17 -->
	<div class="campland-N15" data-bid="crlQNCwqYB">
		<div class="contents-inner" align="center">
			<div class="contents-container container-md" align="center">
				<table width="600" border="2" cellpadding="0" cellspacing="0"
					bordercolor="#d6d4a6" align="center">
					<tr height="40">
						<td style="padding-left: 20px;"><b><h2>게시판</h2></b></td>
					</tr>
				</table>
				<form action="<%=cp%>/image/write_ok.do" method="post"
					enctype="multipart/form-data">
					<table width="600" border="0" cellspacing="0" align="center">
						<tr>
							<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
						</tr>
						<tr>
							<td width="140" height="30" bgcolor="#eeeeee"
								style="padding-left: 20px;">제목</td>
							<td width="460" style="padding-left: 10px;"><input
								type="text" name="subject" size="35" maxlength="20"
								class="boxTF" /></td>
						</tr>
						<tr>
							<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
						</tr>
						<tr>
							<td width="140" height="30" bgcolor="#eeeeee"
								style="padding-left: 20px;">파일</td>
							<td width="460" style="padding-left: 10px;"><input
								type="file" name="upload" maxlength="100" size="48"
								class="boxTF" /></td>
						</tr>
						<tr>
							<td width="140" height="30" bgcolor="#eeeeee"
								style="padding-left: 20px;">내용</td>
							<td width="460" style="padding-left: 10px;"><textarea
									name="board" cols="70" rows="15" style="resize: none;"></textarea>
						</tr>
						<tr>
							<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
						</tr>
					</table>
					<table width="600" border="0" cellpadding="0" cellspacing="3"
						align="center">
						<tr align="center">
							<td height="40">
								<!-- mailSend(); -> mail.js에 있다. --> 
								<input type="submit" value="등록하기" class="btn2" /> 
								<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.senderName.focus();" /> 
								<input type="reset" value="작성취소" class="btn2" onclick="javascript:location.href='<%=cp%>/image/list.do';">
					</table>
				</form>
			</div>
		</div>
	</div>
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="GjLQ6dNu06" id="">
	<div class="footer-container container-lg">
		<div class="footer-bottom">
			<div class="footer-txt">
				<p>전남 목포시 산정로212번길 13 (구, 청호중학교)</p>
				<p>
					<span>T. 062-655-3510</span> <span>E. smhrd@smhrd.or.kr</span>
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