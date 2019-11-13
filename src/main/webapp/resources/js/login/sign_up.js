var idcheck = 0;
var emailcheck = 0;
var randnumcheck = false;
var passcheck = false;
var widgetId1;
var pleasecheckid = "<b>아이디를 입력해 주세요</b>";

function id_chk() {
	var user_id = $("input[name=username]").val();
	if (user_id == null || user_id == "") {
		alert("입력하즈아아");
	} else {
		$.ajax({
			type : "post",
			url : "id_check.do",
			data : "username=" + user_id,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {

				if (user_id == null || user_id == "") {
					idcheck = false;
					$("div[id=id_chk_confirm]").html(pleasecheckid);
				} else {
					if (data.cnt > 0) {
						idcheck = false;
						$("div[id=id_chk_confirm]").html('');
						$("div[id=id_chk_confirm]").html(
								'<b style="color:red;">이미 존재하는 아이디 입니다!</b>');
					} else {
						idcheck = true;
						$("div[id=id_chk_confirm]").html('');
						$("div[id=id_chk_confirm]").html(
								'<b style="color:green;">사용가능한 아이디 입니다!</b>');
						idcheck = 1;
					}
				}
			},
			error : function() {
				alert("아이디 유효성 확인 실패");
			}
		});
	}
}

function email_chk() {
	var user_email = $("input[name=email]").val();
	if (user_email != null || user_email != "") {
		$.ajax({
			type : "post",
			url : "email_check.do",
			data : "email=" + user_email,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				if (user_email == null || user_email == "") {
					emailcheck = 0;
					$("div[id=email_chk_confirm]").html('<b>이메일을 입력해 주세요</b>');
				} else {
					if (data.cnt > 0) {
						emailcheck = 0;
						$("div[id=email_chk_confirm]").html('');
						$("div[id=email_chk_confirm]").html(
								'<b style="color:red;">사용할 수 없는 이메일 입니다!</b>');
					} else {
						emailcheck = 1;
						$("div[id=email_chk_confirm]").html('');
						$("div[id=email_chk_confirm]").html(
								'<b style="color:green;">사용가능한 이메일 입니다!</b>');
					}
				}
			},
			error : function() {
				alert("이메일 유효성 확인 실패");
			}
		});
	}
}

var onloadCallback = function() {
	widgetId1 = grecaptcha.render('example1', {
		'sitekey' : '6LcLE7UUAAAAAPBVDjNvPRLC-O11Jloz59-9-uaD',
		'theme' : 'light'
	});
}

function pass_chk() {
	var pass1 = $("input[id=pass_1]").val();
	var pass2 = $("input[id=pass_2]").val();
	if (pass2 == null || pass2 == "") {
		$("div[id=pass_chk_confirm]").html('');
		$("div[id=pass_chk_confirm]").html('<b>비밀번호 확인 부탁드립니다아</b>');
	} else {
		if (pass1 != pass2) {
			passcheck = false;
			$("div[id=pass_chk_confirm]").html('');
			$("div[id=pass_chk_confirm]").html(
					'<b style="color:red;">비밀번호 다시 써주세요</b>');
		} else {
			passcheck = true;
			$("div[id=pass_chk_confirm]").html('');
			$("div[id=pass_chk_confirm]").html('<b style="color:green;">비밀번호 확인 완료☆</b>');
		}
	}
}

function xsend_email() {
	var email = $("input[name=email]").val();
	var origin_randnum = $("input[name=randomnum]").val();
	$.ajax({
		type : "post",
		url : "send_email.do",
		data : "email=" + email+"&origin_randnum="+origin_randnum,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			alert("인증번호가 전송되었습니다!!");
		},
		error : function() {
			alert("이메일이 올바르지 않습니다!");
		}
	});
}

function randnum_chk() {
	var randnumpass = $("input[id=randnum]").val();
	var origin_randnum = $("input[name=randomnum]").val();
	$.ajax({
		type : "post",
		url : "randnum_check.do",
		data : "randnum=" + $.trim(randnumpass)+"&origin_randnum="+origin_randnum,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			if (randnumpass == null || randnumpass == "") {
				randnumcheck = false;
				$("div[id=randnum_chk_confirm]").html('<b>인증번호를 입력해 주세요</b>');
			} else {
				if (data.ranchk != true) {
					randnumcheck = false;
					$("div[id=randnum_chk_confirm]").html('');
					$("div[id=randnum_chk_confirm]").html(
							'<b style="color:red;">인증번호를 다시 확인해주세요</b>');
				} else if (data.ranchk == true) {
					randnumcheck = true;
					$("div[id=randnum_chk_confirm]").html('');
					$("div[id=randnum_chk_confirm]").html(
							'<b style="color:green;">인증번호 확인완료</b>');
				}
			}
		},
		error : function() {
		}
	});
}

function formsubmit() {
	if ((grecaptcha.getResponse(widgetId1) != null || grecaptcha
			.getResponse(widgetId1) != "")
			&& idcheck == 1
			&& emailcheck == 1
			&& passcheck == true
			&& randnumcheck == true) {
		return true;
	} else {
		alert("입력을 다시 한 번 확인해주세요!");
		return false;
	}
}