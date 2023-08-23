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
                    <span class="d-block">비밀번호(생년월일)</span>
                    <input name="password" class="mt-2 d-block form-control" type="password" placeholder="비밀번호">
                </div>
                <div id="submitBtn" class="mt-5 p-2 rounded-1 w-100 text-center text-white" style="background: #3B3B3B; cursor:pointer;">로그인</div>
            </form>
        </div>
        <div class="d-flex justify-content-center">
            <div class="findDIv btn" data-bs-toggle="modal" data-bs-target="#findIDModal">아이디 찾기</div>
            <div class="findDIv btn">비밀번호 찾기</div>
        </div>

    <%-- 모달 --%>
        <div id="findIdModal" class="modal fade" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3 fs-3 fw-bold">아이디 찾기</div>
                        <form id="findIdFrm" action="/login/findId" method="post">
                            <div class="mt-3">
                                <span class="d-block">성명</span>
                                <input id="nameModal" name="nameModal" class="mt-2 d-block form-control" type="text" placeholder="등록된 성명을 입력하세요.">
                            </div>
                            <div class="mt-3">
                                <span class="d-block">생년월일</span>
                                <input id="birthModal" name="birthModal" class="mt-2 d-block form-control" type="number" placeholder="생년월일을 YYYYMMDD 형식으로 입력하세요.">
                            </div>
                            <div class="mt-5 d-flex w-100 justify-content-around">
                                <div id="findIdBtnModal" class="p-2 rounded-1 text-center text-white" style="background: #3B3B3B; cursor:pointer; width: 48%;">찾기</div>
                                <div class="p-2 rounded-1 text-center text-white" style="background: #3B3B3B; cursor:pointer; width: 48%;" data-bs-dismiss="modal">취소</div>
                            </div>
                        </form>
                        <div id="findIdModalText" class="text-center text-danger mt-4 fw-bold" style="height: 30px;"></div>
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
        const findIdFrm = document.getElementById("findIdFrm");
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
                findIdFrm.submit();
            }
        })
    </script>
</body>
</html>
