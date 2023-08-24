<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
    <style>

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


            <%@ include file="nthTopScreening.jsp"%>

            <div class="d-flex flex-row justify-content-between mt-4 h-75">
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
                                <button id="noticeSaveBtn" class="btn btn-sm btn-success">저장</button>
                                <button id="noticeDeleteBtn" class="btn btn-sm btn-danger">삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="noticeTable bg-white border border-gray-100 rounded-2">
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
                                <div class="col-10 p-2"><input id="subject" class="form-control tableInput" type="text" name="subject"></div>
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

                        <div id="msgCont" class="border border-gray-100 rounded-2 bg-white h-75 p-3">

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
        const noticeEl = document.getElementById("noticeTable");
        const noticeTablePage = document.querySelector('#noticeTablePage');
        const subjectInput = document.getElementById("subject");
        const msgContInput = document.getElementById("msgCont");
        let noticeTable;
        let rcrtNo;
        let focusRowKey;
        let prevDataList = [];

        // notice테이블 grid
        function subTableLoad(rowKey){
            const rowData = nthTable.getRow(rowKey);
            rcrtNo = rowData.rcrtNo;         // 다시 부를 때 안에 내용 지우기 위함

            noticeEl.innerHTML = '';

            noticeTable = new tui.Grid({
                el: noticeEl,
                data: {
                    api: {
                        readData: { url: '/notice/list', method: 'GET', initParams: {rcrtNo : rcrtNo} },
                        modifyData: { url: '/notice/save', method: 'PUT', contentType: 'application/json' },
                        deleteData: { url: '/notice/delete', method: 'DELETE', contentType: 'application/json' }
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
                        header: '안내문종류',
                        name: 'msgDiv',
                        sortingType: 'asc',
                        sortable: true,
                        align: 'center',
                        formatter: 'listItemText',
                        editor: {
                            type: 'select',
                            options: {
                                listItems: [
                                    { text: '모집전형안내문', value: '10' },
                                    { text: '면접전형안내문', value: '20' },
                                    { text: '최종합격자안내문', value: '30' }
                                ]
                            }
                        }
                    }
                ],
                columnOptions: {
                    resizable: true
                },
                draggable: true,

                onGridMounted(){
                    noticeForm("", "");
                }
            });


            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            noticeTablePage.addEventListener('change', function(){handlePerPageChange(this, noticeTable)});

            // row 클릭 시 하단에 해당 row 데이터 load
            noticeTable.on('click', function (ev) {
                focusRowKey = ev.rowKey;
                if(focusRowKey == null) return;       // 헤더 클릭 시

                rowDataLoad(focusRowKey, noticeTable, "noticeInfoTable");
            });

            // 체크박스 전체 선택/해제
            noticeTable.on('checkAll', function (ev) {
                var id = ev.instance['el'].id;
                var rowKeys = document.querySelectorAll("#"+id+" .tui-grid-table-container .tui-grid-table td[data-column-name='"+firstColumName+"'");

                rowKeys.forEach((rowKey) => {
                    noticeTable.addRowClassName(parseInt(rowKey.getAttribute("data-row-key")), "checkCell");
                });
            });
            noticeTable.on('uncheckAll', function (ev) {
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

            noticeTable.on('drop', function (ev) {
                firstColumName = noticeTable.getColumns()[0]['name'];
            });

            noticeTable.on('afterChange', function(ev){
                let data = { 'rowKey' : ev['changes'][0]['rowKey'],
                    'prevValue' : ev['changes'][0]['prevValue']};

                prevDataList.push(data);
            })
        }

        // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
        function handlePerPageChange(event, table) {
            const perPage = parseInt(event.value, 10);
            table.setPerPage(perPage);
        }

        // 안내문 폼 데이터 load 및 초기화
        function noticeForm(subject, msgCont){
            subjectInput.value = subject;
            msgContInput.innerHTML = msgCont;
        }

        // 옆 notice 데이터 넣기
        function rowDataLoad(rowKey, table){
            var datas = table.getRow(rowKey);

            if(datas == null) {        // 데이터 x
                noticeForm("", "");
            }else{
                noticeForm(datas['subject'], datas['msgCont']);
            }
        }

        subjectInput.addEventListener('change', function(){
            noticeTable.setValue( focusRowKey , 'subject' , subjectInput.value, false);
        });

        // 버튼 이벤트
        // 신규 버튼 클릭 이벤트
        let dataFlag;
        const noticeInsertBtn = document.getElementById("noticeInsertBtn");
        noticeInsertBtn.addEventListener("click", function () {
            dataFlag = document.querySelector("#noticeTable .tui-grid-body-area");

            if(dataFlag == null) alert("데이터가 없습니다.");
            else{
                const rowData = [
                    {
                        rcrtNo: rcrtNo,
                        msgDiv: '',
                        subject: '',
                        msgCont: ''
                    }
                ];

                noticeTable.appendRow(rowData[0], {
                    at: noticeTable.getIndexOfRow(noticeTable.getFocusedCell()['rowKey'])+1,
                    extendPrevRowSpan: true,
                    focus: true
                });

                // 초기화
                focusRowKey = noticeTable.getFocusedCell()['rowKey'];
                noticeForm("", "");
            }
        });

        // 저장 버튼 클릭 이벤트
        const noticeSaveBtn = document.getElementById("noticeSaveBtn");
        noticeSaveBtn.addEventListener("click", function () {
            dataFlag = document.querySelector("#noticeTable .tui-grid-body-area tr");

            if(dataFlag == null) alert("데이터가 없습니다.");
            else if(confirm("저장하시겠습니까?")){
                let data = noticeTable.getData();
                let msgDivList = noticeTable.getColumnValues('msgDiv');

                msgDivFlag = data.every(row => {
                    var notice = noticeTable.getRow(row['rowKey']);
                    var msgDivCnt = msgDivList.reduce((cnt, msgDiv) => msgDiv === notice['msgDiv'] ? cnt + 1 : cnt, 0);

                    if(notice['msgDiv'] === ""){
                        alert("안내문종류는 필수항목입니다.");
                        return false;
                    }
                    else if(msgDivCnt > 1){
                        alert("안내문이 존재합니다.");
                        return false;
                    }else{
                        return true;
                    }
                });

                if(!msgDivFlag) return;

                noticeTable.request("modifyData", {showConfirm: false});
                noticeTable.resetData(data);

                // 기존 값 저장하는 리스트 초기화
                prevDataList = [];
            }
        });

        // 삭제 버튼 클릭 이벤트
        const noticeDeleteBtn = document.getElementById("noticeDeleteBtn");
        noticeDeleteBtn.addEventListener("click", function () {
            dataFlag = document.querySelector("#noticeTable .tui-grid-body-area tr");

            if(dataFlag == null) alert("데이터가 없습니다.");
            else if(confirm("삭제하시겠습니까?")){
                let msgDiv = "";
                let divList = noticeTable.getCheckedRows();

                if(divList.length === 0) {
                    alert('체크된 항목이 없습니다.');
                    return;
                }else{
                    if(prevDataList.length !== 0) {
                        prevDataList.forEach(row => {
                            noticeTable.setValue( row['rowKey'] , 'msgDiv' , row['prevValue'] , true );
                        });
                    }
                    noticeTable.getCheckedRows().forEach(row => {
                        msgDiv += row['msgDiv']+",";
                    });
                }

                noticeTable.removeCheckedRows(false);

                noticeTable.setRequestParams({rcrtNo: rcrtNo, msgDiv: msgDiv});
                noticeTable.request("deleteData", {showConfirm: false});

                noticeTable.resetData(noticeTable.getData());
            }
        });


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
