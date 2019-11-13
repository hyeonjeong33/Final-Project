<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		function update(){
			var nickname = $("input[name=nickname]").val();
			var password = $("input[name=password]").val();
			var id = $("input[name=username]").val();
			if(nickname!=""){
				$.ajax({
					type:"post",
					url:"user_update.do",
					data:"nickname="+nickname+"&password="+password,
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success:function(data){
						alert("회원정보 성공!");
						location.href="after_update.do?username="+id;
					},
					error:function(){
						alert("회원정보 실패ㅠ");
					}
				});
			}else{
				alert('입력 제대로 안하슈?');
			}
		}
		
		function user_delete(){
			var id = $("input[name=username]").val();
			alert(id);
			$.ajax({
				type:"post",
				url:"user_delete.do",
				data:"username="+id,
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					alert("회원삭제 성공!");
					location.href="after_delete.do";
				},
				error:function(){
					alert("회원정보 실패ㅠ");
				}
			});
		}
	</script>
	<body>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="username" value="${dto.username }" readonly/></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" value="${dto.password }"/></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" value="${dto.nickname }"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.birth }</td>
			</tr>
			<tr>
				<td colspan="2">
				 <input type="button" value="수정" onclick="update()"> 
		         <input type="button" value="삭제" onclick="user_delete()"> 
		         </td>   
			</tr>
		</table>
	</body>
</html>