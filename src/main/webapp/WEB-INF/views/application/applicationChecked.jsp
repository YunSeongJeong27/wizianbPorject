<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../user/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        .pdfobject-container { height: 30rem; border: 1rem solid rgba(0,0,0,.1); }
        #img1 {
            width: 100%;
            height: auto;
            object-fit: contain;
        }

        #apply_addFile {
            padding: 8px;
        }

        .title {
            font-size: 16px;
            font-weight: 600;
        }

        #apply_table td:nth-child(1),
        #apply_table td:nth-child(2) {
            text-align: center;
        }

        #apply_table colgroup col:first-child, col:nth-child(2) {
            width: 20%;

        }

        #apply_table colgroup col:nth-child(3) {
            width: 60%;
        }

        #apply_table tbody input {
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

        #apply_complete .btn {
            padding: 10px 18px;
            background-color: lightgray;
            border-style: none;
            color: #000000;
        }

        .fbt1 {
            margin: 0 10px;
        }

        .fbt2 {
            margin-right: 13px;
        }

        /*전체모달*/
        .modals {
            font-size: 11px;
        }

        .stn {
            font-weight: bold;
        }

        .modalContent {
            max-height: 80vh; /* 최대 높이를 화면 높이의 80%로 설정 */
            overflow-y: auto; /* 세로 스크롤을 추가하고 내용이 넘치면 스크롤이 생성되도록 함 */
        }

        .thin-line {
            border-top: 1px solid rgba(186, 185, 192, 0.68);
            margin-top: 3px;
            margin-bottom: 3px;
        }

        /*모달 헤더,프터 밑에선*/
        .modalContent .modal-header {
            border-bottom: 2px solid #524e4e;
        }

        .modalContent .modal-footer {
            border-top: 2px solid #524e4e;
        }

        .documentBtns1 {
            height: 30px;
            width: 60px;
            font-size: 10px;
        }

        .documentBtns2 {
            margin-left: 3px;
            height: 30px;
            width: 65px;
            font-size: 10px;
        }

        .documentBtns3 {
            margin-left: 3px;
            height: 30px;
            width: 55px;
            font-size: 10px;
        }

        .truncate-text {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .fileCol {
            padding-left: 0;
        }

        /*추가서류제출의 테이블 조절*/
        @media all  and (max-width: 767px) {
            #apply_table {
                width: 550px;
                font-size: 10px;
            }

            .truncate-text {
                width: 85%;
                margin-bottom: 3px;
            }

            .fileCol {
                width: 85%;
            }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
    <script src="https://unpkg.com/jspdf-autotable@3.6.0/dist/jspdf.plugin.autotable.js"></script>
    <script src="https://unpkg.com/pdfobject@2.2.12/pdfobject.min.js"></script>
</head>
<body>
<div class="my-3 d-flex justify-content-center">
    <div class="container-sub-header" style="width: 1440px;">
        <div class="d-flex flex-row justify-content-between px-3">
            <div class="page-title" id="headerText">${title}</div>

            <div class="d-flex align-items-center">
                <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <div class="breadcrumb d-flex align-items-center" id="breadCrumb">
                        <div id="breadcrumbDiv1" class="breadcrumb-item" style="cursor:pointer;">
                            <i class="bi bi-house-door"></i>
                        </div>
                        <div id="breadcrumbDiv2" class="breadcrumb-item" style="cursor:pointer;">마이페이지</div>
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">지원서작성</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="my-5 container">
    <div class="row">
        <%--좌측탭--%>
        <div class="col-lg-2 p-2 d-flex flex-column justify-content-between">
            <div class="list-group" id="list-tab" role="tablist">
                <div id="firstTap-li">
                    <a class="fw-bold list-group-item list-group-item-action active"
                       id="first-tap-list" data-bs-toggle="list"
                       href="#first-tap" role="tab" aria-controls="first-tap">지원서확인</a>
                </div>
                <div id="secondTap-li">
                    <a class="fw-bold list-group-item list-group-item-action"
                       id="second-tap-list" data-bs-toggle="list" href="#second-tap"
                       role="tab" aria-controls="second-tap">서류제출</a>
                </div>
            </div>
        </div>
        <%--우측탭1--%>
        <div class="tab-pane fade active show col-lg-9"
             id="first-tap" role="tabpanel"
             aria-labelledby="first-tap-list">
            <div class="mb-3">
                <select class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                        aria-label="select_list" id="rcrtNoSelect">
                    <c:forEach items="${courseNameList}" var="list">
                        <option id="${list.rcrtNo}">${list.courseName}</option>
                    </c:forEach>
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
                    <c:forEach items="${mapList}" var="map">
                        <tbody id="${map.key}">
                            <c:forEach items="${map.value}" var="value">
                                <tr class="infoBlock" style="display:none;" data-rcrtNo="${value.rcrtNo}">
                                    <td class="text-center areaDiv">${value.areaDiv}</td>
                                    <td class="text-center statusDiv">${value.statusDiv}</td>
                                    <td class="text-center">
                                        <button type="button"
                                                class="btn btn-sm btn-light btn-outline-dark" onclick="seeMore(this)">보기
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button"
                                                class="btn btn-sm btn-light btn-outline-dark" onclick="updateStatusDiv(this)">확인
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </c:forEach>
                </table>
            </div>

            <div id="textWrap" class="d-flex justify-content-center mt-5"></div>
            <div class="d-flex justify-content-center mt-3">
                <div>
                    <button type="button" id="finalSubmissionBtn" class="btn text-white mx-1 py-2 px-3" style="background-color: #003A78" onclick="finalSubmission()">지원서최종제출</button>
                    <button type="button" id="submissionCancelBtn" class="btn text-dark mx-1 py-2 px-3" disabled style="background-color: #E1E1E1" onclick="submissionCancel()">지원취소</button>
                </div>
                <div class="mx-1 d-none" id="printBtn">
                    <button id="apply_pdf" type="button" class="btn text-white mx-1 py-2 px-3" data-bs-toggle="modal"
                            data-bs-target="#pdf_display"
                            style="background-color: #3B3B3B">입학원서출력</button>
                </div>
            </div>
        </div>
            <div id="pdf_display" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="pdfobject-container" id="example1" style="height: 800px"></div>
                        </div>
                    </div>
                </div>
            </div>




        <%--우측탭2--%>
        <div class="tab-pane fade col-lg-9 d-none" id="second-tap"
             role="tabpanel" aria-labelledby="second-tap-list">
            <div class="mb-3">
                <select class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                        aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">서류제출</h3>
            <%-- Buttons --%>
            <div id="application_btn" class="d-flex justify-content-end mb-3 gap-2">
                <button type="button" id="apply_addFile" class="btn btn-primary btn-sm" onclick="addFile()">서류추가
                </button>
                <button type="button" id="saveFile" class="btn btn-primary btn-sm" onclick="saveFile()">저장
                </button>
            </div>
            <div class="border-top border-dark border-2">
                <table id="apply_table" class="table table-hover align-middle">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="table-light text-center">
                    <tr>
                        <th>제출서류</th>
                        <th>기관명</th>
                        <th>첨부파일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form action="/checked/fileinsert" id="saveFileForm" enctype="multipart/form-data" method="post" >
                        <tr>
                            <input type="hidden" name="docDiv" value="aptitude">
                            <td>
                                <div>적성검사</div>
                            </td>
                            <td>중앙정보처리학원</td>

                            <td class="row">
                                <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text ">
                                    <a href="/checked/filedownload/${aptitude}">${aptitude}</a>
                                </div>


                                <div class="col-12 col-md-5 d-flex fileCol">
                                    <div class="col-4 d-flex justify-content-center">
                                        <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
                                        <input class="mt-2 w-100" type="file" id="file1" style="font-size: 0.6em; display: none;" name="fileUpload">
                                    </div>
                                    <div class="col-5 d-flex justify-content-center">
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns2" onclick="downloadFile()">
                                            다운로드
                                        </button>
                                    </div>
                                    <div class="col-4 d-flex justify-content-center">
                                        <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns3">
                                            삭제
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </form>

                    <tr>
                        <td>
                            <div>학위증명서</div>
                        </td>
                        <td>중앙정보처리학원</td>

                        <td class="row">

                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">
                            </div>


                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
                                    <input class="mt-2 w-100" type="file" id="file2" style="font-size: 0.6em; display: none;" name="fileNo">
                                </div>
                                <div class="col-5 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns2">
                                        다운로드
                                    </button>
                                </div>
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns3">
                                        삭제
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div>활동이력증명</div>
                        </td>
                        <td>중앙정보처리학원</td>

                        <td class="row">
                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">
                            </div>

                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
                                    <input class="mt-2 w-100" type="file" id="file3" style="font-size: 0.6em; display: none;" name="fileNo">
                                </div>
                                <div class="col-5 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns2">
                                        다운로드
                                    </button>
                                </div>
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns3">
                                        삭제
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>



                <div class="d-flex justify-content-start mt-4 application_btn1">
                    <button type="button" id="apply_prev" class="btn btn-secondary">이전</button>
                </div>
            </div>
        </div>
    </div>
</div>


<%--기본정보 Modal--%>
<div class="modal fade modals" id="basicInfo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content modalContent">
            <div class="modal-header">
                <h5 class="modal-title">기본정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="resultContent"></div>
                        <div class="col-12 col-md-3 mb-2">
                            <label for="photo" class="stn">사진</label>
                            <div id="photo" class="justify-content-center align-items-center"
                                 style="width: 160px; height: 180px; border: 1px solid #dee2e6;">
                            </div>
                        </div>
                    </div>
                    <div class="thin-line"></div>
                    <div class="row">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="programName" class="me-1 col-4 stn">모집과정명</label>
                            <div id="programName" class="p-2 col courseName"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="name" class="me-1 col-4 stn">성명</label>
                            <div id="name" class="p-2 col nameKor"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="gender" class="me-1 col-4 stn">성별</label>
                            <div id="gender" class="p-2 col gender"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="nameEnglish" class="me-1 col-4 stn">성명(영어)</label>
                            <div id="nameEnglish" class="p-2 col nameEng"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="email" class="me-1 col-4 stn">이메일</label>
                            <div id="email" class=" p-2 col email"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="dob" class="me-1 col-4 stn">생년월일</label>
                            <div id="dob" class="p-2 col birthday"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="phoneNumber" class="me-1 col-4 stn">전화번호</label>
                            <div id="phoneNumber" class="p-2 col hpLocal"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="PostalCode" class="me-1 col-4 stn">우편번호</label>
                            <div id="PostalCode" class="p-2 col zipCode"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 d-flex align-items-center">
                            <label for="address" class="me-1 col-2 stn">주소</label>
                            <div id="address" class="p-2 col-10 addrLocal text-start"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer d-flex justify-content-center">
                <div class="btn btn-primary" onclick="window.location.href='/userInfo'">수정하기</div>
            </div>
        </div>
    </div>
</div>
<%--학력사항 Modal--%>
<div class="modal fade modals" id="educationBackground" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content modalContent">
            <div class="modal-header">
                <h5 class="modal-title">학력사항</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="grade1" class="me-1 col-4 stn">학위구분</label>
                            <div id="grade1" class="p-2 col gradeDiv"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="admissionDate" class="me-1 col-4 stn">입학년월일</label>
                            <div id="admissionDate" class="p-2 col startDate"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="school" class="me-1 col-4 stn">학위기관명</label>
                            <div id="school" class="p-2 col orgName"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="graduationDate" class="me-1 col-4 stn">졸업년월일</label>
                            <div id="graduationDate" class=" p-2 col endDate"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row mb-2">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="major" class="me-1 col-4 stn">학과/전공명</label>
                            <div id="major" class="p-2 col deptName"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary" onclick="window.location.href='/userEdu'">수정하기</div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--경력사항 Modal--%>
<div class="modal fade modals" id="experienceBackground" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content modalContent">
            <div class="modal-header">
                <h5 class="modal-title">경력사항</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="Corporation" class="me-1 col-4 stn">기관명</label>
                            <div id="Corporation" class="p-2 col plcName"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="startDate" class="me-1 col-4 stn">활동시작년월</label>
                            <div id="startDate" class="p-2 col startDate"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="activityDetails" class="me-1 col-4 stn">활동내역</label>
                            <div id="activityDetails" class="p-2 col plcJob"></div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="endDate" class="me-1 col-4 stn">활동종료년월</label>
                            <div id="endDate" class=" p-2 col endDate"></div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row mb-2">
                        <div class="col-12 d-flex align-items-center">
                            <label for="note" class="me-1 col-2 stn">비고</label>
                            <div id="note" class="p-2 col-10 note"></div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary" onclick="window.location.href='/userExp'">수정하기</div>
                </div>

            </div>
        </div>
    </div>
</div>

<%--자기소개서 Modal--%>
<div class="modal fade modals" id="selfIntroduction" tabindex="-1"
     role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content modalContent">
            <div class="modal-header">
                <h5 class="modal-title">자기소개서</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-12 col-md-12 align-items-center">
                            <label for="applicationReason" class="me-1 col-6 stn itemName0"></label>
                            <div id="applicationReason" class="p-2 border rounded col answer0"
                                 style="height: 300px;">
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-12 col-md-12 align-items-center">
                            <label for="futurePlan" class="me-1 col-6 stn itemName1"></label>
                            <div id="futurePlan" class="p-2 border rounded col answer1"
                                 style="height: 300px;">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary" onclick="window.location.href='/userIntroduce'">수정하기</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        function displaySelectedInfo(selectedRcrtNo) {
            $('.infoBlock').hide();
            $('[data-rcrtNo="' + selectedRcrtNo + '"]').show();
        }

        // 페이지가 로드될 때 실행되는 기본 코드
        const initialSelectedRcrtNo = $('#rcrtNoSelect').find('option:selected').attr('id');
        displaySelectedInfo(initialSelectedRcrtNo);

        // 옵션 변경 이벤트
        $('#rcrtNoSelect').on('change', function() {
            const selectedRcrtNo = $(this).find('option:selected').attr('id');
            displaySelectedInfo(selectedRcrtNo);
            $('#textWrap').text("");
            $("#finalSubmissionBtn").prop("disabled", false);
            $("#submissionCancelBtn").prop("disabled", true);
            $("#printBtn").addClass("d-none");
        });
    });

    // 내용보기 버튼
    function seeMore(btn){
        const basicInfo = document.getElementById("basicInfo");
        const educationBackground = document.getElementById("educationBackground");
        const experienceBackground = document.getElementById("experienceBackground");
        const selfIntroduction = document.getElementById("selfIntroduction");
        var areaDiv = btn.parentElement.parentElement.firstElementChild.innerHTML;
        var rcrtNo = btn.parentElement.parentElement.dataset.rcrtno;
        var applyNo = btn.parentElement.parentElement.parentElement.getAttribute("id");
        var url;
        var data;
        var modal;
        switch (areaDiv){
            case "기본정보" :
                url="/checked/info";
                data= {aplyNo:applyNo, rcrtNo:rcrtNo};
                modal = "#basicInfo";
                ajax(url, data, modal);
                break;
            case "학력사항" :
                url="/checked/edu";
                data= {aplyNo:applyNo, rcrtNo:rcrtNo};
                modal = "#educationBackground";
                ajax(url, data, modal);
                break;
            case "경력사항" :
                url="/checked/exp";
                data= {aplyNo:applyNo, rcrtNo:rcrtNo};
                modal = "#experienceBackground";
                ajax(url, data, modal);
                break;
            case "자기소개서" :
                url="/checked/introduce";
                data= {aplyNo:applyNo, rcrtNo:rcrtNo};
                modal = "#selfIntroduction";
                ajax(url, data, modal);
                break;
        }
    }
    function ajax(url, data, modal){
        $.ajax({
            url: url,
            type: "POST", // 전송 방식
            contentType: "application/json", // 요청의 컨텐츠 타입
            data: JSON.stringify(data),
            success: function(result){
                content(result);
                $(modal).modal("show");
            },
            error: function(request,status,error) {
                // AJAX 호출에 실패한 경우 수행할 콜백 함수
                console.log("code: " + request.status + "\n" + "error: " + error);
            }
        });
    }
    function content(result){
        //기본정보
        $(".courseName").text(result.courseName);
        $(".nameKor").text(result.nameKor);
        $(".nameEng").text(result.nameEng);
        $(".gender").text(result.gender);
        $(".birthday").text(result.birthday);
        $(".email").text(result.email);
        $(".hpLocal").text(result.hpLocal);
        $(".zipCode").text(result.zipcode);
        $(".addrLocal").text(result.addrLocal);

        //학력사항
        $(".gradeDiv").text(result.gradeDiv);
        $(".orgName").text(result.orgName);
        $(".deptName").text(result.deptName);
        $(".startDate").text(result.startDate);
        $(".endDate").text(result.endDate);

        //경력사항
        $(".plcName").text(result.plcName);
        $(".plcJob").text(result.plcJob);
        $(".note").text(result.note);

        //자기소개서
        for(var i=0 ; i<result.length ; i++){
            $(".itemName"+i).text(result[i].itemName+"(최대 "+result[i].maxChar+"자)");
            $(".answer"+i).text(result[i].answer);
        }
    }

    //최종확인 버튼 클릭 시 이벤트
    function updateStatusDiv(btn){
        var areaDiv = btn.parentElement.parentElement.firstElementChild.innerHTML;
        var rcrtNo = btn.parentElement.parentElement.dataset.rcrtno;
        var applyNo = btn.parentElement.parentElement.parentElement.getAttribute("id");
        var statusElement = btn.parentElement.parentElement.children[1]; // 변경: statusElement는 DOM 요소를 참조
        var statusDiv = statusElement.innerText; // 변경: .innerText 속성은 statusElement에 적용

        if(statusDiv === "작성중"){
            statusDiv = "확인완료"
        }else{
            statusDiv = "작성중"
        }

        $.ajax({
            url: "/checked/updateStatus",
            type: "POST", // 전송 방식
            contentType: "application/json", // 요청의 컨텐츠 타입
            data: JSON.stringify({
                areaDiv : areaDiv,
                rcrtNo : rcrtNo,
                aplyNo : applyNo,
                statusDiv : statusDiv
            }),
            success: function(result){
                statusElement.innerText=result.statusDiv
            },
            error: function(request,status,error) {
                // AJAX 호출에 실패한 경우 수행할 콜백 함수
                console.log("code: " + request.status + "\n" + "error: " + error);
            }
        })
    }
    const textWrap = document.getElementById("textWrap");
    //최종제출버튼
    function finalSubmission(){
        var applyNo = $('.infoBlock:visible').closest('tbody').attr('id');
        var rcrtNo = $('.infoBlock:visible').closest('tr').attr('data-rcrtNo');
        $.ajax({
            url: "/checked/finalSubmission",
            type: "POST", // 전송 방식
            contentType: "application/json", // 요청의 컨텐츠 타입
            data: JSON.stringify({
                rcrtNo : rcrtNo,
                aplyNo : applyNo
            }),
            success: function(result){
               if(result){
                   textWrap.innerHTML = "";
                   textWrap.innerHTML = "<div>지원자님의 수험번호는 <span class='text-danger fw-bold'>"+applyNo+"</span> 입니다.</div>";
                   $("#finalSubmissionBtn").prop("disabled", true);
                   $("#submissionCancelBtn").prop("disabled", false);
                   $("#printBtn").removeClass("d-none");
               }else{
                   textWrap.innerHTML = "";
                   textWrap.innerHTML = "<div class='text-danger'>지원서확인이 완료된 경우에만 지원서제출이 가능합니다.</div>";
               }
            },
            error: function(request,status,error) {
                // AJAX 호출에 실패한 경우 수행할 콜백 함수
                console.log("code: " + request.status + "\n" + "error: " + error);
            }
        })
    }
    //지원취소버튼
    function submissionCancel(){
        textWrap.innerHTML = "<div class='text-danger'>지원을 취소하였습니다.</div>";
        $("#finalSubmissionBtn").prop("disabled", false);
        $("#submissionCancelBtn").prop("disabled", true);
        $("#printBtn").addClass("d-none");
    }

    document.querySelector('#apply_pdf').addEventListener('click', () => {
        PDFObject.embed("/pdf/2023_야구규칙.pdf", "#example1");
    });
    /*추가제출서류 파일추가*/
    function addFile() {

        var table = document.getElementById('apply_table');

        var newRow = table.insertRow();

        var newCell1 = newRow.insertCell(0);
        var newCell2 = newRow.insertCell(1);
        var newCell3 = newRow.insertCell(2);

        newCell1.innerHTML = '<div><select id="apply_select" class="form-select" aria-label="Default select example">' +
            '<option selected></option>' +
            '<option value="학위증명서">학위증명서</option>' +
            '<option value="활동이력증명">활동이력증명</option>' +
            '</select></div>';
        newCell2.innerHTML = "<div></div>";
        newCell3.className = "row";
        newCell3.innerHTML = '<div class="col-12 col-md-7 border d-flex justify-content-start truncate-text"></div>' +
            '<div class="col-12 col-md-5 d-flex fileCol">' +
            '<div class="col-4 d-flex justify-content-center">' +
            '<button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button></div>' +
            '<div class="col-5 d-flex justify-content-center">' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns2">다운로드</button></div>' +
            '<div class="col-4 d-flex justify-content-center">' +
            '<button type="button" class="btn btn-sm btn-light btn-outline-dark documentBtns3">삭제</button></div></div>';
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

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    const breadcrumbDiv2 = document.getElementById("breadcrumbDiv2");
    const breadcrumbDiv3 = document.getElementById("breadcrumbDiv3");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
    breadcrumbDiv2.addEventListener("click",function(){
        window.location.href = "/checked";
    })
    breadcrumbDiv3.addEventListener("click",function(){
        window.location.href = "/checked";
    })

    //상단에 홈>마이페이지> (텍스트값 주는 코드)
    document.addEventListener('DOMContentLoaded', function () {
        const tabLinks = document.querySelectorAll('.list-group-item-action'); // 탭 링크들을 선택

        tabLinks.forEach(tabLink => {
            tabLink.addEventListener('click', function () {
                const tabText = this.innerText; // 클릭한 탭의 텍스트를 가져옴
                const breadcrumbDiv3 = document.getElementById('breadcrumbDiv3');
                breadcrumbDiv3.textContent = tabText; // breadcrumb3의 텍스트를 변경
            });
        });
    });


    // 버튼을 찾아서 변수에 저장
    var button = document.querySelector(".documentBtns1");

    // 버튼에 클릭 이벤트 리스너 추가
    button.addEventListener("click", function() {
        // 파일 입력 필드를 찾아서 'click' 이벤트 발생시킴
        document.getElementById("file1").click();
    });



    var button = document.getElementById("saveFile");
    // 파일 저장
    button.addEventListener("click", function() {
        // 폼을 찾아서 'submit' 메소드 호출
        document.getElementById("saveFileForm").submit();
    });

    //파일다운로드
    function downloadFile() {
        var aptitude = '${aptitude}';  // aptitude 값을 적절히 설정하세요.
        window.location.href = '/checked/filedownload/' + aptitude;
    }

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
