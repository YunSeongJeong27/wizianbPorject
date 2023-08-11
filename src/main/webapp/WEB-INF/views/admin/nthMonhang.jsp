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
