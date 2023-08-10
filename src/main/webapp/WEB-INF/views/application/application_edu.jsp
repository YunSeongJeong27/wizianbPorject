<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-09
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>원서작성_학력사항</title>
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

        #add_eduInfo, #save_btn{
            background: #003A78;
        }

    </style>
</head>
<body>
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">학력사항</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">원서작성</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">학력사항</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#" class="active">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
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
            <h3 class="title mt-5 mb-1">학력사항</h3>
            <div class="d-flex justify-content-end mt-5">
                <button type="button" class="btn btn-dark" onclick="remove_btn()">삭제</button>
            </div>
            <div class="border-top border-dark border-2">
                <table class="table table-hover align-middle">
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 30%;">
                        <col style="width: 20%">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                    </colgroup>
                    <tr>
                        <td>학위구분</td>
                        <td>
                            <div class="row g-3">
                                <div class="col-auto">
                                    <select class="form-select">
                                        <option selected></option>
                                        <option>학사학위</option>
                                        <option>석사학위</option>
                                        <option>박사학위</option>
                                    </select>
                                </div>
                                <div class="col-auto">
                                    <select class="form-select">
                                        <option selected></option>
                                        <option>졸업</option>
                                        <option>졸업예정</option>
                                        <option>재학</option>
                                        <option>수료</option>
                                        <option>중퇴</option>
                                        <option>편입</option>
                                    </select>
                                </div>
                            </div>
                        </td>
                        <td>입학년월/졸업년월</td>
                        <td class="col-auto">
                            <input type="date" value="enterYear" class="form-control">
                        </td>
                        <td class="col-auto">
                            <input type="date" value="graduateYear" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td>학위기관명</td>
                        <td><input type="text" class="form-control"></td>
                        <td>학과/전공명</td>
                        <td colspan="2"><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>학위증명서파일등록</td>
                        <td colspan="4">
                            <input type="text" class="form-control" disabled>
                            <label class="btn btn-sm btn-outline-dark">업로드</label>
                            <button type="button" class="btn btn-sm btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                </table>
                <div>
                    <p>※파일명규칙:기수명-성명-파일명.pdf</p>
                </div>
                <div class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-dark" id="add_eduInfo" onclick="add_eduInfo()">학력추가</button>
                </div>
                <%--버튼--%>
                <div>
                    <button type="button" class="btn btn-secondary">이전</button>
                    <button type="button" id="save_btn" class="btn btn-dark">저장</button>
                    <button type="button" class="btn btn-secondary">저장 후 이동</button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
