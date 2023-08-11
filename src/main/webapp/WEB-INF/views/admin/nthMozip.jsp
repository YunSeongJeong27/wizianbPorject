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
        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableColorHead{
            background-color: #EFEFEF;
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

        .infoInput::-webkit-inner-spin-button {
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
        }
        .infoInput{
            background: none;
            border: none;
            text-align: center;
            cursor: pointer;
        }
        .tableInput{
            background-color: inherit;
            border: none;
        }
    </style>
</head>
<body>
<div class="container-table m-2">
    <div class="d-flex flex-row justify-content-end mb-1">
        <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        <button id="insertBtn" class="btn btn-sm btn-light me-1">신규</button>
        <button id="saveBtn" class="btn btn-sm btn-light me-1">저장</button>
        <button id="deleteBtn" class="btn btn-sm btn-light me-1">삭제</button>
    </div>

    <%@ include file="nthTopScreening.jsp"%>

    <div class="nav nav-pills nav-tabs fw-bold text-center col-4 d-flex justify-content-between mt-4" id="infoNav" role="tablist">
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn active" id="select" data-bs-toggle="tab" type="button" onclick="tabContent(this)">모집전형설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="person" data-bs-toggle="tab" type="button" onclick="tabContent(this)">모집인원설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="schedule" data-bs-toggle="tab" type="button" onclick="tabContent(this)">전형일정설정</div>
        </div>
        <div class="nav-item" role="presentation" style="width: 24%;">
            <div class="p-2 divBtn" id="document" data-bs-toggle="tab" type="button" onclick="tabContent(this)">제출서류설정</div>
        </div>
    </div>

    <div class="tab-content pt-3 bg-white" id="infoNavContent">
        <!-- 모진접형설정 Content -->
        <div id="select-pane">
            <div class="d-flex col-4 align-items-center" style="height: 40px";>
                <div class="col-4 ms-3 fw-bold d-flex">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정단계/상태</div>
                </div>
                <div class="col-3">
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
                </div>
            </div>
            <div class="p-3">
                <table class="table border fw-bold align-middle">
                    <tr>
                        <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                        <td class="col-2">
                            <select class="form-select tableInput" aria-label="Default select">
                                <option selected>[S] CORS_DIV [LM0010]</option>
                            </select>
                        </td>
                        <td class="col-2 tableColor">수강년도<span class="text-danger">*</span></td>
                        <td class="col-2"><input class="form-control tableInput" type="text" value="ENT_YR"></td>
                        <td class="col-2 tableColor">분기구분<span class="text-danger">*</span></td>
                        <td class="col-2">
                            <select class="form-select tableInput" aria-label="Default select">
                                <option selected>[S] TERM_DIV [CO0005]</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableColor">과정명</td>
                        <td class=""><input class="form-control tableInput" type="text" value="[S] NTH_NM"></td>
                        <td class="tableColor">교육시작일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" type="date" value="[CAL] EDU_ST_DT(자동)"></td>
                        <td class=" tableColor">교육종료일<span class="text-danger">*</span></td>
                        <td class=""><input class="form-control tableInput" type="date" value="[CAL] EDU_END_DT(자동)"></td>
                    </tr>
                    <tr>
                        <td class="tableColor">모집전형명</td>
                        <td class="" colspan="3"><input class="form-control tableInput" type="text" value="SEL_NM"></td>
                        <td class="tableColor">모집전형번호</td>
                        <td class=""><input class="form-control tableInput" type="text" value="SEL_CD (자동)"></td>
                    </tr>
                    <tr>
                        <td class="tableColor">현재 전형일정</td>
                        <td class=""><input class="form-control tableInput" type="text" value="[S] SCHDL_DIV[LMB020]" readonly></td>
                        <td class="tableColor">전형평가단계</td>
                        <td class="">
                            <select class="form-select tableInput">
                                <option selected>[S] STEP_DIV[LM0140]</option>
                            </select>
                        </td>
                        <td class="tableColor">단계진행상태</td>
                        <td class="">
                            <select class="form-select tableInput">
                                <option selected>[S] STEP_STS_DIV[LM0040]</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 모집인원설정 Content -->
        <div id="person-pane" style="display: none">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px";>
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>모집인원설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="personInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="personSaveBtn" class="btn btn-sm btn-light btn-outline-dark me-2">저장</button>
                    <button id="personDeleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                </div>
            </div>

            <div id="personGridDiv" class="pt-3"></div>
        </div>

        <!-- 전형일정설정 Content -->
        <div id="schedule-pane" style="display: none">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px";>
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>전형일정설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="scheduleInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="scheduleSaveBtn" class="btn btn-sm btn-light btn-outline-dark me-2">저장</button>
                    <button id="scheduleDeleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                </div>
            </div>

            <div id="scheduleGridDiv" class="pt-3"></div>
        </div>

        <!-- 제출서류설정 Content -->
        <div id="document-pane" style="display: none;">
            <div class="d-flex justify-content-between align-items-center" style="height: 40px";>
                <div class="d-flex ms-3 fw-bold">
                    <div>
                        <i class="bi bi-star-fill text-warning px-1"></i>
                    </div>
                    <div>제출서류설정</div>
                </div>
                <div class="d-flex justify-content-end me-3" style="width: 13%;">
                    <button id="documentInsertBtn" class="btn btn-sm btn-light btn-outline-dark me-2">신규</button>
                    <button id="documentSaveBtn" class="btn btn-sm btn-light btn-outline-dark me-2">저장</button>
                    <button id="documentDeleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                </div>
            </div>

            <div id="documentGridDiv" class="pt-3"></div>
        </div>
</div>

<script>
    class CheckboxRenderer {
        constructor(props) {
            const {grid, rowKey} = props;

            const label = document.createElement('label');
            label.className = 'checkbox tui-grid-row-header-checkbox';
            label.setAttribute('for', String(rowKey));

            const hiddenInput = document.createElement('input');
            hiddenInput.className = 'hidden-input';
            hiddenInput.id = String(rowKey);

            const customInput = document.createElement('span');
            customInput.className = 'custom-input';

            label.appendChild(hiddenInput);
            label.appendChild(customInput);

            hiddenInput.type = 'checkbox';
            label.addEventListener('click', (ev) => {
                ev.preventDefault();

                if (ev.shiftKey) {
                    grid[!hiddenInput.checked ? 'checkBetween' : 'uncheckBetween'](rowKey);
                    return;
                }

                grid[!hiddenInput.checked ? 'check' : 'uncheck'](rowKey);
            });

            this.el = label;

            this.render(props);
        }

        getElement() {
            return this.el;
        }

        render(props) {
            const hiddenInput = this.el.querySelector('.hidden-input');
            const checked = Boolean(props.value);

            hiddenInput.checked = checked;
        }
    }

    let personGrid;
    let scheduleGrid;
    let documentGrid;

    function tabContent(e){
        //display 지우기
        const elements = document.querySelectorAll('#select-pane, #person-pane, #document-pane, #schedule-pane');
        elements.forEach(function(element) {
            element.style.display = 'none';
        });

        var content = document.getElementById(e.id+"-pane");

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
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
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
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
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

                    draggable: false,

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
                    rowHeaders: [
                        {
                            type: 'checkbox',
                            header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
                            renderer: {
                                type: CheckboxRenderer
                            }
                        }
                    ],
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

    //list 클릭 시 이벤트
    var biLists = document.getElementsByClassName("bi-list");
    Array.from(biLists).forEach((element) => {
        //태그 생성
        var div = document.createElement("div");
        var select = document.createElement("select");
        for(let i=0 ; i<5 ; i++){
            var option = document.createElement("option");
            option.innerHTML = i;
            select.appendChild(option);
        }
        div.appendChild(select);

        //style 설정
        div.setAttribute("class","position-absolute");
        select.setAttribute("class","w-100");
        div.setAttribute("style","width:15%;");

        element.addEventListener("click", function() {
            //태그 삽입
            var schdlDiv = document.getElementById("schdlDiv"+this.id);
            schdlDiv.parentElement.appendChild(div);
            //select 변경 시 이벤트
            select.addEventListener("change",function(){
                schdlDiv.value = this.value;
                //태그 삭제
                schdlDiv.parentElement.removeChild(div);
            })
        });
    });

    nthTable.addEventListener("click",function(){
        console.log("감자감자");
    })

</script>
</body>
</html>
