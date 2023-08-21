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
            <button id="passFindBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        </div>

        <%--TOP--%>
        <div class="col-12">
            <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
                <div class="col-1 align-middle tableSearch">분기</div>
                <div class="col-1 me-2">
                    <select id="termDiv" class="form-select" onchange="courseSelect();">
                        <option value="%">(전체)</option>
                        <option value="1">1분기</option>
                        <option value="2">2분기</option>
                        <option value="3">3분기</option>
                        <option value="4">4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select id="courseDiv" class="form-select" onchange="courseSelect();">
                        <option value="%">(전체)</option>
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="C++">C++</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정명<span class="text-danger">*</span></div>
                <div class="col-4">
                    <select id="courseName" class="form-select">

                    </select>
                </div>
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
                    <button id="passBatchBtn" class="btn btn-sm btn-light btn-outline-dark me-2">일괄반영</button>
                    <button id="passSaveBtn" class="btn btn-sm btn-success">저장</button>
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
            courseSelect();

            let data;
            let passFindFlag = false;
            const nthTablePage = document.querySelector('#nthTablePage');
            const passFindBtn = document.getElementById("passFindBtn");

            function educationPeriodFormatter({row}) {
                const startDate = row.eduStartDate.substring(0,10);
                const endDate = row.eduEndDate.substring(0,10);
                return startDate + "~" + endDate;
            }
            const nthTable = new tui.Grid({
                el: document.getElementById('nthTable'),
                data: {
                    api: {
                        readData: { url: '/pass/nthList', method: 'GET', initParams: {termDiv: '%', courseDiv: '%', rcrtNo: '%'}}
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
                    subTableLoad(0);
                }
            });
            nthTable.on('click', function (ev) {
                if(data.length === 0 || passFindFlag){
                    data = nthTable.getData();
                    passFindFlag = false;
                }
                if(typeof ev.rowKey !== "undefined") subTableLoad(data[nthTable.getIndexOfRow(ev.rowKey)]['rcrtNo']);
            });

            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            nthTablePage.addEventListener('change', function(){handlePerPageChange(this, nthTable)});

            // 조회 버튼 이벤트
            passFindBtn.addEventListener("click", function(){
                const courseName = document.getElementById("courseName");
                const termDiv = document.getElementById("termDiv");
                const courseDiv = document.getElementById("courseDiv");
                const rcrtNo = courseName.options[courseName.selectedIndex].value;
                const termDivSelected = termDiv.options[termDiv.selectedIndex].value;
                const courseDivSelected = courseDiv.options[courseDiv.selectedIndex].value;

                const params = {termDiv: termDivSelected, courseDiv: courseDivSelected, rcrtNo: rcrtNo};

                nthTable.readData(1, params, false);
                subTableLoad(0);
                passFindFlag = true;
            });
        });


        // application테이블 grid
        let applicationTable;

        function subTableLoad(rcrtNo){
            var firstColumName = 'nameKor';
            const applicationTablePage = document.querySelector('#applicationTablePage');

            var applicationEl = document.getElementById('applicationTable');
            applicationEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            applicationTable = new tui.Grid({
                el: applicationEl,
                data: {
                    api: {
                        readData: { url: '/pass/listDocPass', method: 'GET', initParams: { rcrtNo: rcrtNo } },
                        updateData: { url: '/pass/updateDocPass', method: 'PUT' , contentType: 'application/json' }
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

            applicationTable.on('uncheckAll', function (ev) {
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

            applicationTable.on('drop', function (ev) {
                firstColumName = applicationTable.getColumns()[0]['name'];
            });
        }

        // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
        function handlePerPageChange(event, table) {
            const perPage = parseInt(event.value, 10);
            table.setPerPage(perPage);
        }

        // 일괄처리 버튼 이벤트
        const passBatchBtn = document.getElementById("passBatchBtn");
        passBatchBtn.addEventListener("click", function(){
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

        const passSaveBtn = document.getElementById("passSaveBtn");
        passSaveBtn.addEventListener('click', () => {
            if(confirm("선발 결과를 수정하시겠습니까?")){
                applicationTable.request('updateData', {showConfirm: false});
            }
        });

        // 과정명 필터
        function courseSelect(){
            const termDiv = document.getElementById("termDiv");
            const courseDiv = document.getElementById("courseDiv");
            const courseName = document.getElementById("courseName");
            const termDivSelected = termDiv.options[termDiv.selectedIndex].value;
            const courseDivSelected = courseDiv.options[courseDiv.selectedIndex].value;

            $.ajax({
                url: "/pass/courseSelect", 			//통신할 url
                type: "GET",						//통신할 메소드 타입
                data: {termDiv : termDivSelected, courseDiv: courseDivSelected},	//전송할 데이터
                dataType: "json",
                async: false,						// 실행 결과 기다리지 않고 다음 코드 읽을 것인지
                success : function(result) { 		// 매개변수에 통신성공시 데이터 저장
                    courseName.innerHTML = "<option value='%'>(전체)</option>";

                    result.forEach(course => {      // 과정명 option으로 추가
                        var option = document.createElement('option');
                        option.innerHTML = course['courseName'];
                        option.value = course['rcrtNo']
                        courseName.appendChild(option);
                    });
                },
                error : function (status, error) {	//통신 실패
                    console.log('통신실패');
                    console.log(status, error);
                }
            });
        }

    </script>
</body>
</html>
