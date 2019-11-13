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

<!-- 서머노트 -->
<!-- <link -->
<!-- 	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" -->
<!-- 	rel="stylesheet"> -->
<!-- <script -->
<!-- 	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script> -->
<!-- <script src="dist/lang/summernote-ko-KR.js"></script> -->


<jsp:include page="left_home.jsp" />
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $('#summernote').summernote({
    	  height : 400,
    	  placeholder: '사진을 첨부해주세요.',
  		toolbar: [
  		    ['insert', ['picture', 'hr']],
  		    ['view', ['fullscreen', 'codeview']],
  		    ['help', ['help']]
  		  ]
      });
   });
</script>

<style type="text/css">
	#PostsDto{
		margin-left:15%;
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

			<div
				class="card" style="width: 130%; height: 84.5rem;" id="home_card">
				<div class="input-group col-sm-3" style="float: right;">
					<input type="text" class="form-control" placeholder="검색"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
				<div>
					<a href="home.do"><img src="resources/image/homelogo.png"></a>
				</div>

				<div class="card example-1 scrollbar-deep-purple bordered-deep-purple thin" id="changing_div"
					style="height: 90%">
					<!--             <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div> -->

					<!--             <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div> -->
					<!-- 서머노트 -->
					<form:form action="postswrite.do" modelAttribute="PostsDto" method="post">
					
							<input type="hidden" name="username" value="${dto.username}"/>
							
						<table style="margin-top: 2em;">	
							
							<tr>
								<td></td>
								<td><textarea rows="10" cols="30" id="summernote"
										name="post_content" style="width: 650px; height: 350px;"
										placeholder="사진을첨부해주세요"></textarea></td>
							</tr>
							
							
							<tr height="80px">
								<td></td>
								<td><textarea class="form-control" rows="3" id="comment" name="postcomm" placeholder="게시글을 작성해주세요."></textarea></td>
							</tr>
							
							<tr height="80px">
								<td></td>
								<td><input type="text" name="hashtag" style="width: 675px" 
									placeholder="태그는 #으로 구분됩니다."class="form-control" id="usr"/></td>
							</tr>							
							

							
							
							<tr>
								<td colspan="2"><input type="button" value="cancle"
									class="btn pull-right" onclick="location.href='home.do'" /> <input
									type="submit" class="btn btn-default pull-right" value="write"
									style="margin-right: 1%;" /></td>
							</tr>
							
						</table>
					</form:form>

				</div>

			</div>
		</div>









		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link" href="posts.do" style="color: black;">게시글</a></li>
					<li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
					<li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>



	</div>


</body>
</html>