<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../user/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        #img1{
            width: 100%;
            height: auto;
            object-fit: contain;

        }
        .breadcrumbs,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-title {
            font-size: 30px;
            font-weight: 600;
        }

        .breadcrumbs li {
            display: inline-block;
            font-size: 12px;
        }

        .menu ul li a {
            display: inline-block;
            color: #646464;
            padding: 10px;
            font-weight: 600;
        }

        #apply_current {
            font-weight: bolder;
        }
        #apply_addFile{
            padding: 8px;
        }

        .title {
            font-size: 16px;
            font-weight: 600;
        }


        .table tbody tr td:nth-child(n+2) {
            text-align: right;
        }

        #apply_table colgroup col:first-child, col:nth-child(2){
            width: 20%;
        }
        #apply_table colgroup col:nth-child(3){
            width: 60%;
        }
        #apply_table tbody input{
            background: #f9f9f9;
            border-style: none;
            height: 30px;
            display: inline-block;
        }
        .application_div {
            border: none;
        }

        .application_div:focus {
            outline: none;
            box-shadow: none;
        }
        #application_member .member_id {
            color: #f00;
        }
        #application_member {
            font-weight: 600;
        }
        #apply_prev {
            margin: 0 2px;
            padding: 10px 15px;
        }
        #application_btn .btn {
            margin: 0 2px;
            padding: 10px 15px;
        }
        #apply_complete .btn{
            padding: 10px 18px;
            background-color: lightgray;
            border-style: none;
            color: #000000;
        }
        .fbt1{
            margin: 0 10px;
        }
        .fbt2 {
            margin-right: 10px;
        }

        .table{
            white-space: nowrap;
        }
    </style>
    <script src="../../jquery-3.6.4.js"></script>

</head>
<body>
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">지원서확인</p>

            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">마이페이지</li>
                    <%--탭에맞게 바뀌게--%>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">지원서확인</li>
                </ul>
            </div>
        </div>
        <div>
            <div></div>
        </div>
    </div>
</div>

<img id="img1"  src="https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg" alt="keyboard-5017973-1920" >

<div class="my-5 container">
    <div class="row">
        <%--좌측탭--%>
        <div class="col-lg-2 p-2 d-flex flex-column justify-content-between">
            <div class="list-group" id="list-tab" role="tablist">
                <div id="attribute-li" >
                    <a class="fw-bold list-group-item list-group-item-action active"
                       id="first-tap-list" data-bs-toggle="list"
                       href="#first-tap" role="tab" aria-controls="first-tap">지원서확인</a>
                </div>
                <div id="profile-li">
                    <a class="fw-bold list-group-item list-group-item-action"
                       id="second-tap-list" data-bs-toggle="list" href="#second-tap"
                       role="tab" aria-controls="second-tap">추가제출서류</a>
                </div>
            </div>
        </div>
        <%--우측탭1--%>
        <div class="tab-pane fade active show col-lg-9"
             id="first-tap" role="tabpanel"
             aria-labelledby="first-tap-list">
            <div class="mb-3">
                <select  class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                         aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">지원서확인</h3>
            <div class="border-top border-dark border-2">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr class="table-light text-center">
                        <th>지원서항목</th>
                        <th>상태</th>
                        <th>내용보기</th>
                        <th>최종확인</th>
                    </tr>
                    </thead>
                    <%-- 반복 start --%>
                    <tbody>
                    <tr>
                        <td>기본정보</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>학력사항</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>경력사항</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>자기소개서</td>
                        <td>확인완료</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">보기</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    </tbody>
                    <%-- 반복 end --%>
                </table>

                <div id="application_member" class="d-flex justify-content-center">
                    <p>지원자 님의 수험번호는 <span class="member_id">W123456</span> 입니다.</p>
                </div>

                <%-- Buttons --%>
                <div id="application_btn0" class="d-flex justify-content-center mt-4 application_btn">
                    <button type="button" class="btn btn-primary" disabled>지원서최종제출</button>
                    <button type="button" class="btn btn-secondary fbt1" disabled>지원취소</button>
                    <button type="button" class="btn btn-dark fbt2">입학원서출력</button>
                    <button type="button" class="btn btn-dark">수험표출력</button>
                </div>
                <div id="apply_complete" class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-secondary">제출서류확인</button>
                </div>
            </div>
        </div>



        <%--우측탭2--%>
        <div class="tab-pane fade col-lg-9 d-none" id="second-tap"
             role="tabpanel" aria-labelledby="second-tap-list">
            <div class="mb-3">
                <select  class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                         aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">추가제출서류</h3>
            <%-- Buttons --%>
            <div id="application_btn" class="d-flex justify-content-end mb-3">
                <button type="button" id="apply_addFile" class="btn btn-primary btn-sm" onclick="addFile()">서류추가</button>
            </div>
            <div class="border-top border-dark border-2">
                <form>
                    <div>
                        <table id="apply_table" class="table table-hover align-middle">
                            <thead class="table-light text-center">
                            <tr>
                                <th scope="col-3">제출서류</th>
                                <th scope="col-3">기관명</th>
                                <th scope="col-6">첨부파일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <div>
                                    <td><input type="text" class="form-control" value="지원서(가림A형)"></td>
                                    <td><input type="text" class="form-control" value=""></td>
                                    <td>
                                        <div class="d-flex justify-content-center">
                                            <input type="text" class="form-control me-1">
                                            <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                            <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                        </div>
                                    </td>
                                </div>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="지원서(필기용)"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="지원서(가림B형)"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="학위증명서"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="활동이력증명"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="필기고사답안지"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="지원서(보관용)"></td>
                                <td><input type="text" class="form-control" value=""></td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <input type="text" class="form-control me-1">
                                        <button type="button" class="btn btn-sm btn-dark me-1">업로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div  class="d-flex justify-content-start mt-4 application_btn1">
                    <button type="button" id="apply_prev" class="btn btn-secondary">이전</button>
                </div>
            </div>
        </div>

    </div>
</div>



<script>
    /*추가제출서류 파일추가*/
    function addFile(){

        var table = document.getElementById('apply_table');

        var newRow = table.insertRow();
        var newCell1 = newRow.insertCell(0);
        var newCell2 = newRow.insertCell(1);
        var newCell3 = newRow.insertCell(2);

        newCell1.innerHTML='<div><select id="apply_select" class="form-select" aria-label="Default select example">' +
            '<option selected></option>'+
            '<option value="학위증명서">학위증명서</option>' +
            '<option value="활동이력증명">활동이력증명</option>'+
            '</select></div>';
        newCell2.innerHTML='<input type="text" class="form-control" value="">';
        newCell3.innerHTML='<div class="d-flex justify-content-center">' +
            '<input type="text" class="form-control me-1">' +
            '<button type="button" class="btn btn-sm btn-dark me-1">업로드</button>' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark me-1">다운로드</button>' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button></div>';
    }

    //탭 기능 d-none
    document.addEventListener('DOMContentLoaded', function () {
        // Tab links
        const attributeTabLink = document.getElementById('first-tap-list');
        const profileTabLink = document.getElementById('second-tap-list');

        // Tab panes
        const attributeTab = document.getElementById('first-tap');
        const profileTab = document.getElementById('second-tap');

        // 링크 클릭 이벤트
        attributeTabLink.addEventListener('click', function () {
            profileTab.classList.add('d-none');
            attributeTab.classList.remove('d-none');
        });

        profileTabLink.addEventListener('click', function () {
            attributeTab.classList.add('d-none');
            profileTab.classList.remove('d-none');
        });
    });

    //상단에 홈>마이페이지> (텍스트값 주는 코드)
    document.addEventListener('DOMContentLoaded', function () {
        const tabLinks = document.querySelectorAll('.list-group-item-action'); // 탭 링크들을 선택

        tabLinks.forEach(tabLink => {
            tabLink.addEventListener('click', function () {
                const tabText = this.innerText; // 클릭한 탭의 텍스트를 가져옴
                const applyCurrent = document.getElementById('apply_current'); // apply_current 요소를 가져옴
                applyCurrent.textContent = tabText; // apply_current의 텍스트를 변경
            });
        });
    });

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>