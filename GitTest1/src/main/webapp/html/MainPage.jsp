<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
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
	<meta property="og:description" content="웹사이트입니다">4k4r
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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
<img class="chat" src="../resources/images/고양이말풍선white2.png" />

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
                              <a href="BoardIdService.do"><img src="../resources/icons/ico_profile_black.png" ></a>
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
	<main class="th-layout-main">
		<div id="total_div">
			<div id="left_div">       <!-- 왼쪽 자산정보 입력창 -->
		       <div class="textset textset-sub textset-center">
				  <h5 class="textset-tit" id = "MainSerch">당신의 능력으로 살 수있는 집을 알려드려요​<br></h5>
			   <form>
			   </div>
		   		<ul class="contents-list">
		   				<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>집 사본적?
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" align=center>
									<input type="radio" name="firstloan1"  value="fisrtloan0"> 있어요
									<input type="radio" name="firstloan1"  value="firstloan1"> 없어요
								</div>
							</div>
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span> 현재 집이 있나요?
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" align=center>
									<input type="radio" name="firstloan" value="fisrtloan0"> 있어요
									<input type="radio" name="firstloan" value="firstloan1"> 없어요
								</div>
							</div>
						</li>
		   		
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>나이
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="age" class="selectset-toggle btn" >
                						    <option value="under24">24세이하</option>
                             				<option value="over24">25세~30세</option>
                      					    <option value="over28">31세~36세</option>
                      					    <option value="over34">36세이상</option>
             						 </select>
               					  </div>
               				</div>	  
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>부양가족수
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="family" class="selectset-toggle btn" >
                						    <option value="family1">혼자살아요</option>
                             				<option value="family2">2인</option>
                      					    <option value="family3">3인</option>
                      					    <option value="family4">4인이상</option>
             						 </select>
               					  </div>
               				</div>	  
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>연소득입력(만원)
							</h6>
							<div class="form-wrap">
								<div class="form-wrap">
									<div class="selectset selectset-round selectset-md">
                  						<select name="salary" class="selectset-toggle btn" id="income">
                							<option value="1600">2000만원 이하</option>
                             				<option value="2400">2000만원~3000만원</option>
                      					    <option value="3200">3000만원~4000만원</option>
                      					    <option value="4000">4000만원~5000만원</option>
                      					    <option value="4800">5000만원~6000만원</option>
                      					    <option value="5600">6000만원~7000만원</option>
                      					    <option value="6000">7000만원 이상</option>
             							</select>
               					  	</div>
               					</div>	  
							</div>
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>구매여유자금(만원)
							</h6>
							<div class="form-wrap">
								<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="spare_funds" class="selectset-toggle btn" id="money">
                						    <option value="2000">2000만원</option>
                             				<option value="3000">2000만원~3000만원</option>
                      					    <option value="4000">3000만원~4000만원</option>
                      					    <option value="5000">4000만원~5000만원</option>
                      					    <option value="6000">5000만원~6000만원</option>
                      					    <option value="7000">6000만원~7000만원</option>
                      					    <option value="7001">7000만원 이상</option>
             						 </select>
               					  </div>
               				  </div>	  
						 </div>
						</li>
					<br>
					<div class="contents-confirm" align=center>
						<button id="result_btn" class="btnset btnset-round" type="button" onclick="PriceCompare()">결과보기</button>
						<br>
						<button id="final_btn" class="btnset btnset-round" type="button" onclick="">상세입력</button>
					</div>
				</ul>	
			</div>      <!-- 왼쪽 자산정보 입력창 닫기 -->
			</form>
			
			<div id="full_mid_div">
				<div id="mid_div"></div>
				<div id="search_page" class="bg_white">
					<div class="option">
						<div>
							<form>
                        		<label for="keyword" style="font-size: 20px;">키워드 :</label> <input type="text" value="" id="keyword" size="15" >
                        		<button id = "search_btn" type="button" onclick="searchPlaces()">검색</button>
                        		<span style="font-size: 20px; text-align: left;"><br><br>↑ 주소 검색 가능<br><br> ← 왼쪽에 입력하면 살 수 있는 집이 표시됩니다.<br><br> → 지도에서 직접 집보기,지역게시판 <br><br> ↓ 게시판 인기글 <br><br>↘ 접속한 사람들과 채팅<br><br><br>시연회계정<br>id:test<br>pw:12345<br></span>
                     		</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="campland-N15" data-bid="crlQNCwqYB">
      		<div class="contents-inner">
        		<div class="contents-container container-md">
          			<div class="textset textset-sub">
            			<h2 class="textset-tit">인기 게시글</h2> 
          			</div>
          			<div class="cardset-wrap">
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top1_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top1_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
            			
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top2_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top2_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
            			
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top3_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top3_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
            			
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top4_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top4_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
            			
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top5_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top5_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
            
            			<div class="cardset">
              				<figure class="cardset-figure">
                				<img id = "top6_img" class="cardset-img" src="" onerror="this.src='../resources/images/img_logo.png'">
              				</figure>
              				<div class="cardset-body">
                				<p id="top6_p" class="cardset-desc"></p>
                  				<br>
              				</div>
            			</div>
          			</div>
        		</div>
      		</div>
    	</div>		
	</main>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,clusterer,drawing"></script>
<script>
	var addr = '';
	var markers = [];
	var container = document.getElementById('mid_div');
	var options = {
		center: new kakao.maps.LatLng(34.810159, 126.424775), level: 6
	};
	// 맵 중심좌표, 맵 확대레벨 선언
				
	var map = new kakao.maps.Map(container, options), 
       	customOverlay = new kakao.maps.CustomOverlay({yAnchor: 2, xAnchor:0.5}), 
       	customOverlay2 = new kakao.maps.CustomOverlay({}),
       	customOverlay3 = new kakao.maps.CustomOverlay({}),
		infowindow = new kakao.maps.InfoWindow({removable: true});
			// 맵, 오버레이, 인포윈도우
				
	$.getJSON('../resources/json/mokpo_test.json', function(json) {
	 	var data = json.features;
		var coordintes = [];   // 좌표 저장
		var name = '';         // 행정구 이름
											
		$.each(data, function(index, val) {
			coordinates = val.geometry.coordinates;
			name = val.properties.ADM_NM; // json에 있는 한글이름
				
			displayArea2(coordinates, name);
		})
	})	// 좌표 저장되어잇는 json 파일 불러오기		
					
	var polygons = [];
	var points = [];
					
	function displayArea2(coordinates, name) {
		 var path = [];     // 폴리곤 path
						
		$.each(coordinates[0], function(index, coordinate) {
			var point = new Object();
				point.x = coordinate[0];
				point.y = coordinate[1];
				points.push(point);
							
			path.push(new kakao.maps.LatLng(coordinate[0], coordinate[1]));
		})
					 
		var polygon = new kakao.maps.Polygon({
			map : map, // 다각형을 표시할 지도 객체
		    path : path,
		    strokeWeight: 2,
		    strokeColor: '#004c80',
		    strokeOpacity: 0.8,
		    fillColor: '#fff',
		    fillOpacity: 0.7 
		});
					    
		polygons.push(polygon);
				
		// 폴리곤 위에 마우스를 올렸을 때
	    kakao.maps.event.addListener(polygon, 'mouseover',function(mouseEvent){	                   
	    	polygon.setOptions({fillColor: '#09f'});
		    customOverlay.setContent('<div id="Region_name">'+name+'</div>');
		    customOverlay.setPosition(mouseEvent.latLng);
		    customOverlay.setMap(map);
		});
		        
		// 폴리곤에서 마우스를 움직일 때
		kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		   	customOverlay.setPosition(mouseEvent.latLng); 
		});

		// 맵을 드래그 했을 때
		kakao.maps.event.addListener(map, 'drag', function(mouseEvent){
		   	customOverlay2.setMap(null);
		    polygon.setOptions({fillColor: '#fff'});
		    customOverlay.setMap(null);
		});
		               
		// 폴리곤에서 마우스가 벗어났을 때
		kakao.maps.event.addListener(polygon, 'mouseout', function() {
			polygon.setOptions({fillColor: '#fff'});
			customOverlay.setMap(null);
		});
					
		// 폴리곤을 클릭했을 때
		kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
						
			addr = name;
					
			var content = '<div id="customOverlay">' +
			            '<div id="titleText">' + name + '</div>' +
			            '<ul id="customList">' +
			            '<li class="customListItem"><button class="customButton" onclick="detail_map()">지역상세보기</button></li>' +
			            '<li class="customListItem"><form action="notice_Board.do"><button class="customButton" name="loc" value="' + name + '">지역게시판</button></form></li>' +
			            '</ul>' +
			            '</div>';
			customOverlay2.setContent(content);
			customOverlay2.setPosition(mouseEvent.latLng);
			customOverlay2.setMap(map);
		});
	} // displayarea2 끝나는 부분

	// 상세정보보기 눌렀을 때
	function detail_map(){ 
		removeMarkers();
		customOverlay2.setMap(null);
		getData();// 데이터 가져오는 함수
					
		map.setLevel(2, {anchor: zoomin_map(), animate:true});
					
		for(var i = 0; i < polygons.length; i++){
			polygons[i].setMap(null);		
		}
		customOverlay.setMap(null);
		polygons = [];
						
	}
					
	// 폴리곤 눌러서 클릭 했을 때 확대되는 좌표값
	function zoomin_map(){
		if(addr == "하당동"){
			return new kakao.maps.LatLng(34.808948346503676, 126.42033035076065);
		}else if(addr=="옥암동"){
			return new kakao.maps.LatLng(34.81032236853858, 126.42877975042865);
		}else if(addr=="신흥동"){
			return new kakao.maps.LatLng(34.80073454515796, 126.42368802081405);
		}else if(addr=="하당동"){
			return new kakao.maps.LatLng(34.80893668896109, 126.42166920829253);
		}else if(addr=="상동"){
			return new kakao.maps.LatLng(34.8162030484548, 126.41530104485805);
		}else if(addr=="부흥동"){
			return new kakao.maps.LatLng(34.80363500052842, 126.43381456301658);
		}else if(addr=="부주동"){
			return new kakao.maps.LatLng(34.80794832924792, 126.44658253172632);
		}else if(addr=="삼향동"){
			return new kakao.maps.LatLng(34.82631113863141, 126.42931977338388);
		}
	}
				
				
	let geocoder = new kakao.maps.services.Geocoder();
	let infoapart = '';
	var currentOverlay; // 전역 변수로 현재 오버레이를 저장하는 변수

	function getData() { // 상세정보보기 눌렀을 때 가져오는 동 아파트 주소 정보
		$.ajax({
			url: 'http://localhost:8083/GitTest1/getApart.do?name=' + addr,
		    contentType: 'text/plain; charset=UTF-8',
		    success: function (result) {
		        var itemList = result.split(';');
				            
		        for (let i = 0; i < itemList.length - 1; i += 2) {
		            let j = i + 1;
		            geocoder.addressSearch(itemList[i], function (result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		                    let marker = new kakao.maps.Marker({
		                        map: map,
		                        position: coords
		                    });

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
						    	infoapart = itemList[j]; // 클릭했을 때 이름을 변수에 넣음
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
		    },
		    error: function () { // 통신 실패했을 때
		        console.error('실패애~~~~~~~');
		    }
		});
	} // getData 끝
				
	function getapartallinfo(){
		$.ajax({
			url: 'http://localhost:8083/GitTest1/getapartallinfo.do?aptname=' + infoapart,
						
			success: function (result) {
				let infoList = result.split(';');
	
				let temp1 = infoList.length/5; // 같은 이름 다른 평수 몇개인지 구분하기 위해서
						
				document.getElementById('apt_name').innerText = infoList[0];
							
				document.getElementById('apt_loc').innerText = infoList[1];
							
				document.getElementById('tab_1').innerText = infoList[3]+"㎡";
				document.getElementById('realprice1').innerText = infoList[2]+"만원";
				document.getElementById('apt_img1').src = infoList[4];
				document.getElementById('apt_img1').onerror = function() {
	        	    this.src = '../resources/images/img_logo.png';
	        	};
	        			
	        	if(temp1 > 2 && temp1 < 3){
					document.getElementById('tab_2').innerText = infoList[8]+"㎡";
					document.getElementById('realprice2').innerText = infoList[7]+"만원";
					document.getElementById('apt_img2').src = infoList[9];
					document.getElementById('apt_img2').onerror = function() {
		        	    this.src = '../resources/images/img_logo.png';
		        	};
				}
	        			
				if(temp1 > 3){
					document.getElementById('tab_2').innerText = infoList[8]+"㎡";
					document.getElementById('realprice2').innerText = infoList[7]+"만원";
					document.getElementById('apt_img2').src = infoList[9];
					document.getElementById('apt_img2').onerror = function() {
		        	    this.src = '../resources/images/img_logo.png';
		        	};
					document.getElementById('tab_3').innerText = infoList[13]+"㎡";
					document.getElementById('realprice3').innerText = infoList[12]+"만원";
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
												
			},
			error: function(){
							
			}
		});
	} // getapartallinfo 끝
				
	function PriceCompare(){ //결과보기
		removeMarkers();
		var income = $('#income').val();
		var money = $('#money').val();
					
	    $.ajax({
	    	url : 'http://localhost:8083/GitTest1/getCompare.do?income='+income+'&'+'money='+money,
	        contentType : 'text/plain; charset=UTF-8', // Specify UTF-8
	        data: { income: income },
	                	
	        success : function(result) {
	                		
	        	var searchList = result.split(';');
	                		
	            for (let i = 2; i < searchList.length - 1; i += 3) {
	            	let j = i + 1;
	                var geocoder = new kakao.maps.services.Geocoder();
	                        
	                geocoder.addressSearch(searchList[i],function(result, status) {
	                	if (status === kakao.maps.services.Status.OK) {
	                    	var coords = new kakao.maps.LatLng(
	                        	result[0].y,
	                            result[0].x
	                        );

	                        var marker = new kakao.maps.Marker({
	                        	map : map,
	                            position : coords
	                        });
	                    }
					})
				}
	        },
	        error : function() {
	        	console.log("error");
	        }
		})
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

				
	function searchPlaces() { // 검색데이터 가져오기
		removeMarkers();
		var searchValue = $('#keyword').val();
	            	
	    $.ajax({
	    	url : 'http://localhost:8083/GitTest1/getApartSearch.do?name='+ searchValue,
	        contentType : 'text/plain; charset=UTF-8', // Specify UTF-8
	        data: { name: searchValue },
	                	
	        success : function(result) {
	            var searchList = result.split(';');
	                   		
	           	for (let i = 0; i < searchList.length - 1; i += 3) {
	               	let j = i + 1;
	                        
	                geocoder.addressSearch(searchList[i],function(result, status) {

	                   	if (status === kakao.maps.services.Status.OK) {
	                      	var coords = new kakao.maps.LatLng(
	                           	result[0].y,
	                            result[0].x
	                        );
									
	                        var marker = new kakao.maps.Marker({
	                          	map : map,
	                            position : coords
	                        });
							markers.push(marker);
	                    }
					})
				}
	        },
			error : function() {
		    	console.log("실패");
			}
	    })
	} // searchPlaces 끝

				
	var chatId = "${chatId}";
	// 이미지 클릭 이벤트 처리
    $(".chat").on({"click": function () {
                
    // 눌렀을 때 이미지 변경
        if ($(this).attr("src") == "../resources/images/고양이말풍선white2.png" && chatId !== '') {
            $(this).attr("src", "../resources/images/고양이말풍선black2.png");
            $("#_chatbox").css("display", "block");
        } else if ($(this).attr("src") == "../resources/images/고양이말풍선black2.png") {
            $(this).attr("src", "../resources/images/고양이말풍선white2.png");
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
	
	// 에러났을 때
	webSocket.onerror = function(event) {
		onError(event)
	};
	// 접속했을 때
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	// 메세지 올때
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
			
	//메세지 받은거
	function onMessage(event) {
	    var message = event.data.split("|"); // 메세지를 보낼때 닉네임 | 내용으로 보내기 때문에
	    var sender = message[0]; // 보낸사람 닉네임
	    var content = message[1]; // 내용
	    if (content == "") {
			// 아무것도 안오면 아무것도 하지않음	            
		} else {
			// 내용이 들어왔다면
			if (content.match("/")) { // /가 포함되어있다면
				if (content.match(("/" + chatId))) { // /닉네임으로 들어왔다면
			    	var temp = content.replace("/" + chatId, "(귓속말) :").split(":"); // /닉네임을 (귓속말): 로 바꾸고 :를 기준으로 짜른다
			        if (temp[1].trim() == "") {
			        	// 내용의 공백을 지운것이 아무것도 없다면 아무것도 안함
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
		
			
		$.ajax({
			url: 'http://localhost:8083/GitTest1/getmainforum.do',
			dataType: 'json',
			success:function(result){
				console.log("result : ",result);
				console.log("result : ",result[0].f_seq);
				
				let top1_img = document.getElementById("top1_img");
				top1_img.src = "../uploadimg/"+result[0].f_file;
				let top1_p = document.getElementById("top1_p");
				top1_p.innerText = result[0].f_content;
				
				let top2_img = document.getElementById("top2_img");
				top2_img.src = "../uploadimg/"+result[1].f_file;
				let top2_p = document.getElementById("top2_p");
				top2_p.innerText = result[1].f_content;
				
				let top3_img = document.getElementById("top3_img");
				top3_img.src = "../uploadimg/"+result[2].f_file;
				let top3_p = document.getElementById("top3_p");
				top3_p.innerText = result[2].f_content;
				
				let top4_img = document.getElementById("top4_img");
				top4_img.src = "../uploadimg/"+result[3].f_file;
				let top4_p = document.getElementById("top4_p");
				top4_p.innerText = result[3].f_content;
				
				let top5_img = document.getElementById("top5_img");
				top5_img.src = "../uploadimg/"+result[4].f_file;
				let top5_p = document.getElementById("top5_p");
				top5_p.innerText = result[4].f_content;
				
				let top6_img = document.getElementById("top6_img");
				top6_img.src = "../uploadimg/"+result[5].f_file;
				let top6_p = document.getElementById("top6_p");
				top6_p.innerText = result[5].f_content;
				
			},
			error:function(){
				
			}
		})
		
		const result_btn = document.getElementById("result_btn");
		const final_btn = document.getElementById("final_btn");

		result_btn.addEventListener('click', function () {
    		final_btn.style.display = "block";
		});
		
		final_btn.addEventListener('click', function () {
			$.ajax({
				url: 'http://localhost:8083/GitTest1/logincheck.do',
				
				success: function (result) {
					console.log("결과 : ",result);
					if (result === 'success') {
						window.location.href = "Profile.jsp";
		  			}else{
		  				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
		  				window.location.href = "login.jsp";
		  			}
				},
				error: function(){
			
				}
  		    });
		});
		
		function removeMarkers() {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }
		    // 배열 비우기
		    markers = [];
		}
		
		function preventEnterKey(event) {
		    if (event.keyCode === 13) {
		    	event.preventDefault();
			}
		}
		window.onload = function() {
		      document.onkeydown = preventEnterKey;
		};
		
		</script>

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
	<script src="../resources/js/setting.js"></script>
	<script src="../resources/js/plugin.js"></script>
	<script src="../resources/js/template.js"></script>
	<script src="../resources/js/common.js"></script>
	<script src="../resources/js/script.js"></script>
</body>