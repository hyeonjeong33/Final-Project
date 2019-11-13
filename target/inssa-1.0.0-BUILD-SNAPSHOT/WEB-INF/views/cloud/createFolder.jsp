<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="http://localhost:8787/InsaWorld/src/main/webapp/WEB-INF/left_css/stylesheet.css"> -->

<!-- 지예 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function createSubmit()
{
	var params = $("#createfolder").serialize();
	$.ajax(
	{
		url : '/createOnlyFolder.do',
		data: params,
		success : function(xh)
				{	
					alert('success')
					window.opener.location.reload(); 
					window.close(); 
				},
		
		error: function(err) {
			alert('폴더가 추가되엇습니다')
			window.opener.location.reload(); 
			window.close(); 
		}
	});
}



</script>

<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal.username" var="username" />
<form action="createOnlyFolder.do" id="createfolder">
<input type="text" name="cloudfolder">
<input type="hidden" name="username" value="${username }">


<input type="submit" value="폴더생성" onclick="createSubmit();">
</form>

</body>
</html>