<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>자기소개서</title>
    <style>
        #save_btn{
            background: #003A78;
        }
        #introduce_title h3, #introduce_title .title{
            font-weight: bolder;
        }

        .btn-second{
            background: #e1e1e1;
        }
        #introduce_title p{
            color: red;
        }
        .intro_description{
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
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

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


            <form class="introduce_form" action="/saveIntroduce" method="Post">
                <div id="repeat">
                    <%-- 문항반복시작--%>
                    <div>
                        <div>▶(한국어)지원동기[글자제한:2000자]</div>
                        <div class="intro_description">- 번역 및 한국문학에 관심을 가지게 된 계기 등을 위주로 기술</div>
                        <div id="text_box" class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here"  style="height: 150px; resize: none;"></textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <span id="text_count">[0/</span>
                            <span id="maxLength">2000</span>
                            <span> 자]</span>
                        </div>
                    </div>
                    <%--문항반복끝--%>
                    <div class="mt-3">
                        <div>▶문항명 [글자제한: '최대허용글자수'자]</div>
                        <div class="intro_description">- 문항설명</div>
                        <div class="form-floating"><%--id값 주기. id="text_box--%>
                            <textarea class="form-control" placeholder="Leave a comment here" style="height: 150px; resize: none;">답변내용</textarea>
                        </div>
                        <div class="d-flex justify-content-end">
                            <span>[0/</span><%--id값 주기. id="text_count--%>
                            <span>최대허용글자수</span>
                            <span> 자]</span>
                        </div>
                    </div>

                </div>
                <%--버튼--%>
                <div class="d-flex justify-content-between mt-5">
                    <button type="button" class="btn btn-second">이전</button>
                    <button type="button" id="save_btn" class="btn btn-dark">저장</button>
                    <button type="button" class="btn btn-second">저장 후 이동</button>
                </div>
            </form>

        </div>
    </div>
</div>

<script>
    $('#text_box textarea').keyup(function () {
       var content = $(this).val();
        $('#text_count').html('['+content.length+"/");

        var maxLengthElement = document.getElementById('maxLength');
        var ml = parseInt(maxLengthElement.innerText, 10);

        if (content.length > ml){
            alert("최대 "+ml+"자까지 입력 가능합니다.");
            $(this).val(content.substring(0, ml));
            $('#text_count').html('['+ml+"/");
        }
    });

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    const breadcrumbDiv2 = document.getElementById("breadcrumbDiv2");
    const breadcrumbDiv3 = document.getElementById("breadcrumbDiv3");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
    breadcrumbDiv2.addEventListener("click",function(){
        window.location.href = "/userInfo";
    })
    breadcrumbDiv3.addEventListener("click",function(){
        window.location.href = "/userIntroduce";
    })
</script>
</body>
</html>
<%@include file="../user/footer.jsp" %>
