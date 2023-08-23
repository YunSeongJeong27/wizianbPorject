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
    <link rel="stylesheet" href="css/custom.css" />
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        .table .tableColor{
            background-color: #FAFAFA;
        }

        .divBtn{
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;

            color: #9E9FA8 !important;
            background-color: #C2C2C4 !important;

            cursor: pointer;
        }

        .nav-pills > .nav-item > .active {
            color: #224FA8 !important;
            background-color: white !important;
        }
        .tableInput{
            background-color: inherit;
            /*border: none;*/
        }
    </style>
</head>
<body>
<div class="container-table m-2">

    <div class="d-flex flex-row justify-content-end mb-1">
        <button id="selectBtn" class="btn btn-sm btn-secondary me-1" onclick="searchBtn()">조회</button>
        <button id="nthInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-1">신규</button>
        <button id="nthSaveBtn" class="btn btn-sm btn-success me-1">저장</button>
        <button id="nthDeleteBtn" class="btn btn-sm btn-danger me-1">삭제</button>
    </div>
    <div class="container-table">
        <%--TOP--%>
        <div class="col-12">
            <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
                <div class="col-1 align-middle tableSearch">분기</div>
                <div class="col-1 me-2">
                    <select class="form-select" name="termDiv">
                        <option value="" selected>(전체)</option>
                        <option value="1">1분기</option>
                        <option value="2">2분기</option>
                        <option value="3">3분기</option>
                        <option value="4">4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select class="form-select" id="courseDiv" name="courseDiv">
                        <option  value="" selected>(전체)</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정명</div>
                <div class="col-4">
                    <select class="form-select" id="courseName" name="courseName">
                        <option  value="" selected>(전체)</option>

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

        <%--BODY--%>
        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>


            <%-- <div class="position-absolute top-50 end-0 translate-middle-y">
                 <p class="pageLoc">현재:1/전체:14(1~5)</p>
             </div>--%>
        </div>
    </div>


    <div class="nav nav-pills nav-tabs fw-bold text-center col-4 d-flex justify-content-between mt-4" id="infoNav" role="tablist" style="width: 500px;">
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn active" id="select" data-bs-toggle="tab" onclick="tabContent(this)">모집전형설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="person" data-bs-toggle="tab" onclick="tabContent(this)">모집인원설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="schedule" data-bs-toggle="tab" onclick="tabContent(this)">전형일정설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="document" data-bs-toggle="tab" onclick="tabContent(this)">제출서류설정</div>
        </div>
    </div>

    <div class="tab-content pt-3 bg-white h-50 border border-gray-100 rounded-bottom-2" id="infoNavContent">
        <!-- 모진접형설정 Content -->
        <div id="select-pane">
            <div class="d-flex col-4 align-items-center" style="height: 40px">
                <div class="col-6 ms-3 fw-bold d-flex">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정단계/상태</div>
                </div>
                <%--<div class="col-3">
                    <select class="form-select">
                        <option selected>(미선택)</option>
                        <option>테스트접수</option>
                        <option>지원서접수</option>
                    </select>
                </div>
                <div class="col-3">
                    <select class="form-select">
                        <option selected>(미선택)</option>
                        <option>준비중</option>
                        <option>진행</option>
                        <option>완료</option>
                    </select>
                </div>
                <div class="col-2 ms-2">
                    <div class="btn btn-sm btn-outline-secondary fw-bold">변경</div>
                </div>--%>
            </div>
            <div class="p-3">
                <table id="inputTable" class="table border fw-bold align-middle">
                    <tr>
                        <td class="tableColor">과정명</td>
                        <td class="col-2">
                            <select class="form-select tableInput" name="courseName">

                            </select>
                        </td>
                        <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                        <td class="">
                            <select class="form-select tableInput" name="courseDiv" disabled>
                                <option selected>Java</option>
                                <option>Python</option>
                                <option>C++</option>
                            </select>
                        </td>
                        <td class="tableColor">모집전형번호</td>
                        <td class=""><input class="form-control tableInput" name="rcrtNo" type="text" disabled></td>
                    </tr>
                    <tr>
                        <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" name="eduStartDate" type="date" disabled></td>
                        <td class=" tableColor">교육종료일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" name="eduEndDate" type="date" disabled></td>
                    </tr>
                    <tr>
                        <td class="tableColor">현재전형일정</td>
                        <td class=""><input class="form-control tableInput" name="schdlName" type="text" disabled></td>
                        <%--<td class="tableColor">전형평가단계</td>
                        <td class="">
                            <select class="form-select tableInput">
                                <option selected>[S] STEP_DIV[LM0140]</option>
                            </select>
                        </td>--%>
                        <td class="tableColor">단계진행상태</td>
                        <td class=""><input class="form-control tableInput" name="statusDiv" type="text" disabled></td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 모집인원설정 Content -->
        <div id="person-pane" style="display: none">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>모집인원설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="personInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="personSaveBtn" class="btn btn-sm btn-success me-2">저장</button>
                    <button id="personDeleteBtn" class="btn btn-sm btn-danger">삭제</button>
                </div>
            </div>

            <div id="personGridDiv" class="pt-3"></div>
        </div>

        <!-- 전형일정설정 Content -->
        <div id="schedule-pane" style="display: none">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="scheduleInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="scheduleSaveBtn" class="btn btn-sm btn-success me-2">저장</button>
                    <button id="scheduleDeleteBtn" class="btn btn-sm btn-danger">삭제</button>
                </div>
            </div>

            <div id="scheduleGridDiv" class="pt-3"></div>
        </div>

        <!-- 제출서류설정 Content -->
        <div id="document-pane" style="display: none;">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px">
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>제출서류설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="documentInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="documentSaveBtn" class="btn btn-sm btn-success me-2">저장</button>
                    <button id="documentDeleteBtn" class="btn btn-sm btn-danger">삭제</button>
                </div>
            </div>

            <div id="documentGridDiv" class="pt-3"></div>
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

    document.addEventListener('DOMContentLoaded', async () =>{
        await  nthGridLoad();
        await  searchListData();

    });

    let  termDiv, courseDiv, courseName;
    //readData빼고는 전부 (createData,updateData,deleteData)빽엔드아직안함
    const nthTableData = () => {
        termDiv = termDiv === "" ? "nullTermDiv" : termDiv;
        courseDiv = courseDiv === "" ? "nullCourseDiv" : courseDiv;
        courseName = courseName === "" ? "nullCourseName" : courseName;
        return{
            api: {
                readData: { url: 'topscreen/info/'+termDiv+"/"+courseDiv+"/"+courseName,
                    method: 'GET' },
                createData: { url: 'recruitment/save', method: 'POST',contentType: 'application/json' },
                updateData: { url: 'recruitment/save', method: 'PUT' },
                deleteData: { url: 'recruitment/delete', method: 'DELETE' }
            }
        };
    };

    //조회버튼 클릭시
    async function searchBtn(){
        termDiv = document.querySelector('select[name="termDiv"]').value;
        courseDiv = document.querySelector('select[name="courseDiv"]').value;
        courseName = document.querySelector('select[name="courseName"]').value;

        await nthGridLoad();
        // 이 function에 추가로 서브테이블 이름에
        // 서브테이블.innerHTML = ''; 이거 각뷰에추가하면좋음
    }

    let nthTable;
    const nthGridLoad = () => {
            const oldnNhTable = document.getElementById('nthTable');
            oldnNhTable.innerHTML = '';

            nthTable = new tui.Grid({
                el: document.getElementById('nthTable'),
                data: nthTableData(),
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
                        header: '분기',
                        name: 'termDiv',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '모집기간',
                        name: 'recruitPeriod',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        width: 220,

                    },
                    {
                        header: '발표일자',
                        name: 'announcementPeriod',
                        sortingType: 'asc',
                        sortable: true, align: 'center'

                    },
                    {
                        header: '전형일정',
                        name: 'schdlName',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '전형평가단계',
                        name: 'stepDiv',
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
                    nthTable.focus(0, firstColumName, true);

                    rowDataLoad(0, nthTable, "inputTable");

                    document.querySelector("#inputTable tbody").setAttribute("id", "row0");

                    // 하단 table 수정시 nthTable 반영하기 위한 각 input에 onchange 함수 넣기
                    // 데이터 업데이트..
                    var tableInput = document.querySelectorAll("#inputTable .tableInput");
                    tableInput.forEach((ti) => {
                        ti.addEventListener("change", function () {
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


    }

    // 신규 버튼 클릭 이벤트
    document.getElementById("nthInsertBtn").addEventListener("click", function () {
        const rowData = [
            {   //수정해
                courseDiv: '',
                courseName: '',
                termDiv: '',
                eduStartDate: '',
                eduEndDate: '',
                note: '',
                courseMonth: ''
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
    const nthSaveBtn = document.getElementById("nthSaveBtn");
    nthSaveBtn.addEventListener('click', () => {
        nthTable.request('createData');
    });

    //조회리스트들정보
    async function searchListData() {
        const response = await fetch('/eval/result/searchlist');
        const dataList = await response.json();
        const courseDiv= dataList["courseDivList"];
        const courseName= dataList["courseNameList"];

        const courseDivSelect = document.querySelector("#courseDiv");
        const courseNameSelect = document.querySelector("#courseName");

        courseDiv.map((data) => {
            const option = document.createElement("option");
            option.value = data.courseDiv;
            option.text = data.courseDiv;
            courseDivSelect.appendChild(option);
        });

        courseName.map((data) => {
            const option = document.createElement("option");
            option.value = data.courseName;
            option.text = data.courseName;
            courseNameSelect.appendChild(option);
        });

    }



    // 하단 탭 grid
    let personGrid;
    let scheduleGrid;
    let documentGrid;

    function tabContent(e){
        //display 지우기
        const elements = document.querySelectorAll('#select-pane, #person-pane, #document-pane, #schedule-pane');
        elements.forEach(function(element) {
            element.style.display = 'none';
        });

        const content = document.getElementById(e.id+"-pane");
        console.log(e.id)
        console.log(content)
        if(e.id === "select"){
            content.setAttribute("style","display:block");
        }else if(e.id === "person"){
            if(!personGrid){
                const personData = [
                    {
                        TO_CNT: 'TO_CNT',
                        PLAN_CNT: 'PLAN_CNT',
                        APLY_CNT: 'APLY_CNT',
                        SEL_CNT: 'SEL_CNT',
                        PRO_CNT: 'PRO_CNT'
                    },
                    {
                        TO_CNT: 'TO_CNT2',
                        PLAN_CNT: 'PLAN_CNT2',
                        APLY_CNT: 'APLY_CNT2',
                        SEL_CNT: 'SEL_CNT2',
                        PRO_CNT: 'PRO_CNT2'
                    }
                ];
                personGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: personData,
                    rowHeaders: ['checkbox'],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '모집정원',
                            name: 'TO_CNT',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center'
                        },
                        {
                            header: '선발기준인원',
                            name: 'PLAN_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '지원인원',
                            name: 'APLY_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '최종선발인원',
                            name: 'SEL_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '예비합격인원',
                            name: 'PRO_CNT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        }
                    ],
                    columnOptions: {
                        resizable: true
                    },

                    draggable: false,

                });

                // 체크박스 전체 선택/해제
                personGrid.on('checkAll', function (ev) {
                    var id = ev.instance['el'].id;
                    var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='TO_CNT'");

                    rowKeys.forEach((rowKey) => {
                        personGrid.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                    });
                });
                personGrid.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                    var id = ev.instance['el'].id;
                    var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='TO_CNT'");

                    rowKeys.forEach((rowKey) => {
                        personGrid.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                    });
                });

                // 체크박스 개별 선택/해제
                personGrid.on('check', function (ev) {
                    personGrid.addRowClassName(ev.rowKey, "checkCell");
                });
                personGrid.on('uncheck', function (ev) {
                    personGrid.removeRowClassName(ev.rowKey, "checkCell");
                });
            }
            content.setAttribute("style","display:block");
        }else if(e.id === "schedule"){
            if(!scheduleGrid){
                const scheduleData = [
                    {
                        SCHDL_DIV: 'SCHDL_DIV' + '<i class="bi bi-list"></i>',
                        STEP_DIV: 'STEP_DIV',
                        ST_DT: 'ST_DT',
                        END_DT: 'END_DT',
                        STS_DIV: 'STS_DIV',
                    },
                    {
                        SCHDL_DIV: 'SCHDL_DIV' + '<i class="bi bi-list"></i>',
                        STEP_DIV: 'STEP_DIV2',
                        ST_DT: 'ST_DT2',
                        END_DT: 'END_DT2',
                        STS_DIV: 'STS_DIV2',
                    }
                ];
                scheduleGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: scheduleData,
                    rowHeaders: ['checkbox'],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '전형일정',
                            name: 'SCHDL_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center',
                        },
                        {
                            header: '전형평가단계',
                            name: 'STEP_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center'
                        },
                        {
                            header: '시작일시',
                            name: 'ST_DT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '종료일시',
                            name: 'END_DT',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '진행상태',
                            name: 'STS_DIV',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '노출여부',
                            align: 'center',
                            formatter: function (data) {
                                return '<input type="checkbox" name="chk" value="' + data.rowKey + '">'; // 체크박스 HTML 문자열 반환
                            }
                        },
                    ],
                    columnOptions: {
                        resizable: true,
                    },

                    draggable: false
                });

                // 체크박스 전체 선택/해제
                scheduleGrid.on('checkAll', function (ev) {
                    var id = ev.instance['el'].id;
                    var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='SCHDL_DIV'");

                    rowKeys.forEach((rowKey) => {
                        scheduleGrid.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                    });
                });
                scheduleGrid.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                    var id = ev.instance['el'].id;
                    var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='SCHDL_DIV'");

                    rowKeys.forEach((rowKey) => {
                        scheduleGrid.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                    });
                });

                // 체크박스 개별 선택/해제
                scheduleGrid.on('check', function (ev) {
                    scheduleGrid.addRowClassName(ev.rowKey, "checkCell");
                });
                scheduleGrid.on('uncheck', function (ev) {
                    scheduleGrid.removeRowClassName(ev.rowKey, "checkCell");
                });
            }
            content.setAttribute("style","display:block");
        }else if(e.id === "document"){
            if(!documentGrid){
                const documentData = [
                    {
                        DOC_DIV: 'DOC_DIV',
                    },
                    {
                        DOC_DIV: 'DOC_DIV2',
                    }
                ];
                documentGrid = new tui.Grid({
                    el: document.getElementById(e.id+'GridDiv'),
                    data: documentData,
                    rowHeaders: ['checkbox'],
                    pagination: true,
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '제출서류',
                            name: 'DOC_DIV',
                            sortingType: 'asc',
                            sortable: false,
                            align: 'center',
                        },
                    ],
                    columnOptions: {
                        resizable: true,
                    },

                    draggable: false,

                });
            }
            content.setAttribute("style","display:block");
        }
    }


</script>
</body>
</html>
