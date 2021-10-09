<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
 
function go_time(){
 
var now = new Date();
var year = now.getFullYear(); //년
var month = now.getMonth() ; //월
var day = now.getDate();  //일
var hour = now.getHours();  //시
var min = now.getMinutes();  //분
var sec = now.getSeconds();  //초

var dday = new Date(year,month,day+1,00,00,00);
var gap = dday.getTime() - now.getTime();
var limit_day = Math.ceil(gap / (1000 * 60 * 60 * 24));
var limit_hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))-1;
var limit_min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
var limit_sec = Math.ceil((gap % (1000 * 60)) / 1000);

 document.getElementById("clock").innerHTML 
 = "마감 시간 : "+limit_hour + "시간 " + limit_min + "분 " + limit_sec + "초 남았습니다.";
 //id가 clock인 html에 현재시각을 넣음
 
 setTimeout("go_time()", 1000);
 //1초마다 해당 펑션을 실행함.
}
</script>
<body onload="go_time()">
<div id="clock"></div>
</body>