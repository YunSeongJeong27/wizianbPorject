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
<div class="d-flex flex-row justify-content-end mb-1">
    <button id="selectBtn" class="btn btn-sm btn-secondary me-1" onclick="searchBtn()">조회</button>
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
    </div>

    <%--BODY--%>
    <div class="nthInfoTable text-center border border-gray-100 rounded-2">
        <div id="nthTable"></div>
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
        //await subTableLoad();
    });


    let  termDiv, courseDiv, courseName;
    const nthTableData = () => {
        termDiv = termDiv === "" ? "nullTermDiv" : termDiv;
        courseDiv = courseDiv === "" ? "nullCourseDiv" : courseDiv;
        courseName = courseName === "" ? "nullCourseName" : courseName;
        return{
            api: {
                readData: { url: 'topscreen/info/'+termDiv+"/"+courseDiv+"/"+courseName,
                    method: 'GET' }
            }
        };
    };
    //조회버튼 클릭시
    async function searchBtn(){
        termDiv = document.querySelector('select[name="termDiv"]').value;
        courseDiv = document.querySelector('select[name="courseDiv"]').value;
        courseName = document.querySelector('select[name="courseName"]').value;

        await nthGridLoad(nthTableData());
        // 이 function에 추가로 서브테이블 이름에
        // 서브테이블.innerHTML = ''; 이거 각뷰에추가하면좋음
    }


    let nthTable;
    const nthGridLoad = (nthData) => {
        const oldnNhTable = document.getElementById('nthTable');
        oldnNhTable.innerHTML = '';

        nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: nthData,
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
            ],
            columnOptions: {
                resizable: true
            },

            draggable: true
        });
        nthTable.on('click', function (ev) {
            subTableLoad(ev.rowKey);
        });

        nthTablePage = document.querySelector('#nthTablePage');

        // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
        nthTablePage.addEventListener('change', function () {
            handlePerPageChange(this, nthTable)
        });
    }

    let nthTablePage = document.querySelector('#nthTablePage');

    // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
    function handlePerPageChange(event) {
        const perPage = parseInt(event.target.value, 10);
        nthTable.setPerPage(perPage);
    }
    // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
    nthTablePage.addEventListener('change', handlePerPageChange);


    //검색조회 항목들 리스트불러오기(일단 EvManagementController에서불러옴)
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
</script>
</body>
</html>
