 

 

//방명록 등록하기(완성)
function GuestBookInsert() {
   var content = document.getElementsByName("GuestBookContent")[0];
   var secretCheck = document.getElementsByName("secret")[0]; // 비밀글 체크가 되어있는지
   var sendto = $("input[name=sendTo]").val();
   alert("sendTo : "+sendto);
   // 확인
   var secret = "";
   if (secretCheck.checked == true) { // 확인 후 변수 secret에 값을 넣어줌
      secret = "Y";
   } else if (secretCheck.checked == false) {
      secret = "N";
   }

   if (content != "" && secret == "N") {
      $.ajax({
               url : "GuestBookInsert.do",
               type : "post",
               data : "content=" + content.value + "&secret=" + secret
                     + "&sendTo=" + sendto,    
               success : function(msg) {
                  alert("guestbook.js GuestBookInsert 함수 ajax 성공");
                  $("#myTable").after(
                              "<div id='GuestHide"+msg.rownumresult.boardnum+"'>"+
                              "<table>"+
                              "<ul class='breadcrumb'>"+
                                 "<li>"+msg.rownumresult.username +"</li>"+"&nbsp;"+
                                 "<a href='#'>"+"<span class='glyphicon glyphicon-home'>"+"</span>"+"</a>"+"&nbsp;"+ 
                                 "<li>"+"("+msg.rownumresult.reporting_date+")"+"</li>"+
                                 "<li style='float: right;'>"+"<a onclick='guestUpdateForm("+msg.rownumresult.boardnum+")' id='updateButton"+msg.rownumresult.boardnum+"'>"+"<span class='glyphicon glyphicon-pencil'>"+"</a>"+"</li>"+
                                 "<li style='float: right;'>"+"<a onclick='guestDelete("+msg.rownumresult.boardnum+")'>"+"<span class='glyphicon glyphicon-trash'>"+"</span>"+"</a>"+"</li>"+
                                 "</ul>"+
                                "</table>"+
                                "<div class='inline'>"+
                                "<div style='border: gray;'>"+
                                "<div>"+
                                   "<div class='big' style='overflow : hidden; border: gray; float : left; width : 20%;'>"+
                                      "<div class='small'>"+
                                      msg.usermini +   
                                      "</div>"+
                                   "</div>"+
                                   "<div style='margin-right:5%; margin-left: 20%;'>"+
                                   "<textarea rows='10' cols='50' class='text form-control' id='guestContent"+msg.rownumresult.boardnum+"' readonly='readonly' style='background-color: transparent;width: 106.5%;'>"+msg.rownumresult.content+"</textarea>"+
                                   
                               "</div>"+    
                                "</div>"+
                                "</div>"+
                                "<br/>"+
                                "<div style='overflow : hidden;background-color: #fffcd2;border-radius: 4px;'>"+
                                "<table id='commTable"+msg.rownumresult.boardnum+"'>"+
                                "</table>"+
                                "</div>"+
                                "<textarea class='form-control col-xs-3' cols='55' role='' id='comment' style='resize: none;' name='GuestBookCommContent"+msg.rownumresult.boardnum+"' placeholder='댓글을 입력하세요.'>"+
                                "</textarea>"+
                                "<button class='btn warning' onclick='guestBookCommInsert("+msg.rownumresult.boardnum+")'>"+"확인"+"</button>"+
                                "</div>" 
                                
                  );
                                    document.getElementsByName("GuestBookContent")[0].value = "";
                                    $("#NO").hide();
               },
               error : function() {
                  alert("통신실패, 댓글 입력 했는지 확인!");
               }
            })
   }else if(content != "" && secret == "Y"){ 
      $.ajax({
           url : "GuestBookInsert.do",
           type : "post",
           data : "content=" + content.value + "&secret=" + secret
                 + "&sendTo=" + sendto,    
           success : function(msg) {
              alert("guestbook.js GuestBookInsert 함수 ajax 성공");
              $("#myTable").after(
                          "<div id='GuestHide"+msg.rownumresult.boardnum+"'>"+
                          "<table>"+
                          "<ul class='breadcrumb'>"+
                             "<li>"+msg.rownumresult.username +"</li>"+"&nbsp;"+
                             "<a href='#'>"+"<span class='glyphicon glyphicon-home'>"+"</span>"+"</a>"+"&nbsp;"+ 
                             "<li>"+"("+msg.rownumresult.reporting_date+")"+"&nbsp"+"<p class='glyphicon glyphicon-lock'>"+"비밀글"+"</p>"+"</li>"+
                             "<li style='float: right;'>"+"<a onclick='guestUpdateForm("+msg.rownumresult.boardnum+")' id='updateButton"+msg.rownumresult.boardnum+"'>"+"<span class='glyphicon glyphicon-pencil'>"+"</a>"+"</li>"+
                             "<li style='float: right;'>"+"<a onclick='guestDelete("+msg.rownumresult.boardnum+")'>"+"<span class='glyphicon glyphicon-trash'>"+"</span>"+"</a>"+"</li>"+
                             "</ul>"+
                            "</table>"+
                            "<div class='inline'>"+
                            "<div style='border: gray;'>"+
                            "<div>"+
                               "<div class='big' style='overflow : hidden; border: gray; float : left; width : 20%;'>"+
                                  "<div class='small'>"+
                                  msg.usermini +   
                                  "</div>"+
                               "</div>"+
                               "<div style='margin-right:5%; margin-left: 20%;'>"+
                               "<textarea rows='10' cols='50' class='text form-control' id='guestContent"+msg.rownumresult.boardnum+"' readonly='readonly' style='background-color: transparent;width: 106.5%;'>"+msg.rownumresult.content+"</textarea>"+
                               
                           "</div>"+    
                            "</div>"+
                            "</div>"+
                            "<br/>"+
                            "<div style='overflow : hidden;background-color: #fffcd2;border-radius: 4px;'>"+
                            "<table id='commTable"+msg.rownumresult.boardnum+"'>"+
                            "</table>"+
                            "</div>"+
                            "<textarea class='form-control col-xs-3' cols='55' role='' id='comment' style='resize: none;' name='GuestBookCommContent"+msg.rownumresult.boardnum+"' placeholder='댓글을 입력하세요.'>"+
                            "</textarea>"+
                            "<button class='btn warning' onclick='guestBookCommInsert("+msg.rownumresult.boardnum+")'>"+"확인"+"</button>"+
                            "</div>" 
                            
              );
                                document.getElementsByName("GuestBookContent")[0].value = "";
                                $("#NO").hide();
           },
           error : function() {
              alert("통신실패, 댓글 입력 했는지 확인!");
           }
        })
   }
}



//방명록 수정Form(완성)
function guestUpdateForm(boardnum){
   
         alert("성공");
         $("#guestContent"+boardnum+"").removeAttr("readonly");
         $("#guestContent"+boardnum+"").focus(); 
//         $("#updateButton"+boardnum+"").value='저장'; <-- 이렇게 하면 왜 안될까
         document.getElementById("updateButton"+boardnum+"").value="저장";
         $("#updateButton"+boardnum+"").attr("onclick","guestUpdate("+boardnum+");");
         
}

//방명록 수정(완성)
function guestUpdate(boardnum){
   alert(boardnum); 
   var newGuestContent = document.getElementById("guestContent"+boardnum+"").value;
   var content = document.getElementsByName("guestUpdateContent")[0];
   $.ajax({
      url:"guestUpdate.do",
      type:"post",
      data:"boardnum="+boardnum+"&content="+newGuestContent,
      success:function(msg){
         alert("통신성공");
         alert(msg.Newdto);
         document.getElementById("updateButton"+boardnum+"").value="수정";
         $("#guestContent"+boardnum+"").attr("readonly","readonly");
         $("#updateButton"+boardnum+"").attr("onclick","guestUpdateForm("+boardnum+");");
      },
      error:function(){
         alert("통신실패");
      }
   })
   
   
}
//방명록 삭제 (완성)
function guestDelete(boardnum){
   alert(boardnum);
   
   $.ajax({
      url : "GuestBookDelete.do",
      type : "post",
      data : "boardnum="+boardnum,
      success:function(){
         alert("삭제성공");
         $("#GuestHide"+boardnum).remove();   
      },
      error : function(){
         alert("삭제 실패");
      }
   })
} 

//방명록 댓글입력(완성)
function guestBookCommInsert(boardnum){ 
   var commContent = document.getElementsByName("GuestBookCommContent"+boardnum+"")[0];
     
   $.ajax({
      url:"GuestBookCommInsert.do",
      type:"post",
      data:"commContent="+commContent.value+"&boardnum="+boardnum,
      success:function(msg){
         alert("통신성공"); 
         alert(msg.rownumresult.boardnum);
         $("#commTable"+msg.rownumresult.boardnum+"").append(
            "<tr id='commnum"+msg.rownumresult.commnum+"'>"+
               "<td id='commid"+msg.rownumresult.commnum+"'>"+"<a href='' style='font-weight: bold;'>"+msg.rownumresult.username+"</a>" + "</td>"+
               "<td id='comment"+msg.rownumresult.commnum+"'>"+msg.rownumresult.guestbookcomm+"</td>"+
               "<td style='font-size: 12px;'>("+msg.rownumresult.reporting_date+")</td>"+
               "<td>"+
               "<button class='btn btn-default btn-sm' id='comment_btn' type='button' value=' 삭제' onclick='guestBookCommDelete("+msg.rownumresult.commnum+")'>"+
               "<span class='glyphicon glyphicon-trash'>"+
               "</span>"+ ' 삭제'+
               "</td>"+
             "</tr>"
         ); 
         document.getElementsByName("GuestBookCommContent"+boardnum+"")[0].value="";
        
      }, 
      error:function(){
         alert("통신실패");
      }
   });
   
}

//방명록 댓글 삭제(완성)
function guestBookCommDelete(commnum){
   $.ajax({
      url : "GuestBookCommDelete.do",
      type : "post",
      data : "commnum="+commnum,
      success:function(msg){
         alert("통신성공");
         alert(commnum);
         $("#commnum"+commnum+"").remove(); 
      },
      error : function(){
         alert("통신실패"); 
      } 
   })
}



 