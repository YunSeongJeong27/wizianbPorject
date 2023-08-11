<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-09
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <style>
        body {
            font-size: 15px !important;
            font-weight: bolder !important;
        }

        body {
            overflow: hidden;
        }

        ul > li > ul {
            cursor: pointer;
            padding: 5px;
        }
    </style>
    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;

        }

        .div_wrap_title {
            display: flex;
        }

        .align_right {
            text-align: right !important;
        }
    </style>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            background-color: #F2F3F5;
        }

        .container-table .form-select:focus,
        .container-table .form-control:focus {
            box-shadow: none;
            border-color: #9a9a9a;
        }

        /* 과정 검색 */
        .tableSearch {
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }

        .searchResult .subResult {
            font-size: 14px;
            margin-bottom: 0;
        }

        .searchResult select.form-select {
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }


        /* 과정 정보 테이블 */
        .nthInfoResponsive {
            overflow-x: auto;
        }

        .nthInfoContainer {
            min-width: 1220px;
            cursor: pointer;
        }

        .nthInfoContainer .d-flex {
            border-bottom: 1px solid #E1E1E1;
        }

        .nthInfoContainer .d-flex div:nth-child(n+2) {
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }

        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox'] {
            height: 44px;
            border: none;
        }

        .nthInfoContainer .th {
            background-color: #EFEFEF;
            font-weight: 600;
        }

        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even) {
            background-color: #fff;
        }

        .nthInfoContainer .d-flex.td:nth-child(odd) {
            background-color: rgba(0, 0, 0, 0);
        }

        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover {
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk {
            background-color: #D1D1D1 !important;
        }

        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg {
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

        .pagination ul li {
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }

        .pagination ul li.active {
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }

        .pagination ul li:not(.active):hover {
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

        .table .tableColor {
            background-color: #FAFAFA;
        }

        .table .tableInput {
            background-color: #F4F4F4;
        }

    </style>
</head>
<body>
<div class="container-table m-2">
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        </div>
        <div class="py-3 px-5 border border-gray-100 rounded-2 tr">
            <div class="row mb-2">
                <div class="col-4 d-flex align-items-center">
                    <div class="align-middle me-5">
                        <label for="sugang">수강년도/분기</label>
                    </div>
                    <div class="ms-5 col">
                        <input type="text" id="sugang" class="form-control">
                    </div>
                    <div class="ms-2 col">
                        <select class="form-select">
                            <option selected>1분기</option>
                            <option>2분기</option>
                            <option>3분기</option>
                            <option>4분기</option>
                        </select>
                    </div>
                </div>
                <div class="col-4 d-flex align-items-center">
                    <div class="tableSearch me-5">
                        <label for="courseSelect">과정구분</label>
                    </div>
                    <div class="ms-5 col">
                        <select id="courseSelect" class="form-select">
                            <option selected>(전체)</option>
                            <option>JAVA</option>
                            <option>Python</option>
                            <option>C++</option>
                        </select>
                    </div>
                </div>
                <div class="col-4 d-flex align-items-center">
                    <div class="tableSearch me-5">
                        <label for="registrationCourseName">모집과정명</label>
                    </div>
                    <div class="ms-5 col">
                        <input id="registrationCourseName" type="text" class="form-control">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="d-flex col-4 align-items-center">
                    <div class="tableSearch me-5 col-2">
                        <label for="studentName">성명</label>
                    </div>
                    <div class="ms-5 col">
                        <input id="studentName" type="text" class="form-control">
                    </div>
                </div>
                <div class="d-flex col-4 align-items-center">
                    <div class="tableSearch me-5">
                        <label for="registrationStatus">상태구분</label>
                    </div>
                    <div class="ms-5 col">
                        <select id="registrationStatus" class="form-select">
                            <option selected>(전체)</option>
                            <option>작성중</option>
                            <option>작성완료</option>
                        </select>
                    </div>
                </div>
                <div class="col-4">
                </div>
            </div>
        </div>

        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-3 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집기수정보</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
            </div>
        </div>

        <div id="grid2"></div>
    </div>


    <div class="row">
        <div class="col">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <div>
                        <span class="fw-bold me-2">지원자목록</span>
                    </div>
                    <div>
                        <span class="text-secondary me-2">검색결과 : 0건</span>
                    </div>
                    <div>
                        <select class="form-select-sm" onchange="fn_grid2_pageRowCount()">
                            <option value="5">5</option>
                            <option value="30" selected="">30</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                            <option value="500">500</option>
                        </select>
                    </div>
                </div>
                <div>
                    <button id="btn_grid2_excel_export" class="btn btn-outline-secondary btn-sm me-2"
                            onclick="fn_excel_grid2_onclick()">
                        엑셀내보내기(전체)
                    </button>
                </div>
            </div>
            <div>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex">
                        <div class="me-4">
                            <label for="slt_arg2_aply_sts_div" class="form-label">상태구분</label>
                        </div>
                        <div>
                            <select id="slt_arg2_aply_sts_div" class="form-select-sm me-3">
                                <option value="10">작성중</option>
                                <option value="30">제출완료</option>
                            </select>
                        </div>
                        <div>
                            <button id="btn_arg2_change_all" class="btn btn-outline-secondary btn-sm"
                                    onclick="fn_grid2_change_all_onclick()">
                                일괄변경
                            </button>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <div>
                            <button id="btn_aply_cfm" class="btn btn-outline-secondary btn-sm me-2"
                                    onclick="fn_aply_cfm_onclick()" disabled>접수취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="grid"></div>
        </div>
        <!-- 탭 아이디 'mainTab' -->
        <div id="mainTab" class="col"
             style="">
            <ul role="tablist" class="nav nav-tabs">
                <li role="tab" tabindex="0"
                    class="nav-item"
                    aria-controls="tab1" aria-labelledby="btn_tab1" aria-selected="true" aria-expanded="true"><a
                        id="btn_tab1" href="#tab1" role="presentation" tabindex="-1" class="nav-link active">기본정보</a>
                </li>
                <li role="tab" tabindex="-1" class="nav-item"
                    aria-controls="tab2" aria-labelledby="btn_tab2" aria-selected="false" aria-expanded="false"><a
                        id="btn_tab2" href="#tab2" role="presentation" tabindex="-1" class="nav-link"
                        style="pointer-events: none;">학력사항</a></li>
                <li role="tab" tabindex="-1" class="nav-item"
                    aria-controls="tab3" aria-labelledby="btn_tab3" aria-selected="false" aria-expanded="false"><a
                        id="btn_tab3" href="#tab3" role="presentation" tabindex="-1" class="nav-link"
                        style="pointer-events: none;">활동이력</a></li>
                <li role="tab" tabindex="-1" class="nav-item"
                    aria-controls="tab4" aria-labelledby="btn_tab4" aria-selected="false" aria-expanded="false"><a
                        id="btn_tab4" href="#tab4" role="presentation" tabindex="-1" class="nav-link"
                        style="pointer-events: none;">자기소개서</a></li>
                <li role="tab" tabindex="-1" class="nav-item"
                    aria-controls="tab5" aria-labelledby="btn_tab5" aria-selected="false" aria-expanded="false"><a
                        id="btn_tab5" href="#tab5" role="presentation" tabindex="-1" class="nav-link"
                        style="pointer-events: none;">제출서류</a></li>
            </ul>
            <div id="tab1" aria-labelledby="btn_tab1" role="tabpanel"
                 class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="false">
                <div class="wrap_contents" style="height: 1185px;">
                    <div class="contents">
                        <div class="container">
                            <div class="d-flex justify-content-between">
                                <h3>기본정보</h3>
                                <div>
                                    <button id="btn_tab1_modify" class="btn-default" title="Modify"
                                            onclick="fn_btn_tab1_modify_onclick()" disabled="">수정
                                    </button>
                                    <button id="btn_tab1_save" class="btn-default" title="Save"
                                            onclick="fn_btn_tab1_save_onclick()" disabled="">저장
                                    </button>
                                </div>
                            </div>
                            <div class="form-basic">
                                <div>
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td>모집과정명</td>
                                            <td>
                                                <select id="slt_cors_div" class="slt_cors_div auto_combo width_100"
                                                        disabled="">
                                                    <option value="10">정규과정</option>
                                                    <option value="21">야간과정</option>
                                                    <option value="30">번역아틀리에</option>
                                                    <option value="40">문화콘텐츠 번역실무 고급과정</option>
                                                </select>
                                            </td>
                                            <td>성별</td>
                                            <td>
                                                <select id="slt_gen_div"
                                                        class="slt_gen_div auto_combo width_100"
                                                        style="">
                                                    <option value=" ">(미선택)</option>
                                                    <option value="10">남자</option>
                                                    <option value="20">여자</option>
                                                    <option value="30">기타</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th  lbl_chk">이메일</td>
                                            <td>
                                                <div class="flex justify_content_center">
                                                    <input type="text" id="txt_transcript_email"
                                                           class="txt_transcript_email" disabled="disabled">
                                                    <!-- <button class="btn_email btn_slt button_sm noShrink" title="이메일인증" onclick="location.href='./EN0220P.html'">이메일인증</button> -->
                                                </div>
                                            </td>
                                            <td class="fake_th" rowspan="6">사진</td>
                                            <td rowspan="6">
                                                <div class="profile-pic dp_inlineblk" style="vertical-align: bottom;">
                                                    <img id="img_preview" class="profile-pic" src="/일본어_김현진.jpg">
                                                </div>
                                                <!-- <div class="div_top_gap_06 dp_inlineblk" style="vertical-align: bottom;">
                                                    <button class="btn_slt button_sm" title="업로드">업로드</button>
                                                    <button class="btn_slt button_sm" title="삭제">삭제</button>
                                                </div> -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class=" fake_th lbl_chk">성명(한글)</td>
                                            <td><input type="text" id="txt_inp1_nm_kor" value=""
                                                       class="txt_inp1_nm_kor txt_default " maxlength="50"
                                                       disabled="disabled"></td>

                                        </tr>
                                        <tr>
                                            <td class=" fake_th lbl_chk">성명(영어)</td>
                                            <td><input type="text" id="txt_inp1_nm_eng" value=""
                                                       class="txt_inp1_nm_eng txt_default " maxlength="50"
                                                       disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class=" fake_th">생년월일</td>
                                            <!-- <td>
                                                <span class="bg-icon_calendar div_top_gap_04">
                                                    <input type="date" id="cal_brdt" class="cal_brdt width_100 ">
                                                </span>
                                            </td> -->
                                            <td>
                                                <div class="multi_inputs">
                                                    <input type="text" id="cal_brdt"
                                                           class="cal_brdt txt_default cal_format_kr hasDatepicker"
                                                           maxlength="10" autocomplete="off" disabled="disabled"><img
                                                        class="ui-datepicker-trigger" src="/images/icon-calendar.svg"
                                                        alt="..." title="...">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th">지원자직업</td>
                                            <td>
                                                <select id="slt_job_div" class="slt_job_div auto_combo">
                                                    <option value=" ">(미선택)</option>
                                                    <option value="10">통번역가</option>
                                                    <option value="20">직장인</option>
                                                    <option value="30">학생(졸업예정)</option>
                                                    <option value="40">학생(석사이상)</option>
                                                    <option value="50">유학생</option>
                                                    <option value="90">기타</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th">지원자직업명</td>
                                            <td>
                                                <input type="text" id="txt_inp1_job_nm"
                                                       class="txt_inp1_job_nm width_100" maxlength="50"
                                                       disabled="disabled">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th">우편번호</td>
                                            <td colspan="3">
                                                <div class="flex">
                                                    <input type="text" placeholder="" id="txt_inp1_zip_cd"
                                                           class="txt_inp1_zip_cd width_50 div_right_gap_06"
                                                           disabled="disabled">
                                                    <button id="btn_zip_cd" class="btn-default" title="검색"
                                                            onclick="fn_inp1_zipcode_onclick()" disabled="disabled">검색
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th">주소(기본)</td>
                                            <td colspan="3"><input type="text" id="txt_inp1_addr_local"
                                                                   class="txt_inp1_addr_local width_100" maxlength="200"
                                                                   disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th">주소(상세)</td>
                                            <td colspan="3"><input type="text" id="txt_inp1_addr_natv"
                                                                   class="txt_inp1_addr_natv width_100" maxlength="200"
                                                                   disabled="disabled"></td>
                                        </tr>
                                        <tr>
                                            <td class="fake_th ">전화번호</td>
                                            <td><input type="text" id="txt_inp1_tel_local" maxlength="20"
                                                       oninput="fn_numSign(this)" disabled="disabled"></td>
                                            <td class="fake_th ">휴대전화</td>
                                            <td><input type="text" id="txt_inp1_tel_natv" maxlength="20"
                                                       oninput="fn_numSign(this)" disabled="disabled"></td>
                                        </tr>
                                        <tr hidden="">
                                            <td>
                                                <div id="txt_aply_no"></div>
                                            </td>
                                            <td>
                                                <div id="txt_mem_id"></div>
                                            </td>
                                            <td>
                                                <div id="txt_tab1_sel_cd"></div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab2" aria-labelledby="btn_tab2" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
                    <!-- 탭2 그리드1 -->
                    <div style="height: 1185px;">
                        <div class="div_wrap_title">
                            <div class="grid_title grid_title_arrange">
                                <div><h3 id="lbl_tab2_grid1_title">학력사항</h3></div>
                            </div>
                            <div class="align_right">
                                <button id="btn_tab2_grid1_modify" class="btn-default" onclick="fn_tab2_grid1_modify_onclick()">수정</button>
                                <button id="btn_tab2_grid1_save" class="btn-default" disabled="" onclick="fn_tab2_grid1_save_onclick()">저장</button>
                            </div>
                        </div>
                        <div id="tab2_grid1" class="div_wrap_grid" style="height: auto; position: relative;"><div class="aui-grid" style="position: relative; box-sizing: content-box; overflow: hidden; width: 298px; height: 255px; touch-action: manipulation;"><div class="aui-grid-grouping-panel" style="display: none; position: absolute;"></div><input class="aui-textinputer" style="padding: 0px 4px; overflow: hidden; z-index: -1; position: fixed; width: 1px; height: 1px; left: -20000px; top: 0px;" type="text" autocomplete="off" aria-hidden="true"><div class="aui-grid-content-panel-mask" style="position: absolute; overflow: hidden; width: 298px; height: 241px; left: 0px; top: 0px;"><div style="position: absolute; width: 578px; height: 241px; transform: translate(0px, 0px);"><div class="aui-grid-main-panel" style="position: absolute; width: 578px; height: 241px; left: 0px; top: 0px;"><div class="aui-grid-header-panel" style="position: absolute; width: 578px; height: 40px; left: 0px; top: 0px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 177px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr style="height: 40px;"><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>학위구분</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>학위기관명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 169px;"><span>학과전공명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>입학년월</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>졸업년월</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>졸업구분</span></div></td></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute; width: 578px; height: 201px; left: 0px; top: 40px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 177px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 169px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none; width: 578px; height: 0px; left: 0px; top: 241px;"></div></div><div style="cursor: col-resize; display: block; position: absolute; left: 77px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 157px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 334px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 414px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 494px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 574px; top: 0px; width: 6px; height: 40px;"></div></div></div><div class="aui-grid-left-main-panel" style="overflow: hidden; position: absolute; display: none;"><div class="aui-grid-header-panel" style="position: absolute;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 40px;"></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none;"></div></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; position: absolute; display: none; height: 40px;"></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; display: none; position: absolute;"></div><div class="aui-grid-fixed-row-rule" style="display: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-hscrollbar" style="position: absolute; display: block; width: 298px; height: 14px; left: 0px; top: 241px;"><div class="aui-scroll-track" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 14px;"></div><div class="aui-scroll-thumb" style="position: absolute; display: block; left: 14px; top: 1px; width: 51px; height: 12px;"></div><div class="aui-scroll-up" style="position: absolute; display: block; left: 0px; top: 0px; width: 14px; height: 14px;"></div><div class="aui-scroll-down" style="position: absolute; display: block; left: 284px; top: 0px; width: 14px; height: 14px;"></div></div><div class="aui-vscrollbar" style="position: absolute; display: none;"><div class="aui-scroll-track" style="position: absolute;"></div><div class="aui-scroll-thumb" style="position: absolute;"></div><div class="aui-scroll-up" style="position: absolute;"></div><div class="aui-scroll-down" style="position: absolute;"></div></div><div style="display: none; z-index: 40; position: absolute;"></div><div class="aui-grid-info-layer" style="z-index: 1; position: absolute; display: none;"></div><div style="z-index: 1; position: absolute;"></div><div class="aui-grid-vertical-resizer-rule" style="width: 1px; height: 255px; left: 0px; top: 0px; display: none; position: absolute;"></div></div></div>
                    </div>
                </div>
                <div id="tab3" aria-labelledby="btn_tab3" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
                    <!-- 탭3 그리드1 -->
                    <div style="height: 1185px;">
                        <div class="div_wrap_title">
                            <div class="grid_title grid_title_arrange">
                                <div><h3 id="lbl_tab3_grid1_title">활동이력</h3></div>
                            </div>
                            <div class="align_right">
                                <button id="btn_tab3_grid1_modify" class="btn-default" onclick="fn_tab3_grid1_modify_onclick()">수정</button>
                                <button id="btn_tab3_grid1_save" class="btn-default" disabled="" onclick="fn_tab3_grid1_save_onclick()">저장</button>
                            </div>
                        </div>
                        <div id="tab3_grid1" class="div_wrap_grid" style="height: auto; position: relative;"><div class="aui-grid" style="position: relative; box-sizing: content-box; overflow: hidden; width: 298px; height: 255px; touch-action: manipulation;"><div class="aui-grid-grouping-panel" style="display: none; position: absolute;"></div><input class="aui-textinputer" style="padding: 0px 4px; overflow: hidden; z-index: -1; position: fixed; width: 1px; height: 1px; left: -20000px; top: 0px;" type="text" autocomplete="off" aria-hidden="true"><div class="aui-grid-content-panel-mask" style="position: absolute; overflow: hidden; width: 298px; height: 241px; left: 0px; top: 0px;"><div style="position: absolute; width: 561px; height: 241px; transform: translate(0px, 0px);"><div class="aui-grid-main-panel" style="position: absolute; width: 561px; height: 241px; left: 0px; top: 0px;"><div class="aui-grid-header-panel" style="position: absolute; width: 561px; height: 40px; left: 0px; top: 0px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 160px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 160px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th></tr><tr style="height: 40px;"><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; width: 72px; max-height: 38px;"><span>기관명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; width: 152px; max-height: 38px;"><span>활동내역</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; width: 152px; max-height: 38px;"><span>비고</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; width: 72px; max-height: 38px;"><span>활동시작년월</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; width: 72px; max-height: 38px;"><span>활동종료년월</span></div></td></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute; width: 561px; height: 201px; left: 0px; top: 40px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 160px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 160px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px; height: 0px;"></th></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 152px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none; width: 561px; height: 0px; left: 0px; top: 241px;"></div></div><div style="cursor: col-resize; display: block; position: absolute; left: 77px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 237px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 397px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 477px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 557px; top: 0px; width: 6px; height: 40px;"></div></div></div><div class="aui-grid-left-main-panel" style="overflow: hidden; position: absolute; display: none;"><div class="aui-grid-header-panel" style="position: absolute;"></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute;"></div><div class="aui-grid-footer-panel" style="position: absolute; display: none;"></div></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; position: absolute; display: none; height: 40px;"></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; display: none; position: absolute;"></div><div class="aui-grid-fixed-row-rule" style="display: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-hscrollbar" style="position: absolute; display: block; width: 298px; height: 14px; left: 0px; top: 241px;"><div class="aui-scroll-track" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 14px;"></div><div class="aui-scroll-thumb" style="position: absolute; display: block; left: 14px; top: 1px; width: 54px; height: 12px;"></div><div class="aui-scroll-up" style="position: absolute; display: block; left: 0px; top: 0px; width: 14px; height: 14px;"></div><div class="aui-scroll-down" style="position: absolute; display: block; left: 284px; top: 0px; width: 14px; height: 14px;"></div></div><div class="aui-vscrollbar" style="position: absolute; display: none;"><div class="aui-scroll-track" style="position: absolute;"></div><div class="aui-scroll-thumb" style="position: absolute;"></div><div class="aui-scroll-up" style="position: absolute;"></div><div class="aui-scroll-down" style="position: absolute;"></div></div><div style="display: none; z-index: 40; position: absolute;"></div><div class="aui-grid-info-layer" style="z-index: 1; position: absolute; display: none;"></div><div style="z-index: 1; position: absolute;"></div><div class="aui-grid-vertical-resizer-rule" style="width: 1px; height: 255px; left: 0px; top: 0px; display: none; position: absolute;"></div></div></div>
                    </div>
                </div>
                <div id="tab4" aria-labelledby="btn_tab4" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
                    <div style="height: 1185px;">
                        <div class="div_wrap_title">
                            <h3 class="grid_title grid_title_arrange">자기소개서</h3>
                            <table>
                                <caption>언어유형구분</caption>
                                <colgroup>
                                    <col width="50%">
                                    <col width="20%">
                                    <col width="30%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td></td>
                                    <td class="align_right"><label for="slt_tab4_arg1_lang_tp">언어유형구분</label></td>
                                    <td><select id="slt_tab4_arg1_lang_tp" class="slt_default auto_combo" style="display: none;"><option value="10">한국어</option>
                                        <option value="20">지원어</option></select><span class="custom-combobox"><input title="" id="auto_slt_tab4_arg1_lang_tp" class="auto_slt_tab4_arg1_lang_tp custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="wrap_div">
                            <div id="div_tab4_inp1">
                                <!-- 입력부 영역 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab5" aria-labelledby="btn_tab5" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
                    <!-- 탭6  -->
                    <div style="height: 1185px;">
                        <div class="div_wrap_title">
                            <div class="grid_title grid_title_arrange">
                                <div><h3 id="lbl_tab6_grid1_title">제출서류</h3></div>
                            </div>
                            <div class="align_right">
                                <!-- <button id="btn_tab6_modify" class="btn-default" onclick="fn_btn_tab6_modify_onclick()">수정</button> -->
                                <button id="btn_tab6_new" class="btn-default" onclick="fn_tab6_new_onclick()">신규</button>
                                <button id="btn_tab6_save" class="btn-default" onclick="fn_btn_tab6_save_onclick()">저장</button>
                            </div>
                        </div>
                        <div id="tab6_grid1" class="div_wrap_grid" style="position: relative; height: auto;"><div class="aui-grid" style="position: relative; box-sizing: content-box; overflow: hidden; width: 298px; height: 255px; touch-action: manipulation;"><div class="aui-grid-grouping-panel" style="display: none; position: absolute;"></div><input class="aui-textinputer" style="padding: 0px 4px; overflow: hidden; z-index: -1; position: fixed; width: 1px; height: 1px; left: -20000px; top: 0px;" type="text" autocomplete="off" aria-hidden="true"><div class="aui-grid-content-panel-mask" style="position: absolute; overflow: hidden; width: 298px; height: 207px; left: 0px; top: 0px;"><div style="position: absolute; width: 681px; height: 207px; transform: translate(0px, 0px);"><div class="aui-grid-main-panel" style="position: absolute; width: 681px; height: 207px; left: 0px; top: 0px;"><div class="aui-grid-header-panel" style="position: absolute; width: 681px; height: 40px; left: 0px; top: 0px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 120px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 320px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr style="height: 40px;"><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 112px;"><span>제출서류</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>기관명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 312px;"><span>첨부파일</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>파일관리</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>미리보기</span></div></td></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute; width: 681px; height: 167px; left: 0px; top: 40px;"><table class="aui-grid-table" style="table-layout: fixed !important; width: 0px !important; position: absolute; left: 0px; top: 0px;"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 120px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 320px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 112px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 312px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; display: none; width: 72px;"><span class="aui-grid-button-renderer aui-grid-button-percent-width"></span></div></td></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none; width: 681px; height: 0px; left: 0px; top: 207px;"></div></div><div style="cursor: col-resize; display: block; position: absolute; left: 117px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 197px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 517px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 597px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 677px; top: 0px; width: 6px; height: 40px;"></div></div></div><div class="aui-grid-left-main-panel" style="overflow: hidden; position: absolute; display: none;"><div class="aui-grid-header-panel" style="position: absolute;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 40px;"></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute;"><table class="aui-grid-table" style="table-layout: fixed !important; width: 0px !important; position: absolute; left: 0px; top: 0px;"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none;"></div></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; position: absolute; display: none; height: 40px;"></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; display: none; position: absolute;"></div><div class="aui-grid-fixed-row-rule" style="display: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-hscrollbar" style="position: absolute; display: block; width: 298px; height: 14px; left: 0px; top: 207px;"><div class="aui-scroll-track" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 14px;"></div><div class="aui-scroll-thumb" style="position: absolute; display: block; left: 14px; top: 1px; width: 39px; height: 12px;"></div><div class="aui-scroll-up" style="position: absolute; display: block; left: 0px; top: 0px; width: 14px; height: 14px;"></div><div class="aui-scroll-down" style="position: absolute; display: block; left: 284px; top: 0px; width: 14px; height: 14px;"></div></div><div class="aui-vscrollbar" style="position: absolute; display: none;"><div class="aui-scroll-track" style="position: absolute; left: 0px; top: 0px;"></div><div class="aui-scroll-thumb" style="position: absolute; display: none;"></div><div class="aui-scroll-up" style="position: absolute; display: block; left: 0px; top: 0px;"></div><div class="aui-scroll-down" style="position: absolute; display: block;"></div></div><div style="display: none; z-index: 40; position: absolute;"></div><div class="aui-grid-info-layer" style="z-index: 1; position: absolute; display: none;"></div><div style="z-index: 1; position: absolute;"></div><div class="aui-grid-paging-panel" style="width: 298px; height: 34px; position: absolute; display: none; left: 0px; top: 221px;"><span class="aui-grid-paging-info-text" style="position: absolute;"></span><span class="aui-grid-paging-number aui-grid-paging-first" style="display: none;">&lt;&lt;</span><span class="aui-grid-paging-number aui-grid-paging-prev" style="display: none;">&lt;</span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number" style="display: none;"></span><span class="aui-grid-paging-number aui-grid-paging-next" style="display: none;">&gt;</span><span class="aui-grid-paging-number aui-grid-paging-last" style="display: none;">&gt;&gt;</span></div><div class="aui-grid-vertical-resizer-rule" style="width: 1px; height: 255px; left: 0px; top: 0px; display: none; position: absolute;"></div></div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
        <script>
            class RowNumberRenderer {
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
            }

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
                        APLY_NO: 'EE2232',
                        NM_KOR: '까이멍',
                        APLY_STS_DIV: '접수중',
                        APLY_DT: '2023-08-01 15:32'
                    },
                    {
                        APLY_NO: 'FQ2232',
                        NM_KOR: '가갑손',
                        APLY_STS_DIV: '접수중',
                        APLY_DT: '2023-07-12 15:32'
                    },
                    {
                        APLY_NO: '3E2232',
                        NM_KOR: '가갑순',
                        APLY_STS_DIV: '접수중',
                        APLY_DT: '2023-08-02 15:32'
                    },
                    {
                        APLY_NO: 'EQZ2232',
                        NM_KOR: '뭔갑손',
                        APLY_STS_DIV: '접수중',
                        APLY_DT: '2023-08-01 15:32'
                    }
                ];
                const data2 = [
                    {
                        CORS_DIV: 'JAVA',
                        SEL_NM: '자바과정 풀스택',
                        NTH_NM: '3',
                        ENT_YR: '2023',
                        TERM_DIV: '1',
                        수업개월수: '6',
                        EDU_ST_DT: '2023-08-01 15:32',
                        EDU_END_DT: '2023-08-01 15:32',
                        발표일자: '2023-08-01 15:32',
                        NOTE: '장사때려침'
                    },
                    {
                        CORS_DIV: 'Python',
                        SEL_NM: '파이썬',
                        NTH_NM: '2',
                        ENT_YR: '2023',
                        TERM_DIV: '1',
                        수업개월수: '6',
                        EDU_ST_DT: '2023-08-01 15:32',
                        EDU_END_DT: '2023-08-01 15:32',
                        발표일자: '2023-08-01 15:32',
                        NOTE: '장사때려침'
                    },
                    {
                        CORS_DIV: 'C++',
                        SEL_NM: 'C++ 코딩테스트',
                        NTH_NM: '4',
                        ENT_YR: '2023',
                        TERM_DIV: '1',
                        수업개월수: '6',
                        EDU_ST_DT: '2023-08-01 15:32',
                        EDU_END_DT: '2023-08-01 15:32',
                        발표일자: '2023-08-01 15:32',
                        NOTE: '장사때려침'
                    }
                ];

                function educationPeriodFormatter({row}) {
                    const startDate = row.EDU_ST_DT;
                    const endDate = row.EDU_END_DT;
                    return `${startDate} ~ ${endDate}`;
                }

                const grid = new tui.Grid({
                    el: document.getElementById('grid'),
                    data: data,
                    rowHeaders: [
                        {
                            type: 'rowNum',
                            renderer: {
                                type: RowNumberRenderer
                            }
                        },
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
                    scrollX: true,
                    scrollY: true,
                    columns: [
                        {
                            header: '지원서번호',
                            name: 'APLY_NO',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '성명',
                            name: 'NM_KOR',
                            sortingType: 'asc',
                            sortable: true,
                            align: 'center'
                        },
                        {
                            header: '상태',
                            name: 'APLY_STS_DIV',
                            sortingType: 'asc',
                            sortable: true, align: 'center'
                        },
                        {
                            header: '제출일시',
                            name: 'APLY_DT',
                            sortingType: 'asc',
                            sortable: true, align: 'center'
                        }
                    ],
                    columnOptions: {
                        resizable: true
                    },

                    draggable: true,


                });
                grid.on('check', function (ev) {
                    console.log('check', ev);
                });

                grid.on('uncheck', function (ev) {
                    console.log('uncheck', ev);
                });
                const grid2 = new tui.Grid({
                    el: document.getElementById('grid2'),
                    data: data2,
                    rowHeaders: [
                        {
                            type: 'rowNum',
                            renderer: {
                                type: RowNumberRenderer
                            }
                        },
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

                    draggable: true,
                    pagination: {
                        page: 1,
                        count: 10,
                        useClient: true,
                        useDefault: true
                    }

                });
                grid.on('check', function (ev) {
                    console.log('check', ev);
                });

                grid.on('uncheck', function (ev) {
                    console.log('uncheck', ev);
                });
                grid.on('drag', function (ev) {
                    console.log('drag', ev);
                });
            });
        </script>
        <script>
            /*=============================================================================
            = 시  스  템 : 2.입학지원
            = 프로그램ID : CO0141P
            = 프로그램명 : 주소검색
            = UI 작 성 일 : 2023/01/04
            = UI 작 성 자 : 한준성
            = 작  성  일 : 2023/01/04
            = 작  성  자 : 한준성
            =============================================================================*/

            // 01. 폼 변수 정의 및 그리드 초기화 --------------------------------------------- /
            // 02. 폼 로드 ----------------------------------------------------------------- /
            // 03. 공통 코드 및 콤보 데이터 조회  --------------------------------------- /
            // 04. 신규 함수 선언   ------------------------------------------------------- /
            // 05. 조회 함수 선언  -------------------------------------------------------- /
            // 06. 삭제 함수 선언  -------------------------------------------------------- /
            // 07. 저장 함수 선언  -------------------------------------------------------- /
            // 08. 필수체크  --------------------------------------------------------------- /
            // 09. 콜백(트랜잭션)  -------------------------------------------------------- /
            // 10. 그리드 이벤트  --------------------------------------------------------- /
            // 11. 컨트롤(조건부) 이벤트  ------------------------------------------------ /
            // 12. 업무버튼 이벤트 -------------------------------------------------------- /
            // 13. 팝업 이벤트 ------------------------------------------------------------ /
            // 14. 콜백(팝업)  ------------------------------------------------------------ /
            // 15. 기타 이벤트 ------------------------------------------------------------ /
            // 16. 탭 클릭시 조회/ 버튼활성화 실행 -------------------------------------- /
            // 17. 탭 버튼 활성화 조건 --------------------------------------------------- /
            // 30. 출력 함수 선언   ------------------------------------------------------- /
            // 31. 연결프로그램 설정------------------------------------------------------- /
            // 51. 초기값가져오기  ------------------------------------------------------- /
            // 52. DDL  -------------------------------------------------------------------- /
            // 53. 날짜체크  -------------------------------------------------------------- /
            // 54. 엑셀내보내기    ------------------------------------------------------- /
            // 55. 컴포넌트 값에 따른 이벤트  ------------------------------------------ /
            // 56. 컴포넌트 활성화/비활성화  ------------------------------------------- /
            // 57. 파일업로드/다운로드  ------------------------------------------------- /
            // 91. 리턴값 넘겨주기 (팝업) ------------------------------------------------- /

            // 01. 폼 변수 정의 및 그리드 초기화 ----------------------------------------------------------- /
            const ls_pgmId = "CO0141P";

            // 팝업 제목
            const title = $(document).find("title").text();

            const ls_keyword = document.getElementById("keyword");		// 검색주소
            const ls_currentPage = document.getElementById("currentPage");

            let ls_total_cnt;
            let ls_page_no;
            let ls_line;
            let xml_to_json;

            let selectedItems;

            // 팝업 변수 선언
            let ls_CO0141P_address = "";


            // 02. 폼 로드 ----------------------------------------------------------------- /
            function fn_onload(ev) {
                // 팝업 제목 설정
                $('#title', parent.document).text(title);

                // 팝업 변수 받아오기
                gfn_popupSet();

                // 팝업 변수 설정
                if (_Parent) {

                    ls_CO0141P_address = gfn_str(_Parent.CO0141P_address);
                }

                // 초기값 설정
                ls_keyword.value = !gfn_isNull(ls_CO0141P_address) ? ls_CO0141P_address : "";	// 주소

                var addrKeyword = gfn_str(ls_keyword.value)

                if (addrKeyword != "") {
                    fn_getAddrList();
                }
            }

            // 05. 조회 함수 선언  -------------------------------------------------------- /
            // 검색버튼 클릭 이벤트
            function fn_btn_grid1_search_onclick(pageNum) {
                $("#currentPage").val(pageNum);
                fn_getAddrList();
            }

            ls_total_cnt = 0;
            ls_page_no = 0;
            ls_line = 0;

            // 주소목록조회
            function fn_getAddrList() {
                var addrKeyword = gfn_str(ls_keyword.value);
                if (addrKeyword == "") {
                    return;
                }
                var currentPage = gfn_str(ls_currentPage.value);				// 요청 변수 설정 (현재 페이지. currentPage : n > 0)
                var countPerPage = "10";										// 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
                // var confmKey = "devU01TX0FVVEgyMDIzMDMxNjEzMjI0NjExMzYwMDE=";	// 요청 변수 설정 (승인키)(개발용)
                //var confmKey = "U01TX0FVVEgyMDIzMDMxNjEzMTQxMDExMzU5OTg=";		// 요청 변수 설정 (승인키)(운영용)
                var confmKey = "devU01TX0FVVEgyMDIzMDcwMzE3NTIxNDExMzg5NzQ=";	// 요청 변수 설정 (승인키)

                $.ajax({
                    url: "https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=" + encodeURIComponent(confmKey)
                        + "&currentPage=" + encodeURIComponent(currentPage)
                        + "&countPerPage=" + encodeURIComponent(countPerPage)
                        + "&keyword=" + encodeURIComponent(addrKeyword),
                    type: "post",
                    data: {},
                    dataType: "jsonp",
                    crossDomain: true,
                    success: function (xmlStr) {
                        if (navigator.appName.indexOf("Microsoft") > -1) {
                            var xmlData = new ActiveXObject("Microsoft.XMLDOM");
                            xmlData.loadXML(xmlStr.returnXml)
                        } else {
                            var xmlData = xmlStr.returnXml;
                        }
                        $("#list").html("");
                        var errCode = $(xmlData).find("errorCode").text();
                        var errDesc = $(xmlData).find("errorMessage").text();
                        var totalCount = $(xmlData).find("totalCount").text();
                        var currentPage = $(xmlData).find("currentPage").text();

                        if (parseInt(totalCount) > 9000) {
                            alert("검색 범위를 초과하였습니다.(" + totalCount + "건)\n검색어 예를 참조하여 검색하시기 바랍니다.");
                            fn_makePage(xmlStr);
                            return;
                        }
                        if (errCode != "0") {
                            alert(errCode + "=" + errDesc);
                        } else {
                            if (xmlStr != null) {
                                fn_makeList(xmlData);
                            }
                        }

                    },
                    error: function (xhr, status, error) {
                        alert("검색에 실패하였습니다 \n 다시 검색하시기 바랍니다.");
                    }
                });
            }

            // 10. 그리드 이벤트  --------------------------------------------------------- /
            // 결과 목록 생성
            function fn_makeList(xmlStr) {

                var ls_total_cnt = $(xmlStr).find('totalCount').text();
                var ls_list_div = document.getElementById('list');

                if (ls_total_cnt == '0') {
                    $("#list *").remove();

                    var ls_result_div = document.createElement('div');
                    ls_result_div.classList.add('div_top_gap_10', 'div_side_gap_10');
                    ls_result_div.innerText = '검색된 내용이 없습니다.';

                    ls_list_div.append(ls_result_div);

                } else {
                    $("#list *").remove();


                    var ls_curr_page = parseInt($(xmlStr).find('currentPage').text());
                    var ls_cnt_per_page = parseInt($(xmlStr).find('countPerPage').text());
                    var ls_list_num = (ls_curr_page * ls_cnt_per_page) - (--ls_cnt_per_page);
                    var num = 0;

                    var ls_result_div = document.createElement('div');
                    var ls_result_str = document.createElement('div');
                    var ls_list_table = document.createElement('table');
                    var ls_list_caption = document.createElement('caption');
                    var ls_list_colgroup = document.createElement('colgroup');
                    var ls_list_col1 = document.createElement('col');
                    var ls_list_col2 = document.createElement('col');
                    var ls_list_col3 = document.createElement('col');
                    var ls_list_thead = document.createElement('thead');
                    var ls_list_headtr = document.createElement('tr');
                    var ls_list_headtd1 = document.createElement('th');
                    var ls_list_headtd2 = document.createElement('th');
                    var ls_list_headtd3 = document.createElement('th');
                    var ls_list_tbody = document.createElement('tbody');

                    ls_result_div.classList.add('div_top_gap_10', 'div_side_gap_10');

                    ls_result_div.append(ls_result_str);
                    ls_result_str.classList.add('div_top_gap_10');
                    ls_result_str.innerText = '도로명주소 검색 결과 (' + $(xmlStr).find("totalCount").text() + '건)';

                    ls_result_div.append(ls_list_table);

                    ls_list_table.append(ls_list_caption);
                    ls_list_table.append(ls_list_colgroup);
                    ls_list_table.append(ls_list_thead);

                    ls_list_caption.innerText = '검색 결과';

                    ls_list_colgroup.append(ls_list_col1);
                    ls_list_colgroup.append(ls_list_col2);
                    ls_list_colgroup.append(ls_list_col3);
                    ls_list_col1.setAttribute('style', 'width:8%');
                    ls_list_col2.setAttribute('style', 'width:80%');
                    ls_list_col3.setAttribute('style', 'width:12%');

                    ls_list_thead.append(ls_list_headtd1);
                    ls_list_thead.append(ls_list_headtd2);
                    ls_list_thead.append(ls_list_headtd3);
                    ls_list_headtd1.setAttribute('scope', 'col');
                    ls_list_headtd2.setAttribute('scope', 'col');
                    ls_list_headtd3.setAttribute('scope', 'col');
                    ls_list_headtd1.innerText = 'No.';
                    ls_list_headtd2.innerText = '도로명주소';
                    ls_list_headtd3.innerText = '우편번호';

                    ls_list_table.append(ls_list_tbody);

                    $(xmlStr).find("juso").each(function () {

                        num++;

                        var ls_list_tbody_tr = document.createElement('tr');
                        var ls_list_tbody_td1 = document.createElement('td');
                        var ls_list_tbody_td2 = document.createElement('td');
                        var ls_list_tbody_td2_1 = document.createElement('div');
                        var ls_list_tbody_td2_2 = document.createElement('span');
                        var ls_list_tbody_td3 = document.createElement('td');
                        var ls_list_hidden_item01 = document.createElement('input');
                        var ls_list_hidden_item02 = document.createElement('input');
                        var ls_list_hidden_item03 = document.createElement('input');
                        var ls_list_hidden_item04 = document.createElement('input');
                        var ls_list_hidden_item05 = document.createElement('input');
                        var ls_list_hidden_item06 = document.createElement('input');
                        var ls_list_hidden_item07 = document.createElement('input');
                        var ls_list_hidden_item08 = document.createElement('input');
                        var ls_list_hidden_item09 = document.createElement('input');
                        var ls_list_hidden_item10 = document.createElement('input');
                        var ls_list_hidden_item11 = document.createElement('input');
                        var ls_list_hidden_item12 = document.createElement('input');
                        var ls_list_hidden_item13 = document.createElement('input');
                        var ls_list_hidden_item14 = document.createElement('input');
                        var ls_list_hidden_item15 = document.createElement('input');
                        var ls_list_hidden_item16 = document.createElement('input');
                        var ls_list_hidden_item17 = document.createElement('input');
                        var ls_list_hidden_item18 = document.createElement('input');
                        var ls_list_hidden_item19 = document.createElement('input');
                        var ls_list_hidden_item20 = document.createElement('input');
                        var ls_list_hidden_item21 = document.createElement('input');
                        var ls_list_hidden_item22 = document.createElement('input');
                        var ls_list_hidden_item23 = document.createElement('input');
                        var ls_list_hidden_item24 = document.createElement('input');

                        ls_list_tbody_tr.setAttribute('id', 'rowNum' + num);
                        ls_list_tbody_tr.setAttribute('onclick', 'fn_select_row(' + num + ')');
                    });
                }
            }
        </script>
</body>
</html>
