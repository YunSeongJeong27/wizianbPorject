<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2023-08-11
  Time: 오후 10:48
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
    <link rel="stylesheet" href="/css/custom.css" />
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container-table m-2">
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
            <div class="col-2">
                <select class="form-select">
                    <option selected>자바 풀스택</option>
                    <option>파이썬 빅데이터</option>
                    <option>C++ 코딩테스트</option>
                </select>
            </div>
        </div>
    </div>

    <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
        <div class="col-3 d-flex flex-row align-items-center">
            <p class="subTitle fw-bold me-2">최종합격자명부</p>
            <p class="subResult text-secondary me-2">검색결과:00건</p>
            <div>
                <select class="form-select" id="finalTablePage">
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
    <div class="text-center border border-gray-100 rounded-2">
        <div id="finalTable"></div>


        <%-- <div class="position-absolute top-50 end-0 translate-middle-y">
             <p class="pageLoc">현재:1/전체:14(1~5)</p>
         </div>--%>
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
        function ageFormatter({row}) {
            const birth = Number((row.birthday).substring(0,4));
            const now = new Date().getFullYear();

            return (now-birth+1);
        }
        function docPassYnFormatter({row}) {
            return (row.docPassYn === "Y") ? "합격" : "불합격";
        }

        const finalTable = new tui.Grid({
            el: document.getElementById('finalTable'),
            data: {
                api: {
                    readData: { url: '/pass/listAll', method: 'GET'}
                }
            },
            rowHeaders: ['rowNum'], //인덱스
            pageOptions: {
                useClient: true,   // front에서만 페이징 하는 속성
                perPage: 5,      //한번에 보여줄 데이터 수
                visiblePages: 10
            },
            scrollX: true,
            scrollY: true,
            bodyHeight: 450,
            header: {
                height:60,
                complexColumns: [
                    {
                        header: '면접전형',
                        name: 'INTERVIEW',
                        childNames: ['evAvgScore', 'prelOrd']
                    }
                ]
            },
            columns: [
                {
                    header: '지원서번호',
                    name: 'aplyNo',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '지원자명',
                    name: 'nameKor',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '연령',
                    name: 'age',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                    formatter: ageFormatter
                },
                {
                    header: '성별',
                    name: 'gender',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '서류전형',
                    name: 'docPassYn',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                    formatter: docPassYnFormatter
                },
                {
                    header: '평균',
                    name: 'evAvgScore',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '순위',
                    name: 'prelOrd',
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
                finalTable.focus(0, 'aplyNo', true);
            }
        });

        const finalTablePage = document.querySelector('#finalTablePage');

        // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
        function handlePerPageChange(event) {
            console.log(event);
            const perPage = parseInt(event.target.value, 10);
            finalTable.setPerPage(perPage);
        }
        // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
        finalTablePage.addEventListener('change', handlePerPageChange);
    });
</script>


</body>
</html>