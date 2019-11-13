<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

<link rel="stylesheet" type="text/css" href="resources/css/friend.css">
<jsp:include page="../left_home.jsp" />



</head>
<body>
	<sec:authentication property="principal.username" var="username" />



	<div class="culmn">

		<div class="middlecolumn ">
			<h1></h1>

			<div class="card "id="home_card">
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


				<div
					class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
					id="changing_div" style="height: 90%">


					<h4 class="text-center">친구 요청에 답하기</h4>
						<table>
							<c:forEach items="${friendRequest}" var="FriendRequest">
							  <tr>
							    <td><a href="">${FriendRequest.username}</a></td>
							    
							    <td><button type="button" class="btn pull-right glyphicon glyphicon-remove" onclick="location.href='requestDelete.do?username=${FriendRequest.username}'">거절</button><button type="button" class="btn btn-default pull-right glyphicon glyphicon-user" onclick="location.href='requestUpdate.do?username=${FriendRequest.username}'" style="margin-right: 2%;">수락</button></td>
							  </tr>
							</c:forEach>
							</table>
							
							


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
               <li class="nav-item "><a class="nav-link" href="cloud.do">클라우드</a></li>
            </ul>
         </nav>
      </div>



	</div>


</body>
</html>