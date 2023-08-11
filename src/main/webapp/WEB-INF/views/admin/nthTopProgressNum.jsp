<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
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
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
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

        /* text edit */
        .tui-grid-layer-editing .tui-grid-content-text{
            height: 100% !important;
            border: none !important;
            text-align: center !important;
        }
        /* select eidt */
        .tui-grid-editor-select-box-layer .tui-select-box .tui-select-box-input,
        .tui-select-box-input.tui-select-box-open{
            border: none !important;
            border-bottom: 1px solid #aaa !important;
        }
    </style>
</head>

<body>
    <div class="container-table">
        <%--TOP--%>
        <div class="col-12">
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

        <%--HEAD--%>
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

        <%--BODY--%>
        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>

            <%-- 페이징 --%>
<%--                <div class="position-absolute top-50 end-0 translate-middle-y">--%>
<%--                    <p class="pageLoc">현재:1/전체:14(1~5)</p>--%>
<%--                </div>--%>
        </div>
    </div>


<script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const gridTheme = new tui.Grid.applyTheme('default', {
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

    document.addEventListener('DOMContentLoaded', function () {
        var firstColumName = 'CORS_DIV';

        var nthData = [
            {
                CORS_DIV: 'Java',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 1'
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 2'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 3'
            }
        ];
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
                    header: '교육시작일',
                    sortingType: 'EDU_ST_DT',
                    sortable: true, align: 'center'
                },
                {
                    header: '교육종료일',
                    sortingType: 'EDU_END_DT',
                    sortable: true, align: 'center'
                },
                {
                    header: '수업개월수',
                    name: 'YR_CNT',
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
                nthTable.focus(0, firstColumName, true);

                rowDataLoad(0, nthTable, "inputTable");

                document.querySelector("#inputTable tbody").setAttribute("id", "row0");

                // 하단 table 수정시 nthTable 반영하기 위한 각 input에 onchange 함수 넣기
                // 데이터 업데이트..
                var tableInput = document.querySelectorAll("#inputTable .tableInput");
                tableInput.forEach((ti) => {
                    ti.addEventListener("change", function(){
                        var rowKey = parseInt(ti.parentNode.parentNode.parentNode.id.substring(3));

                        console.log(rowKey);

                        var idx = nthTable.getIndexOfRow(rowKey);
                        console.log(idx);

                        nthData[idx][ti.getAttribute("name")]=this.value;

                        nthTable.resetData(nthData);
                        nthTable.focus(rowKey, firstColumName, true);
                    })
                });
            }
        });

        // row 클릭 시 하단에 해당 row 데이터 load
        nthTable.on('click', function (ev) {
            if(ev.rowKey == null) return;       // 헤더 클릭 시

            document.querySelector("#inputTable tbody").setAttribute("id", "row"+ev.rowKey);
            rowDataLoad(ev.rowKey, nthTable, "inputTable");
        });

        // 체크박스 전체 선택/해제
        var checkBox = [];
        nthTable.on('checkAll', function (ev) {
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

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

        nthTable.on('drop', ev => {
            firstColumName = nthTable.getColumns()[0]['name'];
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
                    EDU_ST_DT: '',
                    EDU_END_DT: '',
                    YR_CNT: '',
                    NOTE: ''
                }
            ];

            nthTable.appendRow(rowData[0], {
                at: nthTable.getIndexOfRow(nthTable.getFocusedCell()['rowKey'])+1,
                extendPrevRowSpan: true,
                focus: true
            });

            nthData = nthTable.getData();

            // 하단 table 초기화
            var tableInput = document.querySelectorAll("#inputTable .tableInput");
            document.querySelector("#inputTable tbody").setAttribute("id", "row"+nthTable.getFocusedCell()['rowKey']);
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
