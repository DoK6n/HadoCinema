<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="../cdn.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/css/main_top.css" rel="stylesheet">

</head>
<body>
<form>

</form>
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

  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="gradienttop w-100 h-25">
	 <jsp:include page="../header.jsp"></jsp:include>
    </div>
    <div class="gradientdown w-100 h-15"></div>
    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
      <li data-target="#carousel-example-1z" data-slide-to="3"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
      <!--First slide-->
      <div class="carousel-item ci active">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/nicegirl01.jpg" alt="First slide">
      </div>
      <!--/First slide-->
      <!--Second slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/run01.jpg" alt="Second slide">
      </div>
      <!--/Second slide-->
      <!--Third slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/thefrom01.jpg" alt="Third slide">
      </div>
      <!--/Third slide-->
      <!--4 slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/joje01.jpg" alt="Fourth slide">
      </div>
      <!--/4 slide-->
    </div>
    <!--/.Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
  </div>
  <!--/.Carousel Wrapper-->
<c:if test="${login ne 'admin' }">
	<c:choose>
		<c:when test="${empty login}">
			<script src="${pageContext.request.contextPath }/resources/js/register.js"></script>
		</c:when>
		<c:otherwise>
			<!-- 
			 <script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
			 -->
			<jsp:include page="${pageContext.request.contextPath }/resources/js/mypage.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>