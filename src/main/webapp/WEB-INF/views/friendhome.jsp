<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="friend_left_home.jsp" />
<link rel="stylesheet" type="text/css" href="resources/css/posts.css">

<script type="text/javascript">

function pop_details(bn){
        $('#myCenterModal').modal({
        	remote : 'post_detail.do?boardnum='+bn
        });
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
	.error-text{
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-top:25%;
	    color: gray;
	    text-align: center;
	    white-space: pre-line;
	    cursor: default;
</style>

</head>
<body>

	<div class="culmn">
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1></h1>

			<div class="card"
				style="width: 130%; height: 84.5rem; border: white; ">
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
					id="changing_div" style="height: 90%; overflow-x:hidden;">

					<div class="div_con">
						<c:choose>
							<c:when test="${empty list }">
								<h3 class="error-text text-center">친구의 게시물이 존재하지 않습니다.</h3>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="dto">
									<div class="posts">
										<div class="post_box">
											<%-- 글번호 : ${dto.boardnum } --%>
											<a class="pop_detail"
												onclick="pop_details(${dto.boardnum });">${dto.post_thumbnail }</a>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>

		<!-- 정중앙 modal -->
		<div class="modal modal-center fade" id="myCenterModal" tabindex="-1"
			role="dialog" aria-labelledby="myCenterModalLabel"
			data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-center" role="document"
				style="width: 92%; max-width: 65em; margin-top: 12em;">
				<div class="modal-content"></div>
			</div>
		</div>

		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">Home</a></li>
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link"
						href="friendhome.do?username=${frienddto.username }"
						style="color: black;">게시글</a></li>
					<li class="nav-item "><a class="nav-link"
						href="friendVisitor.do?username=${frienddto.username }">방명록</a></li>
				</ul>
			</nav>
		</div>


	</div>

</body>
</html>
