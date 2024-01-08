<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.early.model.LoanNameVO"%>
<%@page import="java.util.List"%>
<%@page import="com.early.model.LoanVO"%>
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
	height: 10hv;
}

.container img {
	max-width: 8%;
	max-height: 8%;
}

.color-change {
	text-align: center;
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

table {
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
result_loan{
	text-align: center;
}
.campland-N25 .contents-confirm {
	margin-top: 50px;
	margin-bottom: 3rem;
}
.select_loan{
	font-size: x-large;
}
	</style>
</head>

<body>
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
                              <a href="Mypage.jsp"><img src="../resources/icons/ico_profile_black.png" ></a>
                           </c:if>
                           <c:if test="${member.user_id!='admin' }">
                              <a href="http://localhost:8083/GitTest1/Logout.do"><img src="../resources/icons/LOGOUT.png" ></a>
                           </c:if>
                           <c:if test="${member.user_id=='admin' }">
                              <a href="SelectAll.do">회원관리</a>
                           </c:if>   
                     </c:if>
	</header>
	<main class="th-layout-main ">
		<div class="campland-N25" data-bid="EJlQ6DHEUz" id="">
			<div class="contents-inner">
				<div class="contents-container">
					<div class="textset textset-sub textset-center">
						<h2 class="textset-tit">판단 결과​<br></h2>
						<h4>당신이 대출받을 수 있는 금액은... </h4>
					</div>	
					<form id="result_loan" action="Result.do" method="post">			
     				<div class="container">
     					<img src="../resources/icons/check-icon.png" alt="체크마크">
     				</div>
     				<% HttpSession sessions = request.getSession();
     				List<LoanNameVO> vo = (List<LoanNameVO>)sessions.getAttribute("loanVOs"); 
     				int loan_money = (int) session.getAttribute("loan_money");
     				if(vo.size() ==1){ %>
     				<p class="text_result"><span class="color-change">${loanVOs.get(0).getLOAN_NAME() }</span>상품을 이용하시면</p>
					<p class="text_result">최대&nbsp;<span class="color-change"> ${loanVOs.get(0).getLOAN_LIMIT() }만원&nbsp; </span> 이고,</p>      <!-- profile에서 판단한 대출 금액으로 바꾸기 -->
					<p class="text_result">본인의 자산과 합한 금액은 최대&nbsp;<span class="color-change">${loanVOs.get(0).getLOAN_LIMIT()+loan_money}만원&nbsp; </span> 입니다.</p>
					<input class="select_loan" type="radio" name="loan_select" value="${loanVOs.get(0).getLOAN_LIMIT()+loan_money}"> <span class="select_loan" >${loanVOs.get(0).getLOAN_NAME()}</span>
					<br>
     				<%} else if(vo.size()==2){ %>
     					<p class="text_result"><span class="color-change">${loanVOs.get(0).getLOAN_NAME()}, ${loanVOs.get(1).getLOAN_NAME() }</span>상품을 이용하시면</p>     <!-- 대출상품이름 적용하기 -->
    					<p class="text_result">각각 최대&nbsp;<span class="color-change"> ${loanVOs.get(0).getLOAN_LIMIT()}만원, ${loanVOs.get(1).getLOAN_LIMIT()}만원&nbsp; </span> 이고</p>
    					<p class="text_result">본인의 자산과 합한 금액은 최대&nbsp;<span class="color-change"> ${loanVOs.get(0).getLOAN_LIMIT()+loan_money}만원 , ${loanVOs.get(1).getLOAN_LIMIT()+loan_money}만원&nbsp; </span> 입니다.</p>
    					<input type="radio" name="loan_select" value="${loanVOs.get(0).getLOAN_LIMIT()+loan_money}"> <span class="select_loan" >${loanVOs.get(0).getLOAN_NAME()}</span>
    					<br>
    					<input type="radio" name="loan_select" value="${loanVOs.get(1).getLOAN_LIMIT()+loan_money}"> <span class="select_loan" >${loanVOs.get(1).getLOAN_NAME()}</span>
    					<br>
     				<%} else if(vo.size()==0){%>
                    <input type="radio" name="loan_select" value="${loan_money}"><span class="select_loan" >받을 수 있는 대출이 없습니다.</span>
                    <%} %>
                    <br>
     				<span class="color-change">대출에 관한 금액은 세부적으로 상이할 수 있습니다.</span>
     				<div class="contents-confirm">
						<a href="Profile.jsp" class="btnset btnset-round">다시하기</a>
						<button type="button" class="btnset btnset-round" onclick="submitForm()">결과보기</button>
					</div>
					</form>
					<table>
						<thead>
							<tr>
								<th colspan="5">내 집 마련 디딤돌 대출 금리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>대출만기\연소득</th>
								<th>~ 2000</th>
								<th>2000 ~ 4000</th>
								<th>4000 ~ 7000</th>
								<th>8500 ~</th>
							</tr>
							<tr>
								<th>10</th>
								<td>2.45%</td>
								<td>2.80%</td>
								<td>3.05%</td>
								<td>3.30%</td>
							</tr>
							<tr>
								<th>15</th>
								<td>2.55%</td>
								<td>2.90%</td>
								<td>3.15%</td>
								<td>3.40%</td>
							</tr>
							<tr>
								<th>20</th>
								<td>2.65%</td>
								<td>3.00%</td>
								<td>3.25%</td>
								<td>3.50%</td>
							</tr>
							<tr>
								<th>30</th>
								<td>2.70%</td>
								<td>3.05%</td>
								<td>3.30%</td>
								<td>3.55%</td>
							</tr>							
						</tbody>
						<thead>
							<tr>
								<th colspan="5">신생아 특례대출 금리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>대출만기\연소득</th>
								<th>8500이하</th>
								<th>8500초과</th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<th>10</th>
								<td>1.60%</td>
								<td>2.70%</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>15</th>
								<td>1.90%</td>
								<td>2.90%</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>20</th>
								<td>2.30%</td>
								<td>3.10%</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>30</th>
								<td>2.70%</td>
								<td>3.30%</td>
								<td></td>
								<td></td>
							</tr>							
						</tbody>
						<thead>
							<tr>
								<th colspan="5">신혼부부전용 구입자금대출 금리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>대출만기\연소득</th>
								<th>~ 2000</th>
								<th>2000 ~ 4000</th>
								<th>4000 ~ 7000</th>
								<th>8500 ~</th>
							</tr>
							<tr>
								<th>10</th>
								<td>2.15%</td>
								<td>2.50%</td>
								<td>2.75%</td>
								<td>3.00%</td>
							</tr>
							<tr>
								<th>15</th>
								<td>2.25%</td>
								<td>2.60%</td>
								<td>2.85%</td>
								<td>3.10%</td>
							</tr>
							<tr>
								<th>20</th>
								<td>2.35%</td>
								<td>2.70%</td>
								<td>2.95%</td>
								<td>3.20%</td>
							</tr>
							<tr>
								<th>30</th>
								<td>2.40%</td>
								<td>2.75%</td>
								<td>3.00%</td>
								<td>3.25%</td>
							</tr>					
						</tbody>
						<thead>
							<tr>
								<th colspan="5">희망전용타운전용 주택담보장기대출 금리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>대출만기\연소득</th>
								<th>-</th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<th>20</th>
								<td>1.60%</td>
								<td colspan="3">특이사항</td>
							</tr>
							<tr>
								<th>30</th>
								<td>1.60%</td>
								<td colspan="3">LH희망전용타운 당첨</td>
							</tr>		
						</tbody>
					</table>
				</div>
			</div>
		</div>	
	</main>
	<script type="text/javascript">
	function submitForm() {
		
		var uncheckedRadios = [];

        
		if (!isChecked("loan_select")) {
				uncheckedRadios.push("대출");

				var errorMsg = uncheckedRadios.join(", ")+"을 선택해주세요: ";
				alert(errorMsg);
				return false; // 폼 전송을 막음
		} else {
			window.location.href = "다음페이지URL";

			// 폼을 제출하도록 허용
			document.querySelector('form').submit();
		}

	}
	function isChecked(name) {
	    // 라디오박스 체크 여부 확인
	    var radioBoxes = document.getElementsByName(name);
	    for (var i = 0; i < radioBoxes.length; i++) {
	        if (radioBoxes[i].checked) {
	            return true;
	        }
	    }
	    return false;
	}
	</script>
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
	<script src="../resources/js/setting.js"></script>
	<script src="../resources/js/plugin.js"></script>
	<script src="../resources/js/template.js"></script>
	<script src="../resources/js/common.js"></script>
	<script src="../resources/js/script.js"></script>
</body>
</html>