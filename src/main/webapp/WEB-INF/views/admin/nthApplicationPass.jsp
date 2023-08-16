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
                    <p class="subTitle fw-bold me-2">전형단계 사정결과 등록</p>
                    <p class="subResult text-secondary me-2">검색결과:0건</p>
                    <select class="form-select w-auto">
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
                            <option value="1">적격</option>
                            <option value="2">부적격</option>
                        </select>
                        <button id="passBtn" class="btn btn-sm btn-light btn-outline-dark me-2">일괄반영</button>
                        <button class="btn btn-sm btn-light btn-outline-dark">저장</button>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row justify-content-between mt-2 h-50 bg-white border border-gray-100 rounded-2">
                <div id="applicationTable" class="w-100 h-50"></div>
            </div>
        </div>
    </div>

    <script>




        // application테이블 grid
        // nthTable row 누를 때마다 applicationTable 데이터 바뀌게 - db 연동하면 어떻게 해야하나..? 별로
        function subTableLoad(rowKey){
            var applicationData = [];
            var firstColumName = 'APLY_NO';
            if(rowKey == null) return;       // 헤더 클릭 시
            else if(rowKey === 0) {          // 일단 nthTable rowKey로 관련 데이터 넣어서 보내는걸로..
                applicationData = [
                    {
                        APLY_NO: 'E12341234',
                        NM_KOR: '홍길동',
                        DOC_QLFY_YN: '1',
                        DOC_RSN: ''
                    },
                    {
                        APLY_NO: 'E98769876',
                        NM_KOR: '이길동',
                        DOC_QLFY_YN: '2',
                        DOC_RSN: '자기소개서 미제출'
                    }
                ];
            }

            var applicationEl = document.getElementById('applicationTable');
            applicationEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            const applicationTable = new tui.Grid({
                el: applicationEl,
                data: applicationData,
                rowHeaders: ['checkbox'],
                bodyHeight: 340,
                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 5,		//한번에 보여줄 데이터 수
                    visiblePages: 10
                },
                scrollX: true,
                scrollY: true,
                columns: [
                    {
                        header: '수험번호',
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
                        header: '적격여부',
                        name: 'DOC_QLFY_YN',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        formatter: 'listItemText',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '적격', value: '1' },
                                    { text: '부적격', value: '2' }
                                ]
                            }
                        }
                    },
                    {
                        header: '부적격사유',
                        name: 'DOC_RSN',
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
                    applicationTable.focus(0, firstColumName, true);
                }
            });


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

            // 데이터 변경 후
            applicationTable.on('afterChange', ev => {
                var changes = ev["changes"][0];
                var rowKey = changes['rowKey']
                //var datas = applicationData[applicationTable.getIndexOfRow(rowKey)];
                //datas[changes['columnName']] = changes['value'];

                //applicationTable.resetData(applicationData);
                applicationTable.setValue(rowKey, changes['columnName'], changes['value'], false);
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
                        applicationTable.setValue(rowKey, 'DOC_QLFY_YN', passDiv.options[passDiv.selectedIndex].value, false);
                    });
                }
            });
        }


    </script>
</body>
</html>
