<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style>
		
		
	</style>
</head>

<body>
	<!-- [S]campland-N1 -->
	<header class="campland-N1" data-bid="Dplq6d2rH9" id="">
		<div class="header-container container-lg">
			<div class="header-left">
				<h1 class="header-title">
					<a href="javascript:void(0)">
						<img src="../resources/images/img_logo.png" alt="로고">
					</a>
				</h1>
			</div>
			<div class="header-center">
				<ul class="header-gnblist">
					<li class="header-gnbitem">
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="javascript:void(0)">
							<span>시설소개</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<ul class="header-sublist">
							<li class="header-subitem">
								<a class="header-sublink" href="javascript:void(0)">
									<span>공지사항</span>
								</a>
							</li>
							<li class="header-subitem">
								<a class="header-sublink" href="javascript:void(0)">
									<span>자주묻는질문</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="javascript:void(0)">
							<span>이용후기</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<a class="header-gnblink" href="javascript:void(0)">
							<span>오시는 길</span>
						</a>
					</li>
					<li class="header-gnbitem">
						<ul class="header-sublist">
							<li class="header-subitem">
								<a class="header-sublink" href="javascript:void(0)">
									<span>빠른예약</span>
								</a>
							</li>
							<li class="header-subitem">
								<a class="header-sublink" href="javascript:void(0)">
									<span>예약조회</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="header-right">
				<div class="header-utils">
					<a href="javascript:void(0);" class="btn-profile header-utils-btn">
						<img src="../resources/icons/ico_profile_black.svg" alt="검색">
					</a>
					<button class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" alt="검색">
					</button>
					<button class="btn-moclose header-utils-btn">
						<img src="../resources/icons/ico_close_m_black.svg" alt="닫기">
					</button>
				</div>
			</div>
		</div>
	</header>

	<main class="th-layout-main ">
		<div id="total_div">
			<div id="left_div">
		
			</div>
			
			<div id="mid_div">
			<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
				<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,clusterer,drawing"></script>
				<script>
					var addr = '';
					var container = document.getElementById('mid_div');
					var options = {
						center: new kakao.maps.LatLng(34.810159, 126.424775), level: 6
					};
				
					var map = new kakao.maps.Map(container, options),
						customOverlay = new kakao.maps.CustomOverlay({}),
						infowindow = new kakao.maps.InfoWindow({removable: true});
				
				
					$.getJSON('../resources/json/mokpo_test.json', function(json) {
					 	var data = json.features;
						var coordintes = [];   // 좌표 저장
						var name = '';         // 행정구 이름
						
						
						$.each(data, function(index, val) {
							coordinates = val.geometry.coordinates;
							name = val.properties.ADM_NM; // json에 있는 한글이름
							
							displayArea2(coordinates, name);
							console.log('test = ',name);
							console.log('test2 = ',coordinates);
						})
					})			
					
					var polygons = [];
					var points = [];
					
					function displayArea2(coordinates, name) {
					 	var path = [];     // 폴리곤 path
						   // 중심좌표
						
						$.each(coordinates[0], function(index, coordinate) {
							var point = new Object();
							point.x = coordinate[0];
							point.y = coordinate[1];
							points.push(point);
							console.log('test3 : ',coordinate[1]);
							console.log('test4 : ',coordinate[0]);
							
							path.push(new kakao.maps.LatLng(coordinate[0], coordinate[1]));
						})
						console.log('points : ',points);
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
					    
					    /* kakao.maps.event.addListener(polygon, 'mouseover',function(mouseEvent){
					    	console.log('작동!');
					    	
					    	polygon.setOptions({fillColor: '#09f'});
					    	//customOverlay.setContent('<div>'+name+'</div>');
					    	customOverlay.setPosition(mouseEvent.latLng);
					    	customOverlay.setMap(map);
					    });
					    
					    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
					        
					        customOverlay.setPosition(mouseEvent.latLng); 
					    });

					    
					    kakao.maps.event.addListener(polygon, 'mouseout', function() {
					        polygon.setOptions({fillColor: '#fff'});
					        customOverlay.setMap(null);
					    });  */
					    
					    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
					    	addr = name;
					    	var content = '<div class = "overlaybox">'+
							  '<div class="title_text">'+name+'</div>'+
							      '<ul>'+
								      '<li>'+
									      '<button onclick="detail_map()">지역상세보기</button>'+
									  '</li>'+
									  '<li>'+
									  	  '<form action ="notice_Board.do"><button name="loc" value="'+name+'">지역게시판</button></form>'+
									  '</li>'+
									  '<li>'+
										  '<form action =""><button>지역채팅</button></form>'+
									  '</li>'+
								  '</ul>'+
							  '</div>';
							customOverlay.setContent(content);
							customOverlay.setPosition(mouseEvent.latLng);
							customOverlay.setMap(map);
						});
					}
					
					//kakao.maps.event.addListener(map, 'zoom_changed', function() {        
					    // 지도의 현재 레벨을 얻어옵니다
					    //level = map.getLevel();

						//if(level > 3){
							//for (var i = 0, len = areas.length; i < len; i++) {
					    		//displayArea(areas[0]);
							//}

						//}else {
							//for (var i = 0, len = areas.length; i < len; i++) {
					    	//	map;

							//}
						//}
					    
					//});
					
					
					function detail_map(){
						//console.log('1. name : ',name);
						getData();
						map.setLevel(2, {anchor: zoomin_map(), animate:true});
						
						for(var i = 0; i < polygons.length; i++){
							polygons[i].setMap(null);		
						}
						customOverlay.setMap(null);
						polygons = [];
					}
					
					
					function zoomin_map(){
						if(addr == "하당동"){
							return new kakao.maps.LatLng(34.808948346503676, 126.42033035076065);
						}else if(addr="옥암동"){
							return new kakao.maps.LatLng(34.81032236853858, 126.42877975042865);
						}
					}
					
					function getData(){
						$.ajax({
							/* url : 'http://localhost:8083/GitTest2/GetApartinfoService?name='+addr, */
							url : 'http://localhost:8083/GitTest2/getApart.do?name='+addr,
							contentType: 'text/plain; charset=UTF-8', // Specify UTF-8
							success:function(result){
								var itemList = result.split(';');
								//itemList.remove(4);
								console.log('List from server:', itemList);
								
								for (let i = 0; i < itemList.length-1; i+=2){
									let j = i+1;
									console.log("j : ",itemList[j]);
									var geocoder = new kakao.maps.services.Geocoder();
								
									// 주소로 좌표를 검색
									geocoder.addressSearch(itemList[i], function(result, status) {

								     	// 정상적으로 검색
								     	if (status === kakao.maps.services.Status.OK) {

								        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								        	// 결과값으로 받은 위치를 마커로 표시
								        	var marker = new kakao.maps.Marker({
								           		map: map,
								            	position: coords
								        	});

								        	// 인포윈도우로 장소에 대한 설명을 표시
								        	var infowindow = new kakao.maps.InfoWindow({
								            	content: '<div style="width:150px;text-align:center;padding:6px 0;">'+itemList[j]+'</div>'
								        	});
								        	
								        infowindow.open(map, marker);

								    	} 
									})
								}
								 
								
							},
							error:function(){
								
							}
						})
						
					}
					
					function change_LatLng(itemList){
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(itemList, function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
						        });
						        infowindow.open(map, marker);

						       
						    } 
						})
					}
				</script>
			</div>
			
		</div>
	</main>

	<footer class="campland-N2" data-bid="akLQ6d2RkW">
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
					<p> 서울시 영등포구 선유로70 우리벤처타운2 705호 </p>
					<p>
						<span>T. 070-8872-8874</span>
						<span>E. help@openfield.co.kr</span>
					</p>
				</div>
				<div class="footer-txt">
					<p>2022 BY TEMPLATEHOUSE. ALL RIGHTS RESEVED</p>
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