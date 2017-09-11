<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 메뉴 인클루드 -->
	<jsp:include page="memoMenu.jsp"></jsp:include> 
	<section>
		<!-- 쪽지 보내기 폼 -->
		<form action="send" method="post">
			<div>
				제목 <input type="text" name="title" class="title">
			</div>
			<div>
			받는 사람
			<select name="toId" class="toId">
				<c:forEach items="${userlist}" var="mem">
					<!-- 유저 리스트 : JSTL을 이용하여 처리 -->
					<option value="${mem.getEmail()}"> ${mem.getName()}</option>
				</c:forEach>
			</select>
			</div>
			<div>
				내용 <textarea name="content" class="content"></textarea>
			</div>
			<input type="submit" value="Send">
		</form>
	</section>
</body>
</html>