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
    <style>

    </style>
</head>
<body>
    <div class="container-table m-2">
        <div class="col-12">

            <%@ include file="nthTopScreening.jsp"%>

            <div class="h-50">
                <div class="col-12 d-flex flex-row justify-content-between searchResult mt-4">
                    <div class="d-flex flex-row align-items-center">
                        <p class="subTitle fw-bold me-2">자기소개서문항</p>
                        <p class="subResult text-secondary me-2">검색결과</p>
                        <select id="monhangTablePage" class="form-select w-auto">
                            <option selected>5</option>
                            <option>7</option>
                            <option>50</option>
                            <option>70</option>
                            <option>100</option>
                        </select>
                    </div>

                    <div>
                        <button id="monhangInsertBtn" class="btn btn-sm btn-light btn-outline-dark">신규</button>
                        <button id="monhangSaveBtn" class="btn btn-sm btn-success">저장</button>
                        <button id="monhangDeleteBtn" class="btn btn-sm btn-danger">삭제</button>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-between mt-2 bg-white border border-gray-100 rounded-2">
                    <div id="monhangTable" class="w-100"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', async () => {
            await subTableLoad();
        });
        const subTableLoad = (rowKey) => {
            let firstColumName = 'itemName';
            const rowData = nthTable.getRow(rowKey);
            let rcrtNo = rowData.rcrtNo;
            const Grid = tui.Grid;
            document.getElementById('monhangTable').innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

                const monhangTable = new Grid({
                    el: document.getElementById('monhangTable'),
                    data: {
                        initialRequest: true,
                        api: {
                            hideLoadingBar: false,
                            readData: {url: '/admin/' + rcrtNo + '/introduce', method: 'GET'},
                            modifyData: {
                                url: '/admin/' + rcrtNo + '/introduce',
                                method: 'PUT',
                                contentType: 'application/json'
                            },
                            deleteData: {url: '/admin/' + rcrtNo + '/introduce', method: 'DELETE'}
                        },
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
                            header: '문항명',
                            name: 'itemName',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center',
                            editor: 'text'
                        },
                        {
                            header: '최대허용글자수',
                            name: 'maxChar',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center',
                            editor: 'text'
                        },
                        {
                            header: '문항설명',
                            name: 'itemExpl',
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


            const monhangTablePage = document.querySelector('#monhangTablePage');

            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            monhangTablePage.addEventListener('change', function(){handlePerPageChange(this, monhangTable)});

            // 체크박스 전체 선택/해제
            monhangTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");
                rowKeys.forEach((rowKey) => {
                    monhangTable.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });
            monhangTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");
                rowKeys.forEach((rowKey) => {
                    monhangTable.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });

            // 체크박스 개별 선택/해제
            monhangTable.on('check', function (ev) {
                monhangTable.addRowClassName(ev.rowKey, "checkCell");
            });
            monhangTable.on('uncheck', function (ev) {
                monhangTable.removeRowClassName(ev.rowKey, "checkCell");
            });

            monhangTable.on('drop', ev => {
                firstColumName = monhangTable.getColumns()[0]['name'];
            });


            // 신규 버튼 click
            document.getElementById("monhangInsertBtn").addEventListener("click", function () {
                const rowData = [
                    {
                        itemName: '',
                        maxChar: '',
                        itemExpl: ''
                    }
                ];

                monhangTable.appendRow(rowData[0], {
                    at: monhangTable.getIndexOfRow(monhangTable.getFocusedCell()['rowKey'])+1,
                    extendPrevRowSpan: true,
                    focus: true
                });

                monhangData = monhangTable.getData();
            });
            document.querySelector('#monhangSaveBtn').addEventListener('click', function () {
                monhangTable.request('modifyData');
                monhangTable.resetData(monhangTable.getData());
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
