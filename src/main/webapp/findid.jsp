<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>

    <link rel="stylesheet" href="join.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script type="text/javascript">

        function check(){
            var id = $("#id").val();
            var password = $("#password").val();
            var name = $("#name").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var postcode = $(".postcode").val();
            var address = $(".address").val();
            var detailadd = $(".detailadd").val();

            var reg1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
            //비밀번호
            var reg2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/; // 6~20문자 영대소문자, 숫자 혼합
            //이름
            var reg3 = /^[가-힣]{2,5}$/;
            //전화번호
            var reg4 = /^01(?:0|1|[6-9])[-]?(\d{3}|\d{4})[-]?(\d{4})$/; // 010-(3자리 또는 4자리 0부터 9까지)-(4자리 0부터 9까지)

            //우편번호
            var reg5 = /^[가-힣a-zA-Z0-9~!@#$%^&*()_+-]{2,40}$/; // 상세주소


            // id 확인
            if(id ==""){
                Swal.fire("아이디를 입력해주세요.");
                return false;
            }
            // 이메일 확인
            var result1 = reg1.test(email);
            if(email == ""){
                Swal.fire("이메일을 입력해주세요");
                return false;
            }else if( result1 != true){
                Swal.fire("이메일을 정확하게 입력해주세요");
                return false;
            }

            // 비밀번호 확인
            var result2 = reg2.test(userpassword);
            if (userpassword != pwdcheck){ // 비밀번호와 비밀번호확인란의 입력값이 같은지 확인
                Swal.fire("비밀번호를 확인해주세요.");
                return false;
            }else if(userpassword == ""){
                Swal.fire("비밀번호를 입력해주세요.");
                return false;
            }else if(pwdcheck == ""){
                Swal.fire("비밀번호를 확인해주세요.");
                return false;
            }else if(result2 != true){
                Swal.fire("비밀번호를 정확하게 입력해주세요.(6~20자 영어대소문자,숫자 혼합)");
                return false;
            }

            // 이름 확인
            var result3 = reg3.test(username);
            if(username == ""){
                Swal.fire("이름을 입력해주세요.");
                return false;
            } else if(result3 != true){
                Swal.fire("이름을 정확하게 입력해주세요");
                return false;
            }

            // 전화번호 확인
            var result4 = reg4.test(phone);
            if(phone == ""){
                Swal.fire("전화번호를 입력해주세요.");
                return false;
            } else if(result4 != true){
                Swal.fire("전화번호를 정확하게 입력해주세요.");
                return false;
            }

            // 우편번호 확인
            var result5 = reg5.test(detailadd); // 상세주소
            if(postcode == ""){
                Swal.fire("우편번호를 입력해주세요.");
                return false;
            }else if(address == ""){
                Swal.fire("주소를 입력해주세요.");
                return false;
            }else if(detailadd == ""){
                Swal.fire("상세주소를 입력해주세요.");
                return false;
            }else if(result5 != true){
                Swal.fire("상세주소를 정확하게 입력해주세요.");
                return false;
            }

            return true;
        }

    </script>
</head>
<body>
<div class="wrap">
    <label>아이디 찾기</label>
    <form method="post" action="findid.jsp" onsubmit="return check()">
        <div>
            <div class="textForm">
                <input type="text" name="name" id="name" class="input"
                       placeholder="이름">
            </div>
            <div class="textForm">
                <input type="text" name="phone" id="phone" class="input"
                       placeholder="전화번호">
            </div>
            <div>
                <input type="submit" value="아이디 찾기" class="btn" id = "submit">
            </div>
        </div>
    </form>
</div>


<script
        src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script src="./KENKEN.js"></script>
</body>
</html>
