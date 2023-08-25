<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>자기소개서</title>
    <style>
        #save_btn {
            background: #003A78;
        }

        #introduce_title h3, #introduce_title .title {
            font-weight: bolder;
        }

        .btn-second {
            background: #e1e1e1;
        }

        #introduce_title p {
            color: red;
        }

        .intro_description {
            color: #646464;
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
                        <div id="breadcrumbDiv2" class="breadcrumb-item" style="cursor:pointer;">원서작성</div>
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">자기소개서</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100"
     style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="my-5 container">
    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userInfo" class="active">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userEdu">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userExp">경력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="/userIntroduce">자기소개서</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="introduce_title" class="col-lg-9">
            <h3 class="mb-3">자바기반 풀스택 개발자 취업과정</h3>
            <div class="title mt-5 mb-1">
                자기소개서
            </div>
            <p>자기소개서는 한글로만 입력바랍니다.</p>
            <br>

            <form class="introduce_form" action="/saveIntro" method="Post">
                <div id="repeat">
                    <%-- 문항반복시작--%>
                    <c:forEach items="${introduceList}" var="intro" varStatus="i">
                        <input type="hidden" name="rcrtNo" value="${intro.rcrtNo}">
                        <input type="hidden" name="aplyNo" value="${aplyNo}">
                        <div>
                            <input type="hidden" name="itemNo" value="${intro.itemNo}">
                            <input type="hidden" name="itemName" value="${intro.itemName}">
                            <div>${intro.itemName}[글자제한:${intro.maxChar}자]</div>
                            <div class="intro_description">- ${intro.itemExpl}</div>
                            <div id="text_box" class="form-floating">
                                <c:choose>
                                    <c:when test="${empty intro.answer}">
                                        <textarea id="text_content${i.index}" name="answer" class="form-control" style="height: 150px; resize: none;"></textarea>
                                    </c:when>
                                    <c:otherwise>
                                        <textarea id="text_content${i.index}" name="answer" class="form-control" style="height: 150px; resize: none;">${intro.answer}</textarea>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="d-flex justify-content-end">
                                <span id="text_count${i.index}">[0/</span>
                                <c:set var="maxLength" value="${intro.maxChar}"/>
                                <span id="max_length_${i.index}" style="display: none;">${intro.maxChar}</span>
                                <span>${maxLength} 자]</span>
                            </div>
                        </div>
                    </c:forEach>
                    <%--반복문끝--%>
                </div>
                <%--버튼--%>
                <div class="d-flex justify-content-between mt-5">
                    <button type="button" class="btn btn-second">이전</button>
                    <button type="submit" id="save_btn" class="btn btn-dark">저장</button>
                    <button type="button" class="btn btn-second">작성완료</button>
                </div>
            </form>

        </div>
    </div>
</div>

<script>
    <c:forEach items="${introduceList}" var="intro" varStatus="i">
    $('#text_content${i.index}').keyup(function () {
        var content = $(this).val();
        $('#text_count${i.index}').html('[' + content.length + "/");

        var maxLengthElement = document.getElementById('max_length_${i.index}');
        var ml = parseInt(maxLengthElement.innerText, 10);

        if (content.length > ml) {
            alert("최대 " + ml + "자까지 입력 가능합니다.");
            $(this).val(content.substring(0, ml));
            $('#text_count${i.index}').html('[' + ml + "/");
        }
    });
    </c:forEach>

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    const breadcrumbDiv2 = document.getElementById("breadcrumbDiv2");
    const breadcrumbDiv3 = document.getElementById("breadcrumbDiv3");
    breadcrumbDiv1.addEventListener("click", function () {
        window.location.href = "/app";
    })
    breadcrumbDiv2.addEventListener("click", function () {
        window.location.href = "/userInfo";
    })
    breadcrumbDiv3.addEventListener("click", function () {
        window.location.href = "/userIntroduce";
    })

</script>
</body>
</html>
<%@include file="../user/footer.jsp" %>
