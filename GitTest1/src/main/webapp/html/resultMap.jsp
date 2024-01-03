<%@page import="com.google.gson.JsonArray"%>
<%@ page import="java.util.List" %>
<%@page import="com.early.model.CompareVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

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
<title>지도 | 핵심프로젝트</title>
<link rel="stylesheet" href="../resources/css/setting.css">
<link rel="stylesheet" href="../resources/css/plugin.css">
<link rel="stylesheet" href="../resources/css/template.css">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/map.css">
</head>
<style>
	#total_div{
		height: 850px;
	}
	#full_mid_div{
		width: 95%;
		height: 100%;
	}

</style>

<body>
<c:set var="chatId" value="${not empty sessionScope.member ? sessionScope.member.user_nick : ''}" />

<!-- 채팅창 -->
<div id="_chatbox" style="display: none">
    <fieldset>
        <div id="messageWindow"></div>
        <br /> 
        <input id="inputMessage" type="text" onkeyup="enterkey()" />
        <input id="send" type="submit" value="send" onclick="send()" />
    </fieldset>
</div>
<img class="chat" src="../resources/images/고양이말풍선white.png" />

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
							<a href="BoardIdService.do"><img
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
				</div>
			</div>
		</div>
		</div>
	</header>
	<main class="th-layout-main">
		<div id="total_div">
			<div id="full_mid_div">
				<div id="mid_div"></div>
			</div>
		</div>
<%
	JsonArray list = (JsonArray)session.getAttribute("final_list");
%>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,clusterer,drawing"></script>
		<script>
		var addr = '';
		var container = document.getElementById('mid_div');
		var options = {
			center : new kakao.maps.LatLng(34.810159, 126.424775),
			level : 4
		}; // 맵 중심좌표, 맵 확대레벨 선언

		var map = new kakao.maps.Map(container, options), customOverlay = new kakao.maps.CustomOverlay(
				{}), infowindow = new kakao.maps.InfoWindow({
			removable : true
		});
		// 맵, 오버레이, 인포윈도우

		//var points = [];
		let geocoder = new kakao.maps.services.Geocoder();
		
		let list = <%= list %>
		temp = [];
		// 주소를 좌표로 변환하고 마커를 생성하는 함수
		function addMarkerWithAddress(loc, name, description) {
		    geocoder.addressSearch(loc, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		            let marker = new kakao.maps.Marker({
		                map: map,
		                position: coords
		            });

		            let iwContent = '<div style="padding:5px;"><span>' + name + '</span><br>' + description + '</div>';

		            // 인포윈도우를 생성합니다
		            let infowindow = new kakao.maps.InfoWindow({
		                position: coords,
		                content: iwContent
		            });

		            // 마커 위에 인포윈도우를 표시합니다
		            infowindow.open(map, marker);
		            let content = document.createElement('div');
                    content.innerHTML = '<div id="menu_wrap">'
				                        +'<h1 id="apt_name"></h1>'
				                        +'<h3 id="apt_loc"></h3>'
				                        +'<div class="sizecontiainer">'
				                        +'<ul class="tabs">'
				                        +'<li id="tab_1" class="tab-link current" data-tab="tab-1"></li>'
				                        +'<li id="tab_2" class="tab-link" data-tab="tab-2"></li>'
				                        +'<li id="tab_3" class="tab-link" data-tab="tab-3"></li></ul>'
				                        +'<div id="tab-1" class="tab-content current">'
				                        +'<h3 id="realprice1"></h3>'
				                        +'<img id="apt_img1" class="apt_img" alt="구조도 사진 없음"></div>'
				                        +'<div id="tab-2" class="tab-content">'
				                        +'<h3 id="realprice2"></h3>'
				                        +'<img id="apt_img2" class="apt_img" alt="구조도 사진 없음"></div>'
				                        +'<div id="tab-3" class="tab-content">'
				                        +'<h3 id="realprice3"></h3>'
				                        +'<img id="apt_img3" class="apt_img" alt="구조도 사진 없음">'
				                        +'</div></div><div id="temp_review"></div>'
				                        +'<div id="review"><h3>부동산 후기</h3>'
				                        +'</div></div>';
	                            
				    kakao.maps.event.addListener(marker, 'click', function () {
				    	infoapart = name; // 클릭했을 때 이름을 변수에 넣음
				        getapartallinfo();

				        var existingContent = document.getElementById('content');

				        // 중복 방지를 위해 이미 추가된 엘리먼트인지 확인
				        if (!existingContent) {
				        	existingContent = document.createElement('div');
				            existingContent.id = 'content'; 
				            document.getElementById('mid_div').appendChild(existingContent);
				        }

				        existingContent.innerHTML = ''; // 기존 내용 지우기
				        existingContent.appendChild(content); // 내용 추가

				        // 맵 클릭 시 팝업 제거
				        kakao.maps.event.addListener(map, 'click', function () {
				        	existingContent = document.getElementById('content'); // 다시 가져오기
				        	if (existingContent) {
				        		existingContent.innerHTML = ''; // 엘리먼트의 내용을 지우고
				            	existingContent.parentNode.removeChild(existingContent); // 부모에서 제거
				        	}
				    	});
					});					                    

		        }
		    });
		}

		for (let g = 0; g < list.length; g++) {
		    let temp = list[g].replace("{", "").replace("}", "").replaceAll('"', '').split(',');
		    let loc = temp[2].split(":")[1];

		    // addMarkerWithAddress 함수 호출
		    addMarkerWithAddress(loc, temp[0].split(":")[1], temp[1].split(":")[1]);
		}
	    
					
			
		function getapartallinfo(){
			$.ajax({
				url: 'http://localhost:8083/GitTest1/getapartallinfo.do?aptname=' + infoapart,
							
				success: function (result) {
					let infoList = result.split(';');
					console.log("tteesstt : ",infoList);
						
					console.log("test : ",infoList.length);
					let temp1 = infoList.length/5; // 같은 이름 다른 평수 몇개인지 구분하기 위해서
					console.log("길이 : ",temp1)
					
					document.getElementById('apt_name').innerText = infoList[0];
						
					document.getElementById('apt_loc').innerText = infoList[1];
						
					document.getElementById('tab_1').innerText = infoList[3];
					document.getElementById('realprice1').innerText = infoList[2];
					document.getElementById('apt_img1').src = infoList[4];
					document.getElementById('apt_img1').onerror = function() {
        			    this.src = '../resources/images/img_logo.png';
        			};
        			
        			if(temp1 > 2 && temp1 < 3){
						document.getElementById('tab_2').innerText = infoList[8];
						document.getElementById('realprice2').innerText = infoList[7];
						document.getElementById('apt_img2').src = infoList[9];
						document.getElementById('apt_img2').onerror = function() {
	        			    this.src = '../resources/images/img_logo.png';
	        			};
					}
        			
					if(temp1 > 3){
						document.getElementById('tab_2').innerText = infoList[8];
						document.getElementById('realprice2').innerText = infoList[7];
						document.getElementById('apt_img2').src = infoList[9];
						document.getElementById('apt_img2').onerror = function() {
	        			    this.src = '../resources/images/img_logo.png';
	        			};
						document.getElementById('tab_3').innerText = infoList[13];
						document.getElementById('realprice3').innerText = infoList[12];
						document.getElementById('apt_img3').src = infoList[14];
						document.getElementById('apt_img3').onerror = function() {
	        			    this.src = '../resources/images/img_logo.png';
	        			};
					}
						
					let reviewList = infoList[infoList.length-1].split("|");
						
					const review = document.getElementById('review');
						
					for(let d = 0; d < reviewList.length; d++){
						const reviews = document.createElement('div');
						reviews.className="review_contents";
						reviews.innerText = reviewList[d];
						review.appendChild(reviews);
					}
											
					//infoList 
					/*  0,5 : 아파트 이름 
						1,6 : 주소
						2,7 : 실거래가
						3,8 : 평수
						4,9 : 이미지
						10 ~ :리뷰
					*/
				},
				error: function(){
						
				}
			});
		} // getapartallinfo 끝


			function closeOverlay() { // 오버레이 닫기
				CustomOverlay2.setMap(null);
			}

			// 상세정보 출력하는 부분에서 평수에 따른 탭이동
			$(document).on('click', 'ul.tabs li', function(){
			    console.log("탭이동!")
			    var tab_id = $(this).attr('data-tab');

			    $('ul.tabs li').removeClass('current');
			    $('.tab-content').removeClass('current');

			    $(this).addClass('current');
			    $("#" + tab_id).addClass('current');
			});
			
			var chatId = "${chatId}";
			// 이미지 클릭 이벤트 처리
    		$(".chat").on({"click": function () {
                
    			// 눌렀을 때 이미지 변경
                if ($(this).attr("src") == "../resources/images/고양이말풍선white.png" && chatId !== '') {
                    $(this).attr("src", "../resources/images/고양이말풍선black.png");
                    $("#_chatbox").css("display", "block");
                } else if ($(this).attr("src") == "../resources/images/고양이말풍선black.png") {
                    $(this).attr("src", "../resources/images/고양이말풍선white.png");
                    $("#_chatbox").css("display", "none");
                } else if (chatId === '') {
                    // 비로그인이면 로그인페이지로 보내버림
                    alert("로그인이 필요합니다.");
                    window.location.href = "login.jsp";
                }
            }});


			var textarea = document.getElementById("messageWindow");
			var webSocket = new WebSocket('ws://192.168.219.111:8083/GitTest1/broadcasting');
			var inputMessage = document.getElementById('inputMessage');
			webSocket.onerror = function(event) {
			    onError(event)
			};
			webSocket.onopen = function(event) {
			    onOpen(event)
			};
			webSocket.onmessage = function(event) {
			    onMessage(event)
			};
			
			//메세지 받은거
			function onMessage(event) {
			    var message = event.data.split("|");
			    var sender = message[0];
			    var content = message[1];
			    if (content == "") {
			            
			    } else {
			        if (content.match("/")) {
			            if (content.match(("/" + chatId))) {
			                var temp = content.replace("/" + chatId, "(귓속말) :").split(":");
			                if (temp[1].trim() == "") {
			                } else {
			                    $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
			                        + sender + content.replace("/" + chatId, "(귓속말) :") + "</p>");
			                }
			            } else {
			            }
			        } else {
			            if (content.match("!")) {
			                $("#messageWindow").html($("#messageWindow").html()
			                    + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
			            } else {
			                $("#messageWindow").html($("#messageWindow").html()
			                    + "<p class='chat_content'>" + sender + " : " + content + "</p>");
			            }
			        }
			    }
			}// onMessage(event) 끝
			    
			// 입장할때
			function onOpen(event) {
			    $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
			}
			
			// 에러낫을때
			function onError(event) {
			    alert(event.data);
			}
			
			// 메세지 보내는 부분
			function send() {
			    if (inputMessage.value == "") {
			    } else {
			        $("#messageWindow").html($("#messageWindow").html()
			            + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
			    }
			    webSocket.send(chatId + "|" + inputMessage.value);
			    inputMessage.value = "";
			}
			
			//엔터키를 통해 send함
			function enterkey() {
			    if (window.event.keyCode == 13) {
			        send();
			    }
			}
			
			// 스크롤 조절
			window.setInterval(function() {
			    var elem = document.getElementById('messageWindow');
				    elem.scrollTop = elem.scrollHeight;
			}, 0);
		</script>


		</div>
		</div>
		</div>


	</main>

	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="mMlq6dEKQC">
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