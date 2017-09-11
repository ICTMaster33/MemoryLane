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
<%-- <jsp:include page="memoMenu.jsp"></jsp:include> --%>
	<section>
		<!-- 보낸 메모가 존재하면 리스트 표시, 없으면 메시지 표시 -->
		<c:if test="${sendList==null}">
			보낸 메시지가 없습니다.
		</c:if>
		<c:if test="${sendList!=null}">
			<c:forEach items="${sendList}" var="memo">		
					<article>
						<!-- 제목 표시 -->
						<h1>${memo.title } </h1>
						<!-- 받는 사람 아이디, 작성일 표시 -->
						<h2> ${memo.toEmail } &nbsp; ${memo.inputdate}&nbsp;</h2>
						<!-- 내용 표시 -->
						<h3><pre>${memo.content}</pre></h3>
					</article>
				</c:forEach>
			</c:if>
	</section>
</body>
</html>