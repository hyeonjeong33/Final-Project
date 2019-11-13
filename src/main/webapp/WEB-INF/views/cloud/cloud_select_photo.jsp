<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

	function openPopUp() {
		window.open("createFolder.do?username=${username}", "폴더추가하기",
				"width=400,height=400")

	}
	
	function folder_muldel(){
		var namelist = [];
		$("input[name=foldername]:checked").each(function() {
			var name = $(this).val();
			namelist.push(name);
			var username = $("#username").val();
			alert(username);
		})
		
		if(namelist == null || namelist== ""){
			alert("삭제할 폴더 엄따!!!");
		}else{
			//alert(namelist);
			$.ajax({
				type : "post",
	            url : "folder_muldel.do",
	            data : "namelist="+namelist,
	            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	            success : function(data){
	            	alert("success");
	            	location.href="cloud.do"; 
	            	
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
		$(".folder_checkbox").show();
		$("#cancel_delete").show();
	}
	
	function cancel_button(){
		$("#before_delete").show();
		$("#after_delete").hide();
		$(".folder_checkbox").hide();
		$("#cancel_delete").hide();
	}
	
	$(document).on('click', '#search_btn', function(){
		//e.preventDefault();
		var url = "searchlist.do";
		url = url + "?keyword=" + $('#keyword').val();
		//alert(url);
		location.href = url;
		
	});
	
</script>

<style type="text/css">
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
}

.glyphicon {
	color: black;
}

#after_delete, .folder_checkbox, #cancel_delete{
	display: none;
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

</style>

</head>
<body>


	<input type="hidden" value="${username }" id="username">
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
					<a href="home.do"><img src="resources/image/homelogo.png"></a>
				</div>


				<div
					class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
					id="changing_div" style="height: 90%">
					<!--           		<div class="navigation-bar"> -->
					<!-- 						<div role="button" aria-disabled="false" title="" -->
					<!-- 							class="cw-has-left-icon cw-button" tabindex="0"> -->
					<!-- 							<span class="title" onclick="location.href='cloud.do'">ICWorld Cloud Drive</span> -->
					<!-- 						</div> -->
					<!-- 						<div class="sort-action-menu-container sort-by-action-menu-button"> -->
					<!-- 							<div role="button" aria-disabled="false" title="" -->
					<!-- 								class="cw-has-right-icon sort-action-menu-button dr-text-size-small cw-button" -->
					<!-- 								tabindex="0"> -->
					<%--  									<a onclick="location.href='gotoUpload.do?username=${username}'"><span class="glyphicon glyphicon-picture">사진추가</span></a> --%>
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						<div class="files-grid-title-view text-center"> -->
					<!-- 							<div class="title" role="heading" aria-level="2"> -->
					<!-- 								<a data-toggle="modal" data-target="#myModal" onclick="openPopUp();"> -->
					<!-- 						          <span class="glyphicon glyphicon-folder-close" style="cursor:pointer;">폴더추가</span> -->
					<!-- 						        </a> -->
					<!-- 							</div> -->
					<!-- 							<div class="alternate-title" role="heading" aria-level="2"> -->
					<!-- 								<a href="#"> -->
					<!-- 						          <span class="glyphicon glyphicon-trash">폴더삭제</span> -->
					<!-- 						        </a> -->
					<!-- 							</div> -->
					<!-- 							<div class="subtitle" role="heading" aria-level="3"> -->
					<!-- 								<span></span> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

					<!-- 					</div> -->




					<c:choose>
						<c:when test="${empty folder }">
						<div class="grid-error-view">
							<h2 class="error-title">폴더가 없습니다.</h2>
							<h3 class="error-text">폴더를 생성 후 사진을 저장해주세요.</h3>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-default btn-sm" onclick="openPopUp();">
					          <span class="glyphicon glyphicon-folder-close"></span> 폴더 생성
					        </button>
					    </div>
						</c:when>
						<c:otherwise>
						<div class="pull-right">
							<button type="button" onclick="openPopUp();" class="btn btn-default">
								<span class="glyphicon glyphicon-folder-close"></span> 폴더 추가
							</button>
							<button type="button" onclick="hide_button()" id="before_delete" class="btn btn">
								<span class="glyphicon glyphicon-trash"></span> 삭제 
							</button>
							<button type="button" onclick="folder_muldel()" id="after_delete" class="btn btn">
								<span class="glyphicon glyphicon-trash"></span> 폴더 삭제 
							</button>
							<button type="button" onclick="cancel_button()" id="cancel_delete" class="btn btn">
								<span class="glyphicon glyphicon-remove"></span> 삭제 취소 
							</button>
						</div>
							<form action="">
								<c:forEach items="${folder }" var="myfolder">
									<div style="margin-top: 5%;">
										<div class="text-center pull-left" style="margin: 3%;">
											<div>
												<a href="mycloud_photo.do?username=${username }&cloudfolder=${myfolder.cloudfolder}"><img alt="폴더" src="resources/image/folder.png"></a>
											</div>
											<br>
											<input type="checkbox" name="foldername" class="folder_checkbox" value="${myfolder.cloudfolder }"/>
											<div>
												<a href="mycloud_photo.do?username=${username }&cloudfolder=${myfolder.cloudfolder}">${ myfolder.cloudfolder}</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</form>
						</c:otherwise>
					</c:choose>




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