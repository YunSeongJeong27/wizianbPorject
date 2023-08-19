<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../user/header.jsp" %>
<html>
<head>
    <title>전형정보</title>
    <style>
        .contentWrap{
            border: 1px solid #DDD;
            border-top: 2px solid black;
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="m-5 mx-auto" style="width: 1400px;">
    <div>
        <div class="fw-bold fs-4 mb-3">
            ${courseName}
        </div>
        <div class="contentWrap p-4">
            <c:forEach items="${content}" var="content">
                <div class="fs-5 fw-bold m-2">모집전형안내</div>
                <div class="mx-2 my-4">${content.msgCont}</div>
            </c:forEach>
        </div>

        <form id="frm" method="get" class="d-flex justify-content-center m-5">
            <input type="hidden" value="${rcrtNo}">
            <div id="newUserBtn" class="btn text-white p-2 mx-1" style="background-color: #003A78; width: 150px;">지원서처음작성</div>
            <div id="existingUserBtn" class="btn text-white p-2 mx-1" style="background-color: #003A78; width: 150px;">기존회원작성</div>
        </form>
    </div>
</div>

<script>

    //이건 뭐지?
    const editedData = [
        { name: 'Updated Name 1', age: 30 },
        { name: 'Updated Name 2', age: 25 },
        // ... 편집된 데이터
    ];

    $.ajax({
        url: '/update-data',
        type: 'POST',
        contentType: 'application/json',
        data: editedData,
        success: function(response) {
            // 서버에서의 응답 처리
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });

    //상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })

    //userInfo 페이지 이동버튼
    const frm = document.getElementById("frm")
    const newUserBtn = document.getElementById("newUserBtn");
    const existingUserBtn = document.getElementById("existingUserBtn");
    newUserBtn.addEventListener("click", function(){
        frm.action = "/log";
        frm.submit();
    })
    existingUserBtn.addEventListener("click", function (){
        frm.action = "/userInfo";
        frm.submit();
    })
</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
