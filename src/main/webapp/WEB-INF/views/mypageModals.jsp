<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Modal: Login / Register Form -->
<div class="modal fade" id="mypageMForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Modal cascading tabs-->
      <div class="modal-c-tabs">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#panel82" role="tab"><i class="fas fa-user-plus mr-1"></i>
              정보수정</a>
          </li>
        </ul>

        <!-- Tab panels -->
        <div class="tab-content">
         
          <!--Panel 8-->
          <div class="tab-pane fade in show active" id="panel82" role="tabpanel">

            <!--Body-->
            <div class="modal-body">
													<!-- onsubmit="return sendit()" -->
              <form name="updateform" id="updateform" method="post" action="">
                <div class="md-form form-sm mb-5">
                  <i class="fas fa-user prefix"></i>
                  <input type="text" id="myid" name="userid" class="form-control form-control-sm validate" value="${login }" readonly>
                  <label for="userid">아이디</label>
                </div>

				<div class="md-form form-sm mb-5">
                  <i class="fas fa-lock prefix"></i>
                  <input type="password" id="mypw" name="userpw" class="form-control form-control-sm validate">
                  <label for="userpw">비밀번호</label>
                </div>

                <div class="md-form form-sm mb-4">
                  <i class="fas fa-signature prefix"></i>
                  <input type="text" id="myname" name="name" class="form-control form-control-sm validate" value="${name }">
                  <label for="name">이름</label>
                </div>

                <div class="md-form form-sm mb-4">
                  <i class="fas fa-mobile prefix"></i>
                  <input type="text" id="myphone" name="phone" class="form-control form-control-sm validate" value="${phone }">
                  <label>휴대폰 번호</label>
                </div>
                
                <div class="md-form form-sm mb-4">
                  <i class="fas fa-envelope prefix"></i>
                  <input type="text" id="myemail" name="email" class="form-control form-control-sm validate" value="${email }">
                  <label>이메일</label>
                </div>

                <div class="md-form form-sm mb-4">
                  <div class="row">
                    <div class="col-md-9">
                      <i class="fas fa-home prefix"></i>
                      <input type="text" name="zipcode" id="myzipcode"
                        class="form-control form-control-sm validate" value="${zipcode }">
                      <label style="left: 15px;">우편번호</label>
                    </div>
                      <input type="button" id="daumPost" class="btn btn-outline-info btn-sm waves-effect ml-auto" value="검색"
                        onclick="daumPostcode()"/>
                  </div>
                </div>

                <div class="md-form form-sm mb-4">
                  <i class="fas fa-home prefix"></i>
                  <input type="text" name="address1" id="myaddress1" class="form-control form-control-sm validate" value="${add1 }">
                  <label>주소</label>
                </div>

                <div class="md-form form-sm mb-4">
                  <i class="fas fa-home prefix"></i>
                  <input type="text" name="address2" id="myaddress2"
                    class="form-control form-control-sm validate" value="${add2 }">
                  <label>상세주소</label>
                </div>

              </form>
                <div class="text-center form-sm mt-2">
                	<input type="button" id="updateOk" class="btn btn-info" value="수정완료"/><i class="fas fa-sign-in ml-1"></i>
                </div>
            </div>
            <!--Footer-->
            <div class="modal-footer">
            <label>가입일 : ${signupdate }</label>
              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">닫기</button>
            </div>
          </div>

          <!--/.Panel 8-->
        </div>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
 <!-- Modal: Login / Register Form -->