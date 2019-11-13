
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("src", ev.target.id);
}

//===============남자미니미=================

function save2(user_name){
   
//   document.save_mini.character.value = $("#show_mini")[0].outerHTML;
//   document.save_mini.username.value = user_name;
//   document.save_mini.submit();

   
   var username = user_name;
   var character = $("#show_mini")[0].innerHTML;
   
    var form = document.createElement("form");      // form 엘리멘트 생성
    form.setAttribute("method","post");             // method 속성 설정
    form.setAttribute("action","update_mini.do");   // action 속성 설정
    document.body.appendChild(form);                // 현재 페이지에 form 엘리멘트 추가

    var insert = document.createElement("input");   // input 엘리멘트 생성
    insert.type = "hidden";
    insert.name = "username";
    insert.value = username;        
    
    form.appendChild(insert);                       // form 엘리멘트에 input 엘리멘트 추가
 
    var insert1 = document.createElement("input");  // input 엘리멘트 생성
    insert1.type = "hidden";
    insert1.name = "usermini";
    insert1.value = character;
    
    form.appendChild(insert1);
    
    form.submit();                                  // 전송
}

/*
function save(user_name){
   
      alert($("#show_mini")[0].outerHTML);
      var username = user_name;
      var character = $("#show_mini")[0].outerHTML;
//      var hair = $("#hair")[0].outerHTML;
//      var body = $("#body")[0].outerHTML;
      location.href = "update_mini.do?character="+character+"&username="+username;
      
   }
*/

function drop(ev) {
   // 바디 == drop
  ev.preventDefault();
  var src = document.getElementById(ev.dataTransfer.getData("src"));
  var srcParent = src.parentNode;
  //var tgt = ev.currentTarget.firstElementChild;

  var target = document.querySelector("#male > div:first-child > #drag_box > #mini_body");
  var tgt = target.firstElementChild;
  var cloneTgt = src.cloneNode(true);

  srcParent.appendChild(cloneTgt);
  
  target.appendChild(src);
  target.removeChild(tgt);
}


function drop1(ev) {
   // 헤어 == drop1
  ev.preventDefault();
  var src = document.getElementById(ev.dataTransfer.getData("src"));
  var srcParent = src.parentNode;
  //var tgt = ev.currentTarget.firstElementChild;
  //var target = document.getElementByClassName("mini_hair");
  
  var target = document.querySelector("#male > div:first-child > #drag_box > #mini_hair");

  var tgt = target.firstElementChild;
  var cloneTgt = src.cloneNode(true);

  srcParent.appendChild(cloneTgt);
  
  target.appendChild(src);
  target.removeChild(tgt);
}

//===============여자미니미=================

function save3(user_name){
   
//   document.save_mini.character.value = $("#show_mini")[0].outerHTML;
//   document.save_mini.username.value = user_name;
//   document.save_mini.submit();

   
   var username = user_name;
   var character = $("#show_mini1")[0].innerHTML;
   
    var form = document.createElement("form");      // form 엘리멘트 생성
    form.setAttribute("method","post");             // method 속성 설정
    form.setAttribute("action","update_mini.do");   // action 속성 설정
    document.body.appendChild(form);                // 현재 페이지에 form 엘리멘트 추가

    var insert = document.createElement("input");   // input 엘리멘트 생성
    insert.type = "hidden";
    insert.name = "username";
    insert.value = username;        
    
    form.appendChild(insert);                       // form 엘리멘트에 input 엘리멘트 추가
 
    var insert1 = document.createElement("input");  // input 엘리멘트 생성
    insert1.type = "hidden";
    insert1.name = "usermini";
    insert1.value = character;
    
    form.appendChild(insert1);
    
    form.submit();                                  // 전송
   
}

/*
function save1(user_name){
   
   alert($("#show_mini1")[0].outerHTML);
   var username = user_name;
   var character = $("#show_mini1")[0].outerHTML;
   location.href = "update_mini.do?character="+character+"&username="+username;
}
*/

function drop2(ev) {
   // 바디 == drop2
  ev.preventDefault();
  var src = document.getElementById(ev.dataTransfer.getData("src"));
  var srcParent = src.parentNode;
  //var tgt = ev.currentTarget.firstElementChild;

  var target = document.querySelector("#female > div:first-child > #drag_box > #mini_body1");
  var tgt = target.firstElementChild;
  var cloneTgt = src.cloneNode(true);

  srcParent.appendChild(cloneTgt);
  
  target.appendChild(src);
  target.removeChild(tgt);
}


function drop3(ev) {
   // 헤어 == drop3
  ev.preventDefault();
  var src = document.getElementById(ev.dataTransfer.getData("src"));
  var srcParent = src.parentNode;
  //var tgt = ev.currentTarget.firstElementChild;
  var target = document.querySelector("#female > div:first-child > #drag_box > #mini_hair1");
  var tgt = target.firstElementChild;
  var cloneTgt = src.cloneNode(true);

  srcParent.appendChild(cloneTgt);
  
  target.appendChild(src);
  target.removeChild(tgt);
}
