<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin/header.jsp"%>
<html>
<head>
    <title>Title</title>

    <style>
        .btn-lf:hover{
            background-color: #D1D1D1;
            color: blue;
        }
        .btn-lf:hover span {
            color: initial;
        }
        .indexDiv{
            cursor: pointer;
        }
    </style>
</head>

<body>
<div class="d-flex">
    <!-- 왼 -->
    <div style="width: 300px; height: 100vh;">
        <div class="d-flex p-2 shadow-sm" style="height: 6%;">
            <div class="col-10">
                <input class="form-control h-100" type="text" placeholder="검색어를 입력하세요">
            </div>
            <div class="btn border col-2 p-0 py-2">
                <i class="bi bi-search"></i>
            </div>
        </div>
        <div class="p-2 shadow-sm" style="height: 93%;">
            <div class="accordion" id="accordionWrap">
                <div class="w-100 accordion-item">
                    <button class="p-2 w-100 fw-bold text-start btn-lf navbar-toggler" data-bs-toggle="collapse" data-bs-target="#accordionEnt" aria-controls="accordionEnt" aria-expanded="true" onclick="folder(this)">
                        <span class="bi bi-folder2"></span>
                        입학관리
                    </button>
                    <div class="collapse accordion-collapse show ms-4" id="accordionEnt" data-bs-parent="#accordionWrap">
                        <div class="accordion" id="accEntSelWrap">
                            <div class="accordion-item border-0">
                                <button class="nav-link px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start" data-bs-toggle="collapse" data-bs-target="#accEntSel1" aria-controls="accEntSel1" aria-expanded="true" onclick="folder(this)">
                                    <span class="bi bi-folder2"></span>
                                    기수정보
                                </button>
                                <div class="collapse accordion-collapse ms-4" id="accEntSel1">
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index('info')">모집기수정보</div>
                                </div>
                            </div>

                            <div class="accordion-item border-0">
                                <button class="nav-link px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start collapsed" data-bs-toggle="collapse" data-bs-target="#accEntSel2" aria-controls="accEntSel2" aria-expanded="false" onclick="folder(this)">
                                    <span class="bi bi-folder2"></span>
                                    모집전형설정
                                </button>
                                <div class="collapse accordion-collapse ms-4" id="accEntSel2">
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index('mozip')">모집전형정보</div>
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index('notice')">모집전형안내문관리</div>
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index('monhang')">자기소개서문항관리</div>
                                </div>
                            </div>

                            <div class="accordion-item border-0">
                                <button class="nav-link px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start collapsed" data-bs-toggle="collapse" data-bs-target="#accEntSel3" aria-controls="accEntSel3" aria-expanded="false" onclick="folder(this)">
                                    <span class="bi bi-folder2"></span>
                                    원서접수관리
                                </button>
                                <div class="collapse accordion-collapse ms-4" id="accEntSel3">
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index('apply')">원서접수관리</div>
                                </div>
                            </div>

                            <div class="accordion-item border-0">
                                <button class="nav-link px-2 py-1 mt-1 w-100 btn-lf fw-bold text-start collapsed" data-bs-toggle="collapse" data-bs-target="#accEntSel4" aria-controls="accEntSel4" aria-expanded="false" onclick="folder(this)">
                                    <span class="bi bi-folder2"></span>
                                    평가관리
                                </button>
                                <div class="collapse accordion-collapse ms-4" id="accEntSel4">
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index()">서류전형합격사정</div>
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index()">면접전형합격사정</div>
                                    <div class="nav-link p-1 btn-lf indexDiv" onclick="index()">최종합격자명부</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 오 -->
    <div style="width: 100%">
        <iframe style="width: 100%; height: 100%" src="/info" id="iframe"></iframe>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function index(address){
        var iframe = document.getElementById("iframe");
        iframe.setAttribute("src",address);
    }

    function folder(e) {
        var span = e.getElementsByTagName("span")[0];
        if (span.classList.contains("bi-folder2-open")) {
            span.classList.remove("bi-folder2-open");
            span.classList.add("bi-folder2");
        } else {
            span.classList.remove("bi-folder2");
            span.classList.add("bi-folder2-open");
        }
        console.log(e);
        var test = e.nextSibling;
        console.log(test.id);

    }

</script>
</body>
<%@include file="../user/footer.jsp"%>
</html>