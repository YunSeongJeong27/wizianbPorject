<%@ page import="org.springframework.security.crypto.password.PasswordEncoder" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-10
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>원서작성_기본정보</title>
    <style>
        #info_pw {
            font-size: 13px;
            color: red;
        }

        #info_pwChange, #info_email {
            white-space: nowrap;
        }
        #info_pw {
            font-size: 13px;
            color: red;
        }

        #application_btn button {
            background: #003A78;
            border-style: none;
            padding: 10px 15px;
        }

        #info_title h3 {
            font-weight: bolder;
        }

        #info_subTitle {
            font-weight: bolder;
            font-size: 20px;
        }
    </style>

</head>
<body>
<div class="my-3 d-flex justify-content-center">
    <div class="container-sub-header" style="width: 1440px;">
        <div class="d-flex flex-row justify-content-between px-3">
            <div class="page-title" id="headerText">${title}</div>

            <div class="d-flex align-items-center">
                <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <div class="breadcrumb d-flex align-items-center" id="breadCrumb">
                        <div id="breadcrumbDiv1" class="breadcrumb-item" style="cursor:pointer;">
                            <i class="bi bi-house-door"></i>
                        </div>
                        <div id="breadcrumbDiv2" class="breadcrumb-item" style="cursor:pointer;">원서작성</div>
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">기본정보</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="my-5 container">
    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userInfo" class="active">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userEdu">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userExp">경력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="/userIntroduce">자기소개서</a>
                    </li>
                </ul>
            </div>
        </div>

        <div id="info_title" class="col-lg-9">
            <h3 class="mb-3">자바기반 풀스택 개발자 취업과정</h3>
            <div id="info_subTitle" class="title mt-5 mb-1">
                기본정보
            </div>
            <div class="border-top border-dark border-2">
                <form action="/application/join" id="joinForm" method="post" enctype="multipart/form-data">

                    <c:if test="${loginId!=null}"/>

                    <div><input type="hidden" name="rcrtNo" value="${appInfo.rcrtNo}"></div>
                    <div><input type="hidden" name="aplyNo" value="${appInfo.aplyNo}"></div>

<%--사진업로드--%>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            사진
                        </div>
                        <div class="col">
                            <div id="image_container">
                                <img id="image" width="94.4" height="113.3" src="${pageContext.request.contextPath}/profileImage/${appInfo.picFileNo}.png">
                            </div>
                            <div class="d-flex justify-content mt-1">
                                <input type="file" id="file_add" accept="image/*" name="pictureUrl" onchange="setThumbnail(event);" style="display: none">
                                <label for="file_add" class="btn btn-sm btn-dark me-1">업로드</label>
                                <button type="button" class="btn btn-sm btn-dark" onclick="imgHidden()">삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            모집과정명
                        </div>
                        <div class="col-lg-10">
                            <select class="form-select" name="courseDiv" disabled>
<%--                                <option selected>${courseDiv}</option>--%>
                                <option selected>JAVA</option>
                                <option>Python</option>
                                <option>C++</option>
                                <option>빅데이터</option>
                            </select>
                        </div>
                    </div>
<%--이메일--%>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            이메일
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <div class="d-flex justify-content">
                                <div class="me-2">
                                    <input type="text" class="form-control" name="email" value="${appInfo.email}" disabled>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-sm btn-dark" disabled>이메일인증</button>
                                </div>
                            </div>
                        </div>
<%--비밀번호 --%>
                        <div class="col-lg-2">
                            비밀번호
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <div>
                                <div class="d-flex justify-content">
                                    <div class="me-1">
                                        <input type="password" class="form-control" id="modalMessage" name="pw" value="${member.pw}">
                                    </div>
                                    <div>
                                        <button type="button" id="info_pwChange" class="btn btn-sm btn-dark" data-bs-toggle="modal" data-bs-target="#passwordModal">
                                            비밀번호변경
                                        </button>
                                    </div>
                                </div>
                                <div>
                                    <p id="info_pw">※비밀번호는 8자리 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야합니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-lg-2">
                            비밀번호확인
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="password" class="form-control" name="passwordCheck" id="pwCheck" value="${member.pw}">
                        </div>
                        <div class="col-lg-2">
                            성별구분
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <select class="form-select" name="gender">
                                <option>${appInfo.gender}</option>
                                <option>남자</option>
                                <option>여자</option>
                                <option>기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            성명
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="nameKor" value="${appInfo.nameKor}">
                        </div>
                        <div class="col-lg-2">
                            생년월일
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="date" class="form-control" name="birthday" value="${appInfo.birthday}">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            성명(영어)
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="nameEng" value="${appInfo.nameEng}">
                        </div>
                        <div class="col-lg-2">
                            휴대폰번호
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="hpLocal" value="${appInfo.hpLocal}">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            우편번호
                        </div>
                        <div class="col-lg-4">
                            <div class="row g-3">
                                <div class="col-auto">
                                    <input type="text" id="zipcode" class="form-control" name="zipcode" value="${appInfo.zipcode}">
                                </div>
                                <div class="col-auto">
                                    <button type="button" class="btn btn-sm btn-dark" onclick="searchPost()">검색</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            전화번호
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="telLocal" value="${appInfo.telLocal}">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            주소
                        </div>
                        <div class="col-lg-4">
                            <input type="text" id="addrLocal" class="form-control" name="addrLocal" value="${appInfo.addrLocal}">
                        </div>
                        <div class="col-lg-2">
                            상세주소
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="addrDetail" value="${appInfo.addrDetail}">
                        </div>
                    </div>

<%-- Buttons --%>
                    <div id="application_btn" class="d-flex justify-content-center mt-4">
                        <button type="button" class="btn btn-dark" onclick="passwordCheckFn()">저장</button>
                    </div>
                    <div id="apply_complete" class="d-flex justify-content-end mt-5">
                        <button type="button" class="btn btn-secondary" disabled>저장 후 이동</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%--비밀번호 변경 모달--%>
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호변경</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/updatePassword" method="post" id="pwChangeForm">
                    <div class="mb-3">
                        <input type="hidden" name="loginId" value="${member.loginId}">
                        <div><input type="hidden" name="password" value="${member.pw}"></div>
                        <div>
                            <label for="originPassword" class="col-form-label">변경전 비밀번호</label>
                            <span id="pw-check-warn" class="mb-2"></span>
                        </div>
                        <div class="flex-fill me-2">
                            <input type="password" id="originPassword" class="form-control" name="pw">
                        </div>
                    </div>
                    <div class="mb-3">
                        <div>
                            <label for="newPassword" class="col-form-label">변경후 비밀번호</label>
                        </div>
                        <div class="flex-fill me-2">
                            <input type="password" id="newPassword" class="form-control" name="newPw">
                        </div>
                    </div>
                <div class="mb-3">
                    <div>
                        <label for="newPwCheck" class="col-form-label">비밀번호 확인</label>
                    </div>
                    <div class="flex-fill me-2">
                        <input type="password" id="newPwCheck" class="form-control">
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" onclick="updatePw()">확인</button>
            </div>
        </div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/*사진업로드*/
    function setThumbnail(event){
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.getElementById('image');

            img.setAttribute("src",event.target.result);
            document.querySelector("div#image_container").appendChild(img);
            img.style.visibility="visible";
        };
        reader.readAsDataURL(event.target.files[0]);
    }

/*사진삭제버튼*/
    function imgHidden() {
        const uploadImg = document.getElementById("image");
        uploadImg.style.visibility="hidden";
    }


    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    const breadcrumbDiv2 = document.getElementById("breadcrumbDiv2");
    const breadcrumbDiv3 = document.getElementById("breadcrumbDiv3");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
    breadcrumbDiv2.addEventListener("click",function(){
        window.location.href = "/userInfo";
    })
    breadcrumbDiv3.addEventListener("click",function(){
        window.location.href = "/userInfo";
    })

/*주소검색*/
    function searchPost(){
        new daum.Postcode({
            oncomplete: function(data) {
                document.querySelector("#zipcode").value = data.zonecode;
                document.querySelector("#addrLocal").value = data.address;
            }
        }).open();
    }

/*select이메일주소*/
    const emailSelect = document.getElementById('emailSelect');
    const emailInput = document.getElementById('emailAddr');

    emailSelect.addEventListener('change', function() {
        const selectedValue = emailSelect.value;

        if (selectedValue !== '직접입력') {
            emailInput.value = selectedValue;
        }else{
            emailInput.value="";
        }
    });


/*비밀번호변경 모달창 띄우기*/
    const emailModal = document.getElementById('passwordModal')
    if (emailModal) {

        const newPwInput = emailModal.querySelector('#newPwCheck'); // 모달창 입력 필드
        const modalMessageInput = document.querySelector('#modalMessage'); //비밀번호input
        const pwCheck = document.querySelector('#pwCheck');//비밀번호확인 input

        emailModal.addEventListener('show.bs.modal', event => {
        });
        emailModal.addEventListener('hidden.bs.modal', event => {
            modalMessageInput.value = newPwInput.value; // 이메일 입력값을 메시지 입력 필드로 복사
            modalMessageInput.value = pwCheck.value;
            document.querySelector('#modalMessage').setAttribute('disabled');
        });
    }


    /*비밀번호 체크 form*/
        function updatePw() {

            const password = document.getElementById('modalMessage').value;
            const inputPassword = document.getElementById('originPassword').value;
            const newPw = document.getElementById('newPassword').value;
            const newPwCheck = document.getElementById('newPwCheck').value;
            const updatePwForm = document.getElementById('pwChangeForm');
            const pwModal = document.getElementById('passwordModal')


            if(inputPassword==""){
                alert("현재 비밀번호를 입력해주세요");
                inputPassword.focus();
                return false;
            }
            if(newPw==""){
                alert("새로운 비밀번호를 입력해주세요.");
                newPw.focus();
                return false;
            }
            if (newPwCheck==""){
                alert("비밀번호를 한번 더 입력해주세요.");
                newPwCheck.focus();
                return false;
            }
            if(newPw!=newPwCheck){
                alert("비밀번호가 일치하지 않습니다.");
                newPwCheck.focus();
                return false;
            }
            $.ajax({
                url: "/pwCheck",
                type: "POST",
                dataType: "json",
                data: {
                    password: password,
                    inputPassword: inputPassword
                },
                success: function (data) {
                    if (data == 0) {
                        alert("패스워드가 틀렸습니다.");
                        return;
                    } else {
                        if (confirm("변경하시겠습니까?")) {
                            updatePwForm.submit();
                            pwModal.modal("hide");
                        }

                    }
                }
            })
        }

/*비밀번호 유효성검사*/
    function passwordCheckFn(){
        const firstPw = document.querySelector('#pw');
        const secondPw = document.querySelector('#pwCheck');
        const joinForm = document.getElementById('joinForm');

        var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        var pw = firstPw.value;

        if(firstPw.value===secondPw.value){
            if(reg.test(pw)){
                joinForm.submit();
            }else{
                alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
            }
        }else{
            alert("비밀번호가 일치하지 않습니다.");
        }
    }


</script>
</body>
</html>