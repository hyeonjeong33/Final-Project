<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="../left_home.jsp" />

<script type="text/javascript">

	function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
	}
	
	function photo_muldel(){
		var numlist = [];
		$("input[name=seq]:checked").each(function() {
			var num = $(this).val();
			numlist.push(num);
		})
		
		if(numlist == null || numlist == ""){
			alert("삭제할 파일 엄따!!!!")
		}else{
			$.ajax({
				type : "post",
	            url : "photo_muldel.do",
	            data : "numlist="+numlist,
	            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
	            	alert("success");
	            	location.href="cloud.do"
	            },
	            error:function(){
	            	console.log("Error!!!!!!");
	            }
			});
		}
	}
	
	function hide_button(){
		$("#before_delete").hide();
		$("#after_delete").show();
		$(".photo_checkbox").show();
		$("#cancel_delete").show();
	}
	
	function cancel_button(){
		$("#before_delete").show();
		$("#after_delete").hide();
		$(".photo_checkbox").hide();
		$("#cancel_delete").hide();
	}
	
	$(document).on('click', '#search_btn', function(){
		//e.preventDefault();
		var url = "searchlist.do";
		url = url + "?keyword=" + $('#keyword').val();
		alert(url);
		location.href = url;
		
	});
	
</script>


<style type="text/css">

	/* navbar */
	
	#changing_div{
		height: 90%;
		padding: 0;
	}

	.navbar {
	  overflow: hidden;
	  background-color: #333;
	  position: fixed;
	  width: 100%;
	}
	
	.navbar a {
	  float: left;
	  display: block;
	  color: #f2f2f2;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}
	
	.navbar a:hover {
	  background: #ddd;
	  color: black;
	}
	
	.main {
	  padding: 16px;
	  margin-top: 30px;
	  height: 1500px; /* Used in this example to enable scrolling */
	}

    .error-title{
    margin-left: 10px;
    margin-right: 10px;
    margin-top:25%;
    color: gray;
    text-align: center;
    white-space: pre-line;
    cursor: default;
    }
    
    .grid-error-view{
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    font-family: SFNSText,Helvetica Neue,sans-serif;
    	
    }
    
    .error-text{
    	margin-top: 40px;
   		margin-block-start: 40px;
   		font-size: 17px;
	    color: gray;
	    text-align: center;
	    white-space: pre-line;
	    cursor: default;
    }
    
    .navigation-bar {
/*     position: fixed; */
    inline-size: 100%;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -webkit-box-align: stretch;
    -webkit-align-items: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
    border-bottom: 1px solid #e2e2e2;
    background-color: white;
    padding: 0.8%;
</style>

<style>


#myBtn {
  
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}

.photo_checkbox, #after_delete, #cancel_delete{
	display: none;
}

.posts {
    position: relative;
    width: 27%; /* 가로 크기 지정 */
    float: left;
    margin: 1em;
/*     background-color: white; */
    margin-bottom: 20%;
    
}

.post_box {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin-top: 2em;
    
} 


.posts img {
    min-width: -webkit-fill-available;
    min-height: 20em;
    max-height: 20em;
    max-width: -webkit-fill-available;
    margin-top: 27%;
    margin-bottom: 20%;
    
}

#photo_info{
	margin-right: 2%;
	margin-top: 10%;
	
}

</style>
</head>
<body>
<sec:authentication property="principal.username" var="username" />


   <div class="culmn">
     
      <div class="middlecolumn ">
         <h1></h1>
         
          <div class="card" id="home_card">
            <div class="input-group col-sm-3" style="float: right;">
					<input type="text" class="form-control" placeholder="검색" name="keyword" id="keyword"> 
					<span class="input-group-btn" id="search_btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
            <div>
               <a href="home.do"><img src="resources/image/homelogo.png" ></a>
            </div>
            
            
            <div class="card example-1 scrollbar-deep-purple bordered-deep-purple thin" id="changing_div">

					<div class="navigation-bar">
						<div role="button" aria-disabled="false" title=""
							class="cw-has-left-icon cw-button" tabindex="0">
							<span class="title" onclick="location.href='cloud.do'">ICWorld 사진첩</span>
						</div>
						<div class="files-grid-title-view text-center">
							<div class="title" role="heading" aria-level="2">
								<span class="">폴더 이름 받아오기</span><!-- 폴더 이름 넣어야함 -->
							</div>
						</div>
						<div class="sort-action-menu-container sort-by-action-menu-button">
							<div role="button" aria-disabled="false" title=""
								class="cw-has-right-icon sort-action-menu-button dr-text-size-small cw-button"
								tabindex="0">
								    <a onclick="hide_button()">
						          <span class="glyphicon glyphicon-trash" id="before_delete">삭제</span>
						        </a>
						        <a onclick="cancel_button()">
						          <span class="glyphicon glyphicon-trash" id="cancel_delete">삭제취소</span>
						        </a>
								<a onclick="photo_muldel()">
						          <span class="glyphicon glyphicon-trash" id="after_delete">사진삭제</span>
						        </a>
 									<a onclick="location.href='gotoUpload.do?username=${username}'"><span class="glyphicon glyphicon-picture">사진 추가</span></a>
							</div>
						</div>
					</div>
									
				

<!-- 					<div> -->
<!-- 						<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button> -->
<!-- 					</div> -->

					<div>
         <c:choose>
         <c:when test="${empty photo}">
	         <div class="grid-error-view">
	         <h2 class="error-title">이 폴더는 비어 있습니다.</h2>
	         <h3 class="error-text">사진을 추가해 주세요.</h3>
	         </div>
         </c:when>
         <c:otherwise>
	         <c:forEach items="${photo }" var="myphoto" varStatus="status">
	          <div class="posts">
	          	<div>
	          	<input type="checkbox" name="seq" class="photo_checkbox" value="${myphoto.seq }"/>
	          	</div>
	          	<br/>
	          	<div id="photo_info">
		         <p>${ myphoto.contentname}</p>
		         <p>${myphoto.seq }</p>
		         </div>
		        <div class="post_box"> 
		         <img src="${pageContext.request.contextPath }/resources/uploadimage/${myphoto.contentname}">
		        </div> 
		         <br/>
		         
		      </div>
         	 </c:forEach>
         </c:otherwise>
        
         
         
         </c:choose>
            

				</div>
            </div>
         </div>
      </div>


    <div class="container">
         <nav class="nav ">
            <ul class="nav flex-column">
               <li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
               <li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
               <li class="nav-item "><a class="nav-link" href="diary.do">다이어리</a></li>
               <li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
               <li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
               <li class="nav-item " style="background-color:white;border-left:white;"><a class="nav-link" style="color: black;" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
            </ul>
         </nav>
      </div>

      

   </div>


</body>
</html>