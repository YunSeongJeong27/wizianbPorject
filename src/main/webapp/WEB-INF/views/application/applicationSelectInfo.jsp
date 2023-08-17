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
        #save_btn,#saveFirst_btn{
            background: #003A78;
        }
        #selecInfo_content{
            border-style: solid;
            border-width: 3px 1px 1px 1px;
            border-color: rgba(0,0,0,.5);
            border-top-color: #000000;
        }
        #selecInfo_title{
            font-weight: bolder;
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

<div class="container-lg">
    <div>
        <div id="selecInfo_title" class="pb-2 mb-4 mb-0 mt-3">
            <h3>자바기반 풀스택 개발자 취업과정</h3>
        </div>
        <div id="selecInfo_content" class="mt-0 p-5" >
            <div>
                모집전형안내(타이틀받아오기)
            </div>
            <div>
                내용받아오기
            </div>
        </div>

        <div class="d-flex justify-content-center m-5">
            <button type="button" id="saveFirst_btn" class="btn btn-dark me-3 p-2">지원서처음작성</button>
            <button type="button" id="save_btn" class="btn btn-dark p-2">기존회원작성</button>
        </div>
    </div>
</div>
<script>
    const save_btn = document.getElementById("save_btn");
    save_btn.addEventListener("click", function(){
        window.location.href = "/userInfo";
    })

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
