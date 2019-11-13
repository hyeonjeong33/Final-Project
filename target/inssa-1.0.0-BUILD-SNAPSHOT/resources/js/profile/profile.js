
function profile(){
$.ajax({
    type: 'post',
    url: 'go_profile.do',
    success: function () {

       $("#changing_div").html('<p>프로필</p>');
    },
    error: function (err) {
        alert("잘하자~")
    }
})
}
