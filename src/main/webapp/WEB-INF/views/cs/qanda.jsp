<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 <jsp:include page="../cdn.jsp"></jsp:include>
      <!-- CSS -->
      <link href="${pageContext.request.contextPath }/resources/css/header1.css" rel="stylesheet">
	 	
	 	<title>문의게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/cs/writeQanda");
				formObj.attr("method", "post");
				alert("[문의가 접수되었습니다. 48시간 안에 메일로 답변을 보내드립니다.]")
				formObj.submit();
			});
		})
		
		function fn_valiChk(){
			
			frm = document.forms['writeForm'];
			var cs_memid = frm['cs_memid'].value.trim();
			var cs_subject = frm['cs_subject'].value.trim();
			var cs_content = frm['cs_content'].value.trim();

			var regForm = $("form[name='writeForm'] .form-group").length;
			
			var expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
			
		    if(expEmailText.test(cs_memid) == false){
		        alert('이메일 형식을 확인하세요.');
				frm["cs_memid"].focus();
		        return true;
		    }

			if(cs_subject == ""){
				alert("제목 란은 반드시 작성해야 합니다") ;
				frm["cs_subject"].focus();
				return true;
			}

			if(cs_content == ""){
				alert("내용 란은 반드시 작성해야 합니다") ;
				frm["cs_content"].focus();
				return true;
			}


		}
		

	    
	</script>
	
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
       <jsp:include page="../header.jsp"></jsp:include>
       
	
		<div class="container"  style="margin-top: 7vh;">
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
					<button class="write_btn btn btn-warning" type="submit">문의하기</button>	
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


