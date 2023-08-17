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
        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableInput{
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

    <%@ include file="nthTopProgressNum.jsp"%>

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
                <td class="col-2 tableColor">과정명</td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="courseName" value="NTH_NM"></td>
                <td class="col-2 tableColor">기수코드</td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="nthCode" value="NTH_CD" readonly></td>
            </tr>
            <tr>
                <td class="tableColor">수강년도<span class="text-danger">*</span></td>
                <td class=""><input class="form-control tableInput" type="text" name="entYear" value="ENT_YR"></td>
                <td class="tableColor">분기구분<span class="text-danger">*</span></td>
                <td class="">
                    <select class="form-select tableInput" name="termDiv" aria-label="Default select">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
                <td class="tableColor">수업개월수<span class="text-danger">*</span></td>
                <td class=""><input class="form-control tableInput" type="number" name="EDU_MONTH" value="YR_CNT" id="entInput"></td>
            </tr>
            <tr>
                <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
                <td class=""><input class="form-control tableInput" type="date" name="eduStartDate" value="[CAL] EDU_ST_DT"></td>
                <td class="tableColor">교육종료일<span class="text-danger">*</span></td>
                <td class=""><input class="form-control tableInput" type="date" name="eduEndDate" value="[CAL] EDU_END_DT"></td>
                <td class="tableColor">비고</td>
                <td class="" colspan="5"><input class="form-control tableInput" type="text" name="NOTE" value="NOTE"></td>
            </tr>
        </tbody>
    </table>
</div>


<script>
    // input number 음수 막기
    var entInput = document.getElementById("entInput");
    entInput.addEventListener("click", function () {
        if(this.value < 0){
            this.value = 0;
            alert("음수값은 설정할 수 없습니다.");
        }
    });
    entInput.addEventListener("keydown", function () {
        if(this.value < 0){
            this.value = 0;
            alert("음수값은 설정할 수 없습니다.");
        }
    });
</script>
</body>
</html>
