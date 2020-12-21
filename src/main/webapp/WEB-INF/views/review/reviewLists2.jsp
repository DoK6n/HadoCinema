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
	 
	 	<title>영화 관람평 모음</title>
	</head>
	

	<body>
		<div class="container">
			<header>
				<h4>관람평 모음 [ 네이버 - 최근 리뷰 만개 ]</h4>
				<h5>영화 제목 / 리뷰 내용 검색이 가능합니다.</h5>
				<a href = "https://movie.naver.com/movie/point/af/list.nhn?&page">네이버 영화 리뷰 바로가기</a>
			</header>
			<hr />
			
			<section id="container">
				<form role="form" method="get">
				
				
						<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>영화 제목</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>리뷰 내용</option>
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
									 self.location = "reviewLists2" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<br><br>
    <div class="row">
    <c:forEach items="${list}" var = "list">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="card-box project-box">
                        <p id="c"><c:out value="#${list.reviewUid2}" /></p>
                    <p  style="text-align:center;font-size: 20px;font-style: bold;">
                    <c:out value="${list.rMovieName2}" /></p>
                      
                     <c:choose>
				     <c:when test="${list.reviewGrade2 == 1}">
				     
				     <div class="starRev">
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 2}">
				     <div class="starRev">  
 					 <span class="star">별2</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 3}">
				     <div class="starRev">
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 4}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 5}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 6}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 7}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 8}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 9}">
                     <div class="starRev">		     
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star">별1</span>
 					 <span class="star half">별1</span>
			     	 </div>
					 </c:when>
				     <c:when test="${list.reviewGrade2 == 10}">
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
                    <p class="font-15"><c:out value="${list.reviewContent2}" /></p>

                </div>
            </div>
    
      </c:forEach>
      </div>

					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="reviewLists2${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="reviewLists2${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="reviewLists2${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>


