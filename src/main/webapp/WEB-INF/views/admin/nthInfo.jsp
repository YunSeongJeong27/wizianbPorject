<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="header.jsp"%>
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
        .container-table .tr{
             background-color: #fff;
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
            padding: 0.2rem 2rem 0.2rem 0.75rem;
        }

        /* 그리드 custom css */

        /* 스크롤 자투리 부분 색 변경 */
        .tui-grid-scrollbar-left-bottom,
        .tui-grid-scrollbar-right-bottom,
        .tui-grid-scrollbar-right-top{
            background-color: #fff;
        }

        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-header-area .tui-grid-table,
        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-body-area .tui-grid-table{
            border-right-style: solid;
            border-right-color: #E1E1E1;
        }
        .tui-grid-cell{
            border-left-width: 1px;
        }

        /* 선택한 row */
        .tui-grid-cell-current-row td{
            background-color: #F2F7FF !important;
            font-weight: 600;
            color: #245396;
        }
        /* 체크된 row */
        .checkCell{
            background-color: #D1D1D1 !important;
        }

        /* 페이징 */
        .tui-pagination{
            background-color: #fff;
            margin:0 !important;
            padding: 20px 0 12px;
        }
        .tui-is-disabled:hover{
            background: initial !important;
        }
        .tui-page-btn span{
            margin-top: 9px;
        }
        .tui-pagination .tui-page-btn{
            border: none;
        }
        .tui-pagination .tui-page-btn:hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            font-weight: 600;
        }
        .tui-pagination .tui-is-selected{
            border: none !important;
            background-color: #f5f5f5;
            border-radius: 5px;
            font-weight: 600;
            color: #245396;
        }

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
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="nthSelectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
            <button id="nthInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-1">신규</button>
            <button id="nthSaveBtn" class="btn btn-sm btn-light btn-outline-dark me-1">저장</button>
            <button id="nthDeleteBtn" class="btn btn-sm btn-light btn-outline-dark me-1">삭제</button>
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
        <div class="d-flex flex-row align-items-center">
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
    </div>

    <form>
        <table id="inputTable" class="table border fw-bold align-middle mt-4">
            <tr>
                <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" name="CORS_DIV" aria-label="Default select">
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="C++">C++</option>
                    </select>
                </td>
                <td class="col-2 tableColor">과정명</td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="SEL_NM" value="NTH_NM"></td>
                <td class="col-2 tableColor">기수코드</td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="NTH_NM" value="NTH_CD" readonly></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">수강년도<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="ENT_YR" value="ENT_YR"></td>
                <td class="col-2 tableColor">분기구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" name="TERM_DIV" aria-label="Default select">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
                <td class="col-2 tableColor">수업개월수<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="number" name="YR_CNT" value="YR_CNT" id="entInput"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">교육시작일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" name="EDU_ST_DT" value="[CAL] EDU_ST_DT"></td>
                <td class="col-2 tableColor">교육종료일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" name="EDU_END_DT" value="[CAL] EDU_END_DT"></td>
                <td class="col-2 tableColor">발표일자</td>
                <td class="col-2"><input class="form-control tableInput" type="date" name="ANN_DT" value="2020-10-10"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">비고</td>
                <td class="col-2"><input class="form-control tableInput" type="text" name="NOTE" value="NOTE"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
            </tr>
        </table>
    </form>
</div>


<script>
/*
    // 삭제 btn 클릭 이벤트
    var deleteBtn = document.getElementById("deleteBtn");
    var deleteList = [];
    deleteBtn.addEventListener("click", function(){
        chkBox.forEach((chk) => {
            if(chk.checked) deleteList.push(chk.parentElement.parentElement);
        });

        if(deleteList.length === 0) alert('체크박스를 선택해야합니다.')
        else {
            if(confirm('삭제하시겠습니까?')){
                deleteList.forEach((div) => {
                    div.remove();
                })
                document.querySelector(".nthInfoContainer .td").classList.add("tdBg");
                inputValue();
            }
        }
    })

    // 저장 btn 클릭 이벤트
    var saveBtn = document.getElementById("saveBtn");
    saveBtn.addEventListener("click", function(){
        if(confirm("저장하시겠습니까?")){

        }
    })*/


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

    /* ~ */
    /*class RowNumberRenderer {
        constructor(props) {
            const el = document.createElement('span');
            el.innerHTML = props.formattedValue;
            this.el = el;
        }

        getElement() {
            return this.el;
        }

        render(props) {
            this.el.innerHTML = props.formattedValue;
        }
    }

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
    */

    // Table 테마
    const gridTheme = new tui.Grid.applyTheme('default', {
        row: {
            hover: {
                background: '#D1D1D1'
            }
        },
        cell: {
            normal: {
                background: '#fff',
                border:'#E1E1E1'
            },
            header: {
                background: '#EFEFEF',
                border: '#E1E1E1'
            },
            rowHeader: {
                background: '#EFEFEF',
                border:'#E1E1E1'
            },
            evenRow: {
                background: '#F2F3F5'
            },
            oddRow: {
                background: '#FFF'
            },
            hover: {
                border: '#000'
            },
            float: {
                background: "#fff"
            }
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        var nthData = [
            {
                CORS_DIV: 'Java',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                YR_CNT: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                ANN_DT: '2023-08-01',
                NOTE: ''
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                YR_CNT: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                ANN_DT: '2023-08-01',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                YR_CNT: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                ANN_DT: '2023-08-01',
                NOTE: '장사때려침'
            }
        ];
        function educationPeriodFormatter({ row }) {
            var startDate = row.EDU_ST_DT;
            var endDate = row.EDU_END_DT;
            return startDate + "~" + endDate;
        }
        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: nthData,
            rowHeaders: ['checkbox'],
            pageOptions: {
                useClient: true,	// front에서만 페이징 하는 속성
                perPage: 5,		//한번에 보여줄 데이터 수
                visiblePages: 10
            },
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
                    name: 'YR_CNT',
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
                    name: 'ANN_DT',
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
            draggable: true,

            // 처음 grid 렌더링 시 첫번째 row에 focus 및 하단 테이블에 데이터 load
            onGridMounted() {
                nthTable.focus(0, 'CORS_DIV', true);
                rowDataLoad(0, nthTable, "inputTable");

                // 하단 table 수정시 nthTable 반영하기 위한 각 input에 onchange 함수 넣기
                var tableInput = document.querySelectorAll("#inputTable .tableInput");
                var dataList = nthData[nthTable.getFocusedCell()['rowKey']];
                console.log(dataList);
                tableInput.forEach((ti) => {
                    ti.addEventListener("change", function(){
                        console.log(ti.getAttribute("name"));
                        //dataList[ti.getAttribute("name")]=this.value;
                    })
                });
            }
        });

        // row 클릭 시 하단에 해당 row 데이터 load
        nthTable.on('click', function (ev) {
            if(ev.rowKey == null) return;       // 헤더 클릭 시

            rowDataLoad(ev.rowKey, nthTable, "inputTable");
        });

        // 체크박스 전체 선택/해제
        var checkBox = [];
        nthTable.on('checkAll', function (ev) {
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='CORS_DIV'");

            rowKeys.forEach((rowKey) => {
                checkBox.push(rowKey);
                nthTable.addRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
            });
        });
        nthTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
            checkBox.forEach((rowKey) => {
                nthTable.removeRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
            });
        });

        // 체크박스 개별 선택/해제
        nthTable.on('check', function (ev) {
            nthTable.addRowClassName(ev.rowKey, "checkCell");
        });
        nthTable.on('uncheck', function (ev) {
            nthTable.removeRowClassName(ev.rowKey, "checkCell");
        });

        // 신규 버튼 click
        document.getElementById("nthInsertBtn").addEventListener("click", function () {
            const rowData = [
                {
                    CORS_DIV: '',
                    SEL_NM: '',
                    NTH_NM: '',
                    ENT_YR: '',
                    TERM_DIV: '',
                    YR_CNT: '',
                    EDU_ST_DT: '',
                    EDU_END_DT: '',
                    ANN_DT: '',
                    NOTE: ''
                }
            ];

            nthTable.appendRow(rowData[0], {
                at: nthTable.getIndexOfRow(nthTable.getFocusedCell()['rowKey'])+1,
                extendPrevRowSpan: true,
                focus: true
            });

            // 하단 table 초기화
            var tableInput = document.querySelectorAll("#inputTable .tableInput");
            tableInput.forEach((ti) => {
                ti.value = "";
            });
        });

        // 하단 table 데이터 넣기
        function rowDataLoad(rowKey, table, id){
            var datas = table.getRow(rowKey);
            var tableInput = document.querySelectorAll("#"+id+" .tableInput");
            if(datas == null ) {        // 데이터 x
                tableInput.forEach((ti) => {
                    ti.value = "";
                });
            }else{
                tableInput.forEach((ti) => {
                    var tiName = ti.getAttribute("name");
                    if(tiName==="CORS_DIV" || tiName==="CORS_DIV"){
                        $('select[name='+tiName+']').val(datas[tiName]).prop("selected",true);
                    }
                    ti.value = datas[tiName];
                });
            }
        }
    });


</script>
</body>
</html>
