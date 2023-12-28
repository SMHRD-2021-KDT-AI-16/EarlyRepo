<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.early.model.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		#table_content{
			
			margin-left: 20%;
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
		<table id="table_content">
			<tr>
				<th id = "content_number">글번호</th>
				<th id = "content_userid">작성자</th>
				<th id = "content_content">내용</th>
				<th id = "content_date">작성일자</th>
			</tr>
			<!-- <tr class = "inner_content">
				<td class = "inner_content" id="number"></td>
				<td class = "inner_content" id="userid"></td>
				<td class = "inner_content" id="content"></td>
				<td class = "inner_content" id="date"></td>
			</tr> -->
		</table>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
		console.log('Test')
		let list = <%= list %>
		console.log("test33 : ", list)
		console.log("test2 : ",list[0])
		/* let temp = list[0].replace("{","").replace("}","").split(',')
		
		console.log("test444 : ",temp[0].split(':')[1]) */
		
		//var keys = Object.keys(json); //키를 가져옵니다. 이때, keys 는 반복가능한 객체가 됩니다.
    	/* for (var i=0; i<keys.length; i++) {
    		var key = keys[i];
    		console.log("key : " + key + ", value : " + json[key])
    	} */
		
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
      					
        				const tr = document.createElement('tr');

        				const num = document.createElement('td');
        				num.innerText = temp[0].split(':')[1]; // 글번호
      					
        				const user_id = document.createElement('td');
        				user_id.innerText = temp[6].split(':')[1]; // 작성자 아이디

        				const comment_date = document.createElement('td');
        				comment_date.innerText = temp[3].split(':')[1]; // 날짜

        				const comment = document.createElement('td');
        				comment.innerText = temp[1].split(':')[1]; // 내용

        				tr.appendChild(num);
        				tr.appendChild(user_id);
        				tr.appendChild(comment);
        				tr.appendChild(comment_date);
        				

        				document.querySelector('table').appendChild(tr);
      				}
      				cnt += 10;
    			} else {
      				for (let b = cnt; b < list.length; b++) {
      					cnt += list.length;
						temp = list[b].replace("{","").replace("}","").split(',');  //한줄에서 뭉탱이씩 짤라서 넣어줄꺼야
      					
						const tr = document.createElement('tr');

        				const num = document.createElement('td');
        				num.innerText = temp[0].split(':')[1]; // 글번호
      					
        				const user_id = document.createElement('td');
        				user_id.innerText = temp[6].split(':')[1]; // 작성자 아이디

        				const comment_date = document.createElement('td');
        				comment_date.innerText = temp[3].split(':')[1]; // 날짜

        				const comment = document.createElement('td');
        				comment.innerText = temp[1].split(':')[1]; // 내용

        				tr.appendChild(num);
        				tr.appendChild(user_id);
        				tr.appendChild(comment);
        				tr.appendChild(comment_date);

        				document.querySelector('table').appendChild(tr);
      				}
    			}
  			  } 

  			//loadMoreData();
		
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