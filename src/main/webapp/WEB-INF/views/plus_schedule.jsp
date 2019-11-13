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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="left_home.jsp" />

<script type="text/javascript">
function goBack() {
	window.history.back();
}
</script>
<style type="text/css">
	#my_info{
	  margin-top: 5%;
	}
</style>

</head>
<body>

	<div class="culmn">
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1></h1>

			<div
				class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
				style="width: 130%; height: 84.5rem;border: white;">
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
				<form action="add_schedule_response.do" method="post">
				<h3 class="text-center">일정 추가</h3>
				<div id="my_info">
							<div class="col-xs-8 " style="margin-left: 30%;margin-bottom: 3%;">
									<div class="form-group col-xs-7">
										<label>타이틀</label> <input type="text" class="form-control" name="title" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>시작 날짜</label> <input type="date" name="start_date" class="form-control" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>시작 시간</label> <input type="time" name="start_time" class="form-control" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>끝나는 날짜</label> <input type="date" name="end_date" class="form-control" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>끝나는 시간</label> <input type="time" name="end_time" class="form-control" required/>
									</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-default"
									onclick="goBack()">GoBack</button>
								<button type="submit" class="btn btn-default">Add</button>
							</div>
						</div>
				</form>
			</div>
			</div>
		</div>








		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
					<li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link" href="diary.do" style="color: black;">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
					<li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>



	</div>


</body>
</html>