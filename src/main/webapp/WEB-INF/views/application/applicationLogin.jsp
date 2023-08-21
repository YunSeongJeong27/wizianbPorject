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
            <div class="mx-2 findDIv" data-bs-toggle="modal" data-bs-target="#findIDM">아이디 찾기</div>
            <div class="mx-2 findDIv">비밀번호 찾기</div>
        </div>

    <%-- 모달 --%>
        <div id="findIdModal" class="modal" tabindex="-1">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Modal body text goes here.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
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
    </script>
</body>
</html>
