<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="http://localhost:8787/InsaWorld/src/main/webapp/WEB-INF/left_css/stylesheet.css"> -->

<!-- 지예 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<jsp:include page="../left_home.jsp" />
<script type="text/javascript">
	var sel_files = [];
	$(document).ready(function() {

		$("#file").on("change", handleImgsFilesSelect);
	});
	function handleImgsFilesSelect(e) {

		var files = e.target.files;

		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {

			if (!f.type.match("image.*")) {

				alert("이미지 파일만 가능합니다.");

				return;

			}

			sel_files.push(f);

			var reader = new FileReader();

			reader.onload = function(e) {

				var img_html = "<img src=\""+e.target.result+"\" />";

				$(".imgs_wrap").append(img_html);

			}

			reader.readAsDataURL(f);

		});

		$(document).on('click', '#search_btn', function() {
			//e.preventDefault();
			var url = "searchlist.do";
			url = url + "?keyword=" + $('#keyword').val();
			//alert(url);
			location.href = url;

		});

	}
</script>
<style type="text/css">
.error-title {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5%;
	color: gray;
	text-align: center;
	white-space: pre-line;
	cursor: default;
}

.grid-error-view {
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	font-family: SFNSText, Helvetica Neue, sans-serif;
}

/* Gray */
.default {
	border-color: #e7e7e7;
	color: black;
}

.default:hover {
	background: #e7e7e7;
}

.btn {
	border-radius: 5px;
}

.center {
	height: 200px;
	position: relative;
}

.center h5 {
	color: #2b4be9;
	margin: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.center input {
	margin: 0;
	position: absolute;
	top: 65%;
	left: 55%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
}
</style>

<style type="text/css">

/* navbar */
#changing_div {
	height: 90%;
	padding: 0;
}

.navbar {
	overflow: hidden;
	background-color: #333;
	position: fixed;
	width: 100%;
}

.navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.navbar a:hover {
	background: #ddd;
	color: black;
}

.main {
	padding: 16px;
	margin-top: 30px;
	height: 1500px; /* Used in this example to enable scrolling */
}

.error-title {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5%;
	color: gray;
	text-align: center;
	white-space: pre-line;
	cursor: default;
}

.grid-error-view {
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	font-family: SFNSText, Helvetica Neue, sans-serif;
}

.error-text {
	margin-top: 40px;
	margin-block-start: 40px;
	font-size: 17px;
	color: gray;
	text-align: center;
	white-space: pre-line;
	cursor: default;
}

.navigation-bar {
	/*     position: fixed; */
	inline-size: 100%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-align: stretch;
	-webkit-align-items: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
	border-bottom: 1px solid #e2e2e2;
	background-color: white;
	padding: 0.8%;
}
</style>


</head>
<body>
	<sec:authentication property="principal.username" var="username" />
	<sec:authentication property="principal.email" var="useremail" />
	<sec:authentication property="principal.gender" var="usergender" />
	<sec:authentication property="principal.nickname" var="usernickname" />
	<sec:authentication property="principal.birth" var="userbirth" />
	<sec:authentication property="principal.usermini" var="usermini" />
	<sec:authentication property="principal.bgm" var="userbgm" />
	<sec:authentication property="principal.status" var="userstatus" />

	<div class="culmn">
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1></h1>

			<div class="card" id="home_card">
				<div class="input-group col-sm-3" style="float: right;">
					<input type="text" class="form-control" placeholder="검색"
						name="keyword" id="keyword"> <span class="input-group-btn"
						id="search_btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
				<div>
					<a href="home.do"><img src="resources/image/homelogo.png"></a>
				</div>

				<div
					class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
					id="changing_div" style="height: 90%">

					<div class="navigation-bar">
						<div role="button" aria-disabled="false" title=""
							class="cw-has-left-icon cw-button" tabindex="0">
							<span class="title" onclick="location.href='cloud.do'">ICWorld
								Cloud로 가기</span>
						</div>
						<div class="files-grid-title-view text-center">
							<div class="title" role="heading" aria-level="2">
								<span class="">사진 업로드</span>
							</div>
							<div class="alternate-title" role="heading" aria-level="2">
							</div>
							<div class="subtitle" role="heading" aria-level="3">
								<span></span>
							</div>
						</div>

					</div>


					<!-- 서머노트 -->
					<div class="grid-error-view">
						<h3 class="error-title">이미지 미리보기</h3>
						<div class="imgs_wrap"></div>

						<form name="fileForm"
							action="cloudUpload.do?username=${username }" method="post"
							enctype="multipart/form-data">




							<div class="center">
								<h5>클라우드에 올릴 파일을 선택해주세요.</h5>
								<input multiple="multiple" type="file" name="file" id="file" />
							</div>
							<div class="text-center" style="margin-top: 7%;">
								<div class="col-xs-3 text-center" style="margin-left: 25%;">
									<input type="text" name="cloudcomm" class="form-control " />
								</div>
								<div class="col-xs-3 text-center">
									<input type="text" list="folder" name="cloudfolder"
										placeholder="폴더 선택" class="form-control">
								</div>


								<datalist id="folder">
									<c:forEach items="${folderdata }" var="dto">
										<!-- 전에 setattribute했던 것 -->
										<option value="${dto.cloudfolder }">
									</c:forEach>
								</datalist>

								<div class="text-center">
									<input type="submit" value="올리기" class="btn default"
										style="margin-right: 17%;" />
								</div>


							</div>
						</form>
					</div>

				</div>

			</div>
		</div>








		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
					<li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
					<li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
					<li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link" style="color: black;"
						href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>




	</div>


</body>
</html>