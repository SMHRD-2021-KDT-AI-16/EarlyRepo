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
						<a class="header-gnblink" href="AllgetBoardService.do">
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
				</div>
			</div>
		</div>
	</header>
	
	<main class="th-layout-main ">
		
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
		<div class="myButton">
			<button id = "cmt_int" onclick="loginCheck()" type="button">게시글 작성</button>
		</div>
		<table id="table_content">
		</table>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script>
		let list = <%= list %>
				
		$(document).ready(function() {

  			loadMoreData();			
  		});
    		
  		$(document).scroll(function () {
    		var documentHeight = $(document).height();
    		var scrollPosition = $(window).height() + $(window).scrollTop();

    		if (scrollPosition / documentHeight > 0.9) {
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
        			
        			const div3 = document.createElement('div'); // 위에 2개
        			div2.className = 'bottom';

        			const userid = document.createElement('div');
        			userid.className = 'userid';
        			userid.innerText = "작성자 : "+temp[8].split(':')[1].replace('"',"").replace('"',"")+"("+temp[6].split(':')[1].replace('"',"").replace('"',"")+")"; // 작성자 id
        			
        			const date = document.createElement('div');
        			date.className = 'date';
        			date.innerText = "작성일자 : "+temp[3].split(':')[1].split(' ')[0].replace('"',""); // 날짜
        			
        			const loc = document.createElement('div');
        			loc.className = "loc";
        			loc.innerText = "지역 : "+temp[7].split(':')[1].replace('"',"").replace('"',""); // 지역

        			const content = document.createElement('div');
        			content.className = 'content';
        			content.innerText = temp[1].split(':')[1].replace('"',"").replace('"',""); // 내용

        			const img = document.createElement('img');
        			img.className = 'content_img';
        			const img_src = "../uploadimg/"+((temp[2].split(':')[1]).replace('"','').replace('"',''));
        			//console.log(img_src)
        			img.src = img_src; // 이미지
        			img.onerror = function() {
        			    this.src = '../resources/images/img_logo.png';
        			};
        			
        			const likes = document.createElement('div');
        			likes.className = 'likes';
        			likes.innerText = +temp[5].split(':')[1]; // 좋아요

        			const likes_btn = document.createElement('button');
        			likes_btn.value = temp[0].split(':')[1];
        			likes_btn.className = "likes_btn";
        			likes_btn.name = "f_seq";
        			//likes_btn.innerText = "좋아요";
        			
        			const btn_img = document.createElement('img');
        			btn_img.src = '../resources/images/하트.png';
        			
        			
        			
        			const comment_btn = document.createElement('button');
        			comment_btn.value = temp[0].split(':')[1];
        			comment_btn.className = "comment_btn";
        			comment_btn.name = "f_seq";
        			comment_btn.innerText = "댓글";
        			
        			const comment_close_btn = document.createElement('button');
        			comment_close_btn.className = "comment_close";
        			comment_close_btn.innerText = "댓글창닫기";
        			
        			const cmt_div = document.createElement('div');
        			cmt_div.className="cmt_div";
        			
        			// 댓글 닫기버튼
        			comment_close_btn.addEventListener('click', function(){
        				cmt_div.innerHTML = '';
        			})
        			
        			// 댓글 버튼
        			comment_btn.addEventListener('click', function() {
        				//comment_btn.className = "comment_btn_open";
        				//comment_btn.innerText="댓글닫기";
        				$.ajax({
        					url: 'http://localhost:8083/GitTest1/getComment.do?f_seq='+likes_btn.value,
        					
        					success: function (result) {
        						let comment = result.split(";");
        						//console.log("comment",comment.length)
        			  			
        						for (let e = 0; e < comment.length-1; e+=3){
        							const full_comment = document.createElement('div');
        							
        							const up_comment = document.createElement('div');
        							
        							const comment_userid = document.createElement('span');
        							comment_userid.innerText = comment[e];
        							
        							const comment_created = document.createElement('span');
        							comment_created.innerText = comment[e+1];
        							
        							const comment_comment = document.createElement('div');
        							comment_comment.innerText = comment[e+2];
        							
        							up_comment.appendChild(comment_userid);
        							up_comment.appendChild(comment_created);
        							
        							full_comment.appendChild(up_comment);
        							full_comment.appendChild(comment_comment);
        							
        							cmt_div.appendChild(full_comment);
        						}
        						
        					},
        					error: function(){
        				
        					}
        	  		    });
        				
        				
        				
            			const comment = document.createElement('textArea');
            			comment.name = "comment_text";
            			comment.className = "comment_text";
            			comment.maxLength = 50;
            			comment.placeholder = "최대 50자입니다."
            			
            			
            			const insert_cmt_btn = document.createElement('button');
            			insert_cmt_btn.name = "cmt_btn";
            			insert_cmt_btn.innerText = "댓글작성";
            			
            			cmt_div.appendChild(comment);
            			cmt_div.appendChild(insert_cmt_btn);
            			
            			// 댓글작성 버튼 이벤트
            			insert_cmt_btn.addEventListener('click', function() {
            				$.ajax({
            					url: 'http://localhost:8083/GitTest1/logincheck.do',
            					
            					success: function (result) {
            						console.log("결과 : ",result);
            						if (result === 'success') {
            							insert_comment(comment.value, likes_btn.value);
            			  			}else{
            			  				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
            			  				window.location.href = "login.jsp";
            			  			}
            					},
            					error: function(){
            				
            					}
            	  		    });        				
            			});
        			});
        			
        			likes_btn.addEventListener('click', function() {
            			// 클릭된 버튼의 value 값을 콘솔에 출력
            			console.log('클릭된 버튼의 value:', likes_btn.value, likes.innerText);
            			likes_up(likes_btn.value, likes.innerText);
            			let likesup = parseInt(likes.innerText)+1;
            			likes.innerText = likesup;
        			});
        			
        			div2.appendChild(userid);
        			div2.appendChild(date); 
        			div2.appendChild(loc);
        			// 위에꺼 2개 넣고
        			
        			div1.appendChild(div2);
        			
        			div1.appendChild(content);
        			div1.appendChild(img);
        			
        			likes_btn.appendChild(btn_img);
        			
        			div3.appendChild(comment_btn);
        			div3.appendChild(comment_close_btn);
        			div3.appendChild(likes_btn)
        			div3.appendChild(likes);
        			// 좋아요 버튼, 좋아요 하단에 묶고
        			
        			div1.appendChild(div3);
        			div1.appendChild(cmt_div);
        			
        			td.appendChild(div1); 
        			tr.appendChild(td); // tr에 전체 보드 넣고

        			document.getElementById('table_content').appendChild(tr);
      			}
      			cnt += 10;
    		} else {
      			for (let b = cnt; b < list.length; b++) {
      				cnt += list.length;
      				temp = list[b].replace("{","").replace("}","").split(',');  //한줄에서 뭉탱이씩 짤라서 넣어줄꺼야
      				// console.log("test : ",list)
      				const tr = document.createElement('tr');
      				const td = document.createElement('td');
        			const div1 = document.createElement('div'); // 전체div
        			div1.className = 'noticeBoard';
        			
        			const div2 = document.createElement('div'); // 위에 2개
        			div2.className = 'up';
        			
        			const div3 = document.createElement('div'); // 위에 2개
        			div2.className = 'bottom';

        			const userid = document.createElement('div');
        			userid.className = 'userid';
        			userid.innerText = "작성자 : "+temp[8].split(':')[1].replace('"',"").replace('"',"")+"("+temp[6].split(':')[1].replace('"',"").replace('"',"")+")"; // 작성자 id
        			
        			const date = document.createElement('div');
        			date.className = 'date';
        			date.innerText = "작성일자 : "+temp[3].split(':')[1].split(' ')[0].replace('"',""); // 날짜
        			
        			const loc = document.createElement('div');
        			loc.className = "loc";
        			loc.innerText = "지역 : "+temp[7].split(':')[1].replace('"',"").replace('"',""); // 지역

        			const content = document.createElement('div');
        			content.className = 'content';
        			content.innerText = temp[1].split(':')[1].replace('"',"").replace('"',""); // 내용

        			const img = document.createElement('img');
        			img.className = 'content_img';
        			const img_src = "../uploadimg/"+((temp[2].split(':')[1]).replace('"','').replace('"',''));
        			//console.log(img_src)
        			img.src = img_src; // 이미지
        			img.onerror = function() {
        			    this.src = '../resources/images/img_logo.png';
        			};
        			
        			// 좋아요 수
        			const likes = document.createElement('div');
        			likes.className = 'likes';
        			likes.innerText = +temp[5].split(':')[1];

        			// 좋아요 버튼
        			const likes_btn = document.createElement('button');
        			likes_btn.value = temp[0].split(':')[1];
        			likes_btn.className = "likes_btn";
        			likes_btn.name = "f_seq";
        			likes_btn.innerText = "좋아요";
        			
        			
        			const comment_btn = document.createElement('button');
        			comment_btn.className = "comment_btn";
        			comment_btn.name = "f_seq";
        			comment_btn.innerText = "댓글";
        			
        			const cmt_div = document.createElement('div');
        			cmt_div.className="cmt_div";
        			
        			// 댓글 버튼
        			comment_btn.addEventListener('click', function() {
        				$.ajax({
        					url: 'http://localhost:8083/GitTest1/getComment.do?f_seq='+likes_btn.value,
        					
        					success: function (result) {
        						let comment = result.split(";");
        						console.log("comment",comment.length)
        			  			
        						for (let e = 0; e < comment.length-1; e+=3){
        							const full_comment = document.createElement('div');
        							
        							const up_comment = document.createElement('div');
        							
        							const comment_userid = document.createElement('span');
        							comment_userid.innerText = comment[e];
        							
        							const comment_created = document.createElement('span');
        							comment_created.innerText = comment[e+1];
        							
        							const comment_comment = document.createElement('div');
        							comment_comment.innerText = comment[e+2];
        							
        							up_comment.appendChild(comment_userid);
        							up_comment.appendChild(comment_created);
        							
        							full_comment.appendChild(up_comment);
        							full_comment.appendChild(comment_comment);
        							
        							var cmt_div2 = this.nextElementSibling;
        							cmt_div2.appendChild(full_comment);
        						}
        						
        					},
        					error: function(){
        				
        					}
        	  		    });
        				
        				
            			const comment = document.createElement('textArea');
            			comment.name = "comment_text";
            			comment.className = "comment_text";
            			comment.maxLength = 50;
            			comment.placeholder = "최대 50자입니다."
            			
            			
            			const insert_cmt_btn = document.createElement('button');
            			insert_cmt_btn.name = "cmt_btn";
            			insert_cmt_btn.innerText = "댓글작성";
            			
            			cmt_div.appendChild(comment);
            			cmt_div.appendChild(insert_cmt_btn);
            			
            			// 댓글작성 버튼 이벤트
            			insert_cmt_btn.addEventListener('click', function() {
            				$.ajax({
            					url: 'http://localhost:8083/GitTest1/logincheck.do',
            					
            					success: function (result) {
            						console.log("결과 : ",result);
            						if (result === 'success') {
            							insert_comment(comment.value, likes_btn.value);
            			  			}else{
            			  				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
            			  				window.location.href = "login.jsp";
            			  			}
            					},
            					error: function(){
            				
            					}
            	  		    });        				
            			});
        			});
        			
        			likes_btn.addEventListener('click', function() {
            			// 클릭된 버튼의 value 값을 콘솔에 출력
            			console.log('클릭된 버튼의 value:', likes_btn.value, likes.innerText);
            			likes_up(likes_btn.value, likes.innerText);
            			let likesup = parseInt(likes.innerText)+1;
            			likes.innerText = likesup;
        			});
        			
        			div2.appendChild(userid);
        			div2.appendChild(date); 
        			div2.appendChild(loc);
        			// 위에꺼 2개 넣고
        			
        			div1.appendChild(div2);
        			
        			div1.appendChild(content);
        			div1.appendChild(img);
        			
        			div3.appendChild(comment_btn);
        			div3.appendChild(likes_btn)
        			div3.appendChild(likes);
        			// 좋아요 버튼, 좋아요 하단에 묶고
        			
        			div1.appendChild(div3);
        			div1.appendChild(cmt_div);
        			
        			td.appendChild(div1); 
        			tr.appendChild(td); // tr에 전체 보드 넣고

        			document.getElementById('table_content').appendChild(tr);
      			}
      			
    		}
  		}
  		
  		/* window.onload = function () {
  			var commentBtn_opens = document.getElementsByClassName('comment_btn_open');
  			for (var i = 0; i < commentBtn_opens.length; i++) {
  				commentBtn_opens.addEventListener('click', function() {
  					console.log("testtest")
  		    		this.innerHTML = '';
  					this.className = "comment_btn";
					this.innerText="댓글";
  				});
  			}
  		} */
  		
  		/* window.onload = function () {
  		    var commentBtns = document.getElementsByClassName('comment_btn');
  		    for (var i = 0; i < commentBtns.length; i++) {
  		        commentBtns[i].addEventListener('click', function () {
  		            var clickedBtn = this;
  		            var clickedBtnValue = this.value;

  		            // 'comment_btn_open' 클래스 추가 및 텍스트 변경
  		            clickedBtn.classList.add("comment_btn_open");
  		            clickedBtn.innerText = "댓글닫기";

  		            // 댓글을 추가할 부모의 형제로부터 cmt_div 찾기
  		            var siblingCmtDiv = clickedBtn.parentNode.nextElementSibling;

if (!siblingCmtDiv || !siblingCmtDiv.classList.contains('cmt_div')) {
    // 부모의 형제 cmt_div가 없다면 새로 생성하여 추가
    siblingCmtDiv = document.createElement('div');
    siblingCmtDiv.className = 'cmt_div';
    clickedBtn.parentNode.parentNode.appendChild(siblingCmtDiv);
}

  		            $.ajax({
  		                url: 'http://localhost:8083/GitTest1/getComment.do?f_seq=' + clickedBtnValue,
  		                success: function (result) {
  		                    let comment = result.split(";");
  		                    console.log("comment", comment.length);

  		                    for (let e = 0; e < comment.length - 1; e += 3) {
  		                        const full_comment = document.createElement('div');

  		                        const up_comment = document.createElement('div');

  		                        const comment_userid = document.createElement('span');
  		                        comment_userid.innerText = comment[e];

  		                        const comment_created = document.createElement('span');
  		                        comment_created.innerText = comment[e + 1];

  		                        const comment_comment = document.createElement('div');
  		                        comment_comment.innerText = comment[e + 2];

  		                        up_comment.appendChild(comment_userid);
  		                        up_comment.appendChild(comment_created);

  		                        full_comment.appendChild(up_comment);
  		                        full_comment.appendChild(comment_comment);

  		                        // full_comment를 부모의 형제인 cmt_div에 추가
  		                      parentSibling.parentNode.appendChild(siblingCmtDiv);
  		                    siblingCmtDiv.appendChild(full_comment);
  		                    }

  		                    // 댓글 입력 폼 생성 및 이벤트 추가
  		                    var commentDiv = document.createElement('div');
  		                    commentDiv.className = 'cmt_div';

  		                    const comment_content = document.createElement('textarea');
  		                  	comment_content.name = "comment_text";
  		                	comment_content.className = "comment_text";
  		              		comment_content.maxLength = 50;
  		            		comment_content.placeholder = "최대 50자입니다.";

  		                    const insertCmtBtn = document.createElement('button');
  		                    insertCmtBtn.name = "cmt_btn";
  		                    insertCmtBtn.innerText = "댓글작성";

  		                    commentDiv.appendChild(comment);
  		                    commentDiv.appendChild(insertCmtBtn);

  		                    // 댓글작성 버튼 이벤트
  		                    insertCmtBtn.addEventListener('click', function () {
  		                        $.ajax({
  		                            url: 'http://localhost:8083/GitTest1/logincheck.do',
  		                            success: function (result) {
  		                                console.log("결과 : ", result);
  		                                if (result === 'success') {
  		                                    insert_comment(comment.value, clickedBtnValue);
  		                                } else {
  		                                    alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
  		                                    window.location.href = "login.jsp";
  		                                }
  		                            },
  		                            error: function () {
  		                                console.error("Error in AJAX request");
  		                            }
  		                        });
  		                    });

  		                    // 부모의 형제에 댓글 입력 폼 추가
  		                    clickedBtn.parentNode.parentNode.appendChild(commentDiv);
  		                },
  		                error: function () {
  		                    console.error("Error in AJAX request");
  		                }
  		            });
  		        });
  		    }
  		};
 */
  		
  		
  		
  		function likes_up(value, likes){
  			//console.log("test : ",value, likes);
  		    $.ajax({
				url: 'http://localhost:8083/GitTest1/likes_up.do?f_seq='+value+'&f_likes='+likes,
							
				success: function (result) {
						
				},
				error: function(){
			
				}
  		    });
  		}
  		function insert_comment(comment, num){
  			$.ajax({
				url: 'http://localhost:8083/GitTest1/insertComment.do?cmt_content='+comment+'&f_seq='+num,
							
				success: function (result) {
					
				},
				error: function(){
				
				}
  		    });
  		}

  		function loginCheck(){
  			$.ajax({
				url: 'http://localhost:8083/GitTest1/logincheck.do',
				
				success: function (result) {
					console.log("결과 : ",result);
					if (result === 'success') {
		  				window.location.href = "Write.jsp";
		  			}else{
		  				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
		  				window.location.href = "login.jsp";
		  			}
				},
				error: function(){
			
				}
  		    });
  			
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