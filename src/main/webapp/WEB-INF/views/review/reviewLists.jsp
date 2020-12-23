<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
		<jsp:include page="../cdn.jsp"></jsp:include>
		<!-- CSS -->
	    <link href="${pageContext.request.contextPath }/resources/css/rrr.css" rel="stylesheet">
 		<link href="${pageContext.request.contextPath }/resources/css/header1.css" rel="stylesheet">
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
				<h1> 게시판</h1>
			</header>
			<hr />
			
			<section id="container" style="margin-top: 7vh;">
				<form role="form" method="get">
				
				
						<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>영화 제목</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default btn-sm waves-effect ml-auto">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "reviewLists" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<br><br>
			    <div class="row">
			    <c:forEach items="${list}" var = "list">
			            <div class="col-lg-3 col-md-4 col-sm-6">
			                <div class="card-box project-box">
			                        <p id="c"><c:out value="#${list.reviewUid}" /></p>
			                    <p  style="text-align:center;font-size: 20px;font-style: bold;">
			                    <c:out value="${list.rMovieName}" /></p>
			                      
			                     <c:choose>
							     <c:when test="${list.reviewGrade == 1}">
							     
							     <div class="starRev">
			 					 <span class="starL half">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 2}">
							     <div class="starRev">  
			 					 <span class="starL">별2</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 3}">
							     <div class="starRev">
			 					 <span class="starL">별1</span>
			 					 <span class="starL half">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 4}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 5}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL half">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 6}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 7}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL half">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 8}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 9}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL half">별1</span>
						     	 </div>
								 </c:when>
							     <c:when test="${list.reviewGrade == 10}">
			                     <div class="starRev">		     
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
			 					 <span class="starL">별1</span>
						     	 </div>
								 </c:when>
			                    </c:choose>
			
								<br>
			                    <p class="font-15"><c:out value="${list.reviewContent}" /></p>
			                    <p class="text-muted"><fmt:formatDate value="${list.reviewRegdate}" pattern="yyyy-MM-dd"/><c:out value=" 작성자 ${list.rMemId}" /></p>
			
			                </div>
			            </div>
			    
			      </c:forEach>
			      </div>

					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="reviewLists${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전&nbsp;&nbsp; </a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="reviewLists${pageMaker.makeSearch(idx)}">${idx}&nbsp;&nbsp;&nbsp;&nbsp; </a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="reviewLists${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
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


