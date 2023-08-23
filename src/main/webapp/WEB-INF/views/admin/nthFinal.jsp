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
            <button id="passFindBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        </div>

        <div class="col-12">
            <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
                <div class="col-1 align-middle tableSearch">분기</div>
                <div class="col-1 me-2">
                    <select id="termDiv" class="form-select" onchange="courseSelect();">
                        <option value="0">(전체)</option>
                        <option value="1">1분기</option>
                        <option value="2">2분기</option>
                        <option value="3">3분기</option>
                        <option value="4">4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select id="courseDiv" class="form-select" onchange="courseSelect();">
                        <option value="0">(전체)</option>
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

        <div class="col-12 d-flex flex-row justify-content-between searchResult mt-4 mb-2">
            <div class="col-3 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">최종합격자명부</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
                <div>
                    <select class="form-select" id="finalTablePage">
                        <option>5</option>
                        <option selected>30</option>
                        <option>50</option>
                        <option>70</option>
                        <option>100</option>
                    </select>
                </div>
            </div>


            <div class="d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">안내문종류</p>
                <select class="form-select w-auto me-1">
                    <option selected>최종합격자안내메일</option>
                </select>
                <button id="mailSendBtn" class="btn btn-sm btn-light btn-outline-dark me-2" data-bs-toggle="modal" data-bs-target="#mailModal">합격안내메일</button>
            </div>
        </div>

        <div class="text-center border border-gray-100 rounded-2">
            <div id="finalTable"></div>
        </div>
    </div>

    <%-- 메일 내용 확인 모달 --%>
    <div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" id="dialog">
            <div id="spinner" style="display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 2;">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
            <div class="modal-content">
                <div class="modal-header border-0">
                    <div class="modal-title fw-bold">
                        중앙정보처리학원
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="bi bi-files biIcon fw-bolder fs-4 btn p-1" onclick="sizeChange()"></i>
                        <i class="bi bi-x biIcon fw-bolder fs-2 btn p-1" data-bs-dismiss="modal"></i>
                    </div>
                </div>
                <div class="modal-body pt-0">
                    <div>
                        <div class="d-flex align-items-center justify-content-between">
                            <div>
                                <p class="passNotice">최종 합격자에게만 발송됩니다.</p>
                                <p class="passNotice">메일 발송에 다소 시간이 소요됩니다.</p>
                            </div>
                            <div class="d-flex align-items-center">
                                <button id="sendBtn" class="btn btn-outline-secondary p-1 px-2 mx-1 fw-bold">메일발송</button>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="noticeInfoTable" class="text-start mb-3 mt-2">
                                <div class="border border-gray-100 rounded-2 mb-2">
                                    <div class="d-flex flex-row align-items-center border-bottom border-gray-100">
                                        <div class="col-2 fw-bold inputTitle d-flex align-items-center ps-2 fw-bold inputTitle">메일제목</div>
                                        <div class="col-10 p-2"><input id="subject" class="form-control tableInput" type="text" name="subject" disabled></div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <div class="col-2 fw-bold inputTitle d-flex align-items-center ps-2 fw-bold inputTitle">첨부파일</div>
                                        <div class="col-10 p-2 d-flex flex-row align-items-center justify-content-between">
                                            <input class="form-control" type="text" disabled style="width: 95%;">
                                            <i class="bi bi-search" style="width: 4%; font-size: 20px;"></i>
                                        </div>
                                    </div>
                                </div>
                                <div id="msgCont" class="border border-gray-100 rounded-2 bg-white p-3" style="height: 300px">

                                </div>
                            </div>
                        </div>
                    </div>
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

        let rcrtNo;
        document.addEventListener('DOMContentLoaded', function () {
            courseSelect();

            const finalTablePage = document.querySelector('#finalTablePage');
            const passFindBtn = document.getElementById("passFindBtn");

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
                    initialRequest: false,
                    api: {
                        readData: { url: '/pass/passList', method: 'GET'}
                    }
                },
                rowHeaders: ['rowNum'], //인덱스
                pageOptions: {
                    useClient: true,   // front에서만 페이징 하는 속성
                    perPage: 30,      //한번에 보여줄 데이터 수
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

                draggable: true
            });

            // perPage 핸들러(페이지당 행 개수 변경), (value, 진수)
            function handlePerPageChange(event) {
                const perPage = parseInt(event.target.value, 10);
                finalTable.setPerPage(perPage);
            }
            // 페이지당 행 개수 변경 이벤트 오브젝트에 바인딩
            finalTablePage.addEventListener('change', handlePerPageChange);

            // 조회 버튼 이벤트
            passFindBtn.addEventListener("click", function(){
                const courseName = document.getElementById("courseName");
                rcrtNo = courseName.options[courseName.selectedIndex].value;
                const params = {rcrtNo: rcrtNo};

                finalTable.readData(1, params, true);
            });
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
                    courseName.innerHTML = "";

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

        // 모달 관련
        const modal = document.getElementById("mailModal");
        const msgCont = document.getElementById("msgCont");
        const mailSendBtn = document.getElementById("mailSendBtn");
        const sendBtn = document.getElementById("sendBtn");
        const spinner = document.getElementById("spinner");

        modal.addEventListener('show.bs.modal', function (e) {
            var dataFlag = document.querySelector("#finalTable .tui-grid-body-area tr");

            if(dataFlag == null) {
                alert("데이터가 없습니다.");
                e.preventDefault();
            }
        });
        // 모달이 열릴 때 이벤트 핸들러 등록
        modal.addEventListener('hide.bs.modal', function () {
            var dialog = document.getElementById("dialog");
            if (dialog.classList.contains('modal-fullscreen')) {
                dialog.classList.remove("modal-fullscreen");
                dialog.classList.add("modal-lg");
                msgCont.style.height = '300px';
            }
        });

        //모달 크기 조정
        function sizeChange(){
            var dialog = document.getElementById("dialog");
            if (dialog.classList.contains("modal-fullscreen")) {
                dialog.classList.remove("modal-fullscreen");
                dialog.classList.add("modal-lg");
                msgCont.style.height = '300px';
            } else {
                dialog.classList.remove("modal-lg");
                dialog.classList.add("modal-fullscreen");
                msgCont.style.height = '90%';
            }
        }

        // 메일보내기 버튼 클릭 이벤트
        mailSendBtn.addEventListener('click', function () {
            //const response = await fetch('/pass/findMail');
            //const dataList = await response.json();
            //const title = dataList['SUBJECT'];
            //const content = dataList['MSG_CONT'];

            const subject = document.getElementById("subject");

            subject.value = "title2";
            msgCont.innerHTML = "content2";
        });

        // 메일 보내기
        sendBtn.addEventListener('click', function(){
            spinner.style.display = 'block';
            sendBtn.disabled = true;

            fetch("/pass/sendMail", {
                method: 'POST',
                body: JSON.stringify({
                    rcrtNo: rcrtNo,
                    stepDiv: 'final',
                    subject: "title2",
                    msgCont: "content2",
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then((response) => response.json())
                .then((json) => {
                    if(json['status'] !== 500){
                        alert("메일을 발송하였습니다.");
                    }else{
                        alert("메일을 발송하지 못했습니다.");
                    }

                    spinner.style.display = 'none';
                    sendBtn.disabled = false;
                });
        });

    </script>
</body>
</html>