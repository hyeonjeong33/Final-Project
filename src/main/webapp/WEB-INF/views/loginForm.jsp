<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>로그인 페이지</title>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/login_form.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body {
   background-image: url("resources/image/login_back2.gif");
   background-size: cover;
   background-repeat: no-repeat;
}



</style>
</head>
<body onload="document.f.id.focus();">

   <div id="page">

      <div class="circle">
         <img id="logo" src="resources/image/homelogo.png">

         <div id="login_form">

            <c:url value="/login" var="loginUrl" />
            <form:form name="f" action="${loginUrl}" method="POST">
               <c:if test="${param.error != null}">
                 <p style="color:red;">아이디와 비밀번호가 잘못되었습니다.</p>
               </c:if>
               <c:if test="${param.logout != null}">
                  <p>로그아웃 하였습니다.</p>
               </c:if>
               <p>
                  <label for="username"></label><input type="text" id="id"
                     name="id" placeholder="아이디"/>
               </p>
               <p>
                  <label for="password"></label><input type="password"
                     id="password" name="password" placeholder="비밀번호"/>
               </p>
               <button type="submit" id="login_btn">로그인</button>
              
            </form:form>



         </div>

         <div class="login_append">
            <span class="txt_find"> <a href="findId.do" class="find_id">아이디/비밀번호
                  찾기</a>
            </span> ㅣ <span><a href="signUp.do">회원가입</a></span>
         </div>
      </div>

   </div>

</body>
</html>