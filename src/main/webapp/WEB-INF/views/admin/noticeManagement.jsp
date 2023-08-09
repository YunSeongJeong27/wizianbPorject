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


        /* 과정 정보 테이블 */
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

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk{
            background-color: #D1D1D1 !important;
        }
        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg,
        .nthInfoContainer .d-flex.tdBgSub{
            background-color: #F2F7FF !important;
            border: 1px solid #245396 !important;
            font-weight: 600;
            color: #245396;
        }


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
                <div class="nthInfoResponsive">
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
                </div>

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

            <div class="d-flex flex-row justify-content-between mt-4 h-100">
                <div class="col-5 text-center me-3">
                    <div class="searchResult">
                        <div class="d-flex flex-row justify-content-between">
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
                                <button id="insertBtn" class="btn btn-sm btn-light btn-outline-dark">신규</button>
                                <button id="saveBtn" class="btn btn-sm btn-light btn-outline-dark">저장</button>
                                <button id="deleteBtn" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                            </div>
                        </div>
                    </div>

                    <div class="nthInfoResponsive border border-gray-100 rounded-2 mt-2" style="height:calc(100% - 55px);">
                        <div class="nthInfoContainer w-100" style="min-width: initial;">
                            <div class="d-flex flex-row align-items-center th">
                                <div class="col-1 chkBox"><input type="checkbox" id="chkAllSub"></div>
                                <div class="col-11">안내문종류<span class="text-danger">*</span></div>
                            </div>
                            <div class="d-flex flex-row align-items-center td tdBgSub" onclick="rowFocusSub(this);">
                                <div class="col-1 chkBox"><input type="checkbox" name="subCheck" onclick="check(this);"></div>
                                <div class="col-11 tableData text-start ps-3">모집전형안내문</div>
                            </div>
                            <div class="d-flex flex-row align-items-center td" onclick="rowFocusSub(this);">
                                <div class="col-1 chkBox"><input type="checkbox" name="subCheck" onclick="check(this);"></div>
                                <div class="col-11 tableData text-start ps-3">모집전형안내문2</div>
                            </div>
                        </div>
                    </div>
                    <%-- 페이징 --%>
                    <div class="pagination d-flex flex-row justify-content-center text-center position-relative tr" style="height:55px">
                        <ul>
                            <li class="active">1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                            <li>></li>
                            <li>>></li>
                        </ul>
                    </div>
                </div>

                <div class="w-100">
                    <div class="searchResult d-flex d-row align-items-center" style="height: 32.38px">
                        <p class="subTitle fw-bold">안내문내용</p>
                    </div>

                    <div class="text-start border border-gray-100 rounded-2 mb-3 mt-2">
                        <div class="d-flex flex-row align-items-center ps-2 border-bottom border-gray-200">
                            <div class="col-2 fw-bold">메일제목</div>
                            <div class="col-10"><input class="form-control" type="text" value="안내문 제목"></div>
                        </div>
                        <div class="d-flex flex-row align-items-center ps-2">
                            <div class="col-2 fw-bold">첨부파일</div>
                            <div class="col-10"><input class="form-control" type="file" value="안내문 제목"></div>
                        </div>
                    </div>

                    <div class="border border-gray-100 rounded-2 bg-white h-50 p-3">
                        <p>안내문 작성아어아ㅓ아ㅓㅇㅇ</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        window.onload = function () {
            inputValue();
        }

        // 체크박스 전체 선택
        var chkAll = document.getElementById("chkAll");
        var chkBox = document.getElementsByName("mainCheck");
        chkAll.addEventListener("click", function(){
            chkBox.forEach((chk) => {
                chk.checked = chkAll.checked;
                check(chk);
            });
        })

        // 서브 테이블 체크박스 전체 선택
        var chkAllSub = document.getElementById("chkAllSub");
        var chkBoxSub = document.getElementsByName("subCheck");
        chkAllSub.addEventListener("click", function(){
            chkBoxSub.forEach((chk) => {
                chk.checked = chkAllSub.checked;
                check(chk);
            });
        })

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

        function rowFocusSub(e){
            var tdBgSub = document.getElementsByClassName("tdBgSub");

            tdBgSub[0].classList.remove("tdBgSub");
            e.classList.add("tdBgSub");
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
        })


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
    </script>
</body>
</html>
