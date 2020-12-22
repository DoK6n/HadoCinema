'use strict';
//mypage form
const updateOk = document.getElementById('updateOk');
// 마이페이지
const username = document.getElementById('myname');
const userpw = document.getElementById('mypw');
const phone = document.getElementById('myphone');
const email = document.getElementById('myemail');
const zipcode = document.getElementById('myzipcode');
const address1 = document.getElementById('myaddress1');
const address2 = document.getElementById('myaddress2');
// 정규식
const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
const expNameText = /[가-힣]+$/;
const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
//toaster alert
toastr.options = {
  positionClass: 'toast-top-full-width',
  progressBar: true,
  timeOut: 1000,
};

$(document).ready(() => {
  //modal창 close시 text 초기화
  $('.modal').on('hidden.bs.modal', function (e) {

    $('form').each(function () {
      this.reset();
      $('#mypw').focusin().focusout();
      $('#myname').focusin().focusout();
      $('#myphone').focusin().focusout();
      $('#myemail').focusin().focusout();
      $('#myzipcode').focusin().focusout();
      $('#myaddress1').focusin().focusout();
      $('#myaddress2').focusin().focusout();
    });
  });

  $('#myemail').focusout(function () {
    var isShown = $('#mypageMForm').hasClass('show');
    let chkEmail = $('#myemail').val();
    $.ajax({
      url: contextPath + '/register/' + chkEmail,
      type: 'get',
      cache: false,
      success: function (data) {
        console.log('data : ' + data);
        if (isShown) emailCheckMessage(data, loginEmail);
        if (data != '' && data != loginEmail) $('#myemail').val('').blur();
      },
    });
  });
  //정보수정 버튼
  updateOk.addEventListener('click', function () {
    submit();
  });
});

//end $(document).ready

function emailCheckMessage(data, loginEmail) {
  const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
  if (expEmailText.test(email.value) == false) {
    toastr.error('이메일 형식을 확인하세요.', '이메일 형식', {
      timeOut: 3000,
    });
    email.focusin();
    return;
  }
  if (data === '' && data != loginEmail) {
    toastr.success('사용할수 있는 이메일입니다', '이메일 확인', {
      timeOut: 3000,
    });
    return;
  } else if (data !== '' && data != loginEmail) {
    toastr.error('이미 존재하는 이메일입니다', '이메일 확인', {
      timeOut: 3000,
    });
    return;
  } else if (data === loginEmail) {
    toastr.success('현재 이메일과 동일합니다.', '이메일 확인', {
      timeOut: 3000,
    });
    return;
  }
} //end emailCheckMessage

function submit() {
  //sendit -> 마이페이지 정보수정 유효성검사 return값 flase시 가입실패 true시 ajax로 restcontroller로 데이터 전송
  if (!sendit()) console.log('수정 실패!');
  else {
    const formData = $('#updateform').serialize(); // serialize 사용

    $.ajax({
      url: contextPath + "update",
      type: "POST",
      cache: false,

      data: formData,

      success: function (data) {
        toastr.success('내 정보 수정 성공!', '마이페이지', {
          timeOut: 3000,
        });
        $('.close-btn').click();
        location.reload();
        $('#mypw').focusin().focusout();
        $('#myname').focusin().focusout();
        $('#myphone').focusin().focusout();
        $('#myemail').focusin().focusout();
        $('#myzipcode').focusin().focusout();
        $('#myaddress1').focusin().focusout();
        $('#myaddress2').focusin().focusout();
      },
      error: function (request, status, error) {
        console.log(error);
      }
    });
  }
} //end submit

// 유효성 검사 return boolean
function sendit() {
  console.log("sendit() 클릭");

  if (userpw.value == '') {
    toastr.error('비밀번호를 입력하세요.', '비밀번호 입력', {
      timeOut: 3000,
    });
    userpw.focusin();
    return false;
  }
  if (expPwText.test(userpw.value) == false) {
    toastr.error('비밀번호 형식을 확인하세요.', '비밀번호 형식', {
      timeOut: 3000,
    });
    userpw.focusin();
    return false;
  }
  if (expNameText.test(username.value) == false) {
    toastr.error('이름 형식을 확인하세요.', '이름 형식', {
      timeOut: 3000,
    });
    username.focusin();
    return false;
  }
  if (expHpText.test(phone.value) == false) {
    toastr.error('휴대폰 번호 형식을 확인하세요.', '휴대폰 형식', {
      timeOut: 3000,
    });
    phone.focusin();
    return false;
  }
  if (expEmailText.test(email.value) == false) {
    toastr.error('이메일 형식을 확인하세요.', '이메일 형식', {
      timeOut: 3000,
    });
    email.focusin();
    return false;
  }

  if (zipcode.value == '') {
    toastr.error('우편번호를 입력하세요.', '주소 입력', {
      timeOut: 3000,
    });
    zipcode.focusin();
    return false;
  }
  if (address1.value == '') {
    toastr.error('주소를 입력하세요.', '주소 입력', {
      timeOut: 3000,
    });
    address1.focusin();
    return false;
  }
  if (address2.value == '') {
    toastr.error('상세주소를 입력하세요.', '주소 입력', {
      timeOut: 3000,
    });
    address2.focusin();
    return false;
  }

  return true; // 데이터 전송

} // sendit() 종료


// 카카오 주소찾기 api
function daumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ''; // 주소 변수
      var extraAddr = ''; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      $('#myzipcode').focusin().val(data.zonecode).focusout();
      $('#myaddress1').focusin().val(addr).focusout();
      $('#myaddress2').focusin();
    }
  }).open();
}