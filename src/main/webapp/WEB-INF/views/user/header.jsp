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

        .page-title {
            font-size: 30px;
            font-weight: 600;
        }
        .breadcrumb,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .breadcrumb li {
            display: inline-block;
            font-size: 12px;
        }
        .menu ul li a {
            display: inline-block;
            color: #646464;
            padding: 10px;
            font-weight: 600;
        }
        .menu ul li a.active {
            color: #003A78;
        }
        .breadcrumb {
            --bs-breadcrumb-item-padding-x: 15px !important;
        }
    </style>
</head>

<body>
<div class="border-bottom border-3">
    <div class="d-flex justify-content-between align-items-center mx-auto" style="width: 1440px; height: 105px;">
        <div id="logo" class="h-75 col-3" style="background-image: url(https://www.choongang.co.kr/img/new/logo_new.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;"></div>
        <div class="h-50 col-4 d-flex nav nav-underline fs-4 fw-bold text-center">
            <div class="nav-item" style="width: 31%;">
                <a href="/app" class="nav-link headerBtn">원서작성</a>
            </div>
            <div class="nav-item dropdown" style="width: 31%;">
                <a href="/checked" class="nav-link headerBtn" id="navbarDropdown" role="button">마이페이지</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item headerBtn" href="/checked">지원서확인</a></li>
                    <li><a class="dropdown-item headerBtn" id="checkedAnchor" href="#">추가제출서류</a></li>
                </ul>
            </div>
            <div class="nav-item" style="width: 31%;">
                <a href="/pass" class="nav-link headerBtn">합격자발표</a>
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
        applicationCheckedLink[0].click();
    });


    // var headerBtn = document.querySelectorAll(".headerBtn");
    // headerBtn.forEach(function(Btn){
    //     Btn.addEventListener("click", function(e){
    //          //e.preventDefault()
    //         const breadCrumb = document.getElementById("breadCrumb")
    //         function breadCrumb1(text1, controller1){
    //             const createDiv = document.createElement("div");
    //             createDiv.className = "breadcrumb-item";
    //             createDiv.id = "breadCrumb1";
    //             createDiv.style.cursor = "pointer";
    //             breadCrumb.appendChild(createDiv);
    //             const breadCrumb1 = document.getElementById("breadCrumb1");
    //             breadCrumb1.textContent = text1;
    //             breadCrumb1.addEventListener("click",function(){
    //                 window.location.href = controller1;
    //             });
    //         }
    //         function breadCrumb2(text2, controller2){
    //             const createDiv = document.createElement("div");
    //             createDiv.className = "breadcrumb-item fw-bold";
    //             createDiv.id = "breadCrumb2";
    //             createDiv.style.cursor = "pointer";
    //             breadCrumb.appendChild(createDiv);
    //             const breadCrumb2 = document.getElementById("breadCrumb2");
    //             breadCrumb2.textContent = text2;
    //             breadCrumb2.addEventListener("click",function(){
    //                 window.location.href = controller2;
    //             })
    //         }
    //         function breadCrumbRemove(){
    //             const breadCrumb1 = document.getElementById("breadCrumb1");
    //             const breadCrumb2 = document.getElementById("breadCrumb2");
    //             if (breadCrumb1) {
    //                 breadCrumb.removeChild(breadCrumb1);
    //             }
    //             if (breadCrumb2) {
    //                 breadCrumb.removeChild(breadCrumb2);
    //             }
    //         }
    //
    //         switch (Btn.innerHTML){
    //             case "원서작성" :
    //                 break;
    //             case "마이페이지" :
    //                 breadCrumb1("마이페이지", "/checked");
    //                 breadCrumb2("지원서확인", "/checked");
    //                 break;
    //             case "지원서확인" :
    //                 breadCrumb1("마이페이지","/checked");
    //                 breadCrumb2("지원서확인","/checked")
    //                 break;
    //             case "추가제출서류" :
    //                 breadCrumb1("마이페이지","/checked");
    //                 breadCrumb2("추가제출서류","/checked");
    //                 break;
    //             case "합격자발표" :
    //                 breadCrumb1("합격자발표","/pass");
    //                 breadCrumb2("합격자발표","/pass");
    //                 break;
    //
    //         }
    //     })
    // })

</script>
</body>
</html>