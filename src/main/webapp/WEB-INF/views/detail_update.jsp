<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="left_home.jsp" />
<link rel="stylesheet" type="text/css" href="resources/css/profile_form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function goBack() {
		window.history.back();
	}
	
	function detail_update(){
		var title = $("input[name=title]").val();
		var start_date = $("input[name=start_date]").val();
		var end_date = $("input[name=end_date]").val();
		var start_time = $("input[name=start_time]").val();
		var end_time = $("input[name=end_time]").val();
		var no = $("input[name=scheduleno]").val();
		//alert(title+" "+start_date+" "+end_date+" "+start_time+" "+end_time+" "+no);
		$.ajax({
			type:"post",
			url:"detail_update_form.do",
			data:"title="+title+"&start_date="+start_date+"&end_date="+end_date+"&start_time="+start_time+"&end_time="+end_time+"&scheduleno="+no,
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				alert("일정이 수정되었습니다.");
				location.href="diary.do";
			},
			error:function(){
				console.log("실패애");
			}
		})
	}
	
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

	<div class="culmn">
		<div class="middlecolumn ">
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
						<h3 class="text-center">내 일정 보기</h3>
						<form action="detail_update_form.do" method="post">
						<div id="my_info">
							<div class="col-xs-8 " style="margin-left: 30%;margin-bottom: 3%;">
									<input type="hidden" name="scheduleno" value="${detail.scheduleno }"/>
									<div class="form-group col-xs-7">
										<label>타이틀</label> <input type="text" class="form-control"
											value="${detail.title}" name="title" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>시작 날짜</label> <input type="date" class="form-control"
											value="${detail.start_date}" name="start_date" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>시작 시간</label> <input type="time" class="form-control"
											value="${detail.start_time}" name="start_time" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>끝나는 날짜</label> <input type="date" class="form-control"
											value="${detail.end_date}" name="end_date" required/>
									</div>
									<div class="form-group col-xs-7">
										<label>끝나는 시간</label> <input type="time" class="form-control"
											value="${detail.end_time}" name="end_time" required/>
									</div>
							</div>
							<button type="button" class="btn btn-default"
								onclick="goBack()">GoBack</button>
							<button type="button" class="btn btn-default"
								onclick="detail_update()">Edit</button>
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
