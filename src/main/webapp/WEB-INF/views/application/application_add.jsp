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
        #apply_addFile{
            padding: 8px;
        }

        .title {
            font-size: 18px;
            font-weight: 600;
        }


        .table tbody tr td:nth-child(n+2) {
            text-align: right;
        }
        #apply_table td input {
            width: 300px;
        }
        #apply_table colgroup col:first-child, col:nth-child(2){
            width: 20%;
        }
        #apply_table colgroup col:nth-child(3){
            width: 60%;
        }
        #apply_table tbody input{
            background: #f9f9f9;
            border-style: none;
            height: 30px;
            display: inline-block;
        }

        #application_div {
            border: none;
        }

        #application_div:focus {
            outline: none;
            box-shadow: none;
        }

        #apply_prev {
            margin: 0 2px;
            padding: 10px 15px;
        }

    </style>
    <script src="../../jquery-3.6.4.js"></script>
</head>
<body>
<div class="my-5 container h-100">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">추가제출서류</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">마이페이지</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">추가제출서류</li>
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
                        <a href="#">지원서확인</a>
                    </li>
                    <li class="py-2">
                        <a href="#" class="active">추가제출서류</a>
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
            <h3 class="title mt-5 mb-1">추가제출서류</h3>
            <%-- Buttons --%>
            <div id="application_btn" class="d-flex justify-content-end mb-3">
                <button type="button" id="apply_addFile" class="btn btn-primary btn-sm" onclick="addFile()">서류추가</button>
            </div>
            <div class="border-top border-dark border-2">
                <table id="apply_table" class="table table-hover align-middle">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="table-light text-center">
                    <tr>
                        <th>제출서류</th>
                        <th>기관명</th>
                        <th>첨부파일</th>
                    </tr>
                    </thead>
                    <%-- 반복 start --%>
                    <tbody>
                    <tr>
                        <td><div>지원서(가림A형)</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>지원서(필기용)</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>지원서(가림B형)</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>학위증명서</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>활동이력증명</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>필기고사답안지</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><div>지원서(보관용)</div></td>
                        <td></td>
                        <td>
                            <input type="text" class="form-control">
                            <button type="button" class="btn btn-sm btn-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>

                    </tbody>
                    <%-- 반복 end --%>
                </table>
                <%-- Buttons --%>
                <div id="application_btn" class="d-flex justify-content-start mt-4">
                    <button type="button" id="apply_prev" class="btn btn-secondary">이전</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function addFile(){

        var table = document.getElementById('apply_table');

        var newRow = table.insertRow();
        var newCell1 = newRow.insertCell(0);
        var newCell2 = newRow.insertCell(1);
        var newCell3 = newRow.insertCell(2);

        newCell1.innerHTML='<div><select id="apply_select" class="form-select" aria-label="Default select example">' +
            '<option selected></option>'+
            '<option value="학위증명서">학위증명서</option>' +
            '<option value="활동이력증명">활동이력증명</option>'+
            '</select></div>';
        newCell2.innerHTML="<div></div>";
        newCell3.innerHTML='<input type="text" class="form-control me-1">' +
            '<button type="button" class="btn btn-sm btn-dark me-1">업로드</button>' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>';
    }
</script
<%@include file="../user/footer.jsp" %>
</body>
</html>
