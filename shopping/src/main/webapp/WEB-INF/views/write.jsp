<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

<!-- summer note -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="./resources/js/summernote-ko-KR.js"></script>

<link href="./css/index.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i], this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
        });
        
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "./uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
		$(el).summernote('editor.insertImage', data.url);
		}
	});
}

function writeCheck(){
	var result = confirm("글을 저장하시겠습니까?");	
	return result;
}	
	

</script>

<style type="text/css">
#wrtie_area{
	float:left;
	margin-top: 10px;
}

#board_title{
	width: 88.8%;
    height: 33px;
    margin-bottom: 10px;
}

#write_submit_btn{
    margin: 0 auto;
    display: block;
    height: 35px;
    width: 70px;
    letter-spacing: 2px;
}

#write_select{
	height: 35px;
}

</style>
</head>
<body>
<header>
	<%@ include file= "menu.jsp"%>
</header>
<main>
	<div id="container">	
		<c:import url="/sub_board_menu"/>				
		<div id="content_title"> 
			<h2> 글쓰기 </h2>
		</div>
		<div id="wrtie_area">
			<form action="./write" method="post" onsubmit="return writeCheck()" enctype="multipart/form-data">
				<select id="write_select" name="board_cate">
					<c:if test="${sessionScope.grade gt 6 }">
					<option value="1">자주하는질문</option>
					<option value="2">공지사항</option>
					</c:if>
					<option selected="selected" value="3" name="board_cate">자유게시판</option>
				</select>
				<input type="text" id="board_title" name="board_title" placeholder="제목을 입력해주세요(40자 이내)">
				<textarea name="board_content" id="summernote"></textarea>
				<button id="write_submit_btn">글쓰기</button>
			</form>
		</div>
	</div>
</main>
<footer>
	<%@ include file= "footer.jsp"%>
</footer>	
</body>
</html>