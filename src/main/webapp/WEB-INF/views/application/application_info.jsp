<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-09
  Time: 오후 2:17
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
        #info_pw{
            font-size: 13px;
            color: red;
        }
        .info_input{
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="my-5 container h-100">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">기본정보</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">원서작성</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">기본정보</li>
                </ul>
            </div>
        </div>
        <div>
            <div></div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#" class="active">기본정보</a>
                    </li>
                    <li class="py-2">
                        <a href="#">학력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="#">활동이력</a>
                    </li>
                    <li class="py-2">
                        <a href="#">자기소개서</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="mb-3">
                자바기반 풀스택 개발자 취업과정
            </div>
            <h3 class="title mt-5 mb-1">기본정보</h3>
            <div class="border-top border-dark border-2">
                <table class="table table-hover align-middle">
                    <colgroup>
                        <col style="width: 15%">
                        <col style="width: 35%;">
                        <col style="width: 15%">
                        <col style="width: 35%;">
                    </colgroup>
                    <%--반복문 시작--%>
                    <tbody>
                    <tr class="table-light">
                        <td>사진</td>
                        <td colspan="3">
                            <img class="profile-pic">
                            <div>
                                <input type="file" id="file_add">
                                <label for="file_add" class="btn btn-sm btn-dark">업로드</label>
                                <button type="button" class="btn btn-sm btn-dark">삭제</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>모집과정명</td>
                        <td colspan="3">
                            <select class="form-select" disabled>
                                <option selected>자바</option>
                                <option>파이썬</option>
                                <option>빅데이터</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>
                            <div class="info_input">
                                <input type="text" class="form-control">
                                <button type="button" class="btn btn-sm btn-dark">이메일인증</button>
                            </div>
                        </td>
                        <td>비밀번호</td>
                        <td>
                            <div class="info_input">
                                <input type="text" class="form-control">
                                <button type="button" class="btn btn-sm btn-dark" disabled>비밀번호변경</button>
                            </div>
                            <p id="info_pw">※비밀번호는 8자리 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야합니다.</p>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호확인</td>
                        <td><input type="text" class="form-control"></td>
                        <td>성별구분</td>
                        <td>
                            <select>
                                <option>(선택)</option>
                                <option>남자</option>
                                <option>여자</option>
                                <option>기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>성명</td>
                        <td><input type="text" class="form-control"></td>
                        <td>생년월일</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>성명(영어)</td>
                        <td><input type="text" class="form-control"></td>
                        <td>지원자직업</td>
                        <td>
                            <select>
                                <option>(선택)</option>
                                <option>직장인</option>
                                <option>학생</option>
                                <option>기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">검색</button>
                        </td>
                        <td>지원자직업명</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="text" class="form-control"></td>
                        <td>상세주소</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td colspan="3">전화번호</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    </tbody>
                    <%-- 반복 end --%>
                </table>

                <%-- Buttons --%>
                <div id="application_btn" class="d-flex justify-content-center mt-4">
                    <button type="button" class="btn btn-dark">저장</button>
                </div>
                <div id="apply_complete" class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-secondary" disabled>저장 후 이동</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../user/footer.jsp" %>
</body>
</html>
