
//게시글 댓글입력(완성)
function postsCommInsert(boardnum){ 
	var commContent = document.getElementsByName("PostsCommContent"+boardnum+"")[0];
	$.ajax({
		url:"PostsCommInsert.do",
		type:"post",
		data:"commContent="+commContent.value+"&boardnum="+boardnum,
		success:function(msg){
		
			console.log(commContent);
			$(".no_comm").hide(); 
			$("#post_comment").append(
				"<div class='comment_box"+msg.rownumresult.commnum+"'>"+ 
				"<div class='comment'><ul><li>"+
				"<a class='profile_img'><div class='mini_img'>"+msg.mini+"</div></a>"+
				"<a href='friendhome.do?username="+msg.rownumresult.username+"' class='comment_a comment_a"+msg.rownumresult.commnum+"'>"+ msg.rownumresult.username +"</a><span class='postcomm_span'>"+ msg.rownumresult.postscomm +"</span></li></ul>"+
				"<!-- <button class='more_btn'><span class='more' aria-label='옵션 더 보기'></span></button> -->"+
				"</div>"+
				"<div class='comment_bottom'>"+
				"<input type='button' class='recomm' onclick='add_recommForm("+msg.rownumresult.commnum+","+msg.rownumresult.boardnum+","+msg.rownumresult.groupno+");' value='답글달기'>"+
				"<input type='button' class='del_btn' onclick='delete_comm("+msg.rownumresult.commnum+")' value='삭제'>"+
				"</div>"+
				"<div class='re_comm re_comm_gn"+msg.rownumresult.groupno+"'>"+
				"<div class='re_comm_line' style='float:left; color: #999;'> ― </div>"+
				"<div class='view_comm' onclick='view_comm_js("+msg.rownumresult.commnum+","+msg.rownumresult.groupno+")'> 답글 보기 </div>"+"</div>"+
				
				"<div class='re_comm1 re_comm1_gn"+msg.rownumresult.groupno+"'>"+
				"<div class='re_comm_line1' style='float:left; color: #999;'> ― </div>"+
				"<div class='hide_comm' onclick='hide_comm_js("+msg.rownumresult.commnum+","+msg.rownumresult.groupno+")'> 답글 숨기기</div>"+"</div>"
				
				
			);
			$(".re_comm").show();
			$(".re_comm1").hide();
			document.getElementsByName("PostsCommContent"+boardnum+"")[0].value="";
			
		}, 
		error:function(){
			alert("통신실패ㄴㅇㄹㄴㄹㅇ");
			console.log(commContent);
		}
	});
	
}

function postsReCommInsert(boardnum){ 
	var commContent = document.getElementsByName("PostsCommContent"+boardnum+"")[0];
	$.ajax({
		url:"PostsCommInsert.do",
		type:"post",
		data:"commContent="+commContent.value+"&boardnum="+boardnum,
		success:function(msg){
			alert("통신성ddd2dads"); 
			$(".hide_comm").append(
				"<div class='comment'><ul><li>"+
				"<a class='profile_img'><div class='mini_img'>${myusermini.usermini}</div></a>"+
				"<a class='comment_a'>"+ msg.rownumresult.username +"</a><span class='postcomm_span'>"+ msg.rownumresult.postscomm +"</span></li></ul>"+
				"<!-- <button class='more_btn'><span class='more' aria-label='옵션 더 보기'></span></button> -->"+
				"</div>"+
				"<div class='comment_bottom'><a class='recomm'>답글달기</a>"+
				"</div>"
					
			); 
			document.getElementsByName("PostsCommContent"+boardnum+"")[0].value="";
		}, 
		error:function(){
			alert("통신실패");
		}
	});
	
}

//게시글 댓글 삭제(완성)
function postsCommDelete(commnum){
	$.ajax({
		url : "PostsCommDelete.do",
		type : "post",
		data : "commnum="+commnum,
		success:function(msg){
			alert("통신성공");
			$("#commnum"+commnum+"").remove(); 
		},
		error : function(){
			alert("통신실패"); 
		} 
	})
}

//게시글 댓글 수정(미완성)
function postsCommUpdate(commnum){
	alert(commnum);
	
}


//게시글 삭제(삭제는 되는데 창이 안닫힘)
function deletePost(boardnum){
    alert("ㅇㅇasd"+boardnum);
    
    $.ajax({
      url :"deletePost.do",
      type : "post",
      data : "boardnum="+boardnum,
      success : function(msg){
         alert(msg.result);
         window.location.reload();
      },
      error : function(msg){
         alert("통신실패");
      }
    });
}
 