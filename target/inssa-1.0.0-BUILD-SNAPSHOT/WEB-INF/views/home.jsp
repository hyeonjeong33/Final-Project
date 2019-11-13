<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css">



<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<jsp:include page="left_home.jsp" />

<!-- Demo styles -->
<link rel="stylesheet" type="text/css" href="resources/css/home_timeline.css?after">

<script type="text/javascript">

//==========================이미지 불러오기==============================

/*    $(document).ready(function() {

            var item = '${timeLine.post_content}';
            alert(item);
            var item_p = item.split("<p>");
            alert(item_p);
            item_p1 = item_p[1].split("<br></p>");
            var item_cnt = item_p1[0].split("<img").length;
            var item_arr = item_p1[0].split("<img");

            for (var i = 1; i < item_cnt; i++) {

               $('.swiper-wrapper').append(
                     '<div class="swiper-slide"><img ' + item_arr[i]
                           + '</div>');
            } 
   }); */
            /* 
            function(){
               var item = document.query
               console.log(item);
               for(var i=0 ; i<item.length; i++){
                  console.log(item[i].value);
               }
            }
 
         );
    */

//=========================댓글창 '게시'버튼 활성/비활성===================

function proces(){
   var comment = $('.comment_text').val();
   
   if(comment == ''){
      $('.submit_btn').prop('disabled', 'disable'); 
   }else if(comment != ''){
      $('.submit_btn').prop('disabled', '');
   }
   alert("악");
}

//==========================모달==================================
function open_more_pop(){
    $("#more_pop_modal").show();
   
}

function close_more_pop(){
   $('#more_pop_modal').hide();
}

//========================selectOne==============================
function pop_details(bn){
        $('#myCenterModal').modal({
           remote : 'post_detail.do?boardnum='+bn
        });
    }
    
//=======================댓글 보기/숨기기==============================
 
$(document).ready(function(){
    $(".comment").hide();
    $(".hide_comm").css("display","none");
 });
 
function view_comm_js(commnum,groupno){
    $(".comment").show();
    $(".view_comm").css("display","none");
 }
 
function hide_comm_js(commnum,groupno){
    $(".re_comm_gn"+groupno).show();
    $(".hide_comm_box_gn"+groupno).hide();
    $(".re_comm1_gn"+groupno).hide();
 }

//========================검색=============================

$(document).on('click', '#search_btn', function(){
   //e.preventDefault();
   var url = "searchlist.do";
   url = url + "?keyword=" + $('#keyword').val();
   alert(url);
   location.href = url;
});

</script>

</head>
<body>
   <sec:authentication property="principal.username" var="username" />



   <div class="culmn">

      <div class="middlecolumn ">
         <h1></h1>

         <div class="card "
            style="width: 130%; height: 84.5rem; border: white;">
            <div class="input-group col-sm-3" style="float: right;">
               <input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword"> 
               <span class="input-group-btn" id="search_btn">
                  <button class="btn btn-default" type="button">
                     <span class="glyphicon glyphicon-search"></span>
                  </button>
               </span>
            </div>
            <div>
               <a href="home.do"><img src="resources/image/homelogo.png"></a>
            </div>


            <div
               class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
               id="changing_div" style="height: 90%; background-color: #fafafa !important;">

               <div class="box_all">
                  <c:forEach items="${timelinePosts}" var="timeLine" varStatus="status">


                     <div class="box_top">
                        <div>
                           <a class="profile_img mini_img">${postmaster[status.index].usermini }</a>
                        </div>
                        <div class="header_id">
                           <a class="comment_a">${timeLine.username}</a>
                        </div>
                        <button class="more_btn_top" onclick="open_more_pop();">
                           <span class="more" aria-label="옵션 더 보기"></span>
                        </button>


                     </div>
                     <div class="box_mid" style="height: 30em;">

                        <div class="swiper-slide" onclick="pop_details(${timeLine.boardnum });">${timeLine.post_thumbnail}</div>

                     </div>


                     <div class="box_bottom">
                        <div>
                        <span class="comment_a">${timeLine.username}</span> 
                        <span>${timeLine.postcomm }</span>
                        </div>
      

                        
<script type="text/javascript">

//=============================해시태그================================

$(document).on("click", ".hashtag_a", function() {
      var select_hash = $(this).attr('value');
      var hash = select_hash.split("#");
      location.href = "searchlist.do?keyword=" + encodeURIComponent(hash[1]);
});
   
$(document).ready(function(){
       var txt = '${timeLine.hashtag }';
       var tags = [];
        txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
          tags.push('<a href="#" class="hashtag_a" value='+ tag + '>'+tag+'</a>'+' ');
        });
        $(".postcomm_hashtag${timeLine.boardnum}").html(tags.join(''));
});
       
</script>
                        <p class="postcomm_hashtag${timeLine.boardnum}"></p>
                        
                        
          
         
          <%-- 
                        <div class="re_comm re_comm_gn${comment.groupno }">
                                 <div class="re_comm_line" id="view_line${comment.commnum}" style="float:left; color: #999;"> ― </div>
                                 <div class="view_comm" id="view_comm${comment.commnum }" onclick="view_comm_js(${comment.commnum},${comment.groupno })"> 답글 보기</div>
                              </div>
                              <div class="re_comm1 re_comm1_gn${comment.groupno }">   
                                   <div class="re_comm_line1" style="float:left; color: #999;"> ― </div>   
                                  <div class="hide_comm" onclick="hide_comm_js(${comment.commnum},${comment.groupno })"> 답글 숨기기ss</div>
                              </div>  
             --%>
             
                               <c:forEach items="${comm }" var="comment">
                        
                        
                        <c:if test="${comment.boardnum == timeLine.boardnum and comment.titletab == 0}">
   
                                 <div class="comment"><ul><li>
                                    <a class="comment_a" id="comment_a${comment.commnum}">${comment.username} </a><span class="postcomm_span">${comment.postscomm }</span></li></ul>
                                    <c:if test="${comment.username == myname }">
                                    <input type="button" onclick="delete_add_comm(${comment.commnum})" value="삭제">
                                    </c:if>
                                 </div>
                             </c:if>
                        </c:forEach>
                        
                        <p class="date">${timeLine.postdate }</p>
                     </div>
<%-- 
                     <div class="recomm_box">
                     <textarea class="comment_text" placeholder="댓글 달기..."
                        onkeydown="proces();" name="PostsCommContent${timeLine.boardnum}"></textarea>
                     <button class="submit_btn" disabled="disabled" type="button"
                        id="commInsertButton" onclick="postsCommInsert(${timeLine.boardnum})">게시</button>
                     </div>
 --%>
                     <div class="modal" id="more_pop_modal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-sm" role="document" style="margin-top: 25em;">
                           <div class="modal-content">
                              <div class="modal-body_pop">
                              <div><button class="pop_btn" tabindex="0" style="font-weight: 700;" onclick="location.href='select_post_detail.do?boardnum=${timeLine.boardnum}'">${timeLine.boardnum}ssaa게시글 이동</button></div>
                              <div><button class="pop_btn" onclick="close_more_pop();">취소</button></div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     
                  </c:forEach>
               </div>

            </div>
         </div>
      </div>


<!-- 정중앙 modal -->
<div class="modal modal-center fade" id="myCenterModal" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" data-backdrop="static" data-keyboard="false" style="margin-left: 27em;">
  <div class="modal-dialog modal-center" role="document" style="width:92%; max-width: 65em; margin-top: 12em;">
    <div class="modal-content">
    </div>
  </div>
</div> 











      <!-- Swiper -->   



      <!-- Swiper JS -->
      <script src="resources/js/posts/swiper.min.js"></script>

      <!-- Initialize Swiper -->
      <script>
         var swiper = new Swiper('.swiper-container', {
            slidesPerView : 1,
            spaceBetween : 30,
            loop : true,
            pagination : {
               el : '.swiper-pagination',
               clickable : true,
            },
            navigation : {
               nextEl : '.swiper-button-next',
               prevEl : '.swiper-button-prev',
            },
         });
      </script>













      <div class="container">
         <nav class="nav ">
            <ul class="nav flex-column">
               <li class="nav-item" style="background-color: white; border-left: white;"><a class="nav-link" href="home.do" style="color: black;">타임라인</a></li>
               <li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
               <li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
               <li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
               <li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
               <li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
            </ul>
         </nav>
      </div>



   </div>


</body>
</html>