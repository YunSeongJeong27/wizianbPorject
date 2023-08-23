<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../user/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
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
                       role="tab" aria-controls="second-tap">추가제출서류</a>
                </div>
            </div>
        </div>
        <%--우측탭1--%>
        <div class="tab-pane fade active show col-lg-9"
             id="first-tap" role="tabpanel"
             aria-labelledby="first-tap-list">
            <div class="mb-3">
                <select class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                        aria-label="select_list">
                    <option selected>${courseName}</option>
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
                    <tbody>
                    <tr>
                        <td class="text-center">기본정보</td>
                        <td class="text-center">확인완료</td>
                        <td class="text-center">
                            <button type="button"
                                    class="btn btn-sm btn-light btn-outline-dark" data-bs-toggle="modal"
                                    data-bs-target="#basicInfo">보기
                            </button>
                        </td>
                        <td class="text-center">
                            <button type="button"
                                    class="btn btn-sm btn-light btn-outline-dark">확인
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">학력사항</td>
                        <td class="text-center">확인완료</td>
                        <td class="text-center">
                            <button type="button"
                                    class="btn btn-sm btn-light btn-outline-dark" data-bs-toggle="modal"
                                    data-bs-target="#educationBackground">보기
                            </button>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">경력사항</td>
                        <td class="text-center">확인완료</td>
                        <td class="text-center">
                            <button type="button"
                                    class="btn btn-sm btn-light btn-outline-dark" data-bs-toggle="modal"
                                    data-bs-target="#experienceBackground">보기
                            </button>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">자기소개서</td>
                        <td class="text-center">확인완료</td>
                        <td class="text-center">
                            <button type="button"
                                    class="btn btn-sm btn-light btn-outline-dark" data-bs-toggle="modal"
                                    data-bs-target="#selfIntroduction">보기
                            </button>
                        </td>
                        <td class="text-center">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">확인</button>
                        </td>
                    </tr>
                    </tbody>
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
                <select class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                        aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">추가제출서류</h3>
            <%-- Buttons --%>
            <div id="application_btn" class="d-flex justify-content-end mb-3">
                <button type="button" id="apply_addFile" class="btn btn-primary btn-sm" onclick="addFile()">서류추가
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

                    <tr>
                        <td>
                            <div>지원서(필기용)</div>
                        </td>
                        <td>삼성sds</td>
                        <td class="row">
                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어 파일파일파일
                            </div>
                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                            <div>지원서</div>
                        </td>
                        <td>삼성sds</td>

                        <td class="row">
                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어
                            </div>
                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                            <div>학위증명서</div>
                        </td>
                        <td>삼성sds</td>

                        <td class="row">

                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어
                            </div>


                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                        <td>삼성sds</td>

                        <td class="row">
                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어
                            </div>

                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                            <div>필기고사답안지</div>
                        </td>
                        <td>삼성sds</td>

                        <td class="row">

                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어
                            </div>


                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                            <div>지원서(보관용)</div>
                        </td>
                        <td>
                            <div>삼성sds</div>
                        </td>

                        <td class="row">

                            <div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어
                                넣어파일이름 여기넣어
                            </div>


                            <div class="col-12 col-md-5 d-flex fileCol">
                                <div class="col-4 d-flex justify-content-center">
                                    <button type="button" class="btn btn-sm btn-dark documentBtns1">업로드</button>
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
                        <div class="col-12 col-md-3 mb-2">
                            <label for="photo" class="stn">사진</label>
                            <div id="photo" class="justify-content-center align-items-center"
                                 style="width: 160px; height: 180px; border: 1px solid #dee2e6;">
                                사진넣는공간
                            </div>
                        </div>
                    </div>
                    <div class="thin-line"></div>
                    <div class="row">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="programName" class="me-1 col-4 stn">모집과정명</label>
                            <div id="programName" class="p-2 col">모집과정명</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="detailCourse" class="me-1 col-4 stn">상세과정</label>
                            <div id="detailCourse" class="p-2 col">상세과정</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>


                    <div class="row">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="name" class="me-1 col-4 stn">성명</label>
                            <div id="name" class="p-2 col">성명</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="gender" class="me-1 col-4 stn">성별</label>
                            <div id="gender" class="p-2 col">성별</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="nameEnglish" class="me-1 col-4 stn">성명(영어)</label>
                            <div id="nameEnglish" class="p-2 col">성명(영어)</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="email" class="me-1 col-4 stn">이메일</label>
                            <div id="email" class=" p-2 col">이메일</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="dob" class="me-1 col-4 stn">생년월일</label>
                            <div id="dob" class="p-2 col">생년월일</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="phoneNumber" class="me-1 col-4 stn">전화번호</label>
                            <div id="phoneNumber" class="p-2 col">전화번호</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-12 d-flex align-items-center">
                            <label for="address" class="me-1 col-1 stn">주소</label>
                            <div id="address" class="p-2 col">dddddddd주소dddddddd주소dddddd주소dddddddd주소</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-12 d-flex align-items-center">
                            <label for="PostalCode" class="me-1 col-1 stn">우편번호</label>
                            <div id="PostalCode" class="p-2 col">우편번호써</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer d-flex justify-content-center">
                <div class="btn btn-primary">수정하기</div>
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
                            <div id="grade1" class="p-2 col">석사</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="admissionDate" class="me-1 col-4 stn">입학년월일</label>
                            <div id="admissionDate" class="p-2 col">2017-02-21</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="school" class="me-1 col-4 stn">학위기관명</label>
                            <div id="school" class="p-2 col">하버드대학교</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="graduationDate" class="me-1 col-4 stn">졸업년월일</label>
                            <div id="graduationDate" class=" p-2 col">2023-08-09</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row mb-2">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="major" class="me-1 col-4 stn">학과/전공명</label>
                            <div id="major" class="p-2 col">화학공학과</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="certificationFile" class="me-1 col-6 stn">학위증명파일</label>
                            <div id="certificationFile" class="btn btn-sm btn-light btn-outline-dark p-2 ">다운로드</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary">수정하기</div>
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
                            <div id="Corporation" class="p-2 col">삼성-엔지니어</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="startDate" class="me-1 col-4 stn">활동시작년월</label>
                            <div id="startDate" class="p-2 col">2017-02-21</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row ">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="activityDetails" class="me-1 col-4 stn">활동내역</label>
                            <div id="activityDetails" class="p-2 col">엔지니어활동</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="endDate" class="me-1 col-4 stn">활동종료년월</label>
                            <div id="endDate" class=" p-2 col">2023-08-09</div>
                        </div>
                    </div>
                    <div class="thin-line"></div>

                    <div class="row mb-2">
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="note" class="me-1 col-4 stn">비고</label>
                            <div id="note" class="p-2 col">아아아아아아악!!!!</div>
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center">
                            <label for="activeCertificationFile" class="me-1 col-6 stn">활동증명파일</label>
                            <div id="activeCertificationFile" class="btn btn-sm btn-light btn-outline-dark p-2 ">다운로드
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary">수정하기</div>
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
                            <label for="applicationReason" class="me-1 col-6 stn">지원동기(공백포함-700자)</label>
                            <div id="applicationReason" class="p-2 border rounded col"
                                 style="height: 300px;">dddd
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-12 col-md-12 align-items-center">
                            <label for="futurePlan" class="me-1 col-6 stn">앞으로의 계획</label>
                            <div id="futurePlan" class="p-2 border rounded col"
                                 style="height: 300px;">네카라쿠베
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <div class="btn btn-primary">수정하기</div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
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
        newCell3.innerHTML = '<div class="col-12 col-md-7 border d-flex justify-content-start truncate-text">파일이름 여기넣어넣어파일이름 여기넣어</div>' +
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

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
