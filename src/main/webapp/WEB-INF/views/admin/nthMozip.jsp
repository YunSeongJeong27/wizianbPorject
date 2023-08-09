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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: #F2F3F5;
        }
        .container-table .form-select:focus,
        .container-table .form-control:focus{
            box-shadow: none;
            border-color: #9a9a9a;
        }

        /* 과정 검색 */
        .tableSearch{
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle{
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }
        .searchResult .subResult{
            font-size: 14px;
            margin-bottom: 0;
        }
        .searchResult select.form-select{
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }


        /* 과정 정보 테이블 */
        .nthInfoResponsive{
            overflow-x: auto;
        }
        .nthInfoContainer{
            min-width: 1220px;
            cursor: pointer;
        }
        .nthInfoContainer .d-flex{
            border-bottom:1px solid #E1E1E1;
        }
        .nthInfoContainer .d-flex div:nth-child(n+2){
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }
        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox']{
            height: 44px;
            border:none;
        }

        .nthInfoContainer .th{
            background-color: #EFEFEF;
            font-weight: 600;
        }
        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even){
            background-color: #fff;
        }
        .nthInfoContainer .d-flex.td:nth-child(odd){
            background-color: rgba(0,0,0,0);
        }
        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover{
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk{
            background-color: #D1D1D1 !important;
        }
        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg{
            background-color: #F2F7FF !important;
            border: 1px solid #245396 !important;
            font-weight: 600;
            color: #245396;
        }


        /* 페이징 */
        .pagination ul {
            margin: 15px 0;
            border: none;
            padding: 0;
        }
        .pagination ul li{
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }
        .pagination ul li.active{
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }
        .pagination ul li:not(.active):hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
        }
        .pagination .pageLoc {
            margin: 0 10px 0 0;
            color: #797676;
        }

    /*하단*/
        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableColorHead{
            background-color: #EFEFEF;
        }


        .divBtn{
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;

            color: #9E9FA8 !important;
            background-color: #C2C2C4 !important;

            cursor: pointer;
        }

        .nav-pills > .nav-item > .active{
            color: #224FA8 !important;
            background-color: white !important;
        }

        .infoCheck[type=checkbox] {
            transform : scale(1.3);
        }

        .infoInput::-webkit-inner-spin-button {
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
        }
        .infoInput{
            background: none;
            border: none;
            text-align: center;
            cursor: pointer;
        }

        .infoTr >td:hover{
            background-color: #D1D1D1;
        }

    </style>
</head>
<body>
<div class="container-table m-2">
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
            <button id="insertBtn" class="btn btn-sm btn-light me-1">신규</button>
            <button id="saveBtn" class="btn btn-sm btn-light me-1">저장</button>
            <button id="deleteBtn" class="btn btn-sm btn-light me-1">삭제</button>
        </div>

        <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
            <div class="col-2 align-middle tableSearch">수강년도/분기</div>
            <div class="col-1 me-1"><input type="text" class="form-control"></div>
            <div class="col-1 me-2">
                <select class="form-select">
                    <option selected>1분기</option>
                    <option>2분기</option>
                    <option>3분기</option>
                    <option>4분기</option>
                </select>
            </div>

            <div class="col-2 tableSearch">과정구분</div>
            <div class="col-2 me-2">
                <select class="form-select">
                    <option selected>Java</option>
                    <option>Python</option>
                    <option>C++</option>
                </select>
            </div>

            <div class="col-2 tableSearch">과정명</div>
            <div class="col-2"><input type="text" class="form-control"></div>
        </div>
    </div>

    <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
        <div class="col-3 d-flex flex-row align-items-center">
            <p class="subTitle fw-bold me-2">모집기수정보</p>
            <p class="subResult text-secondary me-2">검색결과:00건</p>
            <div>
                <select class="form-select">
                    <option selected>5</option>
                    <option>30</option>
                    <option>50</option>
                    <option>70</option>
                    <option>100</option>
                </select>
            </div>
        </div>
    </div>

    <div class="nthInfoTable text-center border border-gray-100 rounded-2">
        <div class="nthInfoResponsive">
            <div class="nthInfoContainer">
                <div class="d-flex flex-row align-items-center th">
                    <div class="col-1 chkBox"><input type="checkbox" id="chkAll"></div>
                    <div class="col-1">과정구분</div>
                    <div class="col-2">과정명</div>
                    <div class="col-1">기수</div>
                    <div class="col-1">수강년도</div>
                    <div class="col-1">분기</div>
                    <div class="col-1">수업개월수</div>
                    <div class="col-2">교육기간</div>
                    <div class="col-1">발표일자</div>
                    <div class="col-1">비고</div>
                </div>
                <div class="d-flex flex-row align-items-center td tdBg" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                    <div class="col-1 tableData">JAVA</div>
                    <div class="col-2 tableData">자바기반 풀스택</div>
                    <div class="col-1 tableData">3</div>
                    <div class="col-1 tableData">2023</div>
                    <div class="col-1 tableData">1</div>
                    <div class="col-1 tableData">6</div>
                    <div class="col-2"><span class="tableData">2022-12-10</span> ~ <span class="tableData">2023-05-15</span></div>
                    <div class="col-1 tableData">2022-12-02</div>
                    <div class="col-1 tableData"></div>
                </div>


                <div class="d-flex flex-row align-items-center td" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                    <div class="col-1 tableData">Python</div>
                    <div class="col-2 tableData">파이썬</div>
                    <div class="col-1 tableData">1</div>
                    <div class="col-1 tableData">2022</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-1 tableData">3</div>
                    <div class="col-2"><span class="tableData">2022-05-10</span> ~ <span class=" tableData">2022-08-20</span></div>
                    <div class="col-1 tableData">2022-05-01</div>
                    <div class="col-1 tableData">비고비고</div>
                </div>
                <div class="d-flex flex-row align-items-center td" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                    <div class="col-1 tableData">C++</div>
                    <div class="col-2 tableData">C++ 코딩테스트</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-1 tableData">2023</div>
                    <div class="col-1 tableData">4</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-2"><span class="tableData">2023-10-10</span> ~ <span class=" tableData">2022-11-10</span></div>
                    <div class="col-1 tableData">2022-09-20</div>
                    <div class="col-1 tableData"></div>
                </div>
            </div>
        </div>

        <%-- 페이징 --%>
        <div class="pagination d-flex flex-row justify-content-center text-center position-relative tr">
            <ul>
                <li class="active">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li>7</li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
                <li>></li>
                <li>>></li>
            </ul>

            <div class="position-absolute top-50 end-0 translate-middle-y">
                <p class="pageLoc">현재:1/전체:14(1~5)</p>
            </div>
        </div>
    </div>

<%--하단--%>
    <div class="nav nav-pills nav-tabs fw-bold text-center col-4 d-flex justify-content-between mt-4" id="infoNav" role="tablist">
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn active" id="select-tab" data-bs-toggle="tab" data-bs-target="#select-tab-pane" role="tab" aria-controls="select-tab-pane" aria-selected="true">모집전형설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="person-tab" data-bs-toggle="tab" data-bs-target="#person-tab-pane" type="button" role="tab" aria-controls="person-tab-pane" aria-selected="false">모집인원설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="schedule-tab" data-bs-toggle="tab" data-bs-target="#schedule-tab-pane" type="button" role="tab" aria-controls="schedule-tab-pane" aria-selected="false">전형일정설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="document-tab" data-bs-toggle="tab" data-bs-target="#document-tab-pane" type="button" role="tab" aria-controls="document-tab-pane" aria-selected="false">제출서류설정</div>
        </div>
    </div>

    <div class="tab-content pt-3 bg-white" id="infoNavContent">
        <!-- 모진접형설정 Content -->
        <div class="tab-pane fade show active" id="select-tab-pane" role="tabpanel" aria-labelledby="select-tab" tabindex="0">
            <div class="d-flex col-5 justify-content-around align-items-center">
                <div class="col-4 ms-3 fw-bold d-flex">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정단계/상태</div>
                </div>
                <div class="col-3">
                    <select class="form-select">
                        <option selected>(미선택)</option>
                        <option>테스트접수</option>
                        <option>지원서접수</option>
                    </select>
                </div>
                <div class="col-3">
                    <select class="form-select">
                        <option selected>(미선택)</option>
                        <option>준비중</option>
                        <option>진행</option>
                        <option>완료</option>
                    </select>
                </div>
                <div class="col-2">
                    <div class="btn btn-outline-secondary w-100 fw-bold">변경</div>
                </div>
            </div>
            <div class="p-3">
                <table class="table border fw-bold align-middle">
                    <tr>
                        <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                        <td class="col-2">
                            <select class="form-select tableInput" aria-label="Default select">
                                <option selected>[S] CORS_DIV [LM0010]</option>
                            </select>
                        </td>
                        <td class="col-2 tableColor">수강년도<span class="text-danger">*</span></td>
                        <td class="col-2"><input class="form-control tableInput" type="text" value="ENT_YR"></td>
                        <td class="col-2 tableColor">분기구분<span class="text-danger">*</span></td>
                        <td class="col-2">
                            <select class="form-select tableInput" aria-label="Default select">
                                <option selected>[S] TERM_DIV [CO0005]</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableColor">과정명</td>
                        <td class=""><input class="form-control tableInput" type="text" value="[S] NTH_NM"></td>
                        <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" type="date" value="[CAL] EDU_ST_DT(자동)"></td>
                        <td class=" tableColor">교육종료일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" type="date" value="[CAL] EDU_END_DT(자동)"></td>
                    </tr>
                    <tr>
                        <td class="tableColor">모집전형명</td>
                        <td class="" colspan="3"><input class="form-control tableInput" type="text" value="SEL_NM"></td>
                        <td class="tableColor">모집전형번호</td>
                        <td class=""><input class="form-control tableInput" type="text" value="SEL_CD (자동)"></td>
                    </tr>
                    <tr>
                        <td class="tableColor">현재 전형일정</td>
                        <td class=""><input class="form-control tableInput" type="text" value="[S] SCHDL_DIV[LMB020]" readonly></td>
                        <td class="tableColor">전형평가단계</td>
                        <td class=""><input class="form-control tableInput" type="date" value="[S] STEP_DIV[LM0140]" readonly></td>
                        <td class="tableColor">단계진행상태</td>
                        <td class=""><input class="form-control tableInput" type="date" value="[S] STEP_STS_DIV[LM0040]"></td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 모집인원설정 Content -->
        <div class="tab-pane fade" id="person-tab-pane" role="tabpanel" aria-labelledby="person-tab" tabindex="0">
            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>모집인원설정</div>
                </div>
                <div class="d-flex justify-content-around me-3" style="width: 13%;">
                    <div class="btn btn-outline-secondary" style="width: 30%;">신규</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">삭제</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">저장</div>
                </div>
            </div>

            <div class="p-3">
                <table class="table table-bordered border fw-bold align-middle text-center">
                    <tr>
                        <td class="tableColorHead" style="width: 5%;">
                            <input type="checkbox" name="personCheck" class="infoCheck">
                        </td>
                        <td class="tableColorHead" style="width: 19%;">모집정원</td>
                        <td class="tableColorHead" style="width: 19%;">선발기준인원</td>
                        <td class="tableColorHead" style="width: 19%;">지원인원</td>
                        <td class="tableColorHead" style="width: 19%;">최종선발인원</td>
                        <td class="tableColorHead" style="width: 19%;">예비합격인원</td>
                    </tr>
                    <tr class="infoTr">
                        <td class="tableColor">
                            <input type="checkbox" name="personCheck" class="infoCheck">
                        </td>
                        <td class="tableColor">
                            <input type="number" placeholder="TO_CNT" class="infoInput">
                        </td>
                        <td class="tableColor">
                            <input type="number" placeholder="PLAN_CNT" class="infoInput">
                        </td>
                        <td class="tableColor">
                            <input type="number" placeholder="APLY_CNT" class="infoInput">
                        </td>
                        <td class="tableColor">
                            <input type="number" placeholder="SEL_CNT" class="infoInput">
                        </td>
                        <td class="tableColor">
                            <input type="number" placeholder="PRO_CNT" class="infoInput">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 전형일정설정 Content -->
        <div class="tab-pane fade" id="schedule-tab-pane" role="tabpanel" aria-labelledby="schedule-tab" tabindex="0">
            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정설정</div>
                </div>
                <div class="d-flex justify-content-around me-3" style="width: 13%;">
                    <div class="btn btn-outline-secondary" style="width: 30%;">신규</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">삭제</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">저장</div>
                </div>
            </div>

            <div class="p-3">
                <table class="table table-bordered border fw-bold align-middle text-center">
                    <tr>
                        <td class="tableColorHead" style="width: 5%;">
                            <input type="checkbox" name="scheduleCheck1" class="infoCheck">
                        </td>
                        <td class="tableColorHead" style="width: 17%;">전형일정<span class="text-danger">*</span></td>
                        <td class="tableColorHead" style="width: 17%;">전형평가단계</td>
                        <td class="tableColorHead" style="width: 17%;">시작일시<span class="text-danger">*</span></td>
                        <td class="tableColorHead" style="width: 17%;">종료일시<span class="text-danger">*</span></td>
                        <td class="tableColorHead" style="width: 17%;">진행상태<span class="text-danger">*</span></td>
                        <td class="tableColorHead" style="width: 10%;">노출여부</td>
                    </tr>
                    <tr class="infoTr">
                        <td class="tableColor">
                            <input type="checkbox" name="scheduleCheck1" class="infoCheck">
                        </td>
                        <td class="tableColor">
                            <input type="text" value="SCHDL_DIV" class="infoInput" id="schdlDiv1" readonly>
                            <i class="bi bi-list btn" id="1"></i>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">PLAN_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">APLY_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">SEL_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">PRO_CNT</div>
                        </td>
                        <td class="tableColor">
                            <input type="checkbox" name="scheduleCheck2" class="infoCheck">
                        </td>
                    </tr>
                    <tr class="infoTr">
                        <td class="tableColor">
                            <input type="checkbox" name="scheduleCheck1" class="infoCheck">
                        </td>
                        <td class="tableColor">
                            <input type="text" value="SCHDL_DIV" class="infoInput" id="schdlDiv2" readonly>
                            <i class="bi bi-list btn" id="2"></i>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">PLAN_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">APLY_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">SEL_CNT</div>
                        </td>
                        <td class="tableColor">
                            <div class="form-control infoInput">PRO_CNT</div>
                        </td>
                        <td class="tableColor">
                            <input type="checkbox" name="scheduleCheck2" class="infoCheck">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 제출서류설정 Content -->
        <div class="tab-pane fade" id="document-tab-pane" role="tabpanel" aria-labelledby="document-tab" tabindex="0">
            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>제출서류설정</div>
                </div>
                <div class="d-flex justify-content-around me-3" style="width: 13%;">
                    <div class="btn btn-outline-secondary" style="width: 30%;">신규</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">삭제</div>
                    <div class="btn btn-outline-secondary" style="width: 30%;">저장</div>
                </div>
            </div>

            <div class="p-3">
                <table class="table table-bordered border fw-bold align-middle text-center">
                    <tr>
                        <td class="tableColorHead" style="width: 5%;">
                            <input type="checkbox" name="scheduleCheck1" class="infoCheck">
                        </td>
                        <td class="tableColorHead" style="width: 95%;">제출서류</td>
                    </tr>
                    <tr class="infoTr">
                        <td class="tableColor">
                            <input type="checkbox" name="documentCheck" class="infoCheck">
                        </td>
                        <td class="tableColor">
                            <div class="infoInput">DOC_DIV</div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onload = function () {
        inputValue();
    }

    // 체크박스 전체 선택
    var chkAll = document.getElementById("chkAll");
    var chkBox = document.getElementsByName("checkBox");
    chkAll.addEventListener("click", function(){
        chkBox.forEach((chk) => {
            chk.checked = chkAll.checked;
            check(chk);
        });
    })

    // 체크박스 선택 시 css
    function check(e){
        var td = e.parentElement.parentElement;
        if(e.checked) td.classList.add("tdChk");
        else td.classList.remove("tdChk");
    }

    // row 클릭 시 focus
    function rowFocus(e){
        var tdBg = document.getElementsByClassName("tdBg");

        tdBg[0].classList.remove("tdBg");
        e.classList.add("tdBg");

        // 하단 input에 값 넣기
        inputValue();
    }

    // 하단에 input 값 넣기
    function inputValue(){
        var datas = document.querySelectorAll(".tdBg .tableData");
        var inputs = document.querySelectorAll("#inputTable .tableInput");

        for(var i=0; i<datas.length; i++){
            console.log(inputs[i].tagName);
            if(inputs[i].tagName === 'SELECT') inputs[i].firstElementChild.setAttribute("selected", "selected");
            else inputs[i].value = datas[i].innerText;
        }
    }

    // 신규 btn 클릭 이벤트
    var insertBtn = document.getElementById("insertBtn");
    insertBtn.addEventListener("click", function () {

        // 테이블에 새로운 행 추가
        var tdBg = document.getElementsByClassName("tdBg");

        var td = document.createElement("div");
        td.setAttribute("class", "d-flex flex-row align-items-center td tdBg");
        td.setAttribute("onclick", "rowFocus(this);");

        for(var i=0; i<10; i++){
            var div = document.createElement("div");
            var clazz = "";
            if(i===0) {
                clazz = "col-1 chkBox";
                var input = document.createElement("input");
                input.setAttribute("type", "checkbox");
                input.setAttribute("name", "checkBox");
                input.setAttribute("onclick", "check(this);");

                div.setAttribute("class", clazz);
                div.append(input);
                td.append(div);
                continue;
            }
            else if(i===2 || i===7) clazz = "col-2";
            else clazz = "col-1";

            div.setAttribute("class", clazz);
            td.append(div);
        }
        tdBg[0].after(td);
        tdBg[0].classList.remove("tdBg");


        // 아래 input 초기화
        var inputs = document.querySelectorAll("#inputTable .tableInput");

        var idx = 0;
        inputs.forEach((input) => {
            if(idx === 0 || idx === 4) inputs[idx].firstElementChild.setAttribute("selected", "selected");
            else input.value = "";
            idx++;
        });
    });


//     하단
    //list 클릭 시 이벤트
    var biLists = document.getElementsByClassName("bi-list");
    Array.from(biLists).forEach((element) => {
        //태그 생성
        var div = document.createElement("div");
        var select = document.createElement("select");
        for(let i=0 ; i<5 ; i++){
            var option = document.createElement("option");
            option.innerHTML = i;
            select.appendChild(option);
        }
        div.appendChild(select);

        //style 설정
        div.setAttribute("class","position-absolute");
        select.setAttribute("class","w-100");
        div.setAttribute("style","width:15%;");

        element.addEventListener("click", function() {
            //태그 삽입
            var schdlDiv = document.getElementById("schdlDiv"+this.id);
            schdlDiv.parentElement.appendChild(div);
            //select 변경 시 이벤트
            select.addEventListener("change",function(){
                schdlDiv.value = this.value;
                //태그 삭제
                schdlDiv.parentElement.removeChild(div);
            })
        });
    });
</script>
</body>
</html>
