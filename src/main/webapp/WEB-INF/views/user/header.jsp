<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오전 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        *{
            padding: 0;
            margin: 0;
        }
        a{
            text-decoration: none;
        }
        .nav{
            --bs-nav-link-color: black !important;
            --bs-nav-link-hover-color: black;
        }
    </style>
</head>

<body>
<div class="border-bottom border-3">
    <div class="d-flex justify-content-between align-items-center mx-auto" style="width: 1440px; height: 105px;">
        <div id="logo" class="h-100 col-3" style="background-image: url(https://i.ibb.co/MfHDQ8C/image.png); background-size: contain; background-repeat: no-repeat; cursor: pointer"></div>
        <div class="h-50 col-4 d-flex nav nav-underline fs-4 fw-bold text-center">
            <div class="nav-item" style="width: 31%;">
                <a href="/app" class="nav-link">원서작성</a>
            </div>
            <div class="nav-item dropdown" style="width: 31%;">
                <a href="/checked" class="nav-link" id="navbarDropdown" role="button">마이페이지</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="/checked">지원서확인</a></li>
                    <li><a class="dropdown-item" id="checkedAnchor" href="#second-tap">추가제출서류</a></li>
                </ul>
            </div>
            <div class="nav-item" style="width: 31%;">
                <a href="/pass" class="nav-link">합격자발표</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const logo = document.getElementById("logo");
    logo.addEventListener("click", function(){
        window.location.href = "/app";
    })

    $(document).ready(function () {
        $('.nav-item.dropdown').hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown('fast');
                $(this).addClass('show');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp('fast');
                $(this).removeClass('show');
            }
        );
    });

    const checkedAnchor = document.querySelector('#checkedAnchor');

    checkedAnchor.addEventListener('click', function(e) {
        // 링크의 기본 동작(새로운 페이지 열기) 방지
        e.preventDefault();
        // 이벤트가 발생한 <a> 태그의 href 속성 값 선택
        // const targetHref = this.getAttribute('href');
        // const targetAnchor = "a[href="+targetHref+"]" ;
        // 첫 번째 <a> 태그의 href 속성과 일치하는 두 번째 <a> 태그 선택
        const applicationCheckedLink = document.querySelectorAll('a[href="#second-tap"]');
        // 두 번째 <a> 태그의 클릭 이벤트 호출
        applicationCheckedLink[1].click();
    });
</script>
</body>
</html>