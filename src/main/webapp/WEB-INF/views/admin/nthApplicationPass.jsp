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
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
    <link rel="stylesheet" href="/css/custom.css" />
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container-table m-2">
    <div class="col-12">
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

        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>

            <%-- <div class="position-absolute top-50 end-0 translate-middle-y">
                 <p class="pageLoc">현재:1/전체:14(1~5)</p>
             </div>--%>
        </div>

        <div class="h-50">
            <div class="col-12 d-flex flex-row justify-content-between searchResult mt-4">
            <div class="d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">전형단계 사정결과 등록</p>
                <p class="subResult text-secondary me-2">검색결과:0건</p>
                <select class="form-select w-auto" id="applicationTablePage">
                    <option selected>5</option>
                    <option>7</option>
                    <option>50</option>
                    <option>70</option>
                    <option>100</option>
                </select>
            </div>

            <div class="d-flex flex-row align-items-center">
                <div class="d-flex flex-row align-items-center me-3">
                    <p class="subTitle fw-bold me-2">안내문종류</p>
                    <select class="form-select w-auto me-1">
                        <option selected>면접안내메일</option>
                    </select>
                    <button class="btn btn-sm btn-light btn-outline-dark me-2">합격안내메일</button>
                </div>
                <div class="d-flex flex-row align-items-center">
                    <p class="subTitle fw-bold me-2">선발결과</p>
                    <select id="passDiv" class="form-select w-auto me-1">
                        <option value="0" selected>선택</option>
                        <option value="Y">합격</option>
                        <option value="N">불합격</option>
                    </select>
                    <button id="passBtn" class="btn btn-sm btn-light btn-outline-dark me-2">일괄반영</button>
                    <button class="btn btn-sm btn-success">저장</button>
                </div>
            </div>
        </div>

            <div class="d-flex flex-row justify-content-between mt-2 bg-white border border-gray-100 rounded-2">
            <div id="applicationTable" class="w-100"></div>
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
            let data;
            const nthTablePage = document.querySelector('#nthTablePage');

            function educationPeriodFormatter({row}) {
                const startDate = row.eduStartDate.substring(0,10);
                const endDate = row.eduEndDate.substring(0,10);
                return startDate + "~" + endDate;
            }
            const nthTable = new tui.Grid({
                el: document.getElementById('nthTable'),
                data: {
                    api: {
                        readData: { url: '/recruitment/list', method: 'GET'}
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
                        header: '기수코드',
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
                        header: '교육기간',
                        name: 'eduDate',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        width: 220,
                        formatter: educationPeriodFormatter
                    },
                    {
                        header: '선발예정인원',
                        name: 'rcrtCnt',
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
                    data = nthTable.getData();

                    nthTable.focus(0, 'courseDiv', true);
                    subTableLoad(data[0]['rcrtNo']);
                }
            });
            nthTable.on('click', function (ev) {
                subTableLoad(data[nthTable.getIndexOfRow(ev.rowKey)]['rcrtNo']);
            });

            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            nthTablePage.addEventListener('change', function(){handlePerPageChange(this, nthTable)});
        });

        // application테이블 grid
        // nthTable row 누를 때마다 applicationTable 데이터 바뀌게 - db 연동하면 어떻게 해야하나..? 별로
        function subTableLoad(rcrtNo){
            var firstColumName = 'nameKor';

            var applicationEl = document.getElementById('applicationTable');
            applicationEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            const applicationTable = new tui.Grid({
                el: applicationEl,
                data: {
                    api: {
                        readData: { url: '/pass/list', method: 'GET', initParams: { rcrtNo: rcrtNo } }
                    }
                },
                rowHeaders: ['checkbox'],
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
                        header: '지원자명',
                        name: 'nameKor',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center'
                    },
                    {
                        header: '합격여부',
                        name: 'docPassYn',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        formatter: 'listItemText',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '합격', value: 'Y' },
                                    { text: '불합격', value: 'N' }
                                ]
                            }
                        }
                    }
                ],
                columnOptions: {
                    resizable: true
                },
                draggable: true,

                // 처음 grid 렌더링 시 첫번째 row에 focus
                onGridMounted() {
                    applicationTable.focus(0, firstColumName, true);
                }
            });

            const applicationTablePage = document.querySelector('#applicationTablePage');

            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            applicationTablePage.addEventListener('change', function(){handlePerPageChange(this, applicationTable)});

            // 체크박스 전체 선택/해제
            applicationTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

                rowKeys.forEach((rowKey) => {
                    applicationTable.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });

            applicationTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

                rowKeys.forEach((rowKey) => {
                    applicationTable.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });

            // 체크박스 개별 선택/해제
            applicationTable.on('check', function (ev) {
                applicationTable.addRowClassName(ev.rowKey, "checkCell");
            });
            applicationTable.on('uncheck', function (ev) {
                applicationTable.removeRowClassName(ev.rowKey, "checkCell");
            });

            applicationTable.on('drop', ev => {
                firstColumName = applicationTable.getColumns()[0]['name'];
            });

            // 일괄처리 버튼 이벤트
            document.getElementById("passBtn").addEventListener("click", function(){
                if(confirm("일괄처리하시겠습니까?")){
                    var passDiv = document.getElementById("passDiv");
                    var val = passDiv.options[passDiv.selectedIndex].value;

                    if(val === "0"){
                        alert("선발결과를 선택해주세요.");
                        return;
                    }

                    var rowKeys = applicationTable.getCheckedRowKeys();
                    rowKeys.forEach(rowKey => {
                        applicationTable.setValue(rowKey, 'docPassYn', passDiv.options[passDiv.selectedIndex].value, false);
                    });
                }
            });
        }

        // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
        function handlePerPageChange(event, table) {
            const perPage = parseInt(event.value, 10);
            table.setPerPage(perPage);
        }

    </script>
</body>
</html>
