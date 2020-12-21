<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div class="container">

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       	<form name="writeForm" method="post" action="/review/writeReviewOk">
			<input type="hidden" id="rMemId" name="rMemId" value="${login }"/>
			<textarea id="rMovieName" name="rMovieName" cols="2" rows="2" placeholder="영화 제목을 입력해주세요"></textarea>

			<div class="bx_score">
			<span class="tit"></span>
			<span class="reviewGrad" style="text-align:center;font-size: 20px;font-style: bold;">10</span>점			
				<div class="starRev">
  				<span class="star on">별1</span>
  				<span class="star on">별2</span>
  				<span class="star on">별3</span>
 			    <span class="star on">별4</span>
  				<span class="star on">별5</span>
  				<span class="star on">별6</span>
  				<span class="star on">별7</span>
  				<span class="star on">별8</span>
  				<span class="star on">별9</span>
 			    <span class="star on">별10</span>
				</div>
			</div>		
			
			<textarea id="reviewContent" name="reviewContent" cols="20" rows="5" placeholder="평점 및 영화 리뷰를 작성해주세요. 최대 200자 작성 가능합니다."></textarea>
			<input type="hidden" id="reviewGrade" name="reviewGrade" value="10"> 
			<span class="byte" id="counter">0 / 최대 200자</span>
		
		</form>
		</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
       		<button type="submit" class="submitR btn btn-secondary btn-block write_btn">작성</button>	
        </div>
        
    </div>
    </div>
  </div>
</div>
