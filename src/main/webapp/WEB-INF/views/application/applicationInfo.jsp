<%--
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
        .breadcrumbs,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-title {
            font-size: 36px;
            font-weight: 600;
        }

        .breadcrumbs li {
            display: inline-block;
            font-size: 13px;
        }

        .menu ul li a {
            display: inline-block;
            color: #646464;
            padding: 10px;
            font-weight: 600;
        }

        .menu ul li a.active {
            color: #003A78;
        }

        #apply_current {
            font-weight: bolder;
        }

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
                <form action="/application/join" method="post" enctype="multipart/form-data">
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            사진
                        </div>
                        <div class="col">
                            <div id="image_container">
                                <img id="image" width="94.4" height="113.3">
                            </div>
                            <div class="d-flex justify-content mt-1">
                                <input type="file" id="file_add" accept="image/*" name="" onchange="setThumbnail(event);" style="display: none">
                                <label for="file_add" class="btn btn-sm btn-dark me-1">업로드</label>
                                <button type="button" class="btn btn-sm btn-dark">삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            모집과정명
                        </div>
                        <div class="col-lg-10">
                            <select class="form-select" name="courseDiv" disabled>
                                <option selected>자바</option>
                                <option>파이썬</option>
                                <option>빅데이터</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            이메일
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <div class="d-flex justify-content">
                                <div class="me-2">
                                    <input type="text" class="form-control" name="email">
                                </div>
                                <div>
                                    <button type="button" id="info_email" class="btn btn-sm btn-dark">이메일인증</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            비밀번호
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <div>
                                <div class="d-flex justify-content">
                                    <div class="me-1">
                                        <input type="text" class="form-control" name="password">
                                    </div>
                                    <div>
                                        <button type="button" id="info_pwChange" class="btn btn-sm btn-dark" disabled>
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
                            <input type="text" class="form-control" name="passwordCheck">
                        </div>
                        <div class="col-lg-2">
                            성별구분
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <select class="form-select" name="gender">
                                <option>(선택)</option>
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
                            <input type="text" class="form-control" name="nameKor">
                        </div>
                        <div class="col-lg-2">
                            생년월일
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="date" class="form-control" name="birthday">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            성명(영어)
                            <span class="text-danger">*</span>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="nameEng">
                        </div>
                        <div class="col-lg-2">
                            지원자직업
                        </div>
                        <div class="col-lg-4">
                            <select class="form-select" name="">
                                <option>(선택)</option>
                                <option>직장인</option>
                                <option>학생</option>
                                <option>기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            우편번호
                        </div>
                        <div class="col-lg-4">
                            <div class="row g-3">
                                <div class="col-auto">
                                    <input type="text" class="form-control" name="zipcode">
                                </div>
                                <div class="col-auto">
                                    <button type="button" class="btn btn-sm btn-dark">검색</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            전화번호
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="telLocal">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            주소
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="addrLocal">
                        </div>
                        <div class="col-lg-2">
                            휴대폰번호
                        </div>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="hpLocal">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-2">
                            상세주소
                        </div>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" name="addrDetail">
                        </div>
                    </div>


                    <%-- Buttons --%>
                    <div id="application_btn" class="d-flex justify-content-center mt-4">
                        <button type="submit" class="btn btn-dark">저장</button>
                    </div>
                    <div id="apply_complete" class="d-flex justify-content-end mt-5">
                        <button type="button" class="btn btn-secondary" disabled>저장 후 이동</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    function setThumbnail(event){
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.getElementById('image');
            img.setAttribute("src",event.target.result);
            document.querySelector("div#image_container").appendChild(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }

</script>
</body>
</html>