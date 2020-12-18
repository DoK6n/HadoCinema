<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 주소찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- toastr CSS -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
  <!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
  <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap core JavaScript -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<!-- toastr js 라이브러리 -->
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- review 쓰기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/review.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){

		
		$(".submitR").on("click", function(){
			
			var formObj = $("form[name='writeForm']");
			var name = $('#rMovieName').val();
			var content = $('#reviewContent').val();
			
			if(name.trim()==""){					
				alert('영화 제목을 입력하세요');				
				return false;					
			}
			if(content.trim()==""){					
				alert('관람평을 입력하세요');					
				return false;					
			}
			
			formObj.attr("action", "/review/writeReviewOk");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var countStar = $('.on').length
			  $('.reviewGrad').html(countStar);				  
			  $('#reviewGrade').val(countStar);		
			  return false;
			});
		
		$('textarea').on('keyup', function(){
			  // 남은 글자 수를 구한다.
			  var letterLength = $(this).val().length;
			  var result = letterLength+" / 최대 200자";
			  // 문서 객체에 입력한다.
			  $('.byte').html(result);
			});	
	})	
</script>