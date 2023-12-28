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
        #customOverlay {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 250px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 999;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #titleText {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 16px;
        }

        #customList {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .customListItem {
            margin-bottom: 10px;
        }

        .customButton {
            background-color: #007BFF;
            color: #fafafa;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 16px;
        }

        .customButton img {
            width: 12px;
            height: 12px;
            margin-right: 5px;
        }

        .customButton:hover {
            background-color: #0056b3;
            
        }
        
        .overlay {
    		position:fixed;
    		right: -900px;
    		top: 10px;
    		width:100px;
    		border:1px solid #ccc;
    		border-radius: 5px;
    		padding:5px;
    		font-size:12px;
		    text-align: center;
    		white-space: pre;
    		word-wrap: break-word;
		}
		#menu_wrap {position:fixed;top:0;left:100em;bottom:0;width:250px;margin:absolute; padding:5px;overflow-y:absolute;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
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
						<img src="../resources/icons/ico_profile_black.svg" >
					</a>

					<a href="Profile.jsp" class="btn-search header-utils-btn">
						<img src="../resources/icons/ico_search_black.svg" >
					</a>

				</div>
			</div>
		</div>
	</header>

	<main class="th-layout-main">
		<div id="total_div">
			<div id="left_div">       <!-- 왼쪽 자산정보 입력창 -->
		   
		       <div class="textset textset-sub textset-center">
				  <h5 class="textset-tit">당신의 능력으로 살 수있는 집을 알려드려요​<br></h5>
			   </div>
		   
		   		<ul class="contents-list">
		   		
		   				<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>집 사본적?
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" align=center>
									<input type="radio" name="firstloan"  value="fisrtloan0"> 있어요
									<input type="radio" name="firstloan"  value="firstloan1"> 없어요
								</div>
							</div>
						</li>
						
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span> 현재 집이 있나요?
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" align=center>
									<input type="radio" name="nowhome" value="nowhome0"> 있어요
									<input type="radio" name="nowhome" value="nowhome1"> 없어요
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
                  					  <select name="salary" class="selectset-toggle btn" >
                						    <option value="under2000">2000만원 이하</option>
                             				<option value="over2000">2000~3000만원</option>
                      					    <option value="over3000">3000만원~4000만원</option>
                      					    <option value="over4000">4000만원~5000만원</option>
                      					    <option value="over5000">5000만원~6000만원</option>
                      					    <option value="over6000">6000만원~7000만원</option>
                      					    <option value="over7000">7000만원 이상</option>
                      					    
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
                  					  <select name="spare_funds" class="selectset-toggle btn" >
                						    <option value="under2000">2000만원 이하</option>
                             				<option value="over2000">2000~3000만원</option>
                      					    <option value="over3000">3000만원~4000만원</option>
                      					    <option value="over4000">4000만원~5000만원</option>
                      					    <option value="over5000">5000만원~6000만원</option>
                      					    <option value="over6000">6000만원~7000만원</option>
                      					    <option value="over7000">7000만원 이상</option>
             						 </select>
               					  </div>
               				  </div>	  
						 </div>
						</li>
					<br>
					<div class="contents-confirm" align=center>
						<button class="btnset btnset-round">결과보기</button>
					</div>

				</ul>	
		
			</div>      <!-- 왼쪽 자산정보 입력창 닫기 -->
			
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
					    
					    kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
				            addr = name;
				            var content = '<div id="customOverlay">' +
				                '<div id="titleText">' + name + '</div>' +
				                '<ul id="customList">' +
				                '<li class="customListItem"><button class="customButton" onclick="detail_map()">지역상세보기</button></li>' +
				                '<li class="customListItem"><form action="notice_Board.do"><button class="customButton" name="loc" value="' + name + '">지역게시판</button></form></li>' +
				                '<li class="customListItem"><form action=""><button class="customButton">지역채팅</button></form></li>' +
				                '</ul>' +
				                '</div>';
				            customOverlay.setContent(content);
				            customOverlay.setPosition(mouseEvent.latLng);
				            customOverlay.setMap(map);
				        });
					}

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
					
					function getData() {
					    $.ajax({
					        url: 'http://localhost:8083/GitTest1/getApart.do?name=' + addr,
					        contentType: 'text/plain; charset=UTF-8',
					        success: function (result) {
					            var itemList = result.split(';');
					            
					            for (let i = 0; i < itemList.length - 1; i += 2) {
					                let j = i + 1;

					                var geocoder = new kakao.maps.services.Geocoder();

					                geocoder.addressSearch(itemList[i], function (result, status) {
					                    if (status === kakao.maps.services.Status.OK) {
					                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					                        // 서버에서 추가 데이터를 가져오기
					                        var additionalData = getDataForMarker(itemList[i]);

					                        var marker = new kakao.maps.Marker({
					                            map: map,
					                            position: coords
					                        });

					                        let content = document.createElement('div');
					                        content.innerHTML = '<div id="menu_wrap" style="height:70em; width:350px;text-align:center;padding:6px 0;"><h1>'
					                        	+ itemList[j] + '</h1><br>'
					                            + additionalData + '<br>'
					                            +                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
					                            '</div>';

					                        kakao.maps.event.addListener(marker, 'click', function () {
					                            let CustomOverlay2 = new kakao.maps.CustomOverlay({
					                                map: map,
					                                position: coords,
					                                content: content
					                            });
					                        });
					                    }
					                });
					            }
					        },
					        error: function () {
					            console.error('Error fetching data from server.');
					        }
					    });
					}

					// 서버에서 추가 데이터 가져오는 함수
					function getDataForMarker(name) {
					    return name;
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
		
		<!-- [S]campland-N15 -->
    <div class="campland-N15" data-bid="crlQNCwqYB">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-sub">
            <h2 class="textset-tit">부동산 게시판</h2> 
          </div>
          
          <div class="cardset-wrap">
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/베장미.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  구임규
                  <br>
                 
              </div>
            </a>
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/직방.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  좋아보이지만 다 사진빨이에요.
                 
                </p>
              </div>
            </a>
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/apart.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  돈 벌어서 넓은 집으로!!
                  
                </p>
              </div>
            </a>
            
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/프로젝트하는나의모습.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  정신아 돌아와줘
                  
                </p>
              </div>
            </a>
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/apart.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  이제 어려운 작업만 남았다!!
                  
                </p>
              </div>
            </a>
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/고양이빵.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  고양이빵
                  
                </p>
              </div>
            </a>
            
            <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/고양이빵.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  고양이빵
                  
                </p>
              </div>
            </a>
            
             <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/고양이빵.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  고양이빵
                  
                </p>
              </div>
            </a>
             <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/고양이빵.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  고양이빵
                  
                </p>
              </div>
            </a>
             <a href="javascipt:void(0);" class="cardset">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/고양이빵.png" >
              </figure>
              <div class="cardset-body">
                
                <p class="cardset-desc">
                  고양이빵
                  
                </p>
              </div>
            </a>
            
            
            
          </div>  <!-- 게시판 글 영역 -->
        </div>
      </div>
    </div>
    <!-- [E]campland-N15 -->
	
		
	</main>

	<footer class="campland-N2" data-bid="akLQ6d2RkW">
		<div class="footer-container container-lg">
			<div class="footer-bottom">
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