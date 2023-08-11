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
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
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

        /* 그리드 custom css */

        /* 스크롤 자투리 부분 색 변경 */
        .tui-grid-scrollbar-left-bottom,
        .tui-grid-scrollbar-right-bottom,
        .tui-grid-scrollbar-right-top{
            background-color: #fff;
        }

        .tui-grid-cell-current-row td{
            background-color: #F2F7FF;
            font-weight: 600;
            color: #245396;
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

        .nav-pills > .nav-item > .active {
            color: #224FA8 !important;
            background-color: white !important;
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
        .tableInput{
            background-color: inherit;
            border: none;
        }

        /*.nthInfoContainer {*/
        /*    min-width: 1220px;*/
        /*}*/
        /*.nthInfoContainer .d-flex div:nth-child(n+2) {*/
        /*    min-height: 44px;*/
        /*    min-width: 120px;*/
        /*}*/
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
        <div id="nthTable"></div>

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
            <div class="p-2 divBtn active" id="select" data-bs-toggle="tab" type="button" onclick="tabContent(this)">모집전형설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="person" data-bs-toggle="tab" type="button" onclick="tabContent(this)">모집인원설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="schedule" data-bs-toggle="tab" type="button" onclick="tabContent(this)">전형일정설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="document" data-bs-toggle="tab" type="button" onclick="tabContent(this)">제출서류설정</div>
        </div>
    </div>

    <div class="tab-content pt-3 bg-white" id="infoNavContent">
        <!-- 모진접형설정 Content -->
        <div id="select-pane">
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
                        <td class="">
                            <select class="form-select tableInput">
                                <option selected>[S] STEP_DIV[LM0140]</option>
                            </select>
                        </td>
                        <td class="tableColor">단계진행상태</td>
                        <td class="">
                            <select class="form-select tableInput">
                                <option selected>[S] STEP_STS_DIV[LM0040]</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 모집인원설정 Content -->
        <div id="person-pane" style="display: none">
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

            <div id="personGridDiv" class="pt-3"></div>
        </div>

        <!-- 전형일정설정 Content -->
        <div id="schedule-pane" style="display: none">
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

            <div id="scheduleGridDiv" class="pt-3"></div>
        </div>

        <!-- 제출서류설정 Content -->
        <div id="document-pane" style="display: none;">
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

            <div id="documentGridDiv" class="pt-3"></div>
        </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
    class CheckboxRenderer {
        constructor(props) {
            const {grid, rowKey} = props;

            const label = document.createElement('label');
            label.className = 'checkbox tui-grid-row-header-checkbox';
            label.setAttribute('for', String(rowKey));

            const hiddenInput = document.createElement('input');
            hiddenInput.className = 'hidden-input';
            hiddenInput.id = String(rowKey);

            const customInput = document.createElement('span');
            customInput.className = 'custom-input';

            label.appendChild(hiddenInput);
            label.appendChild(customInput);

            hiddenInput.type = 'checkbox';
            label.addEventListener('click', (ev) => {
                ev.preventDefault();

                if (ev.shiftKey) {
                    grid[!hiddenInput.checked ? 'checkBetween' : 'uncheckBetween'](rowKey);
                    return;
                }

                grid[!hiddenInput.checked ? 'check' : 'uncheck'](rowKey);
            });

            this.el = label;

            this.render(props);
        }

        getElement() {
            return this.el;
        }

        render(props) {
            const hiddenInput = this.el.querySelector('.hidden-input');
            const checked = Boolean(props.value);

            hiddenInput.checked = checked;
        }
    }

    // document.addEventListener('DOMContentLoaded', function () {
    window.onload = function() {
        const data = [
            {
                CORS_DIV: 'JAVA',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: ''
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: '장사때려침'
            }
        ];
        function educationPeriodFormatter({row}) {
            const startDate = row.EDU_ST_DT;
            const endDate = row.EDU_END_DT;
            return startDate + "~" + endDate;
        }
        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: data,
            rowHeaders: [
                /*{
                    type: 'rowNum',
                    renderer: {
                        type: RowNumberRenderer
                    }
                },*/
                {
                    type: 'checkbox',
                    header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                    renderer: {
                        type: CheckboxRenderer
                    }
                }
            ],
            pagination: true,
            scrollX: true,
            scrollY: true,
            columns: [
                {
                    header: '과정구분',
                    name: 'CORS_DIV',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '과정명',
                    name: 'SEL_NM',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '기수',
                    name: 'NTH_NM',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수강년도',
                    name: 'ENT_YR',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '분기',
                    name: 'TERM_DIV',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수업개월수',
                    name: '수업개월수',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '교육기간',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                    formatter: educationPeriodFormatter
                },
                {
                    header: '발표일자',
                    name: '발표일자',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '비고',
                    name: 'NOTE',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                }
            ],
            columnOptions: {
                resizable: true
            },

            draggable: false,

        });
        const nthTheme = new tui.Grid.applyTheme('default', {
            cell: {
                normal: {
                    background: '#fff',
                    border: '#E1E1E1',
                    showVerticalBorder: true
                },
                header: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                },
                rowHeader: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                }
                ,
                evenRow: {
                    background: '#F2F3F5',
                    border: '#000'
                },
                oddRow: {
                    background: '#FFF',
                    border: '#000'
                }
            }
        });
    }
    // });


    let personGrid;
    let scheduleGrid;
    let documentGrid;

    function tabContent(e){
        //display 지우기
        const elements = document.querySelectorAll('#select-pane, #person-pane, #document-pane, #schedule-pane');
        elements.forEach(function(element) {
            element.style.display = 'none';
        });

        var content = document.getElementById(e.id+"-pane");

        if(e.id === "select"){
            content.setAttribute("style","display:block");
        }else if(e.id === "person"){
            if(!personGrid){
                const personData = [
                    {
                        TO_CNT: 'TO_CNT',
                        PLAN_CNT: 'PLAN_CNT',
                        APLY_CNT: 'APLY_CNT',
                        SEL_CNT: 'SEL_CNT',
                        PRO_CNT: 'PRO_CNT'
                    },
                    {
                        TO_CNT: 'TO_CNT2',
                        PLAN_CNT: 'PLAN_CNT2',
                        APLY_CNT: 'APLY_CNT2',
                        SEL_CNT: 'SEL_CNT2',
                        PRO_CNT: 'PRO_CNT2'
                    }
                ];
                personGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: personData,
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '모집정원',
                            name: 'TO_CNT',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center'
                        },
                        {
                            header: '선발기준인원',
                            name: 'PLAN_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '지원인원',
                            name: 'APLY_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '최종선발인원',
                            name: 'SEL_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '예비합격인원',
                            name: 'PRO_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        }
                    ],
                    columnOptions: {
                        resizable: true
                    },

                    draggable: false,

                });
            }
            content.setAttribute("style","display:block");
        }else if(e.id === "schedule"){
            if(!scheduleGrid){
                const scheduleData = [
                    {
                        SCHDL_DIV: 'SCHDL_DIV' + '<i class="bi bi-list"></i>',
                        STEP_DIV: 'STEP_DIV',
                        ST_DT: 'ST_DT',
                        END_DT: 'END_DT',
                        STS_DIV: 'STS_DIV',
                    },
                    {
                        SCHDL_DIV: 'SCHDL_DIV' + '<i class="bi bi-list"></i>',
                        STEP_DIV: 'STEP_DIV2',
                        ST_DT: 'ST_DT2',
                        END_DT: 'END_DT2',
                        STS_DIV: 'STS_DIV2',
                    }
                ];
                scheduleGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: scheduleData,
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '전형일정',
                            name: 'SCHDL_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center',
                        },
                        {
                            header: '전형평가단계',
                            name: 'STEP_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center'
                        },
                        {
                            header: '시작일시',
                            name: 'ST_DT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '종료일시',
                            name: 'END_DT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '진행상태',
                            name: 'STS_DIV',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '노출여부',
                            align: 'center',
                            formatter: function (data) {
                                return '<input type="checkbox" name="chk" value="' + data.rowKey + '">'; // 체크박스 HTML 문자열 반환
                            }
                        },
                    ],
                    columnOptions: {
                        resizable: true,
                    },

                    draggable: false,

                });
            }
            content.setAttribute("style","display:block");
        }else if(e.id === "document"){
            if(!documentGrid){
                const documentData = [
                    {
                        DOC_DIV: 'DOC_DIV',
                    },
                    {
                        DOC_DIV: 'DOC_DIV2',
                    }
                ];
                documentGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: documentData,
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '제출서류',
                            name: 'DOC_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center',
                        },
                    ],
                    columnOptions: {
                        resizable: true,
                    },

                    draggable: false,

                });
            }
            content.setAttribute("style","display:block");
        }
    }

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
