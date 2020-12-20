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
	 	
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/mypage/qandaList2"
		})
		
		$(".update_btn").on("click", function(){

			formObj.attr("action", "/mypage/answerOk");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		
	})
		

	</script>
	
	<body>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/mypage/answerOk">
			
					<input type="hidden" id="cs_uid" name="cs_uid" value="${read.cs_uid}" />
					<input type="hidden" id="page" name="page" value="${cri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 

			    <div class="form-group">
					<label for="cs_memid" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="cs_memid" name="cs_memid" class="form-control" value="${read.cs_memid}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="cs_regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.cs_regdate}" pattern="yyyy-MM-dd" />	
				</div>
				<div class="form-group">
					<label for="cs_subject" class="col-sm-2 control-label">제목</label>
					<input type="text" id="cs_subject" name="cs_subject" class="form-control" value="${read.cs_subject}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="cs_content" class="col-sm-2 control-label">내용</label>
					<textarea id="cs_content" name="cs_content" class="form-control" readonly="readonly"><c:out value="${read.cs_content}" /></textarea>
				</div>

				<div class="form-group chk">
					<label for="cs_status" class="col-sm-2 control-label">답변</label>
					<input type="text" id="cs_answer" name="cs_answer" class="form-control" value="${read.cs_answer}"/>
				</div>
						
				<div>
					<button class="update_btn" type="submit">답변작성</button>	
					<button type="button" class="cancel_btn btn btn-warning">목록</button>
				</div>				
			</form>
		</section>
			<hr />
		</div>
	</body>
</html>