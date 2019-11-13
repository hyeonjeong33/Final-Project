function cloud(){
$.ajax({
    type: 'post',
    url: 'go_cloud.do',
    success: function () {
    	$("#changing_div").html('<p>클라우드</p>');
    	
    	
    },
    error: function (err) {
        alert("잘하자~")
    }
})
}