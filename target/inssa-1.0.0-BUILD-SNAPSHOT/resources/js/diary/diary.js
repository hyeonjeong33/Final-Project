function diary(){
$.ajax({
    type: 'post',
    url: 'go_diary.do',
    success: function () {

    	$("#changing_div").html('<p>diary</p>');
    },
    error: function (err) {
        alert("잘하자~")
    }
})
}