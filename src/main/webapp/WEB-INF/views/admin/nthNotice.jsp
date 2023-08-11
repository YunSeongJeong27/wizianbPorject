<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--Toast--%>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />

    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: #F2F3F5;
        }
        .container-table .form-select:focus,
        .container-table .form-control:focus{
            box-shadow: none;
            border-color: #9a9a9a;
        }
        .container-table .tr{
            background-color: #fff;
        }

        /* 과정 검색 */
        .tableSearch{
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle{
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }
        .searchResult .subResult{
            font-size: 14px;
            margin-bottom: 0;
        }
        .searchResult select.form-select{
            padding: 0.2rem 2rem 0.2rem 0.75rem;
        }

        /* 그리드 custom css */

        /* 스크롤 자투리 부분 색 변경 */
        .tui-grid-scrollbar-left-bottom,
        .tui-grid-scrollbar-right-bottom,
        .tui-grid-scrollbar-right-top{
            background-color: #fff;
        }

        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-header-area .tui-grid-table,
        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-body-area .tui-grid-table{
            border-right-style: solid;
            border-right-color: #E1E1E1;
        }
        .tui-grid-cell{
            border-left-width: 1px;
        }

        /* 선택한 row */
        .tui-grid-cell-current-row td{
            background-color: #F2F7FF !important;
            font-weight: 600;
            color: #245396;
        }
        /* 체크된 row */
        .checkCell{
            background-color: #D1D1D1 !important;
        }

        /* 페이징 */
        .tui-pagination{
            background-color: #fff;
            margin:0 !important;
            padding: 20px 0 12px;
        }
        .tui-is-disabled:hover{
            background: initial !important;
        }
        .tui-page-btn span{
            margin-top: 9px;
        }
        .tui-pagination .tui-page-btn{
            border: none;
        }
        .tui-pagination .tui-page-btn:hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            font-weight: 600;
        }
        .tui-pagination .tui-is-selected{
            border: none !important;
            background-color: #f5f5f5;
            border-radius: 5px;
            font-weight: 600;
            color: #245396;
        }

        /* noticeInfoTable */
        #noticeInfoTable textarea{
            border:none;
            height:100%;
            resize: none;
        }
        #noticeInfoTable .inputTitle{
            background-color: #FAFAFA;
            height: 52px;
        }
        #noticeInfoTable .inputTitle+div{
            background-color: #fff;
            height: 100%;
        }
        #noticeInfoTable .inputTitle+div input{
            border:none;
            background-color: #F4F4F4;
        }

        .biIcon{
            opacity: 0.5;
        }
        .biIcon:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="container-table m-2">
        <div class="col-12">
            <div class="d-flex flex-row justify-content-end mb-1">
                <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
            </div>

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

            <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
                <div class="d-flex flex-row align-items-center">
                    <p class="subTitle fw-bold me-2">모집기수정보</p>
                    <p class="subResult text-secondary me-2">검색결과:00건</p>
                    <div>
                        <select class="form-select">
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
            </div>

            <div class="d-flex flex-row justify-content-between mt-4 h-100">
                <div class="col-4 me-3">
                    <div class="searchResult">
                        <div class="d-flex flex-row justify-content-between mb-2">
                            <div class="d-flex flex-row align-items-center">
                                <p class="subTitle fw-bold me-2">모집전형안내문</p>
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
                                <button id="noticeInsertBtn" class="btn btn-sm btn-light btn-outline-dark">신규</button>
                                <button id="noticeSaveBtn" class="btn btn-sm btn-light btn-outline-dark">저장</button>
                                <button id="noticeDeleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="noticeTable h-75 bg-white border border-gray-100 rounded-2">
                        <div id="noticeTable"></div>
                    </div>
                </div>

                <div class="w-100">
                    <div class="searchResult d-flex flex-row justify-content-between align-items-center" style="height: 32.38px">
                        <p class="subTitle fw-bold">안내문내용</p>
                        <button id="noticeInsertContentBtn" class="btn btn-sm btn-light btn-outline-dark"
                        data-bs-toggle="modal" data-bs-target="#noticeModal">안내문작성하기</button>
                    </div>

                    <div id="noticeInfoTable" class="text-start mb-3 mt-2">
                        <div class="border border-gray-100 rounded-2 mb-2">
                            <div class="d-flex flex-row align-items-center border-bottom border-gray-100">
                                <div class="col-2 fw-bold inputTitle d-flex align-items-center ps-2 fw-bold inputTitle">메일제목</div>
                                <div class="col-10 p-2"><input  class="form-control tableInput" type="text" name="SUBJECT" value=""></div>
                            </div>
                            <div class="d-flex flex-row align-items-center">
                                <div class="col-2 fw-bold inputTitle d-flex align-items-center ps-2 fw-bold inputTitle">첨부파일</div>
                                <div class="col-10 p-2 d-flex flex-row align-items-center">
                                    <input class="form-control" type="text" disabled style="width: 95%;">
                                    <input id="addFile" class="form-control d-none" type="file">
                                    <label for="addFile" class="ms-3" style="width: 4%; font-size: 20px;"><i class="bi bi-search"></i></label>
                                </div>
                            </div>
                        </div>

                        <div class="border border-gray-100 rounded-2 bg-white h-50 p-3">
                            "$"{저장해놓은 Editor 값}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--안내문 작성하기 Modal--%>
    <div class="modal fade" id="noticeModal" tabindex="-1"
         role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" id="dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <div class="modal-title fw-bold">
                        WIZIAN 정보처리학원
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="bi bi-files biIcon fw-bolder fs-4 btn p-1" onclick="sizeChange()"></i>
                        <i class="bi bi-x biIcon fw-bolder fs-2 btn p-1" data-bs-dismiss="modal"></i>
                    </div>
                </div>
                <div class="modal-body">
                    <form action="#" method="post">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center">
                                <div><i class="bi bi-star-fill text-warning"></i></div>
                                <div class="fw-bold">&nbsp;게시 내용 작성하기</div>
                            </div>
                            <div class="d-flex align-items-center">
                                <input type="submit" class="btn btn-outline-secondary p-1 px-2 mx-1 fw-bold" value="저장">
                                <input type="button" class="btn btn-outline-secondary p-1 px-2 mx-1 fw-bold" data-bs-dismiss="modal" value="닫기">
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="editor"></div>
                            <div>
                                <input type="hidden" id="contents" name="noticeContent">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        // Table 테마
        const gridTheme = new tui.Grid.applyTheme('default', {
            row: {
                hover: {
                    background: '#D1D1D1'
                }
            },
            cell: {
                normal: {
                    background: '#fff',
                    border:'#E1E1E1'
                },
                header: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                },
                rowHeader: {
                    background: '#EFEFEF',
                    border:'#E1E1E1'
                },
                evenRow: {
                    background: '#F2F3F5'
                },
                oddRow: {
                    background: '#FFF'
                },
                hover: {
                    border: '#000'
                }
            }
        });

        document.addEventListener('DOMContentLoaded', function () {
            const nthData = [
                {
                    CORS_DIV: 'JAVA',
                    SEL_NM: '자바과정 풀스택',
                    NTH_NM: '3',
                    ENT_YR: '2023',
                    TERM_DIV: '1',
                    YR_CNT: '6',
                    EDU_ST_DT: '2023-08-01',
                    EDU_END_DT: '2023-08-01',
                    ANN_DT: '2023-08-01',
                    NOTE: ''
                },
                {
                    CORS_DIV: 'Python',
                    SEL_NM: '파이썬',
                    NTH_NM: '2',
                    ENT_YR: '2023',
                    TERM_DIV: '1',
                    YR_CNT: '6',
                    EDU_ST_DT: '2023-08-01',
                    EDU_END_DT: '2023-08-01',
                    ANN_DT: '2023-08-01',
                    NOTE: '장사때려침'
                },
                {
                    CORS_DIV: 'C++',
                    SEL_NM: 'C++ 코딩테스트',
                    NTH_NM: '4',
                    ENT_YR: '2023',
                    TERM_DIV: '1',
                    YR_CNT: '6',
                    EDU_ST_DT: '2023-08-01',
                    EDU_END_DT: '2023-08-01',
                    ANN_DT: '2023-08-01',
                    NOTE: '장사때려침'
                }
            ];
            function educationPeriodFormatter({ row }) {
                var startDate = row.EDU_ST_DT;
                var endDate = row.EDU_END_DT;
                return startDate + "~" + endDate;
            }
            const nthTable = new tui.Grid({
                el: document.getElementById('nthTable'),
                data: nthData,
                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 5,		//한번에 보여줄 데이터 수
                    visiblePages: 10
                },
                scrollX: true,
                scrollY: true,
                columns: [
                    {
                        header: '과정구분',
                        name: 'CORS_DIV',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center'
                    },
                    {
                        header: '과정명',
                        name: 'SEL_NM',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center'
                    },
                    {
                        header: '기수',
                        name: 'NTH_NM',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '수강년도',
                        name: 'ENT_YR',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '분기',
                        name: 'TERM_DIV',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '수업개월수',
                        name: 'YR_CNT',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '교육기간',
                        sortingType: 'asc',
                        sortable: true, align: 'center',
                        formatter: educationPeriodFormatter
                    },
                    {
                        header: '발표일자',
                        name: 'ANN_DT',
                        sortingType: 'asc',
                        sortable: true, align: 'center'
                    },
                    {
                        header: '비고',
                        name: 'NOTE',
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
                    nthTable.focus(0, 'CORS_DIV', true);
                    subTableLoad(0);
                }
            });

            nthTable.on('click', function (ev) {
                subTableLoad(ev.rowKey);
            });
        });

        // notice테이블 grid
        // nthTable row 누를 때마다 noticeTable 데이터 바뀌게 - db 연동하면 어떻게 해야하나..? 별로
        function subTableLoad(rowKey){
            var noticeData = [];

            if(rowKey == null) return;       // 헤더 클릭 시
            else if(rowKey === 0) {          // 일단 nthTable rowKey로 관련 데이터 넣어서 보내는걸로..
                noticeData = [
                    {
                        STEP_DIV_NM: '3',
                        MSG_DIV_NM: '1',
                        SUBJECT: '메일제목',
                        MSG_CONT: '내용'
                    },
                    {
                        STEP_DIV_NM: '2',
                        MSG_DIV_NM: '2',
                        SUBJECT: '메일제목2',
                        MSG_CONT: '내용2'
                    }
                ];
            }

            var noticeEl = document.getElementById('noticeTable');
            noticeEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            const noticeTable = new tui.Grid({
                el: noticeEl,
                data: noticeData,
                rowHeaders: ['checkbox'],
                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 5,		//한번에 보여줄 데이터 수
                    visiblePages: 10
                },
                scrollX: true,
                scrollY: true,
                //editingEvent: 'click',
                columns: [
                    {
                        header: '전형평가단계',
                        name: 'STEP_DIV_NM',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        formatter: 'listItemText',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '원서접수', value: '1' },
                                    { text: '서류전형', value: '2' },
                                    { text: '면접전형', value: '3' },
                                    { text: '합격사정', value: '4' }
                                ]
                            }
                        }
                    },
                    {
                        header: '안내문종류',
                        name: 'MSG_DIV_NM',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        formatter: 'listItemText',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '모집전형안내문', value: '1' },
                                    { text: '최종합격자안내문', value: '2' }
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
                    noticeTable.focus(0, 'STEP_DIV_NM', true);
                    rowDataLoad(0, noticeTable, "noticeInfoTable");
                }
            });

            // row 클릭 시 하단에 해당 row 데이터 load
            noticeTable.on('click', function (ev) {
                if(ev.rowKey == null) return;       // 헤더 클릭 시

                rowDataLoad(ev.rowKey, noticeTable, "noticeInfoTable");
            });

            // 체크박스 전체 선택/해제
            var checkBox = [];
            noticeTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+Object.keys(noticeData[0])[0]+"'");

                rowKeys.forEach((rowKey) => {
                    checkBox.push(rowKey);
                    noticeTable.addRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
                });
            });
            noticeTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                checkBox.forEach((rowKey) => {
                    noticeTable.removeRowClassName(rowKey.getAttribute("data-row-key"), "checkCell");
                });
            });

            // 체크박스 개별 선택/해제
            noticeTable.on('check', function (ev) {
                noticeTable.addRowClassName(ev.rowKey, "checkCell");
            });
            noticeTable.on('uncheck', function (ev) {
                noticeTable.removeRowClassName(ev.rowKey, "checkCell");
            });

            // 데이터 변경 후
            noticeTable.on('afterChange', ev => {
                var changes = ev["changes"][0];
                var rowKey = changes['rowKey']
                var datas = noticeData[noticeTable.getIndexOfRow(rowKey)];
                datas[changes['columnName']] = changes['value'];

                noticeTable.resetData(noticeData);
                noticeTable.focus(rowKey, 'STEP_DIV_NM', true);
            })


            // 신규 버튼 click
            document.getElementById("noticeInsertBtn").addEventListener("click", function () {
                const rowData = [
                    {
                        STEP_DIV_NM: '1',
                        MSG_DIV_NM: '1',
                        SUBJECT: '',
                        MSG_CONT: ''
                    }
                ];

                noticeTable.appendRow(rowData[0], {
                    at: noticeTable.getIndexOfRow(noticeTable.getFocusedCell()['rowKey'])+1,
                    extendPrevRowSpan: true,
                    focus: true
                });

                noticeData = noticeTable.getData();
                console.log(noticeData);

                // 옆 notice 데이터 초기화
                var tableInput = document.querySelectorAll("#noticeInfoTable .tableInput");
                tableInput.forEach((ti) => {
                    ti.value = "";
                });
            });

            // 옆 notice 데이터 넣기
            function rowDataLoad(rowKey, table, id){
                var datas = table.getRow(rowKey);
                var tableInput = document.querySelectorAll("#"+id+" .tableInput");

                if(datas == null ) {        // 데이터 x
                    tableInput.forEach((ti) => {
                        ti.value = "";
                    });
                }else{
                    tableInput.forEach((ti) => {
                        ti.value = datas[ti.getAttribute("name")];
                    });
                }
            }
        }

        // Toast Editor
        const Editor = toastui.Editor;
        const editor = new Editor({
            el: document.querySelector('#editor'),
            height: '350px',
            initialEditType: 'wysiwyg',
            initialValue: '저장값 불러오기',
            previewStyle: 'vertical',
            language:'ko'
        });
        editor.getMarkdown();


        // 모달이 열릴 때 이벤트 핸들러 등록
        var modal = document.getElementById("noticeModal")
        modal.addEventListener('hide.bs.modal', function () {
            var dialog = document.getElementById("dialog");
            if (dialog.classList.contains('modal-fullscreen')) {
                dialog.classList.remove("modal-fullscreen");
                dialog.classList.add("modal-lg");
                editor.setHeight('350px');
            }
        });
        //모달 크기 조정
        function sizeChange(){
            var dialog = document.getElementById("dialog");
            if (dialog.classList.contains("modal-fullscreen")) {
                dialog.classList.remove("modal-fullscreen");
                dialog.classList.add("modal-lg");
                editor.setHeight('350px');
            } else {
                dialog.classList.remove("modal-lg");
                dialog.classList.add("modal-fullscreen");
                editor.setHeight('90%');
            }
        }
    </script>
</body>
</html>
