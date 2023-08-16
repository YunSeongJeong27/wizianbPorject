<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2023-08-11
  Time: 오후 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@include file="header.jsp" %>
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
        .tui-page-btn.tui-next-is-ellip.tui-last-child,
        .tui-page-btn.tui-prev-is-ellip.tui-first-child{
            display: none;
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
    <div class="d-flex flex-row justify-content-end mb-1">
        <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
    </div>
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

    <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
        <div class="col-3 d-flex flex-row align-items-center">
            <p class="subTitle fw-bold me-2">최종합격자명부</p>
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


        <%-- <div class="position-absolute top-50 end-0 translate-middle-y">
             <p class="pageLoc">현재:1/전체:14(1~5)</p>
         </div>--%>
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
        const data = [
            {
                APLY_NO: 'APLY_NO',
                NM_KOR: 'NM_KOR',
                GEN_DIV_NM: 'GEN_DIV_NM'

            },
            {
                APLY_NO: 'APLY_NO2',
                NM_KOR: 'NM_KOR2',
                GEN_DIV_NM: 'GEN_DIV_NM2'
            }
        ];

        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: data,
            rowHeaders: ['rowNum'], //인덱스
            pageOptions: {
                useClient: true,   // front에서만 페이징 하는 속성
                perPage: 5,      //한번에 보여줄 데이터 수
                visiblePages: 10
            },
            scrollX: true,
            scrollY: true,
            header: {
                height:60,
                complexColumns: [
                    {
                        header: '면접전형',
                        name: 'INTERVIEW',
                        childNames: ['INT_AVR', 'INT_RANK']
                    }
                ]
            },
            columns: [
                {
                    header: '지원서번호',
                    name: 'APLY_NO',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '지원자명',
                    name: 'NM_KOR',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '연령',
                    name: '',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '성별',
                    name: 'GEN_DIV_NM',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '서류전형',
                    name: 'DOCUMENT',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '평균',
                    name: 'INT_AVR',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '순위',
                    name: 'INT_RANK',
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
</script>


</body>
</html>