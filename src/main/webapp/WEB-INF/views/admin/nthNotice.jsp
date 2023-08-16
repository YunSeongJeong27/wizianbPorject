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
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
    <style>

        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-header-area .tui-grid-table,
        .tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-body-area .tui-grid-table{
            border-right-style: solid;
            border-right-color: #E1E1E1;
        }
        .tui-grid-cell{
            border-left-width: 1px;
        }

        /* 체크된 row */
        .checkCell{
            background-color: #D1D1D1 !important;
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

        /* text edit */
        .tui-grid-layer-editing .tui-grid-content-text{
            height: 100% !important;
            border: none !important;
            text-align: center !important;
        }
        /* select eidt */
        .tui-grid-editor-select-box-layer .tui-select-box .tui-select-box-input:not(.tui-select-box-open){
            border: none !important;
        }
        .tui-select-box-input.tui-select-box-open{
            border: none !important;
            border-bottom: 1px solid #aaa !important;
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

            <%@ include file="nthTopScreening.jsp"%>

            <div class="d-flex flex-row justify-content-between mt-4 h-100">
                <div class="col-4 me-3" style="min-width: 449px;">
                    <div class="searchResult">
                        <div class="d-flex flex-row justify-content-between mb-2">
                            <div class="d-flex flex-row align-items-center">
                                <p class="subTitle fw-bold me-2">모집전형안내문</p>
                                <p class="subResult text-secondary me-2">검색결과:0건</p>
                                <select class="form-select w-auto" id="noticeTablePage">
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

    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>

        // notice테이블 grid
        // nthTable row 누를 때마다 noticeTable 데이터 바뀌게 - db 연동하면 어떻게 해야하나..? 별로
        function subTableLoad(rowKey){
            var noticeData = [];
            var firstColumName = 'STEP_DIV_NM';

            /*  //!*쓰는 예시 *
          // 선택된 행의 데이터를 가져옵니다.
          const rowData = noticeTable.getRow(rowKey);
          // 방법1. 원하는 데이터만 추출합니다.
          const stepDivNm = rowData.STEP_DIV_NM;
          const msgDivNm = rowData.MSG_DIV_NM;
          // 방법2. 원하는 데이터만 추출합니다.
          const { STEP_DIV_NM: stepDivNm, MSG_DIV_NM: msgDivNm } = rowData;*/
            if(rowKey == null) return;       // 헤더 클릭 시
            else if(rowKey === 0) {          // 일단 nthTable rowKey로 관련 데이터 넣어서 보내는걸로..
                noticeData = [
                    {
                        STEP_DIV_NM: '2',
                        MSG_DIV_NM: '1'
                    },
                    {
                        STEP_DIV_NM: '3',
                        MSG_DIV_NM: '2'
                    }
                ];
            }

            var noticeEl = document.getElementById('noticeTable');
            const noticeTablePage = document.querySelector('#noticeTablePage');
            noticeEl.innerHTML="";                  // 다시 부를 때 안에 내용 지우기 위함

            const noticeTable = new tui.Grid({
                el: noticeEl,
                data: noticeData,
                rowHeaders: ['checkbox'],
                pageOptions: {
                    useClient: true,	// front에서만 페이징 하는 속성
                    perPage: 5,		//한번에 보여줄 데이터 수
                    visiblePages: 10,
                    pagination: true
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
                    noticeTable.focus(0, firstColumName, true);
                    rowDataLoad(0, noticeTable, "noticeInfoTable");
                }
            });
            // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
            function handlePerPageChange(event) {
                const perPage = parseInt(event.target.value, 10);
                noticeTable.setPerPage(perPage);
            }
            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            noticeTablePage.addEventListener('change', handlePerPageChange);

            // row 클릭 시 하단에 해당 row 데이터 load
            noticeTable.on('click', function (ev) {
                if(ev.rowKey == null) return;       // 헤더 클릭 시

                rowDataLoad(ev.rowKey, noticeTable, "noticeInfoTable");
            });

            // 체크박스 전체 선택/해제

            noticeTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

                rowKeys.forEach((rowKey) => {
                    noticeTable.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });
            noticeTable.on('uncheckAll', function (ev) {           // 페이지 넘어가도 유지되는지?
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

                rowKeys.forEach((rowKey) => {
                    noticeTable.removeRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
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
                //var datas = noticeData[noticeTable.getIndexOfRow(rowKey)];
                //datas[changes['columnName']] = changes['value'];

                //noticeTable.resetData(noticeData);

                noticeTable.setValue(rowKey, changes['columnName'], changes['value'], false);
            });

            noticeTable.on('drop', ev => {
                firstColumName = noticeTable.getColumns()[0]['name'];
            });


            // 신규 버튼 click
            document.getElementById("noticeInsertBtn").addEventListener("click", function () {
                const rowData = [
                    {
                        STEP_DIV_NM: '',
                        MSG_DIV_NM: '',
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
