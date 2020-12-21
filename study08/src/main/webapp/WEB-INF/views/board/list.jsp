<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판 목록</title>
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#searchBtn").on("click", function(){
			var str = "list" + "${pageMaker.makeQuery(1)}"
							 + "&searchType="
							 + $("select option:selected").val()
							 + "&keyword="
							 + encodeURIComponent($("#keywordInput").val());
			
			self.location = str;
		});
		
		$("#newBtn").on("click", function(){
			self.location = "/board/create";
		});
		
	});
	
</script>
<body>
	<select name="searchType">
		<option value="n" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>--------</option>
		<option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
		<option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
		<option value="w" <c:out value="${cri.searchType eq 'w' ? 'selected' : '' }"/>>작성자</option>
		<option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
		<option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' : '' }"/>>내용+작성자</option>
		<option value="tcw" <c:out value="${cri.searchType eq 'tcw' ? 'selected' : '' }"/>>제목+내용+작성자</option>
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }"/>
	<button type="button" id="searchBtn">검색</button>
		
	<form action="/board/create" method="get">
		<table border="1">
			<tr>
				<td style="width:77;"><p align="center">글번호</p></td>
				<td style="width:327;"><p align="center">제목</p></td>
				<td style="width:197;"><p align="center">작성자</p></td>
				<td style="width:155;"><p align="center">작성일</p></td>
				<td style="width:90;"><p align="center">조회수</p></td>
			</tr>
			
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.bno }</td>
					<td><a href="/board/read${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${list.bno}">${list.title }</a></td>
					<td>${list.writer }</td>
					<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></td>
					<td><span class="badge bg-red">${list.viewcnt }</span></td>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test="${pageMaker.prev }">
			<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">이전</a>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<c:out value="${pageMaker.cri.page == idx? '' : '' }"></c:out>
			<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">다음</a>
		</c:if>
		<br/>
		
		<button id="newBtn">글쓰기</button>
	</form>
</body>
</html>