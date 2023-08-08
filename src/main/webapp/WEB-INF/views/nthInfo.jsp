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
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>
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
        .container-table .d-flex{
            background-color: #fff;
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
        .searchResult *{
            display: inline-block;
            margin-bottom: 2px;
        }
        .searchResult .subTitle{
            font-size: 15px;
            font-weight: 600;
        }
        .searchResult .subResult{
            color: #9a9a9a;
            font-size: 14px;
        }
        .searchResult select.form-select{
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }


        /* 과정 정보 테이블 */
        .nthInfoResponsive{
            overflow-x: auto;
        }
        .nthInfoContainer{
            min-width: 1220px;
            cursor: pointer;
        }
        .nthInfoContainer .d-flex{
            border-bottom:1px solid #E1E1E1;
        }
        .nthInfoContainer .d-flex * {
            height: 100%;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }
        .nthInfoContainer .d-flex .chkBox{
            height: 44px;
        }
        .nthInfoContainer .d-flex .chkBox{
            border:none;
        }

        .nthInfoContainer .th{
            background-color: #EFEFEF;
            font-weight: 600;
        }
        .nthInfoContainer .d-flex.td:nth-child(odd){
            background-color: rgba(0,0,0,0);
        }
        .nthInfoContainer .d-flex.td :nth-child(n):hover{
            background-color: #D1D1D1;
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

        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableInput{
            background-color: #F4F4F4;
        }

    </style>
</head>
<body>
    <div class="container-table m-2">
        <div class="row">
            <div class="col-12">
                <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center">
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
        </div>

        <div class="searchResult mt-4">
            <p class="subTitle fw-bold">모집기수정보</p>
            <p class="subResult text-secondary">검색결과:00건</p>
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

        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div class="nthInfoResponsive">
                <div class="nthInfoContainer">
                    <div>
                        <div class="d-flex flex-row align-items-center th">
                            <div class="col-1 chkBox"><input type="checkbox" id="chkAll"></div>
                            <div class="col-2">과정명</div>
                            <div class="col-1">과정구분</div>
                            <div class="col-1">기수</div>
                            <div class="col-1">수강년도</div>
                            <div class="col-1">분기</div>
                            <div class="col-2">모집기간</div>
                            <div class="col-1">발표일자</div>
                            <div class="col-1">현재전형일정</div>
                            <div class="col-1">전형평가단계</div>
                        </div>
                        <div class="d-flex flex-row align-items-center td">
                            <div class="col-1 chkBox"><input type="checkbox" name="checkBox"></div>
                            <div class="col-2">자바기반 어쩌구</div>
                            <div class="col-1">JAVA</div>
                            <div class="col-1">3</div>
                            <div class="col-1">2023</div>
                            <div class="col-1">1</div>
                            <div class="col-2">2022-12-10 ~ 2022-12-15</div>
                            <div class="col-1">2022-12-20</div>
                            <div class="col-1">2022-12-20??</div>
                            <div class="col-1">서류접수</div>
                        </div>


                        <div class="d-flex flex-row align-items-center td">
                            <div class="col-1 chkBox"><input type="checkbox" name="checkBox"></div>
                            <div class="col-2">자바기반 어쩌구</div>
                            <div class="col-1">JAVA</div>
                            <div class="col-1">3</div>
                            <div class="col-1">2023</div>
                            <div class="col-1">1</div>
                            <div class="col-2">2022-12-10 ~ 2022-12-15</div>
                            <div class="col-1">2022-12-20</div>
                            <div class="col-1">2022-12-20??</div>
                            <div class="col-1">서류접수</div>
                        </div>
                        <div class="d-flex flex-row align-items-center td">
                            <div class="col-1 chkBox"><input type="checkbox" name="checkBox"></div>
                            <div class="col-2">자바기반 어쩌구</div>
                            <div class="col-1">JAVA</div>
                            <div class="col-1">3</div>
                            <div class="col-1">2023</div>
                            <div class="col-1">1</div>
                            <div class="col-2">2022-12-10 ~ 2022-12-15</div>
                            <div class="col-1">2022-12-20</div>
                            <div class="col-1">2022-12-20??</div>
                            <div class="col-1">서류접수</div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- 페이징 --%>
            <div class="pagination d-flex flex-row justify-content-center text-center position-relative">
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

        <table class="table border fw-bold align-middle mt-4">
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
                <td class="col-2 tableColor">기수코드</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_CD" readonly></td>
                <td class="col-2 tableColor">교육시작일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_ST_DT"></td>
                <td class="col-2 tableColor">교육종료일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_END_DT"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">과정명</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_NM"></td>
                <td class="col-2 tableColor">수업개월수<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="number" value="YR_CNT" id="entInput"></td>
                <td class="col-2 tableColor">비고</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NOTE"></td>
            </tr>
        </table>
    </div>







    <script>

        // 체크박스 전체 선택
        var chkAll = document.getElementById("chkAll");
        var chk = document.getElementsByName("checkBox");
        chkAll.addEventListener("click", function(){
            if(chkAll.checked) {
                for(var i=0; i<chk.length; i++) chk[i].checked = true;
            }
            else{
                for(var i=0; i<chk.length; i++) chk[i].checked = false;
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
