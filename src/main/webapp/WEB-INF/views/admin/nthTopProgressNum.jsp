<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
                <p class="subTitle fw-bold me-2">모집기수정보</p>
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
        var firstColumName = 'courseDiv';

        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: {
                api: {
                    readData: { url: '/recruitment/list', method: 'GET' },
                    createData: { url: 'recruitment/save', method: 'POST' },
                    updateData: { url: 'recruitment/save', method: 'PUT' },
                    deleteData: { url: 'recruitment/delete', method: 'DELETE' }
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
                    header: '교육시작일',
                    name: 'eduStartDate',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '교육종료일',
                    name: 'eduEndDate',
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

                        nthTable.setValue(rowKey, ti.getAttribute("name"), this.value, false);
                    })
                });
            }
        });

        const nthTablePage = document.querySelector('#nthTablePage');

        // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
        function handlePerPageChange(event) {
            const perPage = parseInt(event.target.value, 10);
            nthTable.setPerPage(perPage);
        }
        // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
        nthTablePage.addEventListener('change', handlePerPageChange);

        // row 클릭 시 하단에 해당 row 데이터 load
        nthTable.on('click', function (ev) {
            if(ev.rowKey == null) return;       // 헤더 클릭 시

            document.querySelector("#inputTable tbody").setAttribute("id", "row"+ev.rowKey);
            rowDataLoad(ev.rowKey, nthTable, "inputTable");
        });

        // 체크박스 전체 선택/해제
        nthTable.on('checkAll', function (ev) {
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

            rowKeys.forEach((rowKey) => {
                nthTable.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
            });
        });
        nthTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

            rowKeys.forEach((rowKey) => {
                nthTable.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
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
                    if(tiName==="courseDiv" || tiName==="termDiv"){
                        $('select[name='+tiName+']').val(datas[tiName]).prop("selected",true);
                    }
                    ti.value = datas[tiName];
                });
            }
        }

        // 신규 버튼 클릭 이벤트
        document.getElementById("nthInsertBtn").addEventListener("click", function () {
            const rowData = [
                {
                    courseDiv: '',
                    courseName: '',
                    nthCode: '',
                    entYear: '',
                    termDiv: '',
                    eduStartDate: '',
                    eduEndDate: ''
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

        // 삭제 버튼 클릭 이벤트
        document.getElementById("nthDeleteBtn").addEventListener("click", function () {
            if(confirm("삭제하시겠습니까?")){
                nthTable.removeCheckedRows(false);

                if(nthTable.getData().length !== 0){
                    var rowKey = nthTable.getRowAt(0)['rowKey'];

                    nthTable.focus(rowKey, firstColumName, true);
                    rowDataLoad(rowKey, nthTable, "inputTable");
                }else{                                              // 데이터 x
                    rowDataLoad(0, nthTable, "inputTable");         // 공백으로 초기화
                }
            }
        });
    });
</script>
</body>
</html>
