<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<style>
* {
   box-sizing: border-box;
}

div {
   display: block;
}

body {
   font-family: Arial;
   padding: 30px; /* 10px */
   background:  #fff9bd;
   color: black;
}

.nav-item{
       display: inline;
        border: 1px solid #F0AD4E;
        padding: 3px;
        background-color: #F0AD4E;
        margin-bottom: 2%;
        text-align: center;
        border-radius: 0px 8px 8px 0px;
        border-color: #DD8500;
        
       
}

li:hover{
   text-decoration: 
}


ul{
   
   padding: 10px;
}
a{ 
   text-decoration: none;
   color: white;
   margin:0px;
   padding: 10%;
   
}

a:hover {
    text-decoration: none;
    color: white;
}

a:hover span {
    text-decoration:none;
    color: white;
}




/* Header/Blog Title */
.header {
   padding: 30px;
   text-align: center;
   background: white;
}

.header h1 {
   font-size: 50px;
}

.nav{
   width:100%;
   padding-left: 60%;
   text-decoration: none;
   
}



/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {
   float: left;
   width: 75%;
}

/* Right column */
.rightcolumn {
   float: left;
   width: 15%;
   padding-left: 0px;
}

.rightcolumn2{
   float: right;
   width: 50%;
   padding-left: 0px;
}
.rightcolumn3{
   width: 100%;
   
}

.middlecolumn {
   float: left;
   width: 50%;
   padding-left: 20px;
}

/* Fake image */
.fakeimg {
   background-color: #E0E0E0;
   width: 100%;
   padding: 20px;
   text-align: center;
}

.fakeimg1 {
   background-color: #E0E0E0;
   text-align: center;
   vertical-align: middle;
}

/* Add a card effect for articles */
.card {
   background-color: white;
   padding: 20px;
   margin-top: 20px;
}

.card2 {
   background-color: white;
   padding: 50px;
   margin-top: 20px;
   margin-left: 50px;
   padding-left: 100%;
}

/* Clear floats after the columns */
.row:after {
   content: "";
   display: table;
   clear: both;
}

/* Footer */
.footer {
   padding: 20px;
   text-align: center;
   background: #ddd;
   margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) { .
   .leftcolumn, .rightcolumn {
      width: 100%;
      padding: 0;
   }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
   .topnav a {
      float: none;
      width: 100%;
   }
}

.btn-primary {
   background-color: #E0E0E0;
   border-color: #E0E0E0;
   color: black;
   width: 18%;
}


#page {
   background-color: #fff9bd;
   width: 100%;
   height: 100%;
}


.container{
   position:absolute;
   right:12.8%;
   width: 50%;
   top:4.2%;
   
}

.container2{
   width: 550%;
}



</style>
</head>
<body>

   <!-- <div class="header"> -->
   <!--   <h1>My Website</h1> -->
   <!--   <p>Resize the browser window to see the effect.</p> -->
   <!-- </div> -->

   <!-- <div class="topnav"> -->
   <!--   <a href="#">Link</a> -->
   <!--   <a href="#">Link</a> -->
   <!--   <a href="#">Link</a> -->
   <!--   <a href="#" style="float:right">Link</a> -->
   <!-- </div> -->

   <!-- <div class="row"> -->
   <!--   <div class="leftcolumn"> -->
   <!--     <div class="card"> -->
   <!--       <h2>TITLE HEADING</h2> -->
   <!--       <h5>Title description, Dec 7, 2017</h5> -->
   <!--       <div class="fakeimg" style="height:200px;">Image</div> -->
   <!--       <p>Some text..</p> -->
   <!--       <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p> -->
   <!--     </div> -->
   <!--     <div class="card"> -->
   <!--       <h2>TITLE HEADING</h2> -->
   <!--       <h5>Title description, Sep 2, 2017</h5> -->
   <!--       <div class="fakeimg" style="height:200px;">Image</div> -->
   <!--       <p>Some text..</p> -->
   <!--       <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p> -->
   <!--     </div> -->
   <!--   </div> -->
   <div id="page">
      <div class="rightcolumn">
         <div class="card" style="height: 84.5rem;">
            <div class="fakeimg1" style="height: 40px;">상태메세지</div>
            <h1></h1>
            <div class="fakeimg" style="height: 250px;">
               <p>프로필 Image</p>
            </div>
            <h1></h1>
            <div class="fakeimg" style="height: 150px;">
               <p>자기소개</p>
            </div>
            <h1></h1>


            <p>이름(성별) 생년월일</p>
            <p>email 주소</p>




            <div class="container2">
               <div class="dropdown">
                  <button class="btn btn-primary dropdown-toggle" type="button"
                     data-toggle="dropdown">
                     파도타기 <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                     <li><a href="#">친구1</a></li>
                     <li><a href="#">친구2</a></li>
                     <li><a href="#">친구3</a></li>
                  </ul>
               </div>
            </div>



         </div>
      </div>
   
   
   <div class="middlecolumn ">
   <h1></h1>
   
      <div class="card" style="width: 130%; height: 84.5rem;">
         <h1>로고 들어갈꺼임</h1>
         <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div>
         <h1></h1>
         <div class="fakeimg1" style="height: 40%;">타임라인인다 마</div>
      </div>
   </div>




   
      
   <div class="container" >
        <nav class="nav ">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="#">타임라인</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">게시글</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">다이어리</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">방명록</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">프로필</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#">클라우드</a>
                </li>
            </ul>
        </nav>
    </div>
    
  <div style="position: absolute; right:5%; bottom: 5%;" >
    <div class="rightcolumn2">
         <div class="card">
            <div class="fakeimg1" style="height: 40px;">bgm</div>
         </div>
      <h1></h1>
      <div>
          <div class="rightcolumn3">
      <pre class="pre-scrollable" style="background-color: white;">    
            <h1><현재 접속 중인 친구></h1>
      </pre>
      </div>
   </div>
   </div>
</div>
      
      
       </div>
      
</body>
</html>