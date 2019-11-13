<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="resources/css/profile_form.css">
<jsp:include page="left_home.jsp" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	function goBack() {
		window.history.back();
	}
	
	function delete_schedule(){
		var seq = $("input[name=scheduleno]").val();
		$.ajax({
   		    type:"post",
			url:"delete_schedule.do",
   		    data :"scheduleno="+seq,
   	        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
   		    success:function(data){
   			    alert("삭제 서엉고옹");
   			    location.href="diary.do";
   		    },
   		    error:function(){
   			    console.log("실패...ㅠ");
   		    }
		});
	}
	
	
	$(document).on('click', '#search_btn', function(){
		//e.preventDefault();
		var url = "searchlist.do";
		url = url + "?keyword=" + $('#keyword').val();
		alert(url);
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
						<div id="my_info">
							<div class="col-xs-8 " style="margin-left: 30%;margin-bottom: 3%;">
								<input type="hidden" name="scheduleno" value="${detail.scheduleno }"/>
								<div class="form-group col-xs-7">
									<label>타이틀</label> <input type="text" class="form-control"
										readonly="readonly" value="${detail.title}" />
								</div>
								<div class="form-group col-xs-7">
									<label>시작 날짜</label> <input type="text" class="form-control"
										value="${detail.start_date}" readonly="readonly" />
								</div>
								<div class="form-group col-xs-7">
									<label>시작 시간</label> <input type="text" class="form-control"
										value="${detail.start_time}" readonly="readonly" />
								</div>
								<div class="form-group col-xs-7">
									<label>끝나는 날짜</label> <input type="text" class="form-control"
										value="${detail.end_date}" readonly="readonly" />
								</div>
								<div class="form-group col-xs-7">
									<label>끝나는 시간</label> <input type="text" class="form-control"
										value="${detail.end_time}" readonly="readonly" />
								</div>
							</div>
							<button type="button" class="btn btn-default"
								onclick="goBack()">GoBack</button>
							<button type="button" class="btn btn-default"
								onclick="location.href='detail_update.do?scheduleno=${detail.scheduleno}'">Edit</button>
							<button type="button" class="btn btn-default"
								 data-toggle="modal" data-target="#myModal">Delete</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ICWorld</h4>
        </div>
        <div class="modal-body">
          <p>일정 삭제를 하시면 기존에 있던 데이터들이 모두 삭제됩니다.</p>
          <p>정말로 삭제 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn" data-dismiss="modal" onclick="delete_schedule()">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
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
