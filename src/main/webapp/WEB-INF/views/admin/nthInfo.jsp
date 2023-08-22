<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <style>
        .table .tableColor {
            background-color: #FAFAFA;
        }

        .table .tableInput {
            background-color: #F4F4F4;
        }

    </style>
</head>
<body>
<div id="nthInfo" class="container-table m-2">
    <div class="d-flex flex-row justify-content-end mb-1">
                <button id="nthSelectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        <button id="nthInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-1">신규</button>
        <button id="nthSaveBtn" class="btn btn-sm btn-success me-1">저장</button>
        <button id="nthDeleteBtn" class="btn btn-sm btn-danger me-1">삭제</button>
    </div>

    <%@ include file="nthTopProgressNum.jsp" %>

    <table id="inputTable" class="table border fw-bold align-middle mt-4">
        <tbody>
        <tr>
            <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
            <td class="col-2">
                <select class="form-select tableInput" name="courseDiv" aria-label="Default select">
                    <option value="Java">Java</option>
                    <option value="Python">Python</option>
                    <option value="C++">C++</option>
                </select>
            </td>
            <td class="col-2 tableColor">과정명<span class="text-danger">*</span></td>
            <td class="col-2"><input class="form-control tableInput" type="text" name="courseName" value="NTH_NM"></td>
        </tr>

        <tr>
            <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
            <td class=""><input class="form-control tableInput" type="date" name="eduStartDate" id="eduStartDate">
            </td>
            <td class="tableColor"><label for="eduEndDate">교육종료일</label><span class="text-danger">*</span></td>
            <td class=""><input class="form-control tableInput" type="date" name="eduEndDate" id="eduEndDate">
            </td>
            <td class="tableColor">비고</td>
            <td class="" colspan="5"><input class="form-control tableInput" type="text" name="note" value="NOTE"></td>
        </tr>
        </tbody>
    </table>
</div>


<script>
    function calculateCourseMonths({row}) {
        const startDate = row.eduStartDate;
        const endDate = row.eduEndDate;

        const diffInMilliseconds = endDate - startDate;
        const diffInMonths = diffInMilliseconds / (1000 * 60 * 60 * 24 * 30);

        if (!isNaN(diffInMonths) && diffInMonths >= 0) {
            return Math.floor(diffInMonths);
        } else {
            return "";
        }
    }
    function calculateTerm() {
        const startDate = new Date(eduStartDateInput.value);

        termDivSelect.value = Math.ceil((startDate.getMonth() + 1) / 3);
    }
</script>
</body>
</html>
