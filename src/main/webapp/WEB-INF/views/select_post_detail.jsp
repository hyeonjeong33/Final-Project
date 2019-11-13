<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/swiper.min.css">



<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<jsp:include page="left_home.jsp" />

<!-- Demo styles -->
<link rel="stylesheet" type="text/css"
	href="resources/css/select_post_detail.css?after">

<script type="text/javascript">

//==========================이미지 불러오기==============================

$(document).ready(function(){

   var item = '${posts.post_content}';
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
 
 $(document).on("click",".hashtag_a",function(){
       var select_hash = $(this).attr('value');
       var hash = select_hash.split("#");
       //alert(encodeURIComponent(select_hash));
       //var hash = select_hash.split("#");
       //alert(hash[1]);
       location.href="searchlist.do?keyword="+encodeURIComponent(hash[1]);
       //location.href="hashtag_list.do?hashtag="+hash[1];
    });

//=========================댓글창 '게시'버튼 활성/비활성===================

function proces(){

	var comment = $('.comment_text').val();
	
	if(comment == ''){
		$('.submit_btn').prop('disabled', 'disable'); 
	}else if(comment != ''){
		$('.submit_btn').prop('disabled', '');
	}
	
}

//==========================모달==================================
function open_more_pop(){
    $("#more_pop_modal").show();
   
}

function close_more_pop(){
   $('#more_pop_modal').hide();
}

//=======================댓글 보기/숨기기==============================
 
$(document).ready(function(){
    $(".re_comm").show();
    $(".re_comm1").hide();
    $(".hide_comm_box").css("display","none");
 });
 
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

//========================검색=============================

$(document).on('click', '#search_btn', function(){
	//e.preventDefault();
	var url = "searchlist.do";
	url = url + "?keyword=" + $('#keyword').val();
	//alert(url);
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
					<input type="text" class="form-control" placeholder="검색"
						name="keyword" id="keyword"> <span class="input-group-btn"
						id="search_btn">
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
					id="changing_div"
					style="height: 90%; background-color: #fafafa !important;">

					<div class="box_all">


						<!-- Swiper -->

						<div class="swiper-container">

							<div class="swiper-wrapper"></div>

							<!-- Add Pagination -->
							<div class="swiper-pagination"></div>
							<!-- Add Arrows -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>

						</div>



						<div class="right_container">

							<div class="right_header">
								<div>
									<a class="profile_img"> <img
										src="resources/image/zzang.png" class="mini_img">
									</a>
								</div>
								<div class="header_id">
									<a class="comment_a">${posts.username}</a> <span class="dot">•</span>
									<a class="add_friend">친구추가</a>
								</div>
								<c:if test="${posts.username == myname }">
									<button class="more_btn_top" onclick="open_more_pop();">
										<span class="more" aria-label="옵션 더 보기"></span>
									</button>
								</c:if>
							</div>



							<div id="right_body" style="-ms-overflow-style: none;">
								<div class="postcomm">
									<a class="profile_img"><img src="resources/image/zzang.png"
										class="mini_img"></a> <a class="comment_a">
										${posts.username}</a> <span style="margin-left: 0.5em;">${posts.postcomm }(postcomm)</span>
									<p class="postcomm_hashtag"></p>
								</div>
								<div class="postcomm_bottom_date">${posts.postdate }</div>

								<div id="post_comment">

									<%--댓글시작 --%>
									<c:choose>
										<c:when test="${empty comm }">
										</c:when>
										<c:otherwise>

											<c:forEach items="${comm }" var="comment">
												<c:if
													test="${comment.boardnum == posts.boardnum and comment.titletab == 0}">
													<%--                      <fmt:formatDate var="cdate" --%>
													<%--                      value="${comment.reporting_date}" --%>
													<%--                         pattern="yyyy.MM.dd HH:mm" /> --%>
													<div class="comment_box${comment.commnum}">
														<div class="comment">
															<ul>
																<li><a class="profile_img"><img
																		src="resources/image/zzang.png" class="mini_img"></a>
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
																<input type="button"
																	onclick="delete_comm(${comment.commnum})" value="삭제">
															</c:if>
														</div>

														<div class="re_comm re_comm_gn${comment.groupno }">
															<div class="re_comm_line"
																id="view_line${comment.commnum}"
																style="float: left; color: #999;">―</div>
															<div class="view_comm" id="view_comm${comment.commnum }"
																onclick="view_comm_js(${comment.commnum},${comment.groupno })">
																답글 보기</div>
														</div>
														<div class="re_comm1 re_comm1_gn${comment.groupno }">
															<div class="re_comm_line1"
																style="float: left; color: #999;">―</div>
															<div class="hide_comm"
																onclick="hide_comm_js(${comment.commnum},${comment.groupno })">
																답글 숨기기</div>
														</div>

													</div>


												</c:if>

												<c:if
													test="${comment.boardnum == posts.boardnum and comment.titletab > 0}">

													<div id="hide_comm_box${comment.commnum }"
														class="hide_comm_box hide_comm_box${comment.commnum} hide_comm_box_gn${comment.groupno}">
														<div class="comment">
															<ul>
																<li><a class="profile_img"><img
																		src="resources/image/zzang.png" class="mini_img"></a>
																	<a class="comment_a" id="comment_a${comment.commnum}">${comment.username}
																</a><span class="postcomm_span">${comment.postscomm }</span></li>
															</ul>
															<c:if test="${comment.username == myname }">
																<input type="button"
																	onclick="delete_add_comm(${comment.commnum})"
																	value="삭제">
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
										onkeydown="proces();" name="PostsCommContent${posts.boardnum}"></textarea>
									<button class="submit_btn" disabled="disabled" type="button"
										id="commInsertButton"
										onclick="postsCommInsert(${posts.boardnum})">게시</button>

								</form>
							</div>
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
											onclick="deletePost(${posts.boardnum})">게시글 삭제</button>
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


				</div>
			</div>
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


		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"
						style="background-color: white; border-left: white;"><a
						class="nav-link" href="home.do" style="color: black;">타임라인</a></li>
					<li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
					<li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
					<li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
					<li class="nav-item "><a class="nav-link"
						href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>