<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <%--애니메이션--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        #containerTest {
            display: flex;
            flex-direction: column;
            height: 100%; /* 뷰포트 높이를 사용하여 전체 화면 높이 채우기 */
            width: 90%;
        }

        #block1 {
            height: 50px;
            background-color: #F2F7FF;
            border-bottom: 1px solid #D1D1D1;
        }

        #block2 {
            flex-grow: 1; /* 남은 공간에 block2의 크기를 확장 */
        }

        #iframe {
            width: 100%;
            height: 100%;
        }

        .btn-lf:hover {
            background-color: #D1D1D1;
            color: #245396;
            font-weight: 600;
        }

        .btn-lf:hover span {
            color: initial;
        }

        .btn-lf.menuActive {
            background-color: #F2F7FF;
            color: #245396;
            font-weight: 600;
        }
    </style>
</head>

<body>
<div class="d-flex" style="height: calc(100vh - 108px);">
    <!-- 왼 -->
    <div style="width: 250px; height: 100%;">
        <div class="d-flex p-2 shadow-sm" style="height: 50px;">
            <div class="col-10">
                <input class="form-control h-100" type="text" placeholder="검색어를 입력하세요">
            </div>
            <div class="btn border col-2 p-0 py-2">
                <i class="bi bi-search"></i>
            </div>
        </div>
        <div class="p-2 shadow-sm" style="height: calc(100% - 50px); overflow-y: auto;">
            <div class="w-100">
                <div class="px-2 py-1 w-100 fw-bold text-start btn-lf iconWrap btn" id="indexBtn"
                     onclick="indexBtn(this)">
                    <span class="bi bi-folder2"></span>
                    입학관리
                </div>
                <div class="d-none animate__animated">
                    <div class="ms-4">
                        <div class="px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start btn" onclick="indexBtn(this)">
                            <span class="bi bi-folder2"></span>
                            기수정보
                        </div>
                        <div class="ms-4 d-none animate__animated">
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('info', this)">
                                모집기수정보
                            </div>
                        </div>
                    </div>

                    <div class="ms-4">
                        <div class="px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start btn" onclick="indexBtn(this)">
                            <span class="bi bi-folder2"></span>
                            모집전형설정
                        </div>
                        <div class="ms-4 d-none animate__animated">
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('mozip', this)">
                                모집전형전형정보
                            </div>
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('notice', this)">
                                모집전형안내문관리
                            </div>
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('monhang', this)">
                                자기소개서문항관리
                            </div>
                        </div>
                    </div>

                    <div class="ms-4">
                        <div class="px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start btn" onclick="indexBtn(this)">
                            <span class="bi bi-folder2"></span>
                            원서접수관리
                        </div>
                        <div class="ms-4 d-none animate__animated">
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('apply_ex', this)">
                                지원서관리
                            </div>
                        </div>
                    </div>

                    <div class="ms-4">
                        <div class="px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start btn" onclick="indexBtn(this)">
                            <span class="bi bi-folder2"></span>
                            평가관리
                        </div>
                        <div class="ms-4 d-none animate__animated">
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn"
                                 onclick="index('applicationPass', this)">서류전형합격사정
                            </div>
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn"
                                 onclick="index('nthEvResults', this)">면접평가결과등록
                            </div>
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn"
                                 onclick="index('interviewPass', this)">면접전형합격사정
                            </div>
                            <div class="px-2 py-1 mt-1 w-100 btn-lf text-start btn" onclick="index('finalPass', this)">
                                최종합격자명부
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 오 -->

    <div id="containerTest">
        <div class="container-topmenutab">
            <div class="wrap-topmenutab">
                <ul id="tabButtons">
                </ul>
            </div>
            <div class="topmenutab-btns">

                <button onclick="fn_closeAllTab_onclick(event)" title="모두 지우기" class="btn_deleteMenu topmenutabBtn"><img
                        src="/images/icon-deleteMenu.png" alt="메뉴 전체 닫기"></button>
            </div>
        </div>
        <div id="block2">
            <iframe src="/info" id="iframe"></iframe>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var prevMenu = "";

    function index(address, e) {
        var iframe = document.getElementById("iframe");
        iframe.setAttribute("src", address);

        if (prevMenu !== "") {
            console.log(prevMenu);
            prevMenu.classList.remove("menuActive")
        }
        e.classList.add("menuActive");
        prevMenu = e;
    }

    function indexBtn(e) {
        var sibling = e.nextElementSibling;
        var siblingSpan = e.querySelector('span');
        //닫기
        if (sibling.classList.contains("indexBtnCheck")) {
            sibling.classList.remove("indexBtnCheck");
            sibling.classList.remove("animate__fadeIn");
            sibling.classList.add("animate__fadeOut");
            siblingSpan.classList.remove("bi-folder2-open");
            siblingSpan.classList.add("bi-folder2");
            setTimeout(function () {
                sibling.classList.add("d-none");
            }, 500);
        }
        //열기
        else {
            sibling.classList.remove("d-none");
            sibling.classList.add("indexBtnCheck");
            sibling.classList.remove("animate__fadeOut");
            sibling.classList.add("animate__fadeIn");
            siblingSpan.classList.remove("bi-folder2");
            siblingSpan.classList.add("bi-folder2-open");
        }
    }
</script>
</body>
</html>