function update() {
	var nickname = $("input[name=nickname]").val();
	var password = $("input[name=password]").val();
	var id = $("input[name=username]").val();
	var status = $("input[name=status]").val();
	
	if (nickname != "") {
		
		$.ajax({
			type : "post",
			url : "user_update.do",
			data : "nickname="+nickname+"&password="+password+"&status="+status,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				alert("회원정보 성공!");
				location.href = "home.do";
			},
			error : function() {
				alert("회원정보 실패ㅠ");
			}
		});
	} else {
		alert('입력 제대로 안하슈?');
	}
}

function user_delete() {
	var id = $("input[name=username]").val();
	alert(id);
	$.ajax({
		type : "post",
		url : "user_delete.do",
		data : "username=" + id,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			alert("회원삭제 성공!");
			location.href = "after_delete.do";
		},
		error : function() {
			alert("회원정보 실패ㅠ");
		}
	});
}
