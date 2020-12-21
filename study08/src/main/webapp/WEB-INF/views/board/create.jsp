<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>글쓰기</title>
</head>
<script type="text/javascript">
	
</script>
<body>
	<form action="/board/create" method="post">
		<table border="1">
			<tr>
				<td>
					<p>
						<label>제목</label>
						<input type="text" name="title"/>
					</p>
					
					<p>
						<label>작성자</label>
						<input type="text" name="writer" size="15"/>
					</p>
					
					<p>
						<label>내용</label>
						<textarea rows="15" cols="65" name="content"></textarea>
					</p>
				</td>
			</tr>
		</table>
		
		<button type="submit">등록</button>
	</form>
</body>
</html>