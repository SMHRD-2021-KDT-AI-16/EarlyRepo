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
	<title>회원정보 | 핵심프로젝트</title>
	<link rel="stylesheet" href="../resources/css/setting.css">
	<link rel="stylesheet" href="../resources/css/plugin.css">
	<link rel="stylesheet" href="../resources/css/template.css">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/style.css">
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
						<h2 class="textset-tit">자산정보​<br></h2>
						<h4>더 정확한 대출금액을 알려드립니다. </h4>
					</div>
					<ul class="contents-list">  <!-- 자산정보 입력창 시작 -->

						
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>집 사본적
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" align=left>
									<input type="radio" name="firstloan"  value="fisrtloan0"> 있어요    
									<input type="radio" name="firstloan"  value="firstloan1"> 없어요
								</div>
							</div>
						</li>
						
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span> 현재 집이
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round" >
									<input type="radio" name="now_home" value="now_home0"> 있어요
									<input type="radio" name="now_home" value="now_home1"> 없어요
								</div>
							</div>
						</li>
			
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>현재 대출이
							</h6>
							<div class="form-wrap">
								<div class="inputset inputset-round">
									<input type="radio" name="loan"  value="loan0"> 있어요
									<input type="radio" name="loan"  value="loan1"> 없어요
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
								<span></span>결혼기간
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="marriage" class="selectset-toggle btn" >
                  					  		<option value="marriageNo">미혼</option>
                						    <option value="marriage0">3개월이내 결혼예정</option>
                             				<option value="marriage6">7년미만</option>
                      					    <option value="marriage7">7년이상</option>
                      					    
             						 </select>
               					  </div>
               				</div>	  
						</li>

						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>신용등급<br>(모르시면 5등급)
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="grade" class="selectset-toggle btn" >
                						    <option value="grade1">1등급 (900~1000점)</option>
                             				<option value="grade2">2등급 (870~899점)</option>
                      					    <option value="grade3">3등급 (840~869점)</option>
                      					    <option value="grade4">4등급 (805~839점)</option>
                      					    <option value="grade5">5등급 (750~804점)</option>
                      					    <option value="grade6">6등급 (665~749점)</option>
                      					    <option value="grade7">6등급 이상</option>
             						 </select>
               					  </div>
               				</div>	  
						</li>		

						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>연 소득 <br>(부부합산)
							
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="income" class="selectset-toggle btn" >
											<option value="income1">2억원 이상</option>	                  					  
                						    <option value="income1">1억 ~ 1억5천만원</option>	                  					  
                						    <option value="income1">1억3천 ~ 1억5천만원</option>	                  					  
                						    <option value="income1">1억 ~ 1억3천만원</option>
                             				<option value="income2">8천 ~ 1억원</option>
                      					    <option value="income3">6천 ~ 8천만원</option>
                      					    <option value="income4">4천 ~ 6천만원</option>
                      					    <option value="income5">2천 ~ 4천만원</option>
                      					    <option value="income6">2천만원 이하</option>
                      					    
             						 </select>
               					  </div>
               				</div>	 	
						</li>
						<li class="contents-item">
							<h6 class="form-tit form-tit-deco">
								<span></span>주택 구매<br>여유 자금
							</h6>
							<div class="form-wrap">
								  <div class="selectset selectset-round selectset-md">
                  					  <select name="funds" class="selectset-toggle btn" >
                						    <option value="funds1">1억원 이상</option>
                             				<option value="funds2">8천 ~ 1억원</option>
                      					    <option value="funds3">6천 ~ 8천만원</option>
                      					    <option value="funds4">4천 ~ 6천만원</option>
                      					    <option value="funds5">2천 ~ 4천만원</option>
                      					    <option value="funds6">2천만원 이하</option>
                      					    
             						 </select>
               					  </div>
               				</div>	 	
							</div>
						</li>

																		
					</ul>
					
					<div class="contents-confirm">
						<a href="javascript:void(0);" class="btnset btnset-round btnset-line btnset-black">돌아가기</a>
						<a href="javascript:void(0);" class="btnset btnset-round">결과</a>
					</div>
				</div>
			</div>
		</div>
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