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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



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
	#friend_add{
		width: 18%;
	    margin-bottom: 3%;
	}
	
</style>

<!-- 프로필로넘어가기 -->

</head>
<body>

	<sec:authentication property="principal.bgm" var="userbgm" />

	<input type="hidden" name="bgm" value="${friend.bgm}" />


	<div class="rightcolumn">
		<div class="card" style="height: 84.5rem; border: white;">


			<div class="fakeimg1" style="height: 4.2rem;">${frienddto.status }</div>
			<br>
			<div class="fakeimg" style="height: 26rem;">
				${frienddto.usermini }
				<button type="button" class="btn btn-default btn-xs"
					onclick="location.href='edit_mini.do'" style="float: right;">edit</button>
			</div>

			<br>

			<p>${frienddto.username}&lt;${frienddto.gender }&gt;${frienddto.birth }</p>
			<p>${frienddto.email }</p>





			<div class="container2">
				<div class="dropup">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						내 친구 목록 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<c:forEach items="${friendsFriends}" var="friend">
							<li><a href="friendhome.do?username=${friend.username}">${friend.username}</a></li>
						</c:forEach>
					</ul>
					<div>
						
					</div>
				</div>
				<div>
				<br/>
				<c:choose>
					<c:when test="${confirm eq false }">
						<a class="btn btn-warning" id="friend_add" href="addFriends.do?friendname=${frienddto.username}">친구 신청하기</a>
					</c:when>
					<c:otherwise>
						<a>친구임당☆</a>
					</c:otherwise>
				</c:choose>
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