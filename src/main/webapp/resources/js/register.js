'use strict';
//login form
const loginid = document.querySelector('#id');
const loginForm = document.querySelector('#loginForm');
const password = document.querySelector('#password');
const loginButton = document.querySelector('.loginButton');
//register form
const regOk = document.getElementById('regOk');
const id = document.getElementById('userid');
const email = document.getElementById('useremail');
const logout = document.querySelector('.logout');
let idFlag = false;

//toaster alert
toastr.options = {
  positionClass: 'toast-top-full-width',
  progressBar: true,
  timeOut: 1000,
};

// $( document ).ready()와 유사한 코드

$(document).ready(() => {

  // 로그인 버튼 클릭시에 동작하는 함수
  loginButton.addEventListener('click', () => {
    if (loginid.value.trim() === '') {
      toastr.error('아이디를 입력해 주십시오', '경고', {
        timeOut: 3000
      });
      loginid.focusin();
    } else if (password.value.trim() === '') {
      toastr.error('비밀번호를 입력해 주십시오', '경고', {
        timeOut: 3000
      });
      password.focusin();
    } else {
      login();
    }
  });

  //modal창 close시 text 초기화
  $('.modal').on('hidden.bs.modal', function (e) {
    $('form').each(function () {
      this.reset();
      $('#id').focusin().focusout();
      $('#password').focusin().focusout();

      $('#userid').focusin().focusout();
      $('#userpw').focusin().focusout();
      $('#name').focusin().focusout();
      $('#phone').focusin().focusout();
      $('#useremail').focusin().focusout();
      $('#zipcode').focusin().focusout();
      $('#address1').focusin().focusout();
      $('#address2').focusin().focusout();
    });
  });

  //register form userid focusout시 ajax로 restcontroller로 data 전송
  $('#userid').focusout(function () {

    // $(this).addClass('hidden');

    let chkId = $('#userid').val();
    $.ajax({
      url: '/member/' + chkId,
      type: 'get',
      cache: false,
      data: {
        id: chkId
      },
      success: function (data) {
        console.log(data);
        idCheckMessage(data);
        if (data == 'true') {
          $('#userid').val('');
        }
      },
    });
  });

  $('#useremail').focusout(function () {
    // $(this).addClass('hidden');

    let chkEmail = $('#useremail').val();
    var isShown = $('#modalLRForm').hasClass('show');
    $.ajax({
      url: '/register/' + chkEmail,
      type: 'get',
      cache: false,
      success: function (data) {
        console.log('data : ' + data);
        if(isShown){
        	emailCheckMessage(data);
        }
        if (data != '') {
          $('#useremail').val('').focusout();
        }
      },
    });
  });

  //가입하기 버튼
  regOk.addEventListener('click', function () {
    console.log("가입 시도!");
    submit();
  });


});
//end $(document).ready

function login() {
  const loginForm = $('#loginForm').serialize(); // serialize 사용
  console.log(loginForm);

  $.ajax({
    url: "login",
    type: "POST",
    cache: false,
    data: loginForm,

    success: function (data) {
      location.reload();
      toastr.success('로그인 성공!', '로그인', {
        timeOut: 1000,
      });
    },
    error: function (request, status, error) {
      console.log(error);
    }
  });
}

function idCheckMessage(data) {
  if (id.value.length < 3) {
    toastr.error('최소 4글자 이상의 아이디를 입력해 주세요', '아이디 확인', {
      timeOut: 3000,
    });
    return;
  }
  if (data === 'false') {
    toastr.success('사용할수 있는 아이디입니다', '아이디 확인', {
      timeOut: 3000,
    });
    return idFlag = true;
    //registerButton.removeAttribute('disabled');
  } else {
    toastr.error('이미 존재하는 아이디입니다', '아이디 확인', {
      timeOut: 3000,
    });
    return idFlag = false;
    //registerButton.setAttribute('disabled', 'true');
  }
} //end idCheckMessage

function emailCheckMessage(data) {
  const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;

  if (expEmailText.test(email.value) == false) {
    toastr.error('이메일 형식을 확인하세요.', '이메일 형식', {
      timeOut: 3000,
    });
    email.focusin();
    return;
  }
  if (data === '') {
    toastr.success('사용할수 있는 이메일입니다', '이메일 확인', {
      timeOut: 3000,
    });
    return;
  } else {
    toastr.error('이미 존재하는 이메일입니다', '이메일 확인', {
      timeOut: 3000,
    });
    return;
  }
} //end emailCheckMessage


function submit() {
  //sendit -> 회원가입 유효성검사 return값 flase시 가입실패 true시 ajax로 restcontroller로 데이터 전송
  if (!sendit()) {
    console.log('가입 실패!');

  } else {
    let formData = $('#regform').serialize(); // serialize 사용

    $.ajax({
      url: "register",
      type: "POST",
      cache: false,

      data: formData,

      success: function (data) {
        console.log('registerOk의 값 : ' + data);
        toastr.success('회원가입 성공!', '회원가입', {
          timeOut: 3000,
        });
        $('#userid').focusin().val('').focusout();
        $('#userpw').focusin().val('').focusout();
        $('#name').focusin().val('').focusout();
        $('#phone').focusin().val('').focusout();
        $('#useremail').focusin().val('').focusout();
        $('#zipcode').focusin().val('').focusout();
        $('#address1').focusin().val('').focusout();
        $('#address2').focusin().val('').focusout();
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
  // document.querySelector()
  // 회원가입
  const userid = document.getElementById('userid');
  const userpw = document.getElementById('userpw');
  const name = document.getElementById('name');
  const phone = document.getElementById('phone');
  const email = document.getElementById('useremail');
  const zipcode = document.getElementById('zipcode');
  const address1 = document.getElementById('address1');
  const address2 = document.getElementById('address2');

  // 정규식
  const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
  const expNameText = /[가-힣]+$/;
  const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
  const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;

  if (userid.value == '') {
    toastr.error('아이디를 입력하세요.', '아이디', {
      timeOut: 3000,
    });
    userid.focusin();
    return false;
  }
  if (userid.value.length < 4 || userid.value.length > 20) {
    toastr.error('아이디를 4자이상 20자 이하로 입력하세요.', '아이디', {
      timeOut: 3000,
    });
    userid.focusin();
    return false;
  }
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
  if (expNameText.test(name.value) == false) {
    toastr.error('이름 형식을 확인하세요.', '이름 형식', {
      timeOut: 3000,
    });
    name.focusin();
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
      //document.getElementById('zipcode').focus();
      //document.getElementById('zipcode').value = data.zonecode;
      // document.getElementById("address1").focus();
      // document.getElementById("address1").value = addr;

      $('#zipcode').focusin().val(data.zonecode).focusout();
      $('#address1').focusin().val(addr).focusout();
      $('#address2').focusin();



    }
  }).open();
}