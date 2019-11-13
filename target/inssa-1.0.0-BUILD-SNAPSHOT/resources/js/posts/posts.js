function posts(){
$.ajax({
    type: 'post',
    url: 'go_posts.do',
    success: function () {
    	$("#changing_div").html('<p>게시글</p>');
    },
    error: function (err) {
        alert("잘하자~")
    }
})
}