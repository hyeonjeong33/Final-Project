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
				alert("회원정보가 수정되었습니다.!");
				location.href = "home.do";
			},
			error : function() {
				alert("입력을 다시한번 확인해주세요");
			}
		});
	} else {
		alert('입력을 다시한번 확인해주세요');
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
