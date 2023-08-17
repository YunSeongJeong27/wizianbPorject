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
    <link rel="stylesheet" href="css/custom.css" />
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            <div class="col-4 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집전형정보</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
                <div>
                    <select class="form-select" id="nthTablePage">
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
                COURSE_DIV: 'COURSE_DIV',
                COURSE_NAME: 'COURSE_NAME',
                NTH_CODE: 'NTH_CODE',
                ENT_YEAR: 'ENT_YEAR',
                TERM_DIV: 'TERM_DIV',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME',
                STEP_DIV: 'STEP_DIV'
            },
            {
                COURSE_DIV: 'COURSE_DIV2',
                COURSE_NAME: 'COURSE_NAME2',
                NTH_CODE: 'NTH_CODE2',
                ENT_YEAR: 'ENT_YEAR2',
                TERM_DIV: 'TERM_DIV2',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME2',
                STEP_DIV: 'STEP_DIV2'
            },
            {
                COURSE_DIV: 'COURSE_DIV2',
                COURSE_NAME: 'COURSE_NAME2',
                NTH_CODE: 'NTH_CODE2',
                ENT_YEAR: 'ENT_YEAR2',
                TERM_DIV: 'TERM_DIV2',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME2',
                STEP_DIV: 'STEP_DIV2'
            },
            {
                COURSE_DIV: 'COURSE_DIV2',
                COURSE_NAME: 'COURSE_NAME2',
                NTH_CODE: 'NTH_CODE2',
                ENT_YEAR: 'ENT_YEAR2',
                TERM_DIV: 'TERM_DIV2',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME2',
                STEP_DIV: 'STEP_DIV2'
            },
            {
                COURSE_DIV: 'COURSE_DIV2',
                COURSE_NAME: 'COURSE_NAME2',
                NTH_CODE: 'NTH_CODE2',
                ENT_YEAR: 'ENT_YEAR2',
                TERM_DIV: 'TERM_DIV2',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME2',
                STEP_DIV: 'STEP_DIV2'
            },
            {
                COURSE_DIV: 'COURSE_DIV2',
                COURSE_NAME: 'COURSE_NAME2',
                NTH_CODE: 'NTH_CODE2',
                ENT_YEAR: 'ENT_YEAR2',
                TERM_DIV: 'TERM_DIV2',
                EDU_START_DATE: '2023-08-01',
                EDU_END_DATE: '2023-08-01',
                ANNOUNCE_DATE: '2023-08-11',
                SCHDL_NAME: 'SCHDL_NAME2',
                STEP_DIV: 'STEP_DIV2'
            }
        ];
        function educationPeriodFormatter({row}) {
            const startDate = row.EDU_START_DATE;
            const endDate = row.EDU_END_DATE;
            return startDate + "~" + endDate;
        }
        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: data,
            pageOptions: {
                useClient: true,	// front에서만 페이징 하는 속성
                perPage: 5,		//한번에 보여줄 데이터 수
                visiblePages: 10
            },
            scrollX: true,
            scrollY: true,
            bodyHeight: 217,
            columns: [
                {
                    header: '과정구분',
                    name: 'COURSE_DIV',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '과정명',
                    name: 'COURSE_NAME',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '기수코드',
                    name: 'NTH_CODE',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수강년도',
                    name: 'ENT_YEAR',
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
                    header: '교육기간',
                    name: 'EDU_DATE',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                    formatter: educationPeriodFormatter
                },
                {
                    header: '발표일자',
                    name: 'ANNOUNCE_DATE',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '전형일정',
                    name: 'SCHDL_NAME',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '전형평가단계',
                    name: 'STEP_DIV',
                    sortingType: 'asc',
                    sortable: false, align: 'center'
                }
            ],
            columnOptions: {
                resizable: true
            },

            draggable: true,

            // 처음 grid 렌더링 시 첫번째 row에 focus 및 하단 테이블에 데이터 load
            onGridMounted() {
                nthTable.focus(0, 'COURSE_DIV', true);
                subTableLoad(0);
            }
        });
        nthTable.on('click', function (ev) {
            subTableLoad(ev.rowKey);
        });

        const nthTablePage = document.querySelector('#nthTablePage');

        // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
        nthTablePage.addEventListener('change', function(){handlePerPageChange(this, nthTable)});
    });
</script>
</body>
</html>
