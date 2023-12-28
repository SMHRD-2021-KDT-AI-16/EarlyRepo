<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			width: 100px;
			height: 100px;
			background-color: antiquewhite;
		}

		.image-preview {
			width: 1300px;
			height: 200px;
			background-color:white;
			display: flex;
			gap: 20px;
		}
		.textset-tit{
			 color: white;			 
		}
	</style>
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
		<div class="campland-N8" data-bid="fGLQ6DNtyW">
			<div class="contents-container">
				<img class="contents-visual img-pc" src="../resources/images/img_subvisual_1.png" alt="서브 비주얼 PC 이미지">
				<img class="contents-visual img-mobile" src="../resources/images/img_subvisual_mobile_1.png"
					alt="서브 비주얼 모바일 이미지">
				<div class="contents-body container-md">
					<div class="textset textset-visual">
						<h2 class="textset-tit">게시글 작성</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]campland-N8 -->
		<!-- [S]campland-N17 -->
		<div class="campland-N17" data-bid="QolQ6dnTZH" id="">
			<div class="contents-inner">
				<div class="contents-container container-md">
					<div class="textset textset-sub">
						<h2 class="textset-tit">게시글 작성​<br></h2>
					</div>
					<!-- [E]campland-N17 -->
					<input type="file" class="real-upload" accept="image/*" required multiple>
					<div class="upload" >업로드할 이미지를 불러와주세요!</div>
					<ul class="image-preview" >불러온 이미지 목록</ul>
					<script>
						function getImageFiles(e) {
							const uploadFiles = [];
							const files = e.currentTarget.files;
							const imagePreview = document.querySelector('.image-preview');
							const docFrag = new DocumentFragment();

							if ([...files].length >= 7) {
								alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
								return;
							}

							// 파일 타입 검사
							[...files].forEach(file => {
								if (!file.type.match("image/.*")) {
									alert('이미지 파일만 업로드가 가능합니다.');
									return
								}

								// 파일 갯수 검사
								if ([...files].length < 7) {
									uploadFiles.push(file);
									const reader = new FileReader();
									reader.onload = (e) => {
										const preview = createElement(e, file);
										imagePreview.appendChild(preview);
									};
									reader.readAsDataURL(file);
								}
							});
						}

						function createElement(e, file) {
							const li = document.createElement('li');
							const img = document.createElement('img');
							img.setAttribute('src', e.target.result);
							img.setAttribute('data-file', file.name);
							li.appendChild(img);

							return li;
						}

						const realUpload = document.querySelector('.real-upload');
						const upload = document.querySelector('.upload');

						upload.addEventListener('click', () => realUpload.click());

						realUpload.addEventListener('change', getImageFiles);
					</script>
					<form action="">
						<table width="1300px">
							<tr bgcolor="gray" height="50px">
								<td align="left">
									<h1> 적고 싶은 말 </h1>
								</td>
							</tr>
							<tr>
								<td>
									<textarea name="board" cols="200" rows="15"></textarea>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" class="btnset btnset-round">
									<input type="reset" class="btnset btnset-round">
								</td>
							</tr>

						</table>
					</form>
	</main>
	<!-- [S]campland-N2 -->
	<footer class="campland-N2" data-bid="GjLQ6dNu06" id="">
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