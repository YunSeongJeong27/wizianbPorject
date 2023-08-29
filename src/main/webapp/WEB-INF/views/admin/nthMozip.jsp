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

    <link rel="stylesheet" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
    <script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
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
                    <select class="form-select" id="termDiv1" name="termDiv">
                        <option value="" selected>(전체)</option>
                        <option value="1">1분기</option>
                        <option value="2">2분기</option>
                        <option value="3">3분기</option>
                        <option value="4">4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select class="form-select" id="courseDiv1" name="courseDiv">
                        <option  value="" selected>(전체)</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정명</div>
                <div class="col-4">
                    <select class="form-select" id="courseName1" name="courseName">
                        <option  value="" selected>(전체)</option>

                    </select>
                </div>
            </div>
        </div>

        <%--HEAD--%>
        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-4 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집전형정보</p>
                <p class="subResult text-secondary me-2">검색결과</p>
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
            <div class="col-8 d-flex flex-row justify-content-end">
                <button id="updateRecruitStatus" class="btn btn-sm btn-light btn-outline-dark">상태변경</button>
            </div>
        </div>

        <%--BODY--%>
        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>

        </div>
    </div>


    <div class="nav nav-pills nav-tabs fw-bold text-center col-4 d-flex justify-content-left mt-4" id="infoNav" role="tablist" style="width: 500px;">
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn active" id="select" data-bs-toggle="tab" onclick="tabContent(this)">모집전형설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="schedule" data-bs-toggle="tab" onclick="tabContent(this)">전형일정설정</div>
        </div>
    </div>

    <div class="tab-content pt-3 bg-white h-50 border border-gray-100 rounded-bottom-2" id="infoNavContent">
        <!-- 모진접형설정 Content -->
        <div id="select-pane">
            <div class="d-flex col-4 align-items-center" style="height: 40px">
                <div class="col-5 ms-3 fw-bold d-flex">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정단계/상태</div>
                </div>
                <div class=" d-flex flex-row justify-content-left mb-1 gap-2">
                    <select class="form-select mt-2" name="schdlName"  id="updateSchdlName"  style="width: 300px; height: 40px;">
                        <option value="unselected" selected>(미선택)</option>
                    </select>
                    <select class="form-select mt-2" name="statusDiv" id="updateStatusDiv" style="width: 130px; height: 40px;" >
                        <option value="unselected" selected>(미선택)</option>
                        <option value="준비중">준비중</option>
                        <option value="진행중">진행중</option>
                        <option value="완료">완료</option>
                    </select>

                    <button id="updateSchdl" class="btn btn-sm btn-light btn-outline-dark me-1"
                            style="width: 48px; height: 33px; margin-top: 12px;">변경</button>
                </div>
            </div>
            <div class="p-3">
                <table id="inputTable" class="table border fw-bold align-middle">
                    <tbody>
                    <tr>
                        <td class="tableColor">과정명</td>
                        <td class="col-2">
                            <select class="form-select tableInput" id="courseName2" name="courseName" disabled>
                                <option value="" selected>(미선택)</option>
                            </select>
                        </td>
                        <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                        <td class="">
                            <select class="form-select tableInput" id="courseDiv2" name="courseDiv" disabled>
                                <option value="" selected>(미선택)</option>
                            </select>
                        </td>
                        <td class="tableColor">모집전형번호</td>
                        <td class=""><input class="form-control tableInput" id="rcrtNo1" name="rcrtNo" type="text" disabled></td>
                    </tr>
                    <tr>
                        <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" id="eduStartDate1" name="eduStartDate" type="date" disabled></td>
                        <td class=" tableColor">교육종료일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" id="eduEndDate1" name="eduEndDate" type="date" disabled></td>
                    </tr>
                    <tr>
                        <td class="tableColor">현재전형일정</td>
                        <td class=""><input class="form-control tableInput" name="schdlName" type="text" disabled></td>


                        <td class="tableColor">단계진행상태</td>
                        <td class=""><input class="form-control tableInput" name="statusDiv" type="text" disabled></td>
                    </tr>
                    </tbody>
                </table>
            </div>
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

    let firstColumName = 'courseDiv';
    let  termDiv, courseDiv, courseName;
    //readData빼고는 전부 (createData,updateData,deleteData)빽엔드아직안함
    const nthTableData = () => {
        termDiv = termDiv === "" ? "nullTermDiv" : termDiv;
        courseDiv = courseDiv === "" ? "nullCourseDiv" : courseDiv;
        courseName = courseName === "" ? "nullCourseName" : courseName;
        return{
            api: {
                readData: { url: '/topscreen/info/'+termDiv+"/"+courseDiv+"/"+courseName,
                    method: 'GET' },
                updateData: { url: '/recruitmentinfo/recruitment/statusupdate', method: 'PUT', contentType: 'application/json' },
                deleteData: { url: '/recruitmentinfo/deletenthinfo', method: 'DELETE' }
            }
        };
    };

    //조회버튼 클릭시
    async function searchBtn(){
        termDiv = document.querySelector('#termDiv1').value;
        courseDiv = document.querySelector('#courseDiv1').value;
        courseName = document.querySelector('#courseName1').value;

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
                        header: '모집진행상태',
                        name: 'recruitStatusDiv',
                        sortingType: 'asc',
                        sortable: false, align: 'center',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '준비중', value: '준비중' },
                                    { text: '진행중', value: '진행중' },
                                    { text: '완료', value: '완료' }
                                ]
                            }
                        }
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
            selectedRowKey=ev.rowKey;
            for(let i=0;i<newRowList.length;i++){//신규꺼냐 아니냐 판별해서 잠그는과정
                if (newRowList[i] == ev.rowKey) {
                    document.getElementById("courseName2").disabled = false;
                    break;
                } else {
                    document.getElementById("courseName2").disabled = true; //과정명 다시 disabled로잠금
                }
            }
            if(ev.rowKey == null) return;       // 헤더 클릭 시
            document.querySelector("#inputTable tbody").setAttribute("id", "row"+ev.rowKey);
            rowDataLoad(ev.rowKey, nthTable, "inputTable");
            selectedSchdlnameList();//전형일정단계
            subTableLoad(ev.rowKey);
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
                    ti.value = datas[tiName];
                    selectedRcrtNo=datas['rcrtNo'];
                    selectSchdlSeq=datas['schdlSeq'];
                });
            }
            for (let i = 0; i < newRowList.length; i++) {//신규꺼냐 아니냐 판별
                if (newRowList[i] == selectedRowKey) {
                    document.getElementById('courseName2').selectedIndex = 0;//다시 신규로 클릭했을때 미완료로되게끔
                }
            }
        }

    }

    //상태변경 버튼
    var updateRecruitStatusButton = document.getElementById("updateRecruitStatus");
    updateRecruitStatusButton.addEventListener("click", function() {
        nthTable.request("updateData");
    });

    let selectSchdlSeq;
    //변경버튼
    document.getElementById("updateSchdl").addEventListener("click", function () {

        if(confirm("변경하시겠습니까?")) {
            if (selectSchdlSeq == null) {
                alert("저장 후 변경해 주십시오.")
            }
            else{
                const schdlNamevalue = document.querySelector("#updateSchdlName").value;
                const statusDivvale = document.querySelector("#updateStatusDiv").value;
                //전형일정단계테이블이 아예없을때insert
                if(selectSchdlSeq==0) {
                    $.ajax({
                        url: "/recruitmentinfo/insertschdl",
                        type: "PUT",
                        data: {rcrtNo:selectedRcrtNo,
                            schdlName: schdlNamevalue,statusDiv: statusDivvale
                        },
                        dataType: "json",
                        async: false,

                    });
                }
                //있을때 update
                else {
                    $.ajax({
                        url: "/recruitmentinfo/updateschdl",
                        type: "PUT",
                        data: {
                            schdlSeq: selectSchdlSeq, schdlName: schdlNamevalue,
                            statusDiv: statusDivvale
                        },
                        dataType: "json",
                        async: false,

                    });
                }

            }
        }
          searchBtn();
    });


    let newRowList=[];
    // 신규 버튼 클릭 이벤트
    document.getElementById("nthInsertBtn").addEventListener("click", function () {
        const rowData = [
            {
                courseDiv: '',
                courseName: '',
                termDiv: '',
                recruitPeriod: '',
                announcementPeriod: '',
                schdlName: '',
                stepDiv: ''
            }
        ];

        nthTable.appendRow(rowData[0], {
            at: nthTable.getIndexOfRow(nthTable.getFocusedCell()['rowKey'])+1,
            extendPrevRowSpan: true,
            focus: true
        });

        // 하단 table 초기화
        var tableInput = document.querySelectorAll("#inputTable .tableInput");
        document.querySelector("#inputTable tbody").setAttribute("id", "row"+nthTable.getFocusedCell()['rowKey']);
        tableInput.forEach((ti) => {
            ti.value = "";
        });
       document.getElementById("courseName2").disabled = false;
        newRow = nthTable.getRowCount() - 1; //마지막행정보(신규로만들어진행 자체정보는 마지막행에 배치돼있음)
        newRowList.push(newRow);


        //전형일정단계 기존 옵션들 제거과정
        const courseSchdlname = document.querySelector("#updateSchdlName");
        while (courseSchdlname.firstChild) {
            courseSchdlname.removeChild(courseSchdlname.firstChild);
        }
        // "(미선택)" 옵션 추가
        const defaultOption = document.createElement("option");
        defaultOption.value = "unselected";
        defaultOption.text = "(미선택)";
        defaultOption.selected = true;
        courseSchdlname.appendChild(defaultOption);

    });

    //신규추가후 과정명선택시 정보불러오는이벤트
    document.getElementById('courseName2').addEventListener('change', async function() {
        const newCourseName=this.value
        const response = await fetch('/recruitmentinfo/newcoursenameinfo/'+newCourseName);
        const datas = await response.json();

        //정보뿌리기
        const id="inputTable";
        var tableInput = document.querySelectorAll("#"+id+" .tableInput");

            tableInput.forEach((ti) => {
                var tiName = ti.getAttribute("name");
                ti.value = datas[tiName];
                selectedRcrtNo=datas['rcrtNo'];
            });

        //전형일정단계정보불러오기
        await selectedSchdlnameList();
    });

    let selectedRowKey;
    //저장
    document.getElementById("nthSaveBtn").addEventListener('click', () => {
        const schdlNameVal = document.getElementById("updateSchdlName").value;
        const statusDivVal = document.getElementById("updateStatusDiv").value;
        const rcrtNo1Val = document.getElementById("rcrtNo1").value;
        if (confirm("저장하시겠습니까?")){
                    $.ajax({
                        url: "/recruitmentinfo/nthinfosave",
                        type: "PUT",
                        data: {
                            schdlName:schdlNameVal, statusDiv:statusDivVal,
                            rcrtNo: rcrtNo1Val
                        },
                        dataType: "json",
                        async: false,

                    });
    }
        searchBtn();
    });

    // 삭제 버튼 클릭 이벤트
    document.getElementById("nthDeleteBtn").addEventListener("click", function () {
        if(confirm("삭제하시겠습니까?")) {
            nthTable.removeCheckedRows(false);
        }
    });


    //모집전형번호
    let selectedRcrtNo;
    //선택된 전형일정 정보들
    async function selectedSchdlnameList(){
        const response = await fetch('/recruitmentinfo/schdlnamelist/'+selectedRcrtNo);
        const dataList = await response.json();
        const courseSchdlname = document.querySelector("#updateSchdlName");
        // 기존 옵션들 모두 제거
        while (courseSchdlname.firstChild) {
            courseSchdlname.removeChild(courseSchdlname.firstChild);
        }
        // "(미선택)" 옵션 추가
        const defaultOption = document.createElement("option");
        defaultOption.value = "unselected";
        defaultOption.text = "(미선택)";
        defaultOption.selected = true;
        courseSchdlname.appendChild(defaultOption);

        dataList.map((data) => {
            const option = document.createElement("option");
            option.value = data.schdlName;
            option.text = data.schdlName;
            courseSchdlname.appendChild(option);

        });
    }

    //조회리스트들정보
    async function searchListData() {
        //검색 조회부분
        const response = await fetch('/eval/result/searchlist');
        const dataList = await response.json();
        const courseDiv= dataList["courseDivList"];
        const courseName= dataList["courseNameList"];

        const courseDivSelect = document.querySelector("#courseDiv1");
        const courseNameSelect = document.querySelector("#courseName1");
        //모집전형설정리스트
        const nthCourseDivSelect = document.querySelector('#courseDiv2');
        const nthCourseNameSelect = document.querySelector('#courseName2');

        courseDiv.map((data) => {
            const option1 = document.createElement("option");
            option1.value = data.courseDiv;
            option1.text = data.courseDiv;
            courseDivSelect.appendChild(option1);

            const option2 = document.createElement("option");
            option2.value = data.courseDiv;
            option2.text = data.courseDiv;
            nthCourseDivSelect.appendChild(option2);
        });

        courseName.map((data) => {
            const option1 = document.createElement("option");
            option1.value = data.courseName;
            option1.text = data.courseName;
            courseNameSelect.appendChild(option1);

            const option2 = document.createElement("option");
            option2.value = data.courseName;
            option2.text = data.courseName;
            nthCourseNameSelect.appendChild(option2);
        });
    }

    let scheduleGrid;
    function subTableLoad(rowKey){
        if(rowKey!=undefined) {
            const rowData = nthTable.getRow(rowKey);
            rcrtNo = rowData.rcrtNo;
        }


        document.getElementById('scheduleGridDiv').innerHTML='';

        scheduleGrid = new tui.Grid({
            el: document.getElementById('scheduleGridDiv'),
            data: {
                api: {
                    readData: {url: '/recruitmentinfo/subinfo/' + rcrtNo, method: 'GET'},
                    modifyData: {url: '/recruitmentinfo/subinfosave/'+rcrtNo, method: 'PUT', contentType: 'application/json'}
                },
            },
            rowHeaders: ['checkbox'],
            pagination: true,
            scrollX: true,
            scrollY: true,
            columns: [
                {
                    header: '전형일정',
                    name: 'schdlName',
                    sortingType: 'asc',
                    sortable: false,
                    align: 'center',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: [
                                { text: '모집', value: '모집' },
                                { text: '서류합격자발표', value: '서류합격자발표' },
                                { text: '최종합격자발표', value: '최종합격자발표' },
                                { text: '안내문발표', value: '안내문발표' }
                            ]
                        }
                    }
                },
                {
                    header: '시작일시',
                    name: 'startDate',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center',
                    editor: {
                        type: 'datePicker',
                        options: {
                            format: 'yyyy-MM-dd HH:mm',
                            timepicker: true
                        }
                    }
                },
                {
                    header: '종료일시',
                    name: 'endDate',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center',
                    editor: {
                        type: 'datePicker',
                        options: {
                            format: 'yyyy-MM-dd HH:mm',
                            timepicker: true
                        }
                    }
                },
                {
                    header: '진행상태',
                    name: 'statusDiv',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center',
                    editor: {
                        type: 'select',
                        options: {
                            listItems: [
                                { text: '준비중', value: '준비중' },
                                { text: '진행중', value: '진행중' },
                                { text: '완료', value: '완료' }
                            ]
                        }
                    }
                },
                {
                    header: '일정일련번호',
                    name: 'schdlSeq',
                    hidden:true,
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center',
                }
            ],
            columnOptions: {
                resizable: true,
            },

            draggable: false
        });

        // 체크박스 전체 선택/해제
        scheduleGrid.on('checkAll', function (ev) {
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#" + id + " .tui-grid-table-container .tui-grid-table td[data-column-name='SCHDL_DIV'");

            rowKeys.forEach((rowKey) => {
                scheduleGrid.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
            });
        });
        scheduleGrid.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
            var id = ev.instance['el'].id;
            var rowKeys = document.querySelectorAll("#" + id + " .tui-grid-table-container .tui-grid-table td[data-column-name='SCHDL_DIV'");

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


    // 신규 버튼 클릭 이벤트
    document.getElementById("scheduleInsertBtn").addEventListener("click", function () {
        const rowData = [
            {
                schdlName: '',
                startDate: '',
                endDate: '',
                statusDiv: ''
            }
        ];

        scheduleGrid.appendRow(rowData[0], {
            at: scheduleGrid.getIndexOfRow(scheduleGrid.getFocusedCell()['rowKey'])+1,
            extendPrevRowSpan: true,
            focus: true
        });
    });

    function tabContent(e){
        subTableLoad(selectedRowKey);
        //display 지우기
        const elements = document.querySelectorAll('#select-pane, #person-pane, #document-pane, #schedule-pane');
        elements.forEach(function(element) {
            element.style.display = 'none';
        });

        const content = document.getElementById(e.id+"-pane");
        if(e.id === "select"){
            content.setAttribute("style","display:block");
        }
        else if(e.id === "schedule"){
            if(!scheduleGrid){
                subTableLoad(selectedRowKey);
            }
            content.setAttribute("style","display:block");
        }
    }

    const nthSaveBtn = document.getElementById("scheduleSaveBtn");
    nthSaveBtn.addEventListener('click',async () => {
        const modifiedData =  scheduleGrid.getModifiedRows();
        console.log(modifiedData); // 여기서 먼저 modifiedData 출력

        const gridData = modifiedData.updatedRows;
        if (Array.isArray(gridData)) {
            let ii;
            for (const row of gridData){
                if(row.startDate === null || row.startDate === undefined ||
                    row.endDate === null || row.endDate === undefined){
                    alert("날짜를 입력하십시오");
                    ii=1;
                    break;
                }
            }
            if(ii!==1) {
                scheduleGrid.request('modifyData');
                await searchBtn();
                setTimeout(searchBtn, 100); //버퍼링떄문에 바로데이터가로드안돼서 일단추가
            }
        }
    });

    // 삭제 버튼 클릭 이벤트
    document.getElementById("scheduleDeleteBtn").addEventListener("click", function () {
        if(confirm("삭제하시겠습니까?")) {
            scheduleGrid.removeCheckedRows(false);
        }
    });
</script>
</body>
</html>
