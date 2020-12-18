<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	   <link href="${pageContext.request.contextPath }/resources/css/rrr.css" rel="stylesheet">
	 
	 	<title>게시판</title>
	</head>
	

	<body>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			
			<section id="container">
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
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
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
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 2}">
				     <div class="starRev">  
 					 <span class="star">별2</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 3}">
				     <div class="starRev">
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 4}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 5}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 6}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 7}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 8}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 9}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade == 10}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
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
								<li><a href="reviewLists${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="reviewLists${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="reviewLists${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>


