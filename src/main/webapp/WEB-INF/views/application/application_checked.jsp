<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>Title</title>
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
        #apply_current {
            font-weight: bolder;
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

        .title {
            font-size: 18px;
            font-weight: 600;
        }

        .table tr :nth-child(n+2) {
            width: 83px;
        }

        .table tbody tr td:nth-child(n+2) {
            text-align: center;
        }

        #application_div {
            border: none;
        }

        #application_div:focus {
            outline: none;
            box-shadow: none;
        }

        #application_member {
            font-weight: 600;
        }

        #application_member .member_id {
            color: #f00;
        }

        #application_btn .btn {
            margin: 0 2px;
            padding: 10px 15px;
        }
        #apply_complete .btn{
            padding: 10px 18px;
            background-color: lightgray;
            border-style: none;
            color: #000000;
        }
    </style>
</head>
<body>
<div class="my-5 container h-100">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">지원서확인</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">마이페이지</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">지원서확인</li>
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
                        <a href="/apply" class="active">지원서확인</a>
                    </li>
                    <li class="py-2">
                        <a href="/apply2">추가제출서류</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="mb-3">
                <select id="application_div" class="form-select border-bottom border-dark rounded-0 border-2 fw-bold"
                        aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">지원서확인</h3>
            <div class="border-top border-dark border-2">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr class="table-light text-center">
                        <th>지원서항목</th>
                        <th>상태</th>
                        <th>내용보기</th>
                        <th>최종확인</th>
                    </tr>
                    </thead>
                    <%-- 반복 start --%>
                    <tbody>
                    <tr>
                        <td>기본정보</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>학력사항</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>경력사항</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>자기소개서</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    </tbody>
                    <%-- 반복 end --%>
                </table>

                <div id="application_member" class="d-flex justify-content-center">
                    <p>지원자 님의 수험번호는 <span class="member_id">W123456</span> 입니다.</p>
                </div>

                <%-- Buttons --%>
                <div id="application_btn" class="d-flex justify-content-center mt-4">
                    <button type="button" class="btn btn-primary" disabled>지원서최종제출</button>
                    <button type="button" class="btn btn-secondary" disabled>지원취소</button>
                    <button type="button" class="btn btn-dark">입학원서출력</button>
                    <button type="button" class="btn btn-dark">수험표출력</button>
                </div>
                <div id="apply_complete" class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-secondary">제출서류확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../user/footer.jsp" %>
</body>
</html>
