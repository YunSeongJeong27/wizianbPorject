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

        /*
        !* 과정 정보 테이블 *!
        .nthInfoResponsive{
            overflow-x: auto;
            background-color: #fff;
        }
        .nthInfoContainer{
            min-width: 1220px;
            cursor: pointer;
            max-height: 272px;
        }
        .nthInfoContainer .d-flex{
            border-bottom:1px solid #E1E1E1;
        }
        .nthInfoContainer .d-flex div:nth-child(n+2){
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }
        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox']{
            height: 44px;
            border:none;
        }

        .nthInfoContainer .th{
            background-color: #EFEFEF;
            font-weight: 600;
        }
        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even){
            background-color: #fff;
        }
        .nthInfoContainer .d-flex.td:nth-child(odd){
            background-color: #F2F3F5;
        }
        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover{
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        !* 체크 박스 선택 시 css *!
        .nthInfoContainer .d-flex.tdChk{
            background-color: #D1D1D1 !important;
        }
        !* row 선택 시 focus css *!
        .nthInfoContainer .d-flex.tdBg{
            background-color: #F2F7FF !important;
            border: 1px solid #245396 !important;
            font-weight: 600;
            color: #245396;
        }
        */

        /* 페이징 */
        .pagination ul {
            margin: 15px 0;
            border: none;
            padding: 0;
        }
        .pagination ul li{
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }
        .pagination ul li.active{
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }
        .pagination ul li:not(.active):hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
        }
        .pagination .pageLoc {
            margin: 0 10px 0 0;
            color: #797676;
        }

        /* 그리드 custom css */

        /* 스크롤 자투리 부분 색 변경 */
        .tui-grid-scrollbar-left-bottom,
        .tui-grid-scrollbar-right-bottom,
        .tui-grid-scrollbar-right-top{
            background-color: #fff;
        }

        .tui-grid-cell-current-row td{
            background-color: #F2F7FF;
            font-weight: 600;
            color: #245396;
        }

        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableInput{
            background-color: #F4F4F4;
        }

    </style>
</head>
<body>
<div id="nthInfo" class="container-table m-2">
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
            <button id="insertBtn" class="btn btn-sm btn-light btn-outline-dark me-1">신규</button>
            <button id="saveBtn" class="btn btn-sm btn-light btn-outline-dark me-1">저장</button>
            <button id="deleteBtn" class="btn btn-sm btn-light btn-outline-dark me-1">삭제</button>
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
        <%--<div class="nthInfoResponsive">
            <div class="nthInfoContainer">
                <div class="d-flex flex-row align-items-center th">
                    <div class="col-1 chkBox"><input type="checkbox" id="chkAll"></div>
                    <div class="col-1">과정구분</div>
                    <div class="col-2">과정명</div>
                    <div class="col-1">기수</div>
                    <div class="col-1">수강년도</div>
                    <div class="col-1">분기</div>
                    <div class="col-1">수업개월수</div>
                    <div class="col-2">교육기간</div>
                    <div class="col-1">발표일자</div>
                    <div class="col-1">비고</div>
                </div>
                <div class="d-flex flex-row align-items-center td tdBg" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="mainCheck" onclick="check(this);"></div>
                    <div class="col-1 tableData">JAVA</div>
                    <div class="col-2 tableData">자바기반 풀스택</div>
                    <div class="col-1 tableData">3</div>
                    <div class="col-1 tableData">2023</div>
                    <div class="col-1 tableData">1</div>
                    <div class="col-1 tableData">6</div>
                    <div class="col-2"><span class="tableData">2022-12-10</span> ~ <span class="tableData">2023-05-15</span></div>
                    <div class="col-1 tableData">2022-12-02</div>
                    <div class="col-1 tableData"></div>
                </div>


                <div class="d-flex flex-row align-items-center td" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="mainCheck" onclick="check(this);"></div>
                    <div class="col-1 tableData">Python</div>
                    <div class="col-2 tableData">파이썬</div>
                    <div class="col-1 tableData">1</div>
                    <div class="col-1 tableData">2022</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-1 tableData">3</div>
                    <div class="col-2"><span class="tableData">2022-05-10</span> ~ <span class=" tableData">2022-08-20</span></div>
                    <div class="col-1 tableData">2022-05-01</div>
                    <div class="col-1 tableData">비고비고</div>
                </div>
                <div class="d-flex flex-row align-items-center td" onclick="rowFocus(this);">
                    <div class="col-1 chkBox"><input type="checkbox" name="mainCheck" onclick="check(this);"></div>
                    <div class="col-1 tableData">C++</div>
                    <div class="col-2 tableData">C++ 코딩테스트</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-1 tableData">2023</div>
                    <div class="col-1 tableData">4</div>
                    <div class="col-1 tableData">2</div>
                    <div class="col-2"><span class="tableData">2023-10-10</span> ~ <span class=" tableData">2022-11-10</span></div>
                    <div class="col-1 tableData">2022-09-20</div>
                    <div class="col-1 tableData"></div>
                </div>
            </div>
        </div>--%>
        <div id="nthTable"></div>
        <%-- 페이징 --%>
        <div class="pagination d-flex flex-row justify-content-center text-center position-relative tr">
            <ul>
                <li class="active">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li>7</li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
                <li>></li>
                <li>>></li>
            </ul>

            <div class="position-absolute top-50 end-0 translate-middle-y">
                <p class="pageLoc">현재:1/전체:14(1~5)</p>
            </div>
        </div>
    </div>

    <form>
        <table id="inputTable" class="table border fw-bold align-middle mt-4">
            <tr>
                <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" aria-label="Default select">
                        <option selected>[S] CORS_DIV [LM0010]</option>
                        <option>[S] CORS_DIV [LM0010] 2</option>
                    </select>
                </td>
                <td class="col-2 tableColor">과정명</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_NM"></td>
                <td class="col-2 tableColor">기수코드</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_CD" readonly></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">수강년도<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="ENT_YR"></td>
                <td class="col-2 tableColor">분기구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" aria-label="Default select">
                        <option selected>[S] TERM_DIV [CO0005]</option>
                    </select>
                </td>
                <td class="col-2 tableColor">수업개월수<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="number" value="YR_CNT" id="entInput"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">교육시작일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_ST_DT"></td>
                <td class="col-2 tableColor">교육종료일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_END_DT"></td>
                <td class="col-2 tableColor">발표일자</td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="2020-10-10"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">비고</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NOTE"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
            </tr>
        </table>
    </form>
</div>


<script>
/*    window.onload = function () {
        inputValue();
    }


    // 체크박스 선택 시 css
    function check(e){
        var td = e.parentElement.parentElement;
        if(e.checked) td.classList.add("tdChk");
        else td.classList.remove("tdChk");
    }

    // row 클릭 시 focus
    function rowFocus(e){
        var tdBg = document.getElementsByClassName("tdBg");

        tdBg[0].classList.remove("tdBg");
        e.classList.add("tdBg");

        // 하단 input에 값 넣기
        inputValue();
    }

    // 하단에 input 값 넣기
    function inputValue(){
        var datas = document.querySelectorAll(".tdBg .tableData");
        var inputs = document.querySelectorAll("#inputTable .tableInput");

        for(var i=0; i<datas.length; i++){
            console.log(inputs[i].tagName);
            if(inputs[i].tagName === 'SELECT') inputs[i].firstElementChild.setAttribute("selected", "selected");
            else inputs[i].value = datas[i].innerText;
        }
    }

    // 신규 btn 클릭 이벤트
    var insertBtn = document.getElementById("insertBtn");
    insertBtn.addEventListener("click", function () {

        // 테이블에 새로운 행 추가
        var tdBg = document.getElementsByClassName("tdBg");

        var td = document.createElement("div");
        td.setAttribute("class", "d-flex flex-row align-items-center td tdBg");
        td.setAttribute("onclick", "rowFocus(this);");

        for(var i=0; i<10; i++){
            var div = document.createElement("div");
            var clazz = "";
            if(i===0) {
                clazz = "col-1 chkBox";
                var input = document.createElement("input");
                input.setAttribute("type", "checkbox");
                input.setAttribute("name", "mainCheck");
                input.setAttribute("onclick", "check(this);");

                div.setAttribute("class", clazz);
                div.append(input);
                td.append(div);
                continue;
            }
            else if(i===7) {
                clazz = "col-2";
                var span = document.createElement("span");
                span.setAttribute("class", "tableData");
                var span2 = document.createElement("span");
                span2.setAttribute("class", "tableData");

                div.setAttribute("class", clazz);
                div.append(span, ' ~ ', span2);
                td.append(div);
                continue;
            }
            else if(i===2) clazz = "col-2 tableData";
            else clazz = "col-1 tableData";

            div.setAttribute("class", clazz);
            td.append(div);
        }
        tdBg[0].after(td);
        tdBg[0].classList.remove("tdBg");


        // 아래 input 초기화
        var inputs = document.querySelectorAll("#inputTable .tableInput");

        var idx = 0;
        inputs.forEach((input) => {
            if(idx === 0 || idx === 4) inputs[idx].firstElementChild.setAttribute("selected", "selected");
            else input.value = "";
            idx++;
        });
    });

    // 삭제 btn 클릭 이벤트
    var deleteBtn = document.getElementById("deleteBtn");
    var deleteList = [];
    deleteBtn.addEventListener("click", function(){
        chkBox.forEach((chk) => {
            if(chk.checked) deleteList.push(chk.parentElement.parentElement);
        });

        if(deleteList.length === 0) alert('체크박스를 선택해야합니다.')
        else {
            if(confirm('삭제하시겠습니까?')){
                deleteList.forEach((div) => {
                    div.remove();
                })
                document.querySelector(".nthInfoContainer .td").classList.add("tdBg");
                inputValue();
            }
        }
    })

    // 저장 btn 클릭 이벤트
    var saveBtn = document.getElementById("saveBtn");
    saveBtn.addEventListener("click", function(){
        if(confirm("저장하시겠습니까?")){

        }
    })*/


    // input number 음수 막기
    var entInput = document.getElementById("entInput");
    entInput.addEventListener("click", function () {
        if(this.value < 0){
            this.value = 0;
            alert("음수값은 설정할 수 없습니다.");
        }
    });
    entInput.addEventListener("keydown", function () {
        if(this.value < 0){
            this.value = 0;
            alert("음수값은 설정할 수 없습니다.");
        }
    });

    /* ~ */
    /*class RowNumberRenderer {
        constructor(props) {
            const el = document.createElement('span');
            el.innerHTML = props.formattedValue;
            this.el = el;
        }

        getElement() {
            return this.el;
        }

        render(props) {
            this.el.innerHTML = props.formattedValue;
        }
    }*/

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

    document.addEventListener('DOMContentLoaded', function () {
        const data = [
            {
                CORS_DIV: 'JAVA',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: ''
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                발표일자: '2023-08-01',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: '',
                SEL_NM: '',
                NTH_NM: '',
                ENT_YR: '',
                TERM_DIV: '',
                수업개월수: '',
                EDU_ST_DT: '',
                EDU_END_DT: '',
                발표일자: '',
                NOTE: ''
            }
        ];
        function educationPeriodFormatter({ row }) {
            const startDate = row.EDU_ST_DT;
            const endDate = row.EDU_END_DT;
            return startDate +"~" + endDate;
        }
        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: data,
            rowHeaders: [
                /*{
                    type: 'rowNum',
                    renderer: {
                        type: RowNumberRenderer
                    }
                },*/
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
                    name: '수업개월수',
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
                    name: '발표일자',
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

            draggable: false,

        });

        const nthTheme = new tui.Grid.applyTheme('default', {
            cell: {
                normal: {
                    background: '#fff',
                    border:'#E1E1E1',
                    showVerticalBorder: true
                },
                header: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                },
                rowHeader: {
                    background: '#EFEFEF',
                    border:'#E1E1E1'
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
    });
</script>
</body>
</html>
