


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="resources/css/profile_form.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<jsp:include page="left_home.jsp" />

<script type="text/javascript">

$(document).on('click', '#search_btn', function(){
	//e.preventDefault();
	var url = "searchlist.do";
	url = url + "?keyword=" + $('#keyword').val();
	//alert(url);
	location.href = url;
	
});

</script>

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

		<div class="middlecolumn ">
			<h1></h1>

			<div class="card"
				style="width: 130%; height: 84.5rem; border: white;">
				<div class="input-group col-sm-3" style="float: right;">
					<input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword"> 
					<span class="input-group-btn" id="search_btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
				<div>
					<a href="home.do"><img src="resources/image/homelogo.png"></a>
				</div>


				<div class="card " id="changing_div" style="height: 90%">


					<div>

						<h3 class="text-center">내 정보 보기</h3>
						<div id="my_info">
							       <div class="col-xs-8 " style="margin-left:30%;">  
							        <div class="form-group col-xs-7">
							   <label>아이디</label>
							   <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${username}"/>
							</div>
							<div class="form-group col-xs-7">
							  <label>성별</label>
							  <input type="text" class="form-control" id="gender" name="gender" value="${usergender }"  readonly="readonly"/>
							</div>
							<div class="form-group col-xs-7">
							  <label>닉네임</label>
							  <input type="text" class="form-control" id="nick" name="nickname" value="${usernickname }" readonly="readonly"/>
							</div>
							<div class="form-group col-xs-7">
							  <label>이메일</label>
							  <input type="text" class="form-control" id="mail" name="mail" value="${useremail }" readonly="readonly" />
							</div>
							<div class="form-group col-xs-7">
							  <label>생년월일</label>
							  <input type="text" class="form-control" id="birth" name="birth" value="${userbirth }" readonly="readonly"/>
								</div>
							</div>




							<button type="button" class="btn btn-default"
								onclick="location.href='profile_home.do'">Edit</button>

						</div>

					</div>
<!--  -->
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
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link" href="profile.do" style="color: black;">프로필</a></li>
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>



	</div>





</body>
</html>
