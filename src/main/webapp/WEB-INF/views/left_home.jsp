<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/home.css">
<link rel="stylesheet" type="text/css" href="resources/css/my_mini.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>

<script>
	$(document).ready(function() {
		var bgm = $("input[name=bgm]").val();

		$('.dropdown-toggle').dropdown();
		//$("#audio").append("<source src='"+bgm+"'>");
	});
</script>

<style type="text/css">
	strong,#current_user{
		color: #999;
		text-align: center;
		font-size: 17px;
	}
	
	#current{
		margin-top: 27%;
	    width: 15.5%;
	    height: 28em;
	    margin-right: 1.5%;
	}
	
	#info{
	    font-size: 13px;
	}
	
</style>

<!-- 프로필로넘어가기 -->

</head>
<body>

	


	<div class="rightcolumn">
		<div class="card" style="height: 84.5rem; border: white;">


			<div class="fakeimg1" style="height: 3.5rem;">${dto.status }</div>
			<br>
			<div class="fakeimg" style="height: 27rem;">
				${dto.usermini }
				<button type="button" class="btn btn-default btn-xs"
					onclick="location.href='edit_mini.do'" style="float: right;">edit</button>

			</div>
			<!-- Grid row -->
			<div class="row ">

				<!-- Grid column -->
				<div class="col-sm-4 mb-4 " style="width: 100%;">

					<!-- Exaple 1 -->
					<div
						class="card example-1 scrollbar-deep-purple bordered-deep-purple thin">
						<div class="card-body">
							<!--                      <h4 id="section1"> -->
							<%--                         <strong>♥현재 접속 중인 내 칭구들♥ 현재:${total}명</strong> --%>
							<!--                      </h4> -->
							<!--######################################################################################  -->
							<!-- 							<button type="button" class="btn btn-primary" onclick="location.href='friendRequest.do'"> -->
							<%-- 								친구수락대기중 <span class="badge badge-light"><%=session.getAttribute("friendRequest")%></span> --%>
							<!-- 							</button> -->



							<h4 id="section1">
								<strong>회원님을 위한 추천</strong>
							</h4>


							<c:forEach items="${recommendFriends}" var="recFriend">

								<div class="dropdown dropdown-menu-right">
									<a class="btn dropdown-toggle" type="button"
										data-toggle="dropdown" style="color: black;"> <c:out
											value="${recFriend.username}" />
									</a>
									<ul class="dropdown-menu">
										<li><a
											href="friendhome.do?username=${recFriend.username }">홈으로
												가기</a></li>
										<!-- 빌어먹을 friendhome가자 -->
										<li><a
											href="addFriends.do?friendname=${recFriend.username}">친구신청하기</a></li>
									</ul>
								</div>

							</c:forEach>
						</div>
					</div>
					<!-- Exaple 1 -->
					<!-- onclick="location.href='friendRequest.do'"  -->
					<div>
						<a class="notification" onclick="location.href='friendRequest.do'"
							id="notification"> <span>친구 요청</span> <span class="badge"
							id="badge"><%=session.getAttribute("friendRequest")%></span>
						</a>
						<button class="btn default"
							onclick="location.href='current_friend_list.do'" id="friend_btn">친구
							수락 대기중</button>
					</div>
				</div>


			</div>
			<br>

			<!--로그아웃 버튼  -->
			<sec:authorize access="isAuthenticated()">
				<form action="${pageContext.request.contextPath}/logout" method="POST">
					<button type="submit" class="btn btn-default btn-xs"
						style="float: right;">LOGOUT</button>
				</form>
			</sec:authorize>
			<p id="info">${dto.username}&lt;${dto.gender }&gt;${dto.birth }</p>
			<p>${dto.email }</p>





			<div class="container2">
				<div class="dropup">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						내 친구 목록 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<c:forEach items="${myFriends}" var="myFriend">
							<li><a href="friendhome.do?username=${myFriend.username}">${myFriend.username}</a></li>



						</c:forEach>
					</ul>
				</div>
			</div>







		</div>
	</div>
	
	
	
	<div class="card pull-right" id="current">
			<h4 id="current_user" class="text-center">접속 중인 사용자 (현재:${total}명)</h4>
				<c:forEach items="${users}" var="user">
					<div class="inline">
						<div class="pull-left">
						</div>
						<div class="_568z pull-right"><div class="_568-"></div><span aria-label="현재 활동 중" style="background: rgb(66, 183, 42); border-radius: 50%; display: inline-block; height: 6px; margin-left: 4px; width: 6px;"></span></div>
		            </div>     
		                     <div class="dropdown dropdown-menu-right">
		                         <a class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="color: black;">
		                           <c:out value="${user.username}" />
		                         </a>
		                      <ul class="dropdown-menu">
		                        <li><a href="friendhome.do?username=${user.username }">홈으로 가기</a></li>
		                        <li><a href="addFriends.do?friendname=${user.username}">친구 신청하기</a></li>
		                      </ul>
		                    </div>
            	</c:forEach>
		</div>






</body>
</html>