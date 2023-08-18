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
<div class="container-table m-2">
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="selectBtn1" class="btn btn-sm btn-secondary me-1">조회</button>
        </div>

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
        </div>

        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-9 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집전형평가정보</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
                <div>
                    <select class="form-select" id="nthEvaluationTablePage">
                        <option selected>5</option>
                        <option>30</option>
                        <option>50</option>
                        <option>70</option>
                        <option>100</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="nthEvaluationTable text-center border border-gray-100 rounded-2">
            <div id="nthEvaluationTable"></div>
        </div>

        <div class="h-50">
            <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
                <div class="col-7 d-flex flex-row align-items-center">
                    <p class="subTitle fw-bold me-2">평가결과등록</p>
                    <p class="subResult text-secondary me-2">검색결과:00건</p>
                    <div>
                        <select class="form-select" id="nthEvaluationRegistTablePage">
                            <option selected>5</option>
                            <option>30</option>
                            <option>50</option>
                            <option>70</option>
                            <option>100</option>
                        </select>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-end col-5 gap-2">
                    <button class="btn btn-sm btn-danger">완료취소</button>
                    <button class="btn btn-sm btn-success">저장</button>
                </div>
            </div>

            <div class="nthEvaluationRegistTable text-center border border-gray-100 rounded-2">
                <div id="nthEvaluationRegistTable"></div>
            </div>
        </div>
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

        const nthEvaluationTable = new tui.Grid({
            el: document.getElementById('nthEvaluationTable'),
            data: {
                api: {
                    readData: { url: '/eval/result/info',
                        method: 'GET' }
                }
            },
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
                    name: 'courseDiv',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '과정명',
                    name: 'courseName',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '기수',
                    name: 'nthCode',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수강년도',
                    name: 'entYear',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '분기',
                    name: 'termDiv',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },

                {
                    header: '평가단계',
                    name: 'stepDiv',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                },
                {
                    header: '대상인원',
                    name: 'selCnt',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '진행상태',
                    name: 'statusDiv',
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
                nthEvaluationTable.focus(0, 'CORS_DIV', true);
                subTableLoad(0);
            }
        });
        nthEvaluationTable.on('click', function (ev) {
            subTableLoad(ev.rowKey);
        });

        const nthEvaluationTablePage = document.querySelector('#nthEvaluationTablePage');

        // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
        nthEvaluationTablePage.addEventListener('change', function(){handlePerPageChange(this, nthEvaluationTable)});

        //nthEvaluationRegistTable테이블
        function subTableLoad(rowKey){
            const rowData = nthEvaluationTable.getRow(rowKey);
            const rcrtNo = rowData.rcrtNo;

            const nthEvnRegistTable = document.getElementById("nthEvaluationRegistTable");
            // nthEvaluationRegistTable div 요소를 초기화
            nthEvnRegistTable.innerHTML = '';

            const nthEvaluationRegistTable = new tui.Grid({
                el: nthEvnRegistTable,
                data:{
                    api: {
                        readData: { url: '/eval/result/subinfo/'+rcrtNo,
                            method: 'GET' }
                    }
                } ,
                rowHeaders: ['rowNum'],
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
                        header: '지원번호',
                        name: 'aplyNo',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center'
                    },
                    {
                        header: '성명',
                        name: 'nameKor',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center'
                    },
                    {
                        header: '지원서조회',
                        name: 'evPdfFileNo',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '문항1(30)',
                        name: 'ev1Score',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '문항2(30)',
                        name: 'ev2Score',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '문항3(40)',
                        name: 'ev3Score',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        editor: 'text'
                    },
                    {
                        header: '서류평가',
                        name: 'docPassYn',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '합계(100점)',
                        name: "total" ,
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },

                    {
                        header: '비고',
                        name: 'note',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    }

                ],
                columnOptions: {
                    resizable: true
                },

                draggable: true

            });

            const nthEvaluationRegistTablePage = document.querySelector('#nthEvaluationRegistTablePage');

            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            nthEvaluationRegistTablePage.addEventListener('change', function(){handlePerPageChange(this, nthEvaluationRegistTable)});
        }

    });

    // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
    function handlePerPageChange(event, table) {
        const perPage = parseInt(event.value, 10);
        table.setPerPage(perPage);
    }


</script>

</body>
</html>
