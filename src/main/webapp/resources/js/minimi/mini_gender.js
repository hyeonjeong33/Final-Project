
$(document).ready(function(){
   $("#male").hide();
   $("#female").hide();
   
   $("input:radio[name=gender]").click(function(){
    
    if($("input[name=gender]:checked").val() == "M"){
       $("#alert").hide();
       $("#male").show();
       $("#female").hide();
        // radio 버튼의 value 값이 1이라면 활성화

    }else if($("input[name=gender]:checked").val() == "F"){
       $("#alert").hide();
       $("#female").show();
       $("#male").hide();
        // radio 버튼의 value 값이 0이라면 비활성화
    }
});
});
