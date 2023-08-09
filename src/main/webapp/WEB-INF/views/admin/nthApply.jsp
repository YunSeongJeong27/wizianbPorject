<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-09
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
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
            font-size: 15px !important
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
        <div class="col-3 d-flex flex-row align-items-center">
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

    <div id="grid2"></div>
</div>


<div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
    <div class="w-50">
        <div>
            <div class="div_wrap_title">
                <div class="grid_title grid_title_arrange">
                    <div>
                        <span id="lbl_grid2_title">지원자목록</span><span class="grid_count"
                                                                     id="lbl_grid2_count">검색결과 : 0건</span>
                    </div>
                    <select id="slt_grid2_count" class="slt_default" onchange="fn_grid2_pageRowCount()">
                        <option value="5">5</option>
                        <option value="30" selected="">30</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                        <option value="500">500</option>
                    </select>
                </div>
                <div class="d-flex">
                    <button id="btn_grid2_excel_export" class="btn-default" onclick="fn_excel_grid2_onclick()">
                        엑셀내보내기(전체)
                    </button>
                </div>
            </div>
            <div class="flex div_bottom_gap_05">
                <div>
                    <table class="div_wrap_col1 div_wrap_col1_sm width_100">
                        <caption>상태구분</caption>
                        <colgroup>
                            <col width="30%">
                            <col width="70%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td><label for="slt_arg2_aply_sts_div lbl_chk">상태구분</label></td>
                            <td>
                                <select id="slt_arg2_aply_sts_div" class="slt_default auto_combo"
                                        style="display: none;">
                                    <option value="10">작성중</option>
                                    <option value="30">제출완료</option>
                                </select><span class="custom-combobox"><input title=""
                                                                              id="auto_slt_arg2_aply_sts_div"
                                                                              class="auto_slt_arg2_aply_sts_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input"
                                                                              autocomplete="off"><a tabindex="-1"
                                                                                                    class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right"
                                                                                                    role="button"><span
                                    class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span
                                    class="ui-button-icon-space"> </span></a></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="sp_between">
                    <button id="btn_arg2_change_all" class="btn-default" onclick="fn_grid2_change_all_onclick()">
                        일괄변경
                    </button>
                    <button id="btn_aply_cfm" class="btn-default" onclick="fn_aply_cfm_onclick()" disabled="">접수취소
                    </button>
                </div>
            </div>
        </div>
        <div id="grid"></div>
    </div>
    <!-- 탭 아이디 'mainTab' -->
    <div id="mainTab" class="div_tabs width_60 div_left_gap_20 ui-tabs ui-corner-all ui-widget ui-widget-content"
         style="height: 1260px;">
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
                aria-controls="tab6" aria-labelledby="btn_tab6" aria-selected="false" aria-expanded="false"><a
                    id="btn_tab6" href="#tab6" role="presentation" tabindex="-1" class="nav-link"
                    style="pointer-events: none;">제출서류</a></li>
        </ul>
        <div id="tab1" aria-labelledby="btn_tab1" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="false">
            <div class="wrap_contents" style="height: 1185px;">
                <div class="contents">
                    <div class="container">
                        <div class="flex sp_between">
                            <h3 class="grid_title title div_top_gap_unset">기본정보</h3>
                            <div>
                                <button id="btn_tab1_modify" class="btn-default" title="Modify" onclick="fn_btn_tab1_modify_onclick()">수정</button>
                                <button id="btn_tab1_save" class="btn-default" title="Save" onclick="fn_btn_tab1_save_onclick()" disabled="">저장</button>
                            </div>
                        </div>
                        <div class="form-basic div_top_gap_06">
                            <div>
                                <table class="table-top_border">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <col width="20%">
                                        <col width="30%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td class="fake_th">모집과정명 </td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_cors_div" class="slt_cors_div auto_combo width_100" disabled="" style="display: none;"><option value="10">정규과정</option>
<option value="21">야간과정</option>
<option value="30">번역아틀리에</option>
<option value="40">문화콘텐츠 번역실무 고급과정</option></select><span class="custom-combobox"><input title="" id="auto_slt_cors_div" class="auto_slt_cors_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                        <td class=" fake_th">상세과정</td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_dtl_cors_div" class="slt_dtl_cors_div auto_combo width_100" style="display: none;"><option value=" ">(선택)</option><option value="00">없음</option></select><span class="custom-combobox"><input title="" id="auto_slt_dtl_cors_div" class="auto_slt_dtl_cors_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class=" fake_th">언어권 </td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_lang_div" class="slt_lang_div auto_combo width_100" style="display: none;"><option value=" ">(선택)</option><option value="70">일본어</option></select><span class="custom-combobox"><input title="" id="auto_slt_lang_div" class="auto_slt_lang_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                        <td class="fake_th ">지원자구분</td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_aplcnt_div" class="slt_aplcnt_div auto_combo width_100" style="display: none;"><option value=" ">(선택)</option><option value="10">일반지원자</option></select><span class="custom-combobox"><input title="" id="auto_slt_aplcnt_div" class="auto_slt_aplcnt_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th ">한국인/외국인 </td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_inout_div" class="slt_inout_div auto_combo width_100" disabled="" style="display: none;"><option value=" ">(미선택)</option>
<option value="10">한국인</option>
<option value="20">외국인</option></select><span class="custom-combobox"><input title="" id="auto_slt_inout_div" class="auto_slt_inout_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                        <td class=" fake_th">성별</td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_gen_div" class="slt_gen_div auto_combo width_100" style="display: none;"><option value=" ">(미선택)</option>
<option value="10">남자</option>
<option value="20">여자</option>
<option value="30">기타</option></select><span class="custom-combobox"><input title="" id="auto_slt_gen_div" class="auto_slt_gen_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th  lbl_chk">이메일</td>
                                        <td>
                                            <div class="flex justify_content_center">
                                                <input type="text" id="txt_transcript_email" class="txt_transcript_email" disabled="disabled">
                                                <!-- <button class="btn_email btn_slt button_sm noShrink" title="이메일인증" onclick="location.href='./EN0220P.html'">이메일인증</button> -->
                                            </div>
                                        </td>
                                        <td class="fake_th" rowspan="6">사진</td>
                                        <td rowspan="6">
                                            <div class="profile-pic dp_inlineblk" style="vertical-align: bottom;">
                                                <img id="img_preview" class="profile-pic" src="">
                                            </div>
                                            <!-- <div class="div_top_gap_06 dp_inlineblk" style="vertical-align: bottom;">
                                                <button class="btn_slt button_sm" title="업로드">업로드</button>
                                                <button class="btn_slt button_sm" title="삭제">삭제</button>
                                            </div> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class=" fake_th lbl_chk">성명(한글)</td>
                                        <td><input type="text" id="txt_inp1_nm_kor" value="" class="txt_inp1_nm_kor txt_default " maxlength="50" disabled="disabled"></td>
                                    </tr>
                                    <tr>
                                        <td class=" fake_th lbl_chk">성명(영어) </td>
                                        <td><input type="text" id="txt_inp1_nm_eng" value="" class="txt_inp1_nm_eng txt_default " maxlength="50" disabled="disabled"></td>
                                    </tr>
                                    <tr>
                                        <td class=" fake_th lbl_chk">성명(모국어) </td>
                                        <td><input type="text" id="txt_inp1_nm_natv" value="" class="txt_inp1_nm_natv txt_default " maxlength="50" disabled="disabled"></td>
                                    </tr>
                                    <tr>
                                        <td class=" fake_th">생년월일 </td>
                                        <!-- <td>
                                            <span class="bg-icon_calendar div_top_gap_04">
                                                <input type="date" id="cal_brdt" class="cal_brdt width_100 ">
                                            </span>
                                        </td> -->
                                        <td>
                                            <div class="multi_inputs">
                                                <input type="text" id="cal_brdt" class="cal_brdt txt_default cal_format_kr hasDatepicker" maxlength="10" autocomplete="off" disabled="disabled"><img class="ui-datepicker-trigger" src="/images/icon-calendar.svg" alt="..." title="...">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th ">국적 </td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_nation_cd" class="slt_default auto_combo" style="display: none;"><option value=" ">(선택)</option><option value="410">대한민국 [REPUBLIC OF KOREA]</option><option value="288">가나 [GHANA]</option><option value="266">가봉 [GABON]</option><option value="328">가이아나 [GUYANA]</option><option value="270">감비아 [GAMBIA]</option><option value="320">과테말라 [GUATEMALA]</option><option value="308">그레나다 [GRENADA]</option><option value="300">그리스 [GREECE]</option><option value="324">기니 [GUINEA]</option><option value="624">기니비사우 [GUINEA-BISSAU]</option><option value="516">나미비아 [NAMIBIA]</option><option value="520">나우루 [NAURU]</option><option value="566">나이지리아 [NIGERIA]</option><option value="728">남수단 [REPUBLIC OF SOUTH SUDAN]</option><option value="710">남아프리카 공화국 [SOUTH AFRICA]</option><option value="528">네덜란드 [NETHERLANDS]</option><option value="524">네팔 [NEPAL]</option><option value="578">노르웨이 [NORWAY]</option><option value="554">뉴질랜드 [NEW ZEALAND]</option><option value="570">니우에 [NIUE]</option><option value="562">니제르 [NIGER]</option><option value="558">니카라과 [NICARAGUA]</option><option value="208">덴마크 [DENMARK]</option><option value="214">도미니카 공화국 [DOMINICAN REPUBLIC]</option><option value="212">도미니카 연방 [DOMINICA]</option><option value="276">독일 [GERMANY]</option><option value="626">동티모르 [EAST TIMOR]</option><option value="418">라오스 [LAO PEOPLE`S DEMOCRATIC REPUBLIC]</option><option value="430">라이베리아 [LIBERIA]</option><option value="428">라트비아 [LATVIA]</option><option value="643">러시아 [RUSSIAN FEDERATION]</option><option value="422">레바논 [LEBANON]</option><option value="426">레소토 [LESOTHO]</option><option value="642">루마니아 [ROMANIA]</option><option value="442">룩셈부르크 [LUXEMBOURG]</option><option value="646">르완다 [RWANDA]</option><option value="434">리비아 [LIBYAN ARAB JAMAHIRIYA]</option><option value="440">리투아니아 [LITHUANIA]</option><option value="438">리히텐슈타인 [LIECHTENSTEIN]</option><option value="450">마다가스카르 [MADAGASCAR]</option><option value="584">마셜 제도 [MARSHALL ISLANDS]</option><option value="807">마케도니아 공화국 [REPUBLIC OF MACEDONIA]</option><option value="454">말라위 [MALAWI]</option><option value="458">말레이시아 [MALAYSIA]</option><option value="466">말리 [MALI]</option><option value="484">멕시코 [MEXICO]</option><option value="492">모나코 [MONACO]</option><option value="504">모로코 [MOROCCO]</option><option value="480">모리셔스 [MAURITIUS]</option><option value="478">모리타니 [MAURITANIA]</option><option value="508">모잠비크 [MOZAMBIQUE]</option><option value="499">몬테네그로 [MONTENEGRO]</option><option value="498">몰도바 [MOLDOVA, REPUBLIC OF]</option><option value="462">몰디브 [MALDIVES]</option><option value="470">몰타 [MALTA]</option><option value="496">몽골 [MONGOLIA]</option><option value="840">미국 [UNITED STATES]</option><option value="104">미얀마 [MYANMAR]</option><option value="583">미크로네시아 연방 [MICRONESIA]</option><option value="548">바누아투 [VANUATU]</option><option value="048">바레인 [BAHRAIN]</option><option value="052">바베이도스 [BARBADOS]</option><option value="336">바티칸 시국 [VATICAN CITY STATE]</option><option value="044">바하마 [BAHAMAS]</option><option value="050">방글라데시 [BANGLADESH]</option><option value="204">베냉 [BENIN]</option><option value="862">베네수엘라 [VENEZUELA]</option><option value="704">베트남 [VIET NAM]</option><option value="056">벨기에 [BELGIUM]</option><option value="112">벨라루스 [BELARUS]</option><option value="084">벨리즈 [BELIZE]</option><option value="070">보스니아 헤르체고비나 [BOSNIA HERCEGOVINA]</option><option value="072">보츠와나 [BOTSWANA]</option><option value="068">볼리비아 [BOLIVIA]</option><option value="108">부룬디 [BURUNDI]</option><option value="854">부르키나파소 [BURKINA FASO]</option><option value="064">부탄 [BHUTAN]</option><option value="100">불가리아 [BULGARIA]</option><option value="076">브라질 [BRAZIL]</option><option value="096">브루나이 [BRUNEI DARUSSALAM]</option><option value="882">사모아 [SAMOA]</option><option value="682">사우디아라비아 [SAUDI ARABIA]</option><option value="674">산마리노 [SAN MARINO]</option><option value="678">상투메 프린시페 [SAO TOME AND PRINCIPE]</option><option value="686">세네갈 [SENEGAL]</option><option value="688">세르비아 [SERBIA]</option><option value="690">세이셸 [SEYCHELLES]</option><option value="662">세인트루시아 [SAINT LUCIA]</option><option value="670">세인트빈센트 그레나딘 [SAINT VINCENT AND THE GRENADINES]</option><option value="659">세인트키츠 네비스 [SAINT KITTS AND NEVIS]</option><option value="706">소말리아 [SOMALIA]</option><option value="090">솔로몬 제도 [SOLOMON ISLANDS]</option><option value="736">수단 [SUDAN]</option><option value="740">수리남 [SURINAME]</option><option value="144">스리랑카 [SRI LANKA]</option><option value="748">스와질란드 [SWAZILAND]</option><option value="752">스웨덴 [SWEDEN]</option><option value="756">스위스 [SWITZERLAND]</option><option value="724">스페인 [SPAIN]</option><option value="703">슬로바키아 [SLOVAKIA]</option><option value="705">슬로베니아 [SLOVENIA]</option><option value="760">시리아 [SYRIAN ARAB REPUBLIC]</option><option value="694">시에라리온 [SIERRA LEONE]</option><option value="702">싱가포르 [SINGAPORE]</option><option value="784">아랍에미리트 [UNITED ARAB EMIRATES]</option><option value="051">아르메니아 [ARMENIA]</option><option value="032">아르헨티나 [ARGENTINA]</option><option value="352">아이슬란드 [ICELAND]</option><option value="332">아이티 [HAITI]</option><option value="372">아일랜드 [IRELAND]</option><option value="031">아제르바이잔 [AZERBAIJAN]</option><option value="004">아프가니스탄 [AFGHANISTAN]</option><option value="020">안도라 [ANDORRA]</option><option value="008">알바니아 [ALBANIA]</option><option value="012">알제리 [ALGERIA]</option><option value="024">앙골라 [ANGOLA]</option><option value="028">앤티가 바부다 [ANTIGUA AND BARBUDA]</option><option value="232">에리트레아 [ERITREA]</option><option value="233">에스토니아 [ESTONIA]</option><option value="218">에콰도르 [ECUADOR]</option><option value="231">에티오피아 [ETHIOPIA]</option><option value="222">엘살바도르 [EL SALVADOR]</option><option value="826">영국 [UNITED KINGDOM]</option><option value="887">예멘 [YEMEN, REPUBLIC OF]</option><option value="512">오만 [OMAN]</option><option value="036">오스트레일리아 [AUSTRALIA]</option><option value="040">오스트리아 [AUSTRIA]</option><option value="340">온두라스 [HONDURAS]</option><option value="400">요르단 [JORDAN]</option><option value="800">우간다 [UGANDA]</option><option value="858">우루과이 [URUGUAY]</option><option value="860">우즈베키스탄 [UZBEKISTAN]</option><option value="804">우크라이나 [UKRAINE]</option><option value="368">이라크 [IRAQ]</option><option value="364">이란 [IRAN]</option><option value="376">이스라엘 [ISRAEL]</option><option value="818">이집트 [EGYPT]</option><option value="380">이탈리아 [ITALY]</option><option value="356">인도 [INDIA]</option><option value="360">인도네시아 [INDONESIA]</option><option value="392">일본 [JAPAN]</option><option value="388">자메이카 [JAMAICA]</option><option value="894">잠비아 [ZAMBIA]</option><option value="226">적도 기니 [EQUATORIAL GUINEA]</option><option value="268">조지아 [GEORGIA]</option><option value="140">중앙아프리카 공화국 [CENTRAL AFRICAN REPUBLIC]</option><option value="156">중국 [CHINA]</option><option value="262">지부티 [DJIBOUTI]</option><option value="716">짐바브웨 [ZIMBABWE]</option><option value="148">차드 [CHAD]</option><option value="203">체코 [CZECH REPUBLIC]</option><option value="152">칠레 [CHILE]</option><option value="120">카메룬 [CAMEROON]</option><option value="132">카보베르데 [CAPE VERDE]</option><option value="398">카자흐스탄 [KAZAKHSTAN]</option><option value="634">카타르 [QATAR]</option><option value="116">캄보디아 [CAMBODIA]</option><option value="124">캐나다 [CANADA]</option><option value="404">케냐 [KENYA]</option><option value="174">코모로 [COMOROS]</option><option value="188">코스타리카 [COSTA RICA]</option><option value="384">코트디부아르 [COTE D`IVOIRE]</option><option value="170">콜롬비아 [COLOMBIA]</option><option value="178">콩고 공화국 [CONGO]</option><option value="180">콩고 민주 공화국 [DEMOCRATIC REPUBLIC OF THE CONGO]</option><option value="192">쿠바 [CUBA]</option><option value="414">쿠웨이트 [KUWAIT]</option><option value="184">쿡 제도 [COOK ISLANDS]</option><option value="191">크로아티아 [CROATIA]</option><option value="417">키르기스스탄 [KYRGYZSTAN]</option><option value="296">키리바시 [KIRIBATI]</option><option value="196">키프로스 [CYPRUS]</option><option value="764">타이 [THAILAND]</option><option value="762">타지키스탄 [TAJIKISTAN]</option><option value="834">탄자니아 [TANZANIA, UNITED REPUBLIC OF]</option><option value="792">터키 [TURKEY]</option><option value="768">토고 [TOGO]</option><option value="776">통가 [TONGA]</option><option value="795">투르크메니스탄 [TURKMENISTAN]</option><option value="798">투발루 [TUVALU]</option><option value="788">튀니지 [TUNISIA]</option><option value="780">트리니다드 토바고 [TRINIDAD AND TOBAGO]</option><option value="591">파나마 [PANAMA]</option><option value="600">파라과이 [PARAGUAY]</option><option value="586">파키스탄 [PAKISTAN]</option><option value="598">파푸아 뉴기니 [PAPUA NEW GUINEA]</option><option value="585">팔라우 [PALAU]</option><option value="275">팔레스타인 [PALESTINE]</option><option value="604">페루 [PERU]</option><option value="620">포르투갈 [PORTUGAL]</option><option value="616">폴란드 [POLAND]</option><option value="250">프랑스 [FRANCE]</option><option value="242">피지 [FIJI]</option><option value="246">핀란드 [FINLAND]</option><option value="608">필리핀 [PHILIPPINES]</option><option value="348">헝가리 [HUNGARY]</option><option value="383">코소보 [KOSOVO]</option></select><span class="custom-combobox"><input title="" id="auto_slt_nation_cd" class="auto_slt_nation_cd custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th">여권번호(외국인) </td>
                                        <td>
                                            <input type="text" id="txt_inp1_ppt_no" class="txt_inp1_ppt_no width_100" maxlength="10" oninput="fn_withoutKo(this)" disabled="disabled">
                                        </td>
                                        <td class="fake_th">지원자직업 </td>
                                        <td>
                                                <span class="custom-select custom">
                                                    <span class="select_list">
                                                        <select id="slt_job_div" class="slt_job_div auto_combo" style="display: none;"><option value=" ">(미선택)</option>
<option value="10">통번역가</option>
<option value="20">직장인</option>
<option value="30">학생(졸업예정)</option>
<option value="40">학생(석사이상)</option>
<option value="50">유학생</option>
<option value="90">기타</option></select><span class="custom-combobox"><input title="" id="auto_slt_job_div" class="auto_slt_job_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                    </span>
                                                </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th">비자/만료일 </td>
                                        <td>
                                            <div class="flex">
                                                <div class="custom-select custom div_right_gap_06 width_50">
                                                        <span class="select_list">
                                                            <select id="slt_ppt_div" class="slt_ppt_div auto_combo" style="display: none;"><option value=" ">(미선택)</option><option value="0">없음</option><option value="1">외교(A-1)</option><option value="10">문화예술(D-1)</option><option value="11">유학(D-2)</option><option value="12">기술연수(D-3)</option><option value="13">일반연수(D-4)</option><option value="14">취재(D-5)</option><option value="15">종교(D-6)</option><option value="16">기업투자(D-8)</option><option value="17">무역경영(D-9)</option><option value="18">주재(D-7)</option><option value="19">구직(D-10)</option><option value="2">공무(A-2)</option><option value="20">교수(E-1)</option><option value="21">회화지도(E-2)</option><option value="22">연구(E-3)</option><option value="23">기술지도(E-4)</option><option value="24">전문직업(E-5)</option><option value="25">방문동거(F-1)</option><option value="26">거주(F-2)</option><option value="27">동반가족(F-3)</option><option value="28">재외동포(F-4)</option><option value="29">관광취업 (H-1)</option><option value="3">협정(A-3)</option><option value="30">예술흥행(E-6)</option><option value="31">특정활동(E-7)</option><option value="32">계절근로(E-8)</option><option value="33">비전문취업(E-9)</option><option value="34">선원취업(E-10)</option><option value="35">영주(F-5)</option><option value="36">결혼이민(F-6)</option><option value="37">기타(G-1)</option><option value="38">방문취업(H-2)</option><option value="4">사증면제(B-1)</option><option value="5">관광통과(B-2)</option><option value="6">일시취재(C-1)</option><option value="7">단기상용(C-2)</option><option value="8">단기종합(C-3)</option><option value="9">단기취업(C-4)</option></select><span class="custom-combobox"><input title="" id="auto_slt_ppt_div" class="auto_slt_ppt_div custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left ui-autocomplete-input" autocomplete="off" disabled="disabled"><a tabindex="-1" class="ui-button ui-widget ui-button-icon-only custom-combobox-toggle ui-corner-right custom-combobox-button-disabled" role="button"><span class="ui-button-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-button-icon-space"> </span></a></span>
                                                        </span>
                                                </div>
                                                <!-- <div class="bg-icon_calendar width_50">
                                                    <input type="date" id="cal_ppt_end_dt" class="cal_ppt_end_dt width_100">
                                                </div> -->
                                                <div class="multi_inputs width_50">
                                                    <input type="text" id="cal_ppt_end_dt" class="cal_ppt_end_dt txt_default cal_format_kr hasDatepicker" maxlength="10" autocomplete="off" disabled="disabled"><img class="ui-datepicker-trigger" src="/images/icon-calendar.svg" alt="..." title="...">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fake_th">지원자직업명 </td>
                                        <td>
                                            <input type="text" id="txt_inp1_job_nm" class="txt_inp1_job_nm width_100" maxlength="50" disabled="disabled">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th ">우편번호 </td>
                                        <td colspan="3">
                                            <div class="flex">
                                                <input type="text" placeholder="" id="txt_inp1_zip_cd" class="txt_inp1_zip_cd width_50 div_right_gap_06" disabled="disabled">
                                                <button id="btn_zip_cd" class="btn-default" title="검색" onclick="fn_inp1_zipcode_onclick()" disabled="disabled">검색</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th">주소(한국)</td>
                                        <td colspan="3"><input type="text" id="txt_inp1_addr_local" class="txt_inp1_addr_local width_100" maxlength="200" disabled="disabled"> </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th">주소(한국외)</td>
                                        <td colspan="3"><input type="text" id="txt_inp1_addr_natv" class="txt_inp1_addr_natv width_100" maxlength="200" disabled="disabled"> </td>
                                    </tr>
                                    <tr>
                                        <td class="fake_th ">전화번호(한국) </td>
                                        <td><input type="text" id="txt_inp1_tel_local" maxlength="20" oninput="fn_numSign(this)" disabled="disabled"></td>
                                        <td class="fake_th ">전화번호(한국외) </td>
                                        <td><input type="text" id="txt_inp1_tel_natv" maxlength="20" oninput="fn_numSign(this)" disabled="disabled"></td>
                                    </tr>
                                    <tr hidden="">
                                        <td><div id="txt_aply_no"></div></td>
                                        <td><div id="txt_mem_id"></div></td>
                                        <td><div id="txt_tab1_sel_cd"></div></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
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
                <div id="tab2_grid1" class="div_wrap_grid" style="height: auto; position: relative;"><div class="aui-grid" style="position: relative; box-sizing: content-box; overflow: hidden; width: 298px; height: 255px; touch-action: manipulation;"><div class="aui-grid-grouping-panel" style="display: none; position: absolute;"></div><input class="aui-textinputer" style="padding: 0px 4px; overflow: hidden; z-index: -1; position: fixed; width: 1px; height: 1px; left: -20000px; top: 0px;" type="text" autocomplete="off" aria-hidden="true"><div class="aui-grid-content-panel-mask" style="position: absolute; overflow: hidden; width: 298px; height: 241px; left: 0px; top: 0px;"><div style="position: absolute; width: 593px; height: 241px; transform: translate(0px, 0px);"><div class="aui-grid-main-panel" style="position: absolute; width: 593px; height: 241px; left: 0px; top: 0px;"><div class="aui-grid-header-panel" style="position: absolute; width: 593px; height: 40px; left: 0px; top: 0px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 192px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr style="height: 40px;"><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>학위구분</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>학위기관명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 184px;"><span>학과전공명</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>입학년월</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>졸업년월</span></div></td><td class="aui-grid-default-header"><div class="aui-grid-renderer-base aui-grid-header-renderer" style="padding: 0px 4px; overflow: hidden; overflow-wrap: normal; white-space: nowrap; max-height: 38px; width: 72px;"><span>졸업구분</span></div></td></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute; width: 593px; height: 201px; left: 0px; top: 40px;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 192px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th><th scope="col" style="visibility: hidden !important; margin: 0px !important; padding: 0px !important; font-size: 0px !important; line-height: 0 !important; width: 80px;"></th></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr><tr class="" style="height: 36px; display: none;"><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column align_left"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 184px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td><td class="aui-grid-default-column"><div class="aui-grid-renderer-base" style="padding: 0px 4px; overflow: hidden; white-space: nowrap; width: 72px;"></div></td></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none; width: 593px; height: 0px; left: 0px; top: 241px;"></div></div><div style="cursor: col-resize; display: block; position: absolute; left: 77px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 157px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 349px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 429px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 509px; top: 0px; width: 6px; height: 40px;"></div><div style="cursor: col-resize; display: block; position: absolute; left: 589px; top: 0px; width: 6px; height: 40px;"></div></div></div><div class="aui-grid-left-main-panel" style="overflow: hidden; position: absolute; display: none;"><div class="aui-grid-header-panel" style="position: absolute;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 40px;"></tr></tbody></table></div><div class="aui-grid-body-panel" style="overflow: hidden; position: absolute;"><table class="aui-grid-table" style="table-layout:fixed !important; width:0px !important"><tbody><tr style="border:0px none !important;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr><tr style="height: 36px;"></tr></tbody></table></div><div class="aui-grid-footer-panel" style="position: absolute; display: none;"></div></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; position: absolute; display: none; height: 40px;"></div><div class="aui-grid-fixed-column-rule" style="pointer-events: none; display: none; position: absolute;"></div><div class="aui-grid-fixed-row-rule" style="display: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-grid-selection-cell-border-lines" style="display: none; pointer-events: none; border: none; position: absolute;"></div><div class="aui-hscrollbar" style="position: absolute; display: block; width: 298px; height: 14px; left: 0px; top: 241px;"><div class="aui-scroll-track" style="position: absolute; left: 0px; top: 0px; width: 298px; height: 14px;"></div><div class="aui-scroll-thumb" style="position: absolute; display: block; left: 14px; top: 1px; width: 49px; height: 12px;"></div><div class="aui-scroll-up" style="position: absolute; display: block; left: 0px; top: 0px; width: 14px; height: 14px;"></div><div class="aui-scroll-down" style="position: absolute; display: block; left: 284px; top: 0px; width: 14px; height: 14px;"></div></div><div class="aui-vscrollbar" style="position: absolute; display: none;"><div class="aui-scroll-track" style="position: absolute;"></div><div class="aui-scroll-thumb" style="position: absolute;"></div><div class="aui-scroll-up" style="position: absolute;"></div><div class="aui-scroll-down" style="position: absolute;"></div></div><div style="display: none; z-index: 40; position: absolute;"></div><div class="aui-grid-info-layer" style="z-index: 1; position: absolute; display: none;"></div><div style="z-index: 1; position: absolute;"></div><div class="aui-grid-vertical-resizer-rule" style="width: 1px; height: 255px; left: 0px; top: 0px; display: none; position: absolute;"></div></div></div>
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
        <div id="tab6" aria-labelledby="btn_tab6" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
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

        function educationPeriodFormatter({ row }) {
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

        });
        grid.on('check', function (ev) {
            console.log('check', ev);
        });

        grid.on('uncheck', function (ev) {
            console.log('uncheck', ev);
        });
    });
</script>
</body>
</html>
