<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.early.model.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>게시판 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
	<link rel="stylesheet" href="../resources/css/noticeBoard.css">
	<style>
		li {
			list-style: none;
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
		#table_content{
			
			margin-left: 30%;
		}
		#content_userid{
			align-items: center;
			
			width: 150px;
			height: 100px;
		}
		#content_number{
			width: 50px;
			height: 100px;
		}
		#content_content{
			width: 500px;
			height: 100px;
		}
		.inner_content{
			height: 100px;
		}
		
		.myButton {
			box-shadow:inset 0px 0px 0px 0px #ffffff;
			background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
			background-color:#f9f9f9;
			border-radius:6px;
			border:1px solid #dcdcdc;
			display:inline-block;
			cursor:pointer;
			color:#666666;
			font-family:Arial;
			font-size:15px;
			font-weight:bold;
			padding:8px 21px;
			text-decoration:none;
			text-shadow:0px 1px 0px #ffffff;
			margin-left: 30%;
			margin-top: 20px;
		}
		.myButton:hover {
			background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
			background-color:#e9e9e9;
		}
		.myButton:active {
			position:relative;
			top:1px;
		}
		.textset-tit{
			 color: white;			 
		}
		
	</style>
</head>

<body>
<%
	JsonArray list = (JsonArray)session.getAttribute("NoticeAllboard");
%>
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
		<div class="campland-N8" data-bid="pXlq6deKP1">
			<div class="contents-container">
				<img class="contents-visual img-pc" src="../resources/images/board.png" alt="서브 비주얼 PC 이미지">
				<img class="contents-visual img-mobile" src="../resources/images/board.png"
					alt="서브 비주얼 모바일 이미지">
				<div class="contents-body container-md">
					<div class="textset textset-visual">
						<h6 class="textset-tit">동네 게시판</h6>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N8 -->
		<!-- [S]campland-N15 -->
		<div class="myButton">
			<a href="logincheck.do">게시글 작성</a>
		</div>
		<table id="table_content">
			<!-- <tr>
			<td>
				<div class="noticeBoard">
					<div class="up">
						<div class="userid"></div>
						<div class="date"></div>
					</div>
					<div class="content">adsfdasdasfdasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfaasdfasdfadsfadfadsfadfadfadsfadfasdfasdfasdfasddfasdfasdfasdfasdfasdfadfadsfadfadf</div>
					<div class="content_img">
						<img src="">
					</div>
					<div class="likes"></div>
				</div>
			</td>
			</tr> -->
		</table>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
		console.log('Test')
		let list = <%= list %>
		console.log("test33 : ", list)
		console.log("test2 : ",list[0])
		$(document).ready(function() {

  			loadMoreData();			
  		});
    		
  		$(document).scroll(function () {
    		var documentHeight = $(document).height();
    		var scrollPosition = $(window).height() + $(window).scrollTop();

    		if (scrollPosition / documentHeight > 0.9) {
    			console.log("우에엥")
      			loadMoreData();
    		}
  		});
  		let temp = [];
  		let cnt = 0;
  		function loadMoreData() {
  				
    		if (list.length > cnt + 10) { // 불러오는 글의 수가 10개 +a보다 많으면
      			for (let b = cnt; b < cnt + 10; b++) { // 10개만 출력할꺼야
      				temp = list[b].replace("{","").replace("}","").split(',');  //한줄에서 뭉탱이씩 짤라서 넣어줄꺼야
      				// console.log("test : ",list)
      				const tr = document.createElement('tr');
      				const td = document.createElement('td');
        			const div1 = document.createElement('div'); // 전체div
        			div1.className = 'noticeBoard';
        			
        			const div2 = document.createElement('div'); // 위에 2개
        			div2.className = 'up';

        			const userid = document.createElement('div');
        			userid.className = 'userid';
        			userid.innerText = temp[6].split(':')[1]; // 작성자 id
      					
        			const date = document.createElement('div');
        			date.className = 'date';
        			date.innerText = temp[3].split(':')[1]; // 날짜

        			const content = document.createElement('div');
        			content.className = 'content';
        			content.innerText = temp[1].split(':')[1]; // 내용

        			const img = document.createElement('img');
        			img.className = 'content_img';
        			const img_src = "../uploadimg/"+((temp[2].split(':')[1]).replace('"','').replace('"',''));
        			console.log(img_src)
        			img.src = img_src; // 이미지
        			
        			const likes = document.createElement('div');
        			likes.className = 'likes';
        			likes.innerText = temp[5].split(':')[1]; // 좋아요

        			
        			div2.appendChild(userid);
        			div2.appendChild(date); // 위에꺼 2개 넣고
        			
        			div1.appendChild(div2);
        			div1.appendChild(content);
        			div1.appendChild(img);
        			div1.appendChild(likes); // 전체 보드에 넣고
        			
        			td.appendChild(div1); 
        			tr.appendChild(td); // tr에 전체 보드 넣고

        			document.getElementById('table_content').appendChild(tr);
      			}
      			cnt += 10;
    		} else {
      			for (let b = cnt; b < list.length; b++) {
      				cnt += list.length;
					temp = list[b].replace("{","").replace("}","").split(',');  //한줄에서 뭉탱이씩 짤라서 넣어줄꺼야
      				
					const tr = document.createElement('tr');
					const td = document.createElement('td');
        			const div1 = document.createElement('div'); // 전체div
        			div1.className = 'noticeBoard';
        			
        			const div2 = document.createElement('div'); // 위에 2개
        			div2.className = 'up';

        			const userid = document.createElement('div');
        			userid.className = 'userid';
        			userid.innerText = temp[6].split(':')[1]; // 작성자 id
      					
        			const date = document.createElement('div');
        			date.className = 'date';
        			date.innerText = temp[3].split(':')[1]; // 날짜

        			const content = document.createElement('div');
        			content.className = 'content';
        			content.innerText = temp[1].split(':')[1]; // 내용

        			// const img = document.createElement('div');
        			const img = document.createElement('img');
        			img.className = 'content_img';
        			img.src = temp[2].split(':')[1]; // 이미지
        			
        			const likes = document.createElement('div');
        			likes.className = 'likes';
        			likes.innerText = temp[5].split(':')[1]; // 좋아요

        			
        			div2.appendChild(userid);
        			div2.appendChild(date); // 위에꺼 2개 넣고
        			
        			div1.appendChild(div2);
        			div1.appendChild(content);
        			div1.appendChild(img);
        			div1.appendChild(likes); // 전체 보드에 넣고
        			
        			td.appendChild(div1); 
        			tr.appendChild(td); // tr에 전체 보드 넣고

        			document.getElementById('table_content').appendChild(tr);
      			}
    		}
  		}
		</script>
		<!-- [E]campland-N15 -->
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="mMlq6dEKQC">
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