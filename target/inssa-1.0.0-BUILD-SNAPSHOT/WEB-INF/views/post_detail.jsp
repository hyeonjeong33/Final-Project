<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>


<!-- Link Swiper's CSS -->
<link rel="stylesheet" type="text/css"
   href="resources/css/swiper.min.css">

<!-- Demo styles -->
<link rel="stylesheet" type="text/css"
   href="resources/css/post_detail.css">


<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script src="resources/js/posts/post_detail.js"></script> -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/posts/postscomm.js"></script>

<script type="text/javascript">

function reload(){
   window.location.reload();
}



//========================이미지 불러오기====================

$(document).ready(function(){

   var item = '${dto.post_content}';
   /* alert(item); */
   var item_p = item.split("<p>");
   item_p1 = item_p[1].split("<br></p>");
   
/*    alert(item_p[1]);
   alert(item_p1[0]);  */
   
   var item_cnt = item_p1[0].split("<img").length;
   var item_arr = item_p1[0].split("<img");
   
   
/*    for(var i = 1; i < item_cnt; i++){
      var item_cnt1 = item_cnt[i].split("style|>").length;
      var item_arr1 = item_arr[i].split("style|>");
      alert(item_cnt1);
      alert(item_arr1);
   } */
      
   for(var i = 1; i < item_cnt; i++){ 
         /* document.body.append(item_arr[i]); */
         
         $('.swiper-wrapper').append('<div class="swiper-slide"><img ' + item_arr[i]+ '</div>');
      /*    $("#img"[i]).append("<img " + item_arr[i]);  */
   } 
   
});

//==========================해시태그=============================
/* 
$(document).ready(function(){
   
   var content = document.getElementById('right_body').innerHTML;
   var splitedArray = content.split(' ');
   var linkedContent = '';
   for(var word in splitedArray)
   {
     word = splitedArray[word];
      if(word.indexOf('#') == 0 || word.indexOf('@') == 0)
      {
         word = '<a href=\'링크\'>'+word+'</a>';
      }
      linkedContent += word+' ';
   }
   document.getElementById('right_body').innerHTML = linkedContent; 
   
});
 */
 
 $(document).on("click",".hashtag_a",function(){
       var select_hash = $(this).attr('value');
       var hash = select_hash.split("#");
       //alert(encodeURIComponent(select_hash));
       //var hash = select_hash.split("#");
       //alert(hash[1]);
       location.href="searchlist.do?keyword="+encodeURIComponent(hash[1]);
       //location.href="hashtag_list.do?hashtag="+hash[1];
    });

 
//==========================대댓글=================================
 
 function add_recommForm(commnum,boardnum,groupno){
    alert("컴넘="+commnum+"보드넘"+boardnum+"그룹넘"+groupno);
       alert("대댓글폼 바꾸따");
       var a = $(".comment_a"+commnum).html();
       alert("아이디 : " + a);
       $('.comment_text').empty();
       $('.comment_text').val('@'+a+' ');
       $('.comment_text').focus();
       $('#commInsertButton').attr("onclick","add_recomm("+commnum+","+boardnum+","+groupno+")"); 
      
    }
  
    function add_recomm(commnum,boardnum,groupno){
       alert("add_recomm 함수 실행");
       alert("컴넘="+commnum+"보드넘"+boardnum+"그룹넘"+groupno);
       var content = document.getElementsByName("PostsCommContent"+boardnum+"")[0].value;
       $.ajax({
          url : "add_comm.do",
          type : "post",
          data : "commnum="+commnum+"&boardnum="+boardnum+"&content="+content+"&groupno="+groupno,
          success : function(msg){
             alert("컨텐"+msg.content+"이름"+msg.username);
            alert("대댓글이다")
               $(".comment_box"+commnum).append( 
                  "<div id='hide_comm_box"+commnum+"' class='hide_comm_box hide_comm_box$"+commnum+" hide_comm_box_gn"+groupno+"'>"+   
                     "<div class='comment'><ul><li>"+
                        "<a class='profile_img'><img src='resources/image/zzang.png' class='mini_img'></a>"+
                        "<a class='comment_a'>"+ msg.username +"</a><span class='postcomm_span'>"+ msg.content +"</span></li></ul>"+
                        "<!-- <button class='more_btn'><span class='more' aria-label='옵션 더 보기'></span></button> -->"+
                     "</div>"+
                     "<input type='button' onclick='delete_add_comm("+commnum+")' value='삭제'>"
                     
                  ); 
                $(".re_comm_gn"+groupno).hide();
                $(".re_comm1_gn"+groupno).show();
                $(".hide_comm_box_gn"+groupno).css("display","block");
                $('#commInsertButton').attr("onclick","postsCommInsert("+boardnum+")");
            document.getElementsByName("PostsCommContent"+boardnum+"")[0].value="";
               
          },
          error : function(){
             alert("통신실패");
          }
       })
    }
    
function delete_comm(commnum){
   alert(commnum);
   $.ajax({
      url : "PostsCommDelete.do",
      type : "post",
      data : "commnum="+commnum,
      success : function(msg){
         alert("통신성공");
         $(".comment_box"+commnum+"").hide();
         $("#view_comm"+commnum+"").hide();
         $("#view_line"+commnum+"").hide();
      }, 
      error : function(){
         alert("통신실패");
      }
   })
}

function delete_add_comm(commnum){
   alert("대댓글 삭제 함수");
   $.ajax({
      url : "PostsCommDelete.do",
      type : "post",
      data : "commnum="+commnum,
      success : function(msg){
         alert("통신성공");
         $("#hide_comm_box"+commnum+"").hide();
      },
      error : function(){
         alert("통신실패");
      }
   })
   
}
/*  
 $(document).on("click",".recomm",function(){
    var a = $(".comment_a").html();
    $('.comment_text').append('@'+a+' ');
    $('.comment_text').focus();
     
 });
 */     
 

     
 $(document).ready(function(){
    var txt = '${dto.hashtag }';
    var tags = [];
     txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
       tags.push('<a href="#" class="hashtag_a" value='+ tag + '>'+tag+'</a>'+' ');
     });
     $(".postcomm_hashtag").html(tags.join(''));
   });
 
 

//=========================댓글창 '게시'버튼 활성/비활성===================

function proces(){

   var comment = $('.comment_text').html();
   
   if(comment == ''){
      $('.submit_btn').prop('disabled', false); 
   }else if(comment != ''){
      $('.submit_btn').prop('disabled', true);
   }
   
}



//========================대댓글==================================
 $(document).ready(function(){
    $(".re_comm").show();
    $(".re_comm1").hide();
    $(".hide_comm_box").css("display","none");
 });
 
   
/*  
$(document).on("click",".view_comm",function(commnum){
    //$('.hide_comm').append($('.comment_box'));
    $(".re_comm").hide();
    $(".hide_comm_box").show();
    $(".re_comm1").show();
   
 });    
 
 $(document).on("click",".hide_comm",function(commmum){
    //$('.hide_comm').append($('.comment_box'));
    $(".re_comm").show();
    $(".hide_comm_box").hide();
    $(".re_comm1").hide();
   
 });
 */
 
 function view_comm_js(commnum,groupno){
    alert(commnum);
    $(".re_comm_gn"+groupno).hide();
    $(".hide_comm_box_gn"+groupno).show();
    $(".re_comm1_gn"+groupno).show();
 }
 
 function hide_comm_js(commnum,groupno){
    $(".re_comm_gn"+groupno).show();
    $(".hide_comm_box_gn"+groupno).hide();
    $(".re_comm1_gn"+groupno).hide();
 }


//==========================모달==================================
function open_more_pop(){
    $("#more_pop_modal").show();
   
}

function close_more_pop(){
   $('#more_pop_modal').hide();
}


</script>

</head>
<body>


   <sec:authentication property="principal.username" var="myname" />
   <sec:authentication property="principal.usermini" var="usermini" />

   <div class="modal-header">
      <button type="button" class="close_btn" class="close"
         data-dismiss="modal" aria-label="Close" aria-hidden="true"
         onclick="reload();">X</button>
   </div>

   <div class="modal-body">
      <div class="right_container">

         <div class="right_header">
            <div>
               <a class="profile_img">
                  ${myusermini.usermini}
               </a>
            </div>
            <div class="header_id">
               <a class="comment_a">${dto.username}</a>
            </div>
            <c:if test="${dto.username == myname }">
               <button class="more_btn_top" onclick="open_more_pop();">
                  <span class="more" aria-label="옵션 더 보기"></span>
               </button>
            </c:if>
         </div>



         <div id="right_body" style="-ms-overflow-style: none;">
            <div class="postcomm">
               <a class="profile_img">${myusermini.usermini}</a>
               <a class="comment_a"> ${dto.username}</a>
               <span style="margin-left: 0.5em;">${dto.postcomm }(postcomm)</span>
               <p class="postcomm_hashtag"></p>
            </div>
            <div class="postcomm_bottom_date">${dto.postdate }</div>

            <div id="post_comment">

               <%--댓글시작 --%>
               <c:choose>
                  <c:when test="${empty comm }">
                  </c:when>
                  <c:otherwise>

                     <c:forEach items="${comm }" var="comment" varStatus="status">
                        <c:if
                           test="${comment.boardnum == dto.boardnum and comment.titletab == 0}">
                           <%--                      <fmt:formatDate var="cdate" --%>
                           <%--                      value="${comment.reporting_date}" --%>
                           <%--                         pattern="yyyy.MM.dd HH:mm" /> --%>
                           <div class="comment_box${comment.commnum}">
                              <div class="comment">
                                 <ul>
                                    <li><a class="profile_img">
                                          <!-- 여기에 미니미이미지 들어가야함!!! -->
                                          ${commdto[status.index].usermini}
                                       </a>
                                       <a class="comment_a${comment.commnum} comment_a"
                                          id="comment_a">${comment.username} </a><span
                                          class="postcomm_span">${comment.postscomm }</span></li>
                                 </ul>
                                 <!-- <button class="more_btn"><span class="more" aria-label="옵션 더 보기"></span></button> -->
                              </div>
                              <div class="comment_bottom">
                                 <input type="button" class="recomm"
                                    onclick="add_recommForm(${comment.commnum},${comment.boardnum},${comment.groupno});"
                                    value="답글달기">
                                 <c:if test="${comment.username == myname}">
                                    <input type="button" class="del_btn"
                                       onclick="delete_comm(${comment.commnum})" value="삭제">
                                 </c:if>
                              </div>



                              <div class="re_comm re_comm_gn${comment.groupno }">
                                 <div class="re_comm_line" id="view_line${comment.commnum}"
                                    style="float: left; color: #999;">―</div>
                                 <div class="view_comm" id="view_comm${comment.commnum }"
                                    onclick="view_comm_js(${comment.commnum},${comment.groupno })">
                                    답글 보기</div>
                              </div>
                              <div class="re_comm1 re_comm1_gn${comment.groupno }">
                                 <div class="re_comm_line1" style="float: left; color: #999;">
                                    ―</div>
                                 <div class="hide_comm"
                                    onclick="hide_comm_js(${comment.commnum},${comment.groupno })">
                                    답글 숨기기</div>
                              </div>



                           </div>


                        </c:if>

                        <c:if
                           test="${comment.boardnum == dto.boardnum and comment.titletab > 0}">

                           <div id="hide_comm_box${comment.commnum }"
                              class="hide_comm_box hide_comm_box${comment.commnum} hide_comm_box_gn${comment.groupno}">
                              <div class="comment">
                                 <ul>
                                    <li><a class="profile_img">
                                    ${commdto[status.index].usermini}</a> 
                                    <a class="comment_a" id="comment_a${comment.commnum}">${comment.username}
                                    </a><span class="postcomm_span">${comment.postscomm }</span></li>
                                 </ul>
                                 <c:if test="${comment.username == myname }">
                                    <input type="button"
                                       onclick="delete_add_comm(${comment.commnum})" value="삭제">
                                 </c:if>
                                 <!-- <button class="more_btn"><span class="more" aria-label="옵션 더 보기"></span></button> -->
                              </div>
                           </div>
                        </c:if>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
               <!-- END 댓글 -->

            </div>

         </div>


         <div class="comment_container">
            <form class="comment_form" method="POST">



               <textarea class="comment_text" placeholder="댓글 달기..."
                  onkeydown="proces();" name="PostsCommContent${dto.boardnum}"></textarea>
               <button class="submit_btn" disabled="disabled" type="button"
                  id="commInsertButton" onclick="postsCommInsert(${dto.boardnum})">게시</button>


            </form>
         </div>

      </div>





      <div class="modal" id="more_pop_modal" tabindex="-1" role="dialog">
         <div class="modal-dialog modal-sm" role="document"
            style="margin-top: 15em;">
            <div class="modal-content">
               <div class="modal-body_pop">
                  <div>
                     <button class="pop_btn" tabindex="0"
                        style="color: #ed4956; font-weight: 700;"
                        onclick="deletePost(${dto.boardnum})">게시글 삭제</button>
                  </div>
                  <div>
                     <button class="pop_btn" onclick="close_more_pop();">취소</button>
                  </div>
                  <!-- 
            <div><a>공유하기</a></div>
            <div><a class="close_pop" style="color: #ed4956;" data-dismiss="modal">취소하기</a></div>
          -->
               </div>
            </div>
         </div>
      </div>











      <!-- Swiper -->

      <div class="swiper-container">

         <div class="swiper-wrapper"></div>

         <!-- Add Pagination -->
         <div class="swiper-pagination"></div>
         <!-- Add Arrows -->
         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>


      </div>




      <!-- <input type="button" id="check" value="잘려라 이미지" onclick="click();"> -->

   </div>










   <!-- Swiper JS -->
   <script src="resources/js/posts/swiper.min.js"></script>

   <!-- Initialize Swiper -->
   <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>

</body>
</html>