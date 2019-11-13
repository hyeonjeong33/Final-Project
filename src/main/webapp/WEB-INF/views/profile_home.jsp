<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>

 
<meta charset="UTF-8">
<title>ICWORLD</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="resources/css/profile_form.css">  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<jsp:include page="left_home.jsp"/>
<script type="text/javascript" src="resources/js/login/user_update_delete.js"></script>

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


				<div
					class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
					id="changing_div" style="height: 90%">
					
					<div>

						<h3 class="text-center" >프로필 편집</h3>
						<div id="my_info">
							       <div class="col-xs-8 " style="margin-left:30%;">  
							        <div class="form-group col-xs-7">
							   <label>아이디</label>
							   <input type="text" class="form-control"  name="username" readonly="readonly" value="${dto.username }"/>
							</div>
							   <div class="form-group col-xs-7">
							   <label>비밀번호</label>
							   <input type="password" class="form-control" id="password" name="password"  value="${dto.password }"/>
							</div>
							<div class="form-group col-xs-7">
							  <label>닉네임</label>
							  <input type="text" class="form-control" name="nickname" value="${dto.nickname }" />
							</div>
							<div class="form-group col-xs-7">
							  <label>이메일</label>
							  <input type="text" class="form-control"  name="mail" value="${dto.email }" readonly="readonly" />
							</div>
							<div class="form-group col-xs-7">
							  <label>생년월일</label>
							  <input type="text" class="form-control" id="birth" name="birth" value="${dto.birth }" readonly="readonly"/>
								</div>
								<div class="form-group col-xs-7">
							  <label>상태메세지</label>
							  <input type="text" class="form-control"  name="status" value="${dto.status }"/>
								</div>
							</div>


						
							<button type="button" class="btn btn-default"onclick="update()">수정</button>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">회원 탈퇴</button>
							<button type="button" class="btn"onclick="location.href='profile.do'">취소</button>
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
        	<p>회원 탈퇴를 하시면 기존에 있던 데이터들이 모두 삭제됩니다.</p>
          <p>정말로 회원을 탈퇴하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn" data-dismiss="modal" onclick="user_delete()">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- onclick="user_delete()"  -->


 <div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
					<li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
					<li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do" >방명록</a></li>
					<li class="nav-item " style="background-color: white; border-left: white;"><a class="nav-link" href="profile.do" style="color: black;">프로필</a></li>
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>

      

   </div>
   





</body>
</html>