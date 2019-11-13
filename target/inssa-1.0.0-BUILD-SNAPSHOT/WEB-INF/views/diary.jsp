<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="left_home.jsp" />
<script src="resources/calendar/lib/jquery.min.js"></script>
<script src="resources/calendar/lib/moment.min.js"></script>
<script src="resources/calendar/fullcalendar.min.js"></script>
<link href="resources/calendar/fullcalendar.min.css" rel="stylesheet"/>
<link href="resources/calendar/fullcalendar.print.min.css" rel="stylesheet" media="print"/>
<script>

  $(document).ready(function(){
	  var _events = get_events()
	  console.log(_events)
	  set_calendar(_events)
  })
  
  function set_calendar(_events){
  	$('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: new Date(),
      navLinks: true,
      editable: true,
      eventLimit: true,
      events: _events,
      eventClick : function(info){
    	  var seq = info.seq;
    	  location.href="detail_schedule.do?seq="+seq;
      }
    });
  }
  
  function get_events(){
	  var items

   	  $.ajax({
   		  url:"jason_diary.do",
   		  type:"post",
   		  data :$("input[name=username]").val(),
   		  dataType:"json",
   		  async: false,
   		  timeout:1000,
   	      contentType:"application/x-www-form-urlencoded; charset=UTF-8",
   		  success:function(data){
   			  items = data.list;
   		  },
   		  error:function(){
   			  console.log("실패...ㅠ");
   		  }
   	  });
	  
	  return items;
  }

  
  $(document).on('click', '#search_btn', function(){
		//e.preventDefault();
		var url = "searchlist.do";
		url = url + "?keyword=" + $('#keyword').val();
		alert(url);
		location.href = url;
		
	});
</script>
<style>

/*   body { */
/*     margin: 40px 10px; */
/*     padding: 0; */
/*     font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; */
/*     font-size: 14px; */
/*   } */

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
  #calendar_btn{
    margin: 3%;
    float: right;
  }

</style>
</head>
<body>

	<div class="culmn">
		<div class="column "
			style="float: left; width: 50%; padding-left: 20px;">
			<h1></h1>

			<div
				class="card example-1 scrollbar-deep-purple bordered-deep-purple thin"
				style="width: 130%; height: 84.5rem;border: white;">
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
				
			<div class="card example-1 scrollbar-deep-purple bordered-deep-purple thin" id="changing_div"
					style="height: 90%">
			<div id='calendar'></div>
		    <div>
		  	  <input type="hidden" name="username" value="${dto.username }"/>
		  	  <button class="btn btn-default" id="calendar_btn" onclick="location.href='add_schedule.do'">일정추가</button>
		    </div>
			</div>
			</div>
		</div>








		<div class="container">
			<nav class="nav ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="home.do">타임라인</a></li>
					<li class="nav-item "><a class="nav-link" href="posts.do">게시글</a></li>
					<li class="nav-item "
						style="background-color: white; border-left: white;"><a
						class="nav-link" href="diary.do" style="color: black;">다이어리</a></li>
					<li class="nav-item "><a class="nav-link" href="visitor.do">방명록</a></li>
					<li class="nav-item "><a class="nav-link" href="profile.do">프로필</a></li>
					<li class="nav-item "><a class="nav-link" href="cloud_select_photo.do?username=${username }">사진첩</a></li>
				</ul>
			</nav>
		</div>



	</div>


</body>
</html>