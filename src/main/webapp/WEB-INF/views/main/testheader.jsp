<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <jsp:include page="../cdn.jsp"></jsp:include>

  <!-- CSS -->
  <link href="${pageContext.request.contextPath }/resources/css/header1.css" rel="stylesheet">

  <title>해도시네마 메인</title>
</head>

<body>
  <c:if test="${login ne 'admin' }">
	<c:choose>
		<c:when test="${empty login}">
			<jsp:include page="../memberModals.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../mypageModals.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
  </c:if>
 <jsp:include page="../review/writeReview.jsp"></jsp:include>
 <jsp:include page="../header.jsp"></jsp:include>

  <c:if test="${login ne 'admin' }">
	  <script type="text/javascript">
		  let contextPath = '${pageContext.request.contextPath }';
		  let loginEmail = '${email }';
	  </script>
	  <c:choose>
		  <c:when test="${empty login}">
	  		  <script src="${pageContext.request.contextPath }/resources/js/register.js"></script>
		  </c:when>
		  <c:otherwise>
			 <script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
  		  </c:otherwise>
	  </c:choose>
  </c:if>
  
</body>

</html>