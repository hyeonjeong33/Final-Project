<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<jsp:include page="left_home.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/css/edit_mini.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/minimi/mini_gender.js"></script>
    <script src="resources/js/minimi/act.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

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
     
      <div class="middlecolumn ">
         <h1></h1>
         
         <div class="card" style="width: 130%; height: 84.5rem;">
             <div class="input-group col-sm-3" style="float: right;">
        <input type="text" class="form-control" placeholder="검색">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
            <div>
               <a href="home.do"><img src="resources/image/homelogo.png" ></a>
            </div>
            
<!-- 미니미~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div class="forajaximage_change" id="changing_div" style="height:100%">

	<div id="mini_container">	
	
	<h2>EDIT MINIMI</h2>	
    
    <p id="select_gender">
      <label for="usergender">성별</label> 
         <input type="radio" name="gender" value="M"/>남
              <input type="radio" name="gender" value="F"/>여
   </p>
   <p id="alert">
      성별을 선택해주세요.
   </p>
   
<div id="male">
    <div id="show_mini"><div id="base" class="box2"><img id="drag" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div><div id = "drag_box"><div id="mini_hair"><img id="drag0" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div><div id="mini_body"><img id="drag1" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div></div></div>
    
        <div id="blocker_hair" ondrop="drop1(event)" ondragover="allowDrop(event)"></div>
         <div id="blocker_body" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
        
    
   <div id="select_box">
       <div id="select_hair">
           <label> 머리 </label>
              <div id="div2" >
                  <img id="drag2" src="resources/image/only_hair_man_1.png"  draggable="true" ondragstart="drag(event)" />
                </div>
              
                <div id="div2">
                  <img id="drag3" src="resources/image/only_hair_man_2.png"  draggable="true" ondragstart="drag(event)" />
                </div>
                
                  <div id="div2">
                  <img id="drag4" src="resources/image/only_hair_man_3.png"  draggable="true" ondragstart="drag(event)" style="margin-right: 2em;"/>
                </div>
                
                <div id="div2">
                  <img id="drag8" src="resources/image/mini_zzang.png"  draggable="true" ondragstart="drag(event)" style="float: none;"/>
                </div>
        </div>
        
       <div id="select_body">
            <label> 옷 </label>
                <div id="div2">
                  <img id="drag5" src="resources/image/only_body_man_1.png"  draggable="true" ondragstart="drag(event)" />
                </div>
              
                <div id="div2">
                  <img id="drag6" src="resources/image/only_body_man_2.png"  draggable="true" ondragstart="drag(event)" />
                </div>
                
                <div id="div2">
                  <img id="drag7" src="resources/image/only_body_man_3.png"  draggable="true" ondragstart="drag(event)" style="float: none;"/>
                </div>
                
      </div>
   </div>
   <input type="button" id="submit_bt" value="저장" onclick="save2('${username}');">
   <input type="button" id="home" value="홈홈" onclick="location.href='home.do'">   
   
</div>      
   
<div id="female">
    <div id="show_mini1"><div id="base1" class="box1"><img id="drag" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div><div id = "drag_box"><div id="mini_hair1"><img id="drag0" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div><div id="mini_body1"><img id="drag1" src="resources/image/02set0.png"  draggable="true" ondragstart="drag(event)" /></div></div></div>
       
        <div id="blocker_hair" ondrop="drop3(event)" ondragover="allowDrop(event)"></div>
         <div id="blocker_body" ondrop="drop2(event)" ondragover="allowDrop(event)"></div>
        
    
   <div id="select_box">
       <div id="select_hair1">
           <label> 머리 </label>
              <div id="div2">
                  <img id="drag2_1" src="resources/image/only_hair_1.png"  draggable="true" ondragstart="drag(event)" />
                </div>
              
                <div id="div2">
                  <img id="drag3_1" src="resources/image/only_hair_2.png"  draggable="true" ondragstart="drag(event)" />
                </div>
                
                  <div id="div2">
                  <img id="drag4_1" src="resources/image/only_hair_3.png"  draggable="true" ondragstart="drag(event)" style="margin-right: 2em;"/>
                </div>
                
                <div id="div2">
                  <img id="drag9" src="resources/image/ol.png"  draggable="true" ondragstart="drag(event)" style="float: none;"/>
                </div>
        </div>
        
       <div id="select_body1">
            <label> 옷 </label>
                <div id="div2">
                  <img id="drag5_1" src="resources/image/only_body_1.png"  draggable="true" ondragstart="drag(event)" />
                </div>
              
                <div id="div2">
                  <img id="drag6_1" src="resources/image/only_body_2.png"  draggable="true" ondragstart="drag(event)" />
                </div>
                
                  <div id="div2">
                  <img id="drag7_1" src="resources/image/only_body_3.png"  draggable="true" ondragstart="drag(event)" style="float: none;"/>
                </div>
      </div>
   </div>
   <input type="button" id="submit_bt" value="저장" onclick="save3('${username}');">
   <input type="button" id="home" value="홈홈" onclick="location.href='home.do'">
   </div>

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
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>

      

   </div>


</body>
</html>