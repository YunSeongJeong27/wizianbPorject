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
    <div class="container-table m-2">
        <div class="col-12">
            <div class="d-flex flex-row justify-content-end mb-1">
                <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
            </div>
            
            <%@ include file="nthTopScreening.jsp"%>

            <div class="col-12 d-flex flex-row justify-content-between searchResult mt-4">
                <div class="d-flex flex-row align-items-center">
                    <p class="subTitle fw-bold me-2">자기소개서문항</p>
                    <p class="subResult text-secondary me-2">검색결과:0건</p>
                    <select class="form-select w-auto">
                        <option selected>5</option>
                        <option>30</option>
                        <option>50</option>
                        <option>70</option>
                        <option>100</option>
                    </select>
                </div>

                <div>
                    <button id="monhangInsertBtn" class="btn btn-sm btn-light btn-outline-dark">신규</button>
                    <button id="monhangSaveBtn" class="btn btn-sm btn-light btn-outline-dark">저장</button>
                    <button id="monhangDeleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                </div>
            </div>

            <div class="d-flex flex-row justify-content-between mt-2 h-50 bg-white border border-gray-100 rounded-2">
                <div id="monhangTable" class="w-100 h-50"></div>
            </div>
        </div>
    </div>

    <script>
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
                }
            }
        });

        document.addEventListener('DOMContentLoaded', function () {
            const nthData = [
                {
                    CORS_DIV: 'JAVA',
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
                    subTableLoad(0);
                }
            });
            nthTable.on('click', function (ev) {
                subTableLoad(ev.rowKey);
            });
        });

        // monhang테이블 grid
        // nthTable row 누를 때마다 monhangTable 데이터 바뀌게 - db 연동하면 어떻게 해야하나..? 별로
        function subTableLoad(rowKey){
            var monhangData = [];
            var firstColumName = 'Field';

            if(rowKey == null) return;       // 헤더 클릭 시
            else if(rowKey === 0) {          // 일단 nthTable rowKey로 관련 데이터 넣어서 보내는걸로..
                monhangData = [
                    {
                        Field: '1',
                        ITEM_NM: '지원동기',
                        MAX_CHAR: '2000',
                        ITEM_EXPL: 'WIZIAN 정보처리학원에 지원한 동기에 대해서 기술'
                    },
                    {
                        Field: '2',
                        ITEM_NM: '프로그래밍 경험',
                        MAX_CHAR: '1000',
                        ITEM_EXPL: '사용해본 프로그래밍 경험에 대해 기술'
                    }
                ];
            }

            var monhangEl = document.getElementById('monhangTable');
            monhangEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            const monhangTable = new tui.Grid({
                el: monhangEl,
                data: monhangData,
                rowHeaders: ['checkbox'],
                bodyHeight: 340,
                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 30,		//한번에 보여줄 데이터 수
                    visiblePages: 10
                },
                scrollX: true,
                scrollY: true,
                columns: [
                    {
                        header: '문항표시코드',
                        name: 'Field',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '문항명',
                        name: 'ITEM_NM',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '최대허용글자수',
                        name: 'MAX_CHAR',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '문항설명',
                        name: 'ITEM_EXPL',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        editor: 'text'
                    }
                ],
                columnOptions: {
                    resizable: true
                },
                draggable: true,

                // 처음 grid 렌더링 시 첫번째 row에 focus
                onGridMounted() {
                    monhangTable.focus(0, firstColumName, true);
                }
            });


            // 체크박스 전체 선택/해제
            var checkBox = [];
            monhangTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");
                rowKeys.forEach((rowKey) => {
                    checkBox.push(rowKey);
                    monhangTable.addRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
                });
            });
            monhangTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                checkBox.forEach((rowKey) => {
                    monhangTable.removeRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
                });
            });

            // 체크박스 개별 선택/해제
            monhangTable.on('check', function (ev) {
                monhangTable.addRowClassName(ev.rowKey, "checkCell");
            });
            monhangTable.on('uncheck', function (ev) {
                monhangTable.removeRowClassName(ev.rowKey, "checkCell");
            });

            // 데이터 변경 후
            monhangTable.on('afterChange', ev => {
                var changes = ev["changes"][0];
                var rowKey = changes['rowKey']
                var datas = monhangData[monhangTable.getIndexOfRow(rowKey)];
                datas[changes['columnName']] = changes['value'];

                monhangTable.resetData(monhangData);
                monhangTable.focus(rowKey, firstColumName, true);
            });

            monhangTable.on('drop', ev => {
                firstColumName = monhangTable.getColumns()[0]['name'];
            });


            // 신규 버튼 click
            document.getElementById("monhangInsertBtn").addEventListener("click", function () {
                const rowData = [
                    {
                        Field: '',
                        ITEM_NM: '',
                        MAX_CHAR: '',
                        ITEM_EXPL: ''
                    }
                ];

                monhangTable.appendRow(rowData[0], {
                    at: monhangTable.getIndexOfRow(monhangTable.getFocusedCell()['rowKey'])+1,
                    extendPrevRowSpan: true,
                    focus: true
                });

                monhangData = monhangTable.getData();
            });
        }


    </script>
</body>
</html>
