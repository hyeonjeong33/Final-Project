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

<link rel="stylesheet" type="text/css" href="resources/css/posts.css">

<jsp:include page="left_home.jsp" />

<script type="text/javascript">

$(document).on('click', '#search_btn', function(){
	//e.preventDefault();
	var url = "searchlist.do";
	url = url + "?keyword=" + $('#keyword').val();
	//alert(url);
	location.href = url;
	
});
	
	function pop_details(bn){
        $('#myCenterModal').modal({
        	remote : 'post_detail.do?boardnum='+bn
        });
    }

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
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1></h1>

			<div class="card"
				style="width: 130%; height: 84.5rem;border: white;">
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
				
			<div class="card example-1 scrollbar-deep-purple bordered-deep-purple thin" id="changing_div"
					style="height: 90%">
					
				<c:choose>
						<c:when test="${empty list }">
							<h3>게시글이 없습니다..????.</h3>
						</c:when>
						<c:when test="${empty list2 }">
								<div>
									<h1>USERNAME : ${hash }</h1>
								</div>
								<div>
									<span>게시물</span> <span> ${count }</span>
								</div>					
							<c:forEach items="${list }" var="dto">
								<div class="posts">
									<div class="post_box">
										<%-- <p>boardnum : ${dto.boardnum}</p> --%>
										<a class="pop_detail" onclick="pop_details(${dto.boardnum });">${dto.post_thumbnail }</a>
										<br />
									</div>
								</div>
							</c:forEach>								
						</c:when>		
								
						<c:when test="${empty list1 }">
								<div>
									<h1># ${hash }</h1>
								</div>
								<div>
									<span>게시물</span> <span> ${count }</span>
								</div>	
							<c:forEach items="${list }" var="dto">
								<div class="posts">
									<div class="post_box">
										<%-- <p>boardnum : ${dto.boardnum}</p> --%>
										<a class="pop_detail" onclick="pop_details(${dto.boardnum });">${dto.post_thumbnail }</a>
										<br />
									</div>
								</div>
							</c:forEach>														
						</c:when>
						
						<c:otherwise>
								<div>
									<h1>USERNAME or HASHTAG : ${hash }</h1>
								</div>
								<div>
									<span>게시물</span> <span> ${count }</span>
								</div>	
							<div class="username_div">	
							<p>USERNAME</p>
							<c:forEach items="${list1 }" var="dto">
									<div class="posts">
										<div class="post_box">
											<%-- <p>boardnum : ${dto.boardnum}</p> --%>
											<a class="pop_detail" onclick="pop_details(${dto.boardnum });">${dto.post_thumbnail }</a>
											<br />
										</div>
									</div>
							</c:forEach>
							</div>
							<div class="hash_div">
							<p>HASHTAG</p>
							<c:forEach items="${list2 }" var="dto">
									<div class="posts">
										<div class="post_box">
											<%-- <p>boardnum : ${dto.boardnum}</p> --%>
											<a class="pop_detail" onclick="pop_details(${dto.boardnum });">${dto.post_thumbnail}</a>
											<br />
										</div>
									</div>
							</c:forEach>							
							</div>
						</c:otherwise>
					</c:choose>
					
					</div>
				</div>
			</div>
			
			
			
<!-- 정중앙 modal -->
<div class="modal modal-center fade" id="myCenterModal" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-center" role="document" style="width:92%; max-width: 65em; margin-top: 12em;">
    <div class="modal-content">
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
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">클라우드</a></li>
				</ul>
			</nav>
		</div>


</div>
 



</body>
</html>