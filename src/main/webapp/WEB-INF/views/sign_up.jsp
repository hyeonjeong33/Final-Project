<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/sign_up.css">

<script type="text/javascript" src="resources/js/login/sign_up.js"></script>

<script
	src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
	async defer></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<input type="hidden" name="randomnum" value="${origin_randnum }"/>
	<form action="sign_up.do" method="post" onsubmit="return formsubmit();">

		<div id="page">
			<div id="logo">
				<img id="logo" src="resources/image/login_logo.png">
			</div>

			<div class="box_join">

				<div class="inp_text">
					<input type="text" id="id" name="username" placeholder="아이디" class="id_box">
					<input type="button" id="idcheck_bt" value="중복체크"
						onclick="id_chk()">
				</div>

				<div id="id_chk_confirm"></div>

				<div class="inp_text">
					<input type="password" id="pass_1" name="password"
						placeholder="비밀번호">
				</div>

				<div class="inp_text">
					<input type="password" id="pass_2" name="repasswoard"
						placeholder="비밀번호 확인" onchange="pass_chk()">
				</div>
				
				<div id="pass_chk_confirm"></div>

				<div class="inp_text">
					<input type="text" id="nickname" name="nickname" placeholder="성명">
				</div>

				<div class="inp_text">
					<input type="email" id="email" name="email" placeholder="이메일"
						onchange="email_chk()" class="email_box"> <input type="button"
						id="send_email" name="send_email" value="인증번호 보내기"
						onclick="xsend_email()" />
				</div>

				<div id="email_chk_confirm"></div>

				<div class="inp_text">
					<input type="text" id="randnum" placeholder="인증번호" onchange="randnum_chk()" />
				</div>

				<div id="randnum_chk_confirm"></div>
				
				<div class="inp_text" id="radio_div">
					<div>
					<input type="radio" class="gender_radio" name="gender" value="M"><span>남성</span> 
					<input type="radio" class="gender_radio" name="gender" value="F"><span>여성</span>
					</div>
				</div>

				<div class="inp_text">
					<input type="date" id="birth" name="birth" placeholder="생년월일">
				</div>

				<div id="example1"></div>

			</div>

			<div id="agree_text">
				가입하면 ICWORLD의 약관, 데이터 정책<br /> &nbsp;&nbsp;&nbsp;&nbsp;및 쿠키정책에 동의하게
				됩니다.
			</div>

			<input type="submit" id="join_bt" value="가입"/>


		</div>

	</form>
</body>
</html>