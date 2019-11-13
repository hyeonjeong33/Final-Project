<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>인싸월드 고객센터</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script type="text/javascript" src="resources/js/login/findpw.js"></script>
  
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #fff9bd;
      height: 100%;
    }
    .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
    	background-color: #efb763; /* #ef6363 red */
    	
    }
   
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    a:focus, a:hover {
    	color:efb763;
    }
    a{
    	color: #ef6363;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
  
button {
  color: white;
  margin: 2%;
  width: 55.5%;
  margin-left: 1.5%
}

.find_btn{
	margin-top: 1.4em;
    height: 5em;}
}

}
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <img src="resources/image/homelogo.png">
      <ul class="nav nav-pills nav-stacked">
        <li ><a href="loginForm.do">Home</a></li>
        <li><a href="signUp.do">회원가입</a></li>
        <li><a href="findId.do">아이디 찾기</a></li>
        <li class="active"><a href="findPw.do">비밀번호 찾기</a></li>
      </ul>
    </div>

    <div class="col-sm-9">
    <img src="resources/image/homelogo.png">
      <hr>
      <h2>비밀번호 찾기</h2>
<!--       <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br> -->
      <br><br>
      
      
      
       <div class="col-sm-3">
            <h4>임시 비밀번호 발급</h4>
            <div class="container well">
  <p>회원가입시 등록한 아이디와 이메일 주소와 동일하게 작성해야, 임시 비밀번호를 받을 수 있습니다.</p>
  <form action="findPwForm.do" method="post">
  <div style=" vertical-align: middle;text-align:vertical-align;">
    <div class="col-xs-7 form-horizontal">
      <label for="email/">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="이메일 주소를 입력해 주세요" name="email" required>
    </div>
  
    
    <div class="col-xs-7 form-horizontal">
        <label for="id">Id:</label>
        <input class="form-control" id="username" type="text" placeholder="아이디를 입력해 주세요" name="username" required>
			
     </div>
     		</div>	

			<input type="button" class="btn btn-danger btn-lg find_btn" value="비밀번호 찾기" onclick="gofindpw()"/>
		</form>
</div>



	
        </div>
     </div>
    </div>
   </div>
   
   
    

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
