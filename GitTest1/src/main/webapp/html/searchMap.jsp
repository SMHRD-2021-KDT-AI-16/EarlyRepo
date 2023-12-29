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
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}

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
   color: #fff;
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
   position: fixed;
   right: -900px;
   top: 10px;
   width: 100px;
   height: 100px;
   background: #fff;
   border: 1px solid #ccc;
   border-radius: 5px;
   padding: 5px;
   font-size: 12px;
   text-align: center;
   white-space: pre;
   word-wrap: break-word;
}
#mid_div_full{
         display: inline-block;
         width: 80%;
         height: 700px;
         position: relative;
         margin-right: 5%;
         margin-left: 50px;
      }
</style>
</head>

<body>
   <!-- [S]campland-N1 -->
   <header class="campland-N1" data-bid="Dplq6d2rH9" id="">
      <div class="header-container container-lg">
         <div class="header-left">
            <h1 class="header-title">
               <a href="javascript:void(0)"> <img
                  src="../resources/images/img_logo.png" alt="로고">
               </a>
            </h1>
         </div>
         <div class="header-center">
            <ul class="header-gnblist">
               <li class="header-gnbitem"></li>
               <li class="header-gnbitem"><a class="header-gnblink"
                  href="javascript:void(0)"> <span>시설소개</span>
               </a></li>
               <li class="header-gnbitem">
                  <ul class="header-sublist">
                     <li class="header-subitem"><a class="header-sublink"
                        href="javascript:void(0)"> <span>공지사항</span>
                     </a></li>
                     <li class="header-subitem"><a class="header-sublink"
                        href="javascript:void(0)"> <span>자주묻는질문</span>
                     </a></li>
                  </ul>
               </li>
               <li class="header-gnbitem"><a class="header-gnblink"
                  href="javascript:void(0)"> <span>이용후기</span>
               </a></li>
               <li class="header-gnbitem"><a class="header-gnblink"
                  href="javascript:void(0)"> <span>오시는 길</span>
               </a></li>
               <li class="header-gnbitem">
                  <ul class="header-sublist">
                     <li class="header-subitem"><a class="header-sublink"
                        href="javascript:void(0)"> <span>빠른예약</span>
                     </a></li>
                     <li class="header-subitem"><a class="header-sublink"
                        href="javascript:void(0)"> <span>예약조회</span>
                     </a></li>
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
         <div id="left_div"></div>

         <div id="full_mid_div">
            <div id="mid_div"></div>

            <div id="menu_wrap" class="bg_white">
               <div class="option">
                  <div>
                     <form  id="myForm" >
                        키워드 : <input type="text" value="" id="keyword" name="search" size="15">
                        <button type="button" onclick="getData2()">검색하기</button>
                     </form>
                  </div>
               </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
         </div>
         <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
         <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,clusterer,drawing"></script>
         <script>
            var addr = '';
            var container = document.getElementById('mid_div');
            var options = {
               center : new kakao.maps.LatLng(34.810159, 126.424775),
               level : 6
            };

            var map = new kakao.maps.Map(container, options), customOverlay = new kakao.maps.CustomOverlay(
                  {}), infowindow = new kakao.maps.InfoWindow({
               removable : true
            });

            $.getJSON('../resources/json/mokpo_test.json', function(json) {
               var data = json.features;
               var coordintes = []; // 좌표 저장
               var name = ''; // 행정구 이름

               $.each(data, function(index, val) {
                  coordinates = val.geometry.coordinates;
                  name = val.properties.ADM_NM; // json에 있는 한글이름

                  displayArea2(coordinates, name);
                  console.log('test = ', name);
                  console.log('test2 = ', coordinates);
               })
            })

            var polygons = [];
            var points = [];

            function displayArea2(coordinates, name) {
               var path = []; // 폴리곤 path
               // 중심좌표

               $.each(coordinates[0], function(index, coordinate) {
                  var point = new Object();
                  point.x = coordinate[0];
                  point.y = coordinate[1];
                  points.push(point);
                  console.log('test3 : ', coordinate[1]);
                  console.log('test4 : ', coordinate[0]);

                  path.push(new kakao.maps.LatLng(coordinate[0],
                        coordinate[1]));
               })
               //console.log('points : ', points);
               var polygon = new kakao.maps.Polygon({
                  map : map, // 다각형을 표시할 지도 객체
                  path : path,
                  strokeWeight : 2,
                  strokeColor : '#004c80',
                  strokeOpacity : 0.8,
                  fillColor : '#fff',
                  fillOpacity : 0.7
               });

               polygons.push(polygon);
            
               let isClick= false; 
               
               kakao.maps.event.addListener(polygon, 'mouseover',function(mouseEvent){
                 if (isClick){
                    return false;
                 }
                  console.log('작동!');
                  
                  polygon.setOptions({fillColor: '#09f'});
                  //customOverlay.setContent('<div>'+name+'</div>');
                  customOverlay.setPosition(mouseEvent.latLng);
                  customOverlay.setMap(map);
               });
               
               kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
                  if (isClick){
                     return false;
                  }
                   customOverlay.setPosition(mouseEvent.latLng); 
               });

               
               kakao.maps.event.addListener(polygon, 'mouseout', function() {
                  if (isClick){
                     return false;
                  }
                   polygon.setOptions({fillColor: '#fff'});
                   customOverlay.setMap(null);
               });

               kakao.maps.event.addListener(polygon,'click', function(mouseEvent) {
                   if (!isClick){
                  isClick = true;
                   }
                              addr = name;
                              var content = '<div id="customOverlay">'
                                    + '<div id="titleText">'
                                    + name
                                    + '</div>'
                                    + '<ul id="customList">'
                                    + '<li class="customListItem"><button class="customButton" onclick="detail_map()">지역상세보기</button></li>'
                                    + '<li class="customListItem"><form action="notice_Board.do"><button class="customButton" name="loc" value="' + name + '">지역게시판</button></form></li>'
                                    + '<li class="customListItem"><form action=""><button class="customButton">지역채팅</button></form></li>'
                                    + '</ul>' + '</div>';
                              customOverlay.setContent(content);
                              customOverlay.setPosition(mouseEvent.latLng);
                              customOverlay.setMap(map);
                           });
            }

            function detail_map() {
               //console.log('1. name : ',name);
               getData();
               map.setLevel(2, {
                  anchor : zoomin_map(),
                  animate : true
               });

               for (var i = 0; i < polygons.length; i++) {
                  polygons[i].setMap(null);
               }
               customOverlay.setMap(null);
               polygons = [];


               // 마커를 담을 배열입니다
               var markers = [];
               // 장소 검색 객체를 생성합니다
               var ps = new kakao.maps.services.Places();
               // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({
                  zIndex : 1
               });
               // 키워드로 장소를 검색합니다
               searchPlaces();

            }

            function zoomin_map() {
               if (addr == "하당동") {
                  return new kakao.maps.LatLng(34.808948346503676,
                        126.42033035076065);
               } else if (addr = "옥암동") {
                  return new kakao.maps.LatLng(34.81032236853858,
                        126.42877975042865);
               }
            }

            // 키워드 검색을 요청하는 함수입니다
            function searchPlaces() {

               var keyword = document.getElementById('keyword').value;

               if (!keyword.replace(/^\s+|\s+$/g, '')) {
                  //alert('키워드를 입력해주세요!');
                  return false;
               }

               // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
               ps.keywordSearch(keyword, placesSearchCB);
            }

            // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
               if (status === kakao.maps.services.Status.OK) {

                  // 정상적으로 검색이 완료됐으면
                  // 검색 목록과 마커를 표출합니다
                  displayPlaces(data);

                  // 페이지 번호를 표출합니다
                  displayPagination(pagination);

               } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                  alert('검색 결과가 존재하지 않습니다.');
                  return;

               } else if (status === kakao.maps.services.Status.ERROR) {

                  alert('검색 결과 중 오류가 발생했습니다.');
                  return;

               }
            }

            // 검색 결과 목록과 마커를 표출하는 함수입니다
            function displayPlaces(places) {

               var listEl = document.getElementById('placesList'), menuEl = document
                     .getElementById('menu_wrap'), fragment = document
                     .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

               // 검색 결과 목록에 추가된 항목들을 제거합니다
               removeAllChildNods(listEl);

               // 지도에 표시되고 있는 마커를 제거합니다
               removeMarker();

               for (var i = 0; i < places.length; i++) {

                  // 마커를 생성하고 지도에 표시합니다
                  var placePosition = new kakao.maps.LatLng(places[i].y,
                        places[i].x), marker = addMarker(placePosition,
                        i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                  // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                  // LatLngBounds 객체에 좌표를 추가합니다
                  bounds.extend(placePosition);

                  // 마커와 검색결과 항목에 mouseover 했을때
                  // 해당 장소에 인포윈도우에 장소명을 표시합니다
                  // mouseout 했을 때는 인포윈도우를 닫습니다
                  (function(marker, title) {
                     kakao.maps.event.addListener(marker, 'mouseover',
                           function() {
                              displayInfowindow(marker, title);
                           });

                     kakao.maps.event.addListener(marker, 'mouseout',
                           function() {
                              infowindow.close();
                           });

                     itemEl.onmouseover = function() {
                        displayInfowindow(marker, title);
                     };

                     itemEl.onmouseout = function() {
                        infowindow.close();
                     };
                  })(marker, places[i].place_name);

                  fragment.appendChild(itemEl);
               }

               // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
               listEl.appendChild(fragment);
               menuEl.scrollTop = 0;

               // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
               map.setBounds(bounds);
            }

            // 검색결과 항목을 Element로 반환하는 함수입니다
            function getListItem(index, places) {

               var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
                     + (index + 1)
                     + '"></span>'
                     + '<div class="info">'
                     + '   <h5>' + places.place_name + '</h5>';

               if (places.road_address_name) {
                  itemStr += '    <span>' + places.road_address_name
                        + '</span>' + '   <span class="jibun gray">'
                        + places.address_name + '</span>';
               } else {
                  itemStr += '    <span>' + places.address_name
                        + '</span>';
               }

               itemStr += '  <span class="tel">' + places.phone
                     + '</span>' + '</div>';

               el.innerHTML = itemStr;
               el.className = 'item';

               return el;
            }

            // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
            function addMarker(position, idx, title) {
               var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
               imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
               imgOptions = {
                  spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                  spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                  offset : new kakao.maps.Point(13, 37)
               // 마커 좌표에 일치시킬 이미지 내에서의 좌표
               }, markerImage = new kakao.maps.MarkerImage(imageSrc,
                     imageSize, imgOptions), marker = new kakao.maps.Marker(
                     {
                        position : position, // 마커의 위치
                        image : markerImage
                     });

               marker.setMap(map); // 지도 위에 마커를 표출합니다
               markers.push(marker); // 배열에 생성된 마커를 추가합니다

               return marker;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
               for (var i = 0; i < markers.length; i++) {
                  markers[i].setMap(null);
               }
               markers = [];
            }

            // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
            function displayPagination(pagination) {
               var paginationEl = document.getElementById('pagination'), fragment = document
                     .createDocumentFragment(), i;

               // 기존에 추가된 페이지번호를 삭제합니다
               while (paginationEl.hasChildNodes()) {
                  paginationEl.removeChild(paginationEl.lastChild);
               }

               for (i = 1; i <= pagination.last; i++) {
                  var el = document.createElement('a');
                  el.href = "#";
                  el.innerHTML = i;

                  if (i === pagination.current) {
                     el.className = 'on';
                  } else {
                     el.onclick = (function(i) {
                        return function() {
                           pagination.gotoPage(i);
                        }
                     })(i);
                  }

                  fragment.appendChild(el);
               }
               paginationEl.appendChild(fragment);
            }

            // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
            // 인포윈도우에 장소명을 표시합니다
            function displayInfowindow(marker, title) {
               var content = '<div style="padding:5px;z-index:1;">'
                     + title + '</div>';

               infowindow.setContent(content);
               infowindow.open(map, marker);
            }

            // 검색결과 목록의 자식 Element를 제거하는 함수입니다
            function removeAllChildNods(el) {
               while (el.hasChildNodes()) {
                  el.removeChild(el.lastChild);
               }
            }
            
            function getData2() { // 검색데이터 가져오기
            	var searchValue = $('#keyword').val();
            	var keyword = document.getElementById('keyword').value;
            	console.log("test : ",searchValue)
            	console.log("test2 : ",keyword)
            	
            	$.ajax({
           	 		url : 'http://localhost:8083/GitTest1/getApartSearch.do?name='+ searchValue,
                contentType : 'text/plain; charset=UTF-8', // Specify UTF-8
                data: { name: searchValue },
                success : function(result) {
                    var itemList = result.split(';');
                    
                    console.log('List from server:', itemList);
                    for (let i = 0; i < itemList.length - 1; i += 3) {
                        let j = i + 1;
                        console.log("j : ", itemList[j]);
                    	var geocoder = new kakao.maps.services.Geocoder();
                        
                        geocoder.addressSearch(itemList[i],function(result, status) {

                                       
                                       if (status === kakao.maps.services.Status.OK) {

                                          var coords = new kakao.maps.LatLng(
                                                result[0].y,
                                                result[0].x);

                                          var marker = new kakao.maps.Marker({
                                                   map : map,
                                                   position : coords
                                          });
                                       }
                         })
                    }},

	               	error : function() {
	                   
                    }
            	})

            } 

            
          							
          							
          							
			function getData() {
               $.ajax({
                        /* url : 'http://localhost:8083/GitTest2/GetApartinfoService?name='+addr, */
                        url : 'http://localhost:8083/GitTest1/getApart.do?name='
                              + addr,
                        contentType : 'text/plain; charset=UTF-8', // Specify UTF-8
                        success : function(result) {
                           var itemList = result.split(';');
                           //itemList.remove(4);
                           console.log('List from server:', itemList);

                           for (let i = 0; i < itemList.length - 1; i += 2) {
                              let j = i + 1;
                              console.log("j : ", itemList[j]);
                              var geocoder = new kakao.maps.services.Geocoder();

                              // 주소로 좌표를 검색
                              geocoder
                                    .addressSearch(
                                          itemList[i],
                                          function(result, status) {

                                             // 정상적으로 검색
                                             if (status === kakao.maps.services.Status.OK) {

                                                var coords = new kakao.maps.LatLng(
                                                      result[0].y,
                                                      result[0].x);

                                                // 결과값으로 받은 위치를 마커로 표시
                                                var marker = new kakao.maps.Marker(
                                                      {
                                                         map : map,
                                                         position : coords
                                                      });

                                                let content = document.createElement('div');
                                                content.className = 'overlay';
                                                content.innerHTML = '<div id="test" style="width:150px;text-align:center;padding:6px 0;">'
                                                      + itemList[j]
                                                      + '</div>';

                                                kakao.maps.event.addListener(marker,'click',function() {

                                                               let CustomOverlay2 = new kakao.maps.CustomOverlay(
                                                                     {
                                                                        map : map,
                                                                        position : coords,
                                                                        content : content
                                                                     });
                                                            });

                                             }
                                          })
                           }

                        },
                        error : function() {

                        }
                     })

            }
            function change_LatLng(itemList) {
               var geocoder = new kakao.maps.services.Geocoder();

               // 주소로 좌표를 검색합니다
               geocoder.addressSearch(
                           itemList,
                           function(result, status) {

                              // 정상적으로 검색이 완료됐으면 
                              if (status === kakao.maps.services.Status.OK) {

                                 var coords = new kakao.maps.LatLng(
                                       result[0].y, result[0].x);

                                 // 결과값으로 받은 위치를 마커로 표시합니다
                                 var marker = new kakao.maps.Marker(
                                       {
                                          map : map,
                                          position : coords
                                       });

                                 // 인포윈도우로 장소에 대한 설명을 표시합니다
                                 var infowindow = new kakao.maps.InfoWindow(
                                       {
                                          content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                                       });
                                 infowindow.open(map, marker);

                              }
                           })
            }
         </script>

      </div>

      
   </main>

   <footer class="campland-N2" data-bid="akLQ6d2RkW">
      <div class="footer-container container-lg">
         <div class="footer-top">
            <h1 class="footer-logo">
               <a href="javascript:void(0)"> <img
                  src="../resources/images/img_logo_white.png" alt="로고">
               </a>
            </h1>
            <ul class="footer-menulist">
               <li class="footer-menuitem"><a href="javascript:void(0)">
                     <span>이용약관</span>
               </a></li>
               <li class="footer-menuitem"><a href="javascript:void(0)">
                     <span>개인정보처리방침</span>
               </a></li>
               <li class="footer-menuitem"><a href="javascript:void(0)">
                     <span>푸터메뉴1</span>
               </a></li>
               <li class="footer-menuitem"><a href="javascript:void(0)">
                     <span>푸터메뉴2</span>
               </a></li>
            </ul>
            <ul class="footer-snslist">
               <li class="footer-snsitem"><a class="footer-snslink"
                  href="javascript:void(0)"> <img
                     src="../resources/icons/ico_instagram_lightgrey.svg" alt="인스타그램">
               </a></li>
               <li class="footer-snsitem"><a class="footer-snslink"
                  href="javascript:void(0)"> <img
                     src="../resources/icons/ico_youtube_lightgrey.svg" alt="유튜브">
               </a></li>
               <li class="footer-snsitem"><a class="footer-snslink"
                  href="javascript:void(0)"> <img
                     src="../resources/icons/ico_facebook_lightgrey.svg" alt="페이스북">
               </a></li>
               <li class="footer-snsitem"><a class="footer-snslink"
                  href="javascript:void(0)"> <img
                     src="../resources/icons/ico_kakao_lightgrey.svg" alt="카카오톡">
               </a></li>
            </ul>
         </div>
         <div class="footer-bottom">
            <h2 class="footer-logo">
               <a href="javascript:void(0)"> <img
                  src="../resources/images/img_logo_white.png" alt="로고">
               </a>
            </h2>
            <div class="footer-txt">
               <p>서울시 영등포구 선유로70 우리벤처타운2 705호</p>
               <p>
                  <span>T. 070-8872-8874</span> <span>E. help@openfield.co.kr</span>
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