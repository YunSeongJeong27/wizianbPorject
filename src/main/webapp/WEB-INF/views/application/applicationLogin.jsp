<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-19
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        .form-control{
            box-shadow: none !important;
            background-color: #F8F8F8;
            border-color: #F8F8F8;
        }
        .findDIv{
            cursor: pointer;
            font-size: 0.85rem;
            color: #9A9A9A;
            border: none;
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

    /* 모달 */
        .modal{
            --bs-modal-header-border-width : 0 !important;
            --bs-modal-footer-border-width : 0 !important;
            animation: none !important;
            transition: none !important;
        }
        .modal-backdrop{height:0%;}
        .modal-content{
            border-radius: 0 !important;
            border: 2px solid black;
            width: 800px !important;
            height: 650px;
            padding: 100px;
            display: flex;
            justify-content: center;
         }
        .btn-close{
            --bs-btn-close-focus-shadow: 0 !important;
            position: relative;
            top: -100px;
            left: 100px;
        }
</style>
</head>

<body>
<div class="h-100 d-flex justify-content-center align-items-center">
    <div class="mx-auto px-3" style="width: 620px;">
        <div id="logo" class="col-5 mx-auto" style="background-image: url(https://www.choongang.co.kr/img/new/logo_new.png); background-size: contain; background-repeat: no-repeat; cursor: pointer; height: 65px;"></div>
        <div>
            <div class="mt-5 mb-3 fs-3 fw-bold d-flex">
                <div class="col-2">로그인</div>
                <div class="col-8 ms-2 p-1 text-danger align-self-end" style="font-size: 0.65em">${text}</div>
            </div>
            <form id="frm" action="/login" method="post">
                <div class="mt-3">
                    <span class="d-block">아이디(이메일)</span>
                    <input name="email" class="mt-2 d-block form-control" type="email" placeholder="아이디">
                </div>
                <div class="mt-3">
                    <span class="d-block">비밀번호</span>
                    <input name="password" class="mt-2 d-block form-control" type="password" placeholder="비밀번호">
                </div>
                <div id="submitBtn" class="mt-5 p-2 rounded-1 w-100 text-center text-white" style="background: #3B3B3B; cursor:pointer;">로그인</div>
            </form>
        </div>
        <div class="d-flex justify-content-center">
            <div class="findDIv btn" data-bs-toggle="modal" data-bs-target="#findIdModal">아이디 찾기</div>
            <div class="findDIv btn" data-bs-toggle="modal" data-bs-target="#findPwModal">비밀번호 찾기</div>
        </div>

    <%-- 모달 --%>
        <%-- 아이디 찾기 --%>
        <div id="findIdModal" class="modal fade" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3 fs-3 fw-bold">아이디 찾기</div>
                        <div>
                            <div class="mt-3">
                                <span class="d-block">성명</span>
                                <input id="nameModal" class="mt-2 d-block form-control" type="text" placeholder="등록된 성명을 입력하세요.">
                            </div>
                            <div class="mt-3">
                                <span class="d-block">생년월일</span>
                                <input id="birthModal" class="mt-2 d-block form-control" type="number" placeholder="생년월일을 YYYYMMDD 형식으로 입력하세요.">
                            </div>
                            <div class="mt-5 d-flex w-100 justify-content-around">
                                <div id="findIdBtnModal" class="p-2 rounded-1 text-center text-white" style="background: #3B3B3B; cursor:pointer; width: 48%;">찾기</div>
                                <div class="p-2 rounded-1 text-center text-white" style="background: #3B3B3B; cursor:pointer; width: 48%;" data-bs-dismiss="modal">취소</div>
                            </div>
                        </div>
                        <div id="findIdModalText" class="text-center text-danger mt-4 fw-bold" style="height: 30px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <%-- 비밀번호 찾기 --%>
        <div id="findPwModal" class="modal fade" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3 fs-3 fw-bold">비밀번호 찾기</div>
                        <div>
                            <div class="mt-3">
                                <span class="d-block">아이디(이메일)</span>
                                <div class="d-flex">
                                    <div class="mt-2 w-75 d-flex justify-content-between">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control " placeholder="이메일" aria-label="Email"
                                                   id="username">
                                        </div>
                                        <div class="col-sm-6 ms-0">
                                            <select class="form-select form-control" aria-label="Default select example" id="freeFix">
                                                <option selected>이메일 선택</option>
                                                <option value="@naver.com">@naver.com</option>
                                                <option value="@gmail.com">@gmail.com</option>
                                                <option value="@daum.net">@daum.net</option>
                                                <option value="@nate.com">@nate.com</option>
                                            </select>
                                        </div>
                                    </div>
<%--                                    <input id="emailModal" class="mt-2 form-control w-75" type="text" placeholder="이메일">--%>
                                    <div id="emailModalBtn" class="w-25 d-flex align-items-center rounded-1 align-self-end text-white justify-content-center" style="height: 38px; background-color:#3B3B3B; cursor:pointer;">인증메일발송</div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <span class="d-block">인증번호</span>
                                <div class="d-flex">
                                    <input class="form-control mail-check-input mt-2 w-75" placeholder="인증번호 "
                                           disabled="disabled" maxlength="7" onkeyup="checkAuthNumFn()">
<%--                                    <input id="verificationModal" class="mt-2 form-control w-75" type="text" placeholder="인증번호">--%>
                                    <div id="verificationModalBtn" class="w-25 d-flex align-items-center rounded-1 align-self-end text-white justify-content-center" style="height: 38px; background-color:#3B3B3B; cursor:pointer;">인증번호확인</div>
                                </div>
                            </div>
                            <div class="mt-5 d-flex w-100 justify-content-around">
                                <div class="p-2 rounded-1 text-center text-white" style="background: #3B3B3B; cursor:pointer; width: 100%;" data-bs-dismiss="modal">닫기</div>
                            </div>
                        </div>
                        <div id="findPwModalText" class="text-center text-danger mt-4 fw-bold" style="height: 30px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        //로고 클릭 시 이동
        const logo = document.getElementById("logo");
        logo.addEventListener("click", function(){
            window.location.href = "/app";
        })

        //아이디, 비밀번호 input 클릭시 border 이벤트
        var formControls = document.querySelectorAll('.form-control');
        formControls.forEach(function(formControl){
            formControl.addEventListener("click", function(){
                this.style.border = "1px solid green"
            })
            formControl.addEventListener("blur", function() {
                this.style.border = "1px solid #F8F8F8"
            });
        })

        //로그인 클릭 시 이벤트
        const submitBtn = document.getElementById("submitBtn");
        const frm = document.getElementById("frm")
        submitBtn.addEventListener("click", function(){
            frm.submit();
        })

        //모달
        //아이디찾기
        const findIdBtnModal = document.getElementById("findIdBtnModal");
        const nameModal = document.getElementById("nameModal");
        const birthModal = document.getElementById("birthModal");
        const findIdModalText = document.getElementById("findIdModalText");
        findIdBtnModal.addEventListener("click", function(){
            findIdModalText.innerText = null;
            //공백 잡아내기
            if(/[\s]+/.test(nameModal.value)) {
                findIdModalText.innerText = "유효하지 않은 형식입니다."
                nameModal.value = null;
                nameModal.focus();
            }else if(nameModal.value.length === 0){
                findIdModalText.innerText = "성명은 필수 항목입니다."
            }else if(birthModal.value.length === 0){
                findIdModalText.innerText = "생년월일은 필수 항목입니다."
            }else{
                // 모달 창 유지하며 db 검색
                $.ajax({
                    url: "/login/findId", // 호출할 URL 주소
                    type: "POST", // 전송 방식
                    contentType: "application/json", // 요청의 컨텐츠 타입
                    data: JSON.stringify({ // 서버에 보낼 데이터를 JSON 문자열로 변환
                        userName: nameModal.value,
                        birthday: birthModal.value
                    }),
                    success: function(result){
                        findIdModalText.innerText = result.text;
                    },
                    error: function(request,status,error) {
                        // AJAX 호출에 실패한 경우 수행할 콜백 함수
                        console.log("code: " + request.status + "\n" + "error: " + error);
                    }
                });
            }
        })
        //비밀번호 찾기
        const emailModal = document.getElementById("emailModal");
        const emailModalBtn = document.getElementById("emailModalBtn");
        const verificationModal = document.getElementById("verificationModal");
        const verificationModalBtn = document.getElementById("verificationModalBtn");
        const findPwModalText = document.getElementById("findPwModalText")
        emailModalBtn.addEventListener("click", function(){
            findPwModalText.innerText = null;
            //공백 잡아내기
            if(/[\s]+/.test(emailModal.value) || (emailModal.value.length === 0)) {
                findPwModalText.innerText = "이메일은 필수항목입니다."
                emailModal.value = null;
                emailModal.focus();
            }
        });



    </script>
</body>
</html>
