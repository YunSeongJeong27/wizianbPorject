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
        .breadcrumbs,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-title {
            font-size: 36px;
            font-weight: 600;
        }

        .breadcrumbs li {
            display: inline-block;
            font-size: 13px;
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

        #apply_current {
            font-weight: bolder;
        }

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
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">자기소개서</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item"><i class="fas fa-sharp fa-light fa-house"></i></li>
                    <li class="breadcrumb-item">원서작성</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">자기소개서</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<img id="img1"  src="https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg" alt="keyboard-5017973-1920" >

<div class="my-5 container">
    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="#">경력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="#" class="active">자기소개서</a>
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


            <form class="introduce_form" action="" method="">
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
</script>
</body>
</html>
<%@include file="../user/footer.jsp" %>
