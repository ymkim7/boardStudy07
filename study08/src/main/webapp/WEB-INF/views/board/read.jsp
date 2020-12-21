<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>조회</title>
</head>
<script type="text/javascript">
	
</script>
<body>
	<form name="readform" method="post">
		<table border="1">
			<tr>
				<td>
					<p>
						<label>글번호</label>
						<input type="text" name="bno" value="${list.bno }" readonly="readonly"/>
					</p>
					
					<p>
						<label>제목</label>
						<input type="text" name="title" style="background-color:#B0E0E6" value="${list.title }" readonly="readonly"/>
					</p>
					
					<p>
						<label>작성자</label>
						<input type="text" name="writer" size="15" value="${list.writer }" readonly="readonly"/>
					</p>
					
					<p>
						<label>내용</label>
						<textarea rows="15" cols="65" name="content" style="background-color:#B0E0E6" readonly="readonly">${list.content }</textarea>
					</p>
				</td>
			</tr>
		</table>
	</form>
	
	<button type="button" id="modify" name="modify">수정</button>
	<button type="button" id="remove" name="remove">삭제</button>
	<button type="button" id="listAll" name="listAll">목록</button>
	
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#modify").on("click", function(){
			var formObj = $("form[name='readform']");
			
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#remove").on("click", function(){
			var formObj = $("form[name='readForm']").val();
			
			formObj.attr("action", "/board/remove");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#listAll").on("click", function(){
			location.href = "/board/list";
		});
		
	});

</script>
</body>
</html>