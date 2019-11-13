<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<jsp:include page="../left_home.jsp" />

<script type="text/javascript">

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
<sec:authentication property="principal.username" var="username" />


   
   <div class="culmn">
     
      <div class="middlecolumn ">
         <h1></h1>
         
          <div class="card " id="home_card">
             <div class="input-group col-sm-3" style="float: right;">
					<input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword"> 
					<span class="input-group-btn" id="search_btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
            <div>
               <a href="home.do"><img src="resources/image/homelogo.png" ></a>
            </div>
            
            
            <div class="card example-1 scrollbar-deep-purple bordered-deep-purple thin" id="changing_div" style="height:90%">
<!--             <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div> -->
            
<!--             <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div> -->
<%-- 					<a href="mycloud_photo.do?username=${username }">내사진보러가기</a> --%>

				<div>
				<a href="cloud_select_photo.do?username=${username }">사진첩이동</a><!-- 사진첩이동 -->
				
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
               <li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
               <li class="nav-item " style="background-color:white;border-left:white;"><a class="nav-link" style="color: black;" href="cloud_select_photo.do?username=${username }">클라우드</a></li>
            </ul>
         </nav>
      </div>


      

   </div>


</body>
</html>