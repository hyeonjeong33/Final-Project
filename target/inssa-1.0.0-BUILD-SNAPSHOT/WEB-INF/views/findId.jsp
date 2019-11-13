<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>인싸월드 고객센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="resources/js/login/findid.js"></script>

<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #fff9bd;
	height: 100%;
}

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	background-color: #efb763; /* #ef6363 red */
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

a:focus, a:hover {
	color: efb763;
}

a {
	color: #ef6363;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

button {
	color: white;
	margin: 2%;
	width: 55.5%;
	margin-left: 1.5%
}
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>인싸World 로고 들어갈꺼임</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="loginForm.do">Home</a></li>
					<li><a href="signUp.do">회원가입</a></li>
					<li class="active"><a href="findId.do">아이디 찾기</a></li>
					<li><a href="findPw.do">비밀번호 찾기</a></li>
				</ul>
			</div>

			<div class="col-sm-9">
				<h4>인싸World(로고 들어가기) 아이디 찾기</h4>
				<hr>
				<h2>아이디 찾기</h2>
				<br>
				<br>

				<div class="col-sm-3">
					<h4>본인확인 이메일로 인증</h4>
					<div class="container well">
						<p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>
						<div style="vertical-align: middle; text-align: vertical-align;">
							<div class="col-xs-7 form-horizontal">
								<label for="email/">Email:</label> <input type="email"
									class="form-control" id="email" placeholder="이메일 주소를 입력해 주세요"
									name="email">
							</div>
							<div class="col-xs-7 form-horizontal">
								<label for="ex2">name:</label> <input class="form-control"
									id="ex2" type="text" placeholder="이름을 입력해 주세요" name="nickname">
							</div>
						</div>
						<input type="button" class="btn btn-danger btn-lg" value="아이디 찾기"
							onclick="gofindid()">
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
