<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 	<jsp:include page="../cdn.jsp"></jsp:include>
		<!-- CSS -->
	 	<link href="${pageContext.request.contextPath }/resources/css/header1.css" rel="stylesheet">
	 	<title>게시판</title>
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
		<div class="container" style="margin-top: 7vh;">
			<header>
				<h4>1:1 문의 하기</h4>
				<h5>[48시간 안에 메일로 답변을 보내드립니다.]</h5>
			</header>
			<hr />

			
			<section id="container">
				<form name="writeForm" method="post" action="/cs/writeQanda">

			    <div class="form-group">
					<label for="cs_memid" class="col-sm-2 control-label">작성자 메일</label>
					<input type="text" id="cs_memid" name="cs_memid" class="form-control" value="${email }"/>
				</div>

				<div class="form-group">
					<label for="cs_subject" class="col-sm-2 control-label">제목</label>
					<input type="text" id="cs_subject" name="cs_subject" class="form-control" />
				</div>
				<div class="form-group">
					<label for="cs_content" class="col-sm-2 control-label">내용</label>
					<textarea id="cs_content" name="cs_content" class="form-control"  title="문의 내용을 입력하세요. 답변은 이메일로 보내드립니다."/></textarea>
				</div>

						
				<div>
					<button class="write_btn btn btn-warning" type="submit">문의작성</button>	
				</div>				
			</form>
		</section>
			<hr />
		</div>
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


