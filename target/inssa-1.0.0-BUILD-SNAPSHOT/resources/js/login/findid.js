	function gofindid(){
  		var email = $("input[name=email]").val();
  		var nick = $("input[name=nickname]").val();
  		alert("이메일 : "+email+" / 닉네임 : "+nick);
  		$.ajax({
  			type : "post",
            url : "findIdForm.do",
            data : "email="+email+"&nickname="+nick,
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data){
            	alert("입력한 이메일로 메일이 발송됬당!");
            	location.href="loginForm.do";
            },
            error : function(){
            	alert("입력을 다시 한번 확인하세욧");
            }
  		});
  	}