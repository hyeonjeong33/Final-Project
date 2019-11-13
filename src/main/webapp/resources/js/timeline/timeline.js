
function timeline(){
$.ajax({
    type: 'post',
    url: 'go_timeline.do',
    success: function () {

    	$("#changing_div").html('<p>타임라인</p>');
    },
    error: function (err) {
        alert("잘하자~")
    }
})
}
