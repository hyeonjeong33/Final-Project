<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/visitor.css?after">
<script type="text/javascript" src="resources/js/guestbook/guestbook.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<!-- <link rel="stylesheet" href="http://localhost:8787/InsaWorld/src/main/webapp/WEB-INF/left_css/stylesheet.css"> -->
<jsp:include page="friend_left_home.jsp" />



<script type="text/javascript">
$(document).ready(function(){
$('#GuestBookContent').on('keyup',function(){
if($(this).val().length >200){
$(this).val($(this).val().substring(0,200));
alert('글자 수가 200자를 넘었습니다.');
}
});
});
</script>






<style>
ul.breadcrumb {
	padding: 10px 16px;
	list-style: none;
	background-color: #f8f8f8;
	margin-top: 5%;
}

ul.breadcrumb li {
	display: inline;
	font-size: 18px;
}

ul.breadcrumb li+li:before {
	padding: 8px;
	color: black;
	content: "/\00a0";
}

ul.breadcrumb li a {
	color: #0275d8;
	text-decoration: none;
}

ul.breadcrumb li a:hover {
	color: #01447e;
}

/* 테이블 */
#myTable {
	border-collapse: collapse; /* Collapse borders */
	/*   width: 100%; /* Full-width */ */
	font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
}


#comment {
	width: 92.3%;
	margin-right: 2%;
	margin-top: 1%;
}

/* Orange */
.warning {
	border-color: #ff9800;
	color: orange;
	background-color: white;
	height: 50px;
	margin-top: 1%;
}

.warning:hover {
	background: #ff9800;
	color: white;
}

#writeform {
	background-color: #f8f8f8;
	border-radius: 4px;
}

/* 스위치 */
.material-switch>input[type="checkbox"] {
	display: none;
}

.material-switch>label {
	cursor: pointer;
	height: 0px;
	position: relative;
	width: 40px;
}

.material-switch>label::before {
	background: rgb(0, 0, 0);
	box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
	border-radius: 8px;
	content: '';
	height: 16px;
	margin-top: -8px;
	position: absolute;
	opacity: 0.3;
	transition: all 0.4s ease-in-out;
	width: 40px;
}

.material-switch>label::after {
	background: rgb(255, 255, 255);
	border-radius: 16px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
	content: '';
	height: 24px;
	left: -4px;
	margin-top: -8px;
	position: absolute;
	top: -4px;
	transition: all 0.3s ease-in-out;
	width: 24px;
}

.material-switch>input[type="checkbox"]:checked+label::before {
	background: inherit;
	opacity: 0.5;
}

.material-switch>input[type="checkbox"]:checked+label::after {
	background: inherit;
	left: 20px;
}

#comment_btn {
	padding: 2%;
	margin-left: 10%;
}

#changing_div {
	overflow-x: hidden;
}

#guestContent {
	word-break: break-all;
	white-space: pre-line;
}

#mini {
	width: 20%;
}

#GuestBookContent {
	width: 95%;
}

h3 {
	color: gray;
	font-size: 17px;
	margin-top: 12%;
}

h4 {
	color: gray;
	font-size: 15px;
}
.glyphicon{
	cursor: pointer;
}

</style>

</head>
<body>
	<sec:authentication property="principal.username" var="username" />
	<input type="hidden" name="sendTo" value="${frienddto.username }" />
	<div class="culmn">
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1 id="A"></h1>

			<div id="scroll" class="card"
				style="width: 130%; height: 84.5rem; border: white;">
				<!-- 				<div id="log"> -->
				<!-- 		<span>scrollHeight: <b id="scrollHeight"></b></span><br> -->
				<!-- 		<span>scrollPosition: <b id="scrollPosition">0</b></span><br> -->
				<!-- 		<span>from bottom :  <b id="bottom">0</b></span><br> -->
				<!-- 	</div> -->
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
					id="changing_div" style="height: 90%;">
					<table id="myTable" style="width: 100%;">
						<tr class="header">
							<ul class="breadcrumb" style="margin-top: 1%;">
								<li>ID : ${username }</li>
								<li class="pull-right"><a onclick="GuestBookInsert()">
										<span class="glyphicon glyphicon-pencil">작성하기</span>
								</a></li>
								<li class="material-switch pull-right"><span
									class="glyphicon glyphicon-lock">비밀글</span> <input
									id="someSwitchOptionInfo" name="secret" type="checkbox" /> <label
									for="someSwitchOptionInfo" class="label-info"></label></li>
							</ul>
						</tr>
						<tr>
							<th id="mini">${dto.usermini }</th>
							<th><textarea rows="12" cols="50"
									style="resize: none; width: 100%;"
									onKeyUp="checkByte(this.form)" id="GuestBookContent"
									name="GuestBookContent" class="text form-control"
									placeholder="200자 이하로 작성해 주세요."></textarea>
						</tr>
					</table>

					<c:choose>
						<c:when test="${empty friendguestlist }">
							<h3 class="text-center">방명록이 존재하지 않습니다.</h3>
							<h4 class="text-center">첫 방명록을 남겨주세요.</h4>

						</c:when>
						<c:otherwise>
							<c:forEach items="${friendguestlist }" var="babo"
								varStatus="status">
								<div>
									<div id="GuestHide${babo.boardnum }">
										<!-- ajax 삭제 할때 hide 해줘야함 -->
										<table>
											<ul class="breadcrumb">
												<li>${babo.username }</li>
												<c:choose>
													<c:when test="${dto.username eq babo.username }">
														<a href="home.do"> <span class="glyphicon glyphicon-home"></span></a>
													</c:when>
													<c:otherwise>
														<a href="friendhome.do?username=${babo.username }"> <span class="glyphicon glyphicon-home"></span></a>
													</c:otherwise>
												</c:choose>
												<li>(${babo.reporting_date})</li>
												<c:if test="${username eq babo.username }">
													<li style="float: right;"><a
														onclick="guestUpdateForm(${babo.boardnum})"
														id="updateButton${babo.boardnum }"> <span
															class="glyphicon glyphicon-pencil"></span>
													</a></li>
													<li style="float: right;"><a
														onclick="guestDelete(${babo.boardnum})"><span
															class="glyphicon glyphicon-trash"></span> </a></li>
												</c:if>
											</ul>
										</table>
										<div style="border: gray;">
											<div>
												<div class="big"
													style="overflow: hidden; border: gray; float: left; width: 20%;">
													<div class="small">
														${guestdto[status.index].usermini}</div>
												</div>
												<div style="margin-right: 5%; margin-left: 20%;">
													<textarea rows="10" cols="50" class="text form-control"
														id="guestContent${babo.boardnum}" readonly="readonly"
														style="background-color: transparent; width: 106.5%;">${babo.content}</textarea>
												</div>
											</div>
											<br />

											<div>
												<div class="form-inline">
													<textarea class="form-control col-xs-3" cols="55" role=""
														id="comment" name="GuestBookCommContent${babo.boardnum}"
														placeholder="댓글을 입력하세요."></textarea>
												</div>
												<div>
													<button class="btn warning"
														onclick="guestBookCommInsert(${babo.boardnum})">확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>

					</c:choose>
				</div>
			</div>
		</div>
	</div>



	<div class="container">
		<nav class="nav ">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="home.do">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="friendhome.do?username=${frienddto.username }">게시글</a></li>
				<li class="nav-item "
					style="background-color: white; border-left: white;"><a
					class="nav-link"
					href="friendVisitor.do?username=${frienddto.username }"
					style="color: black;">방명록</a></li>
			</ul>
		</nav>
	</div>

</body>
</html>