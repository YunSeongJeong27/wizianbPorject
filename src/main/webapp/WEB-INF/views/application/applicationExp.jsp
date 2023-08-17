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
    <title>경력사항</title>
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

        #add_expInfo, #save_btn{
            background: #003A78;
        }
        #edu_title h3{
            font-weight: bolder;
        }
        .exp_p{
            font-size: 13px;
            color: #245396;
            font-weight: bolder;
            margin-top: 0;
        }
        .btn-second{
            background: #e1e1e1;
        }
        .exp_form{
            white-space: nowrap;
        }

    </style>
</head>
<body>
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">경력사항</p>
            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item"><i class="fas fa-sharp fa-light fa-house"></i></li>
                    <li class="breadcrumb-item">원서작성</li>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">경력사항</li>
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
                        <a href="userInfo" class="active">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="userEdu">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="userExp">경력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="userIntroduce">자기소개서</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="edu_title" class="col-lg-9">
            <h3 class="mb-3">자바기반 풀스택 개발자 취업과정</h3>
            <div class="title mt-5 mb-1">
                경력사항
            </div>

            <form class="exp_form" action="" method="">
                <div id="again">
                    <%--추가할때 반복, 여기부터~--%>
                    <div id="repeat_form">
                        <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-dark btn-sm mb-2" id="delete_form">삭제</button>
                        </div>
                        <div class="border-top border-dark border-2">
                            <div class="row mt-3">
                                <div class="col-lg-2">근무처명</div>
                                <div class="col-lg-4">
                                    <input type="date" name="PLC_NM" value="" class="form-control">
                                </div>
                                <div class="col-lg-2">근무시작년월/종료년월</div>
                                <div class="col-lg-2">
                                    <input type="date" name="ST_DT" value="" class="form-control">
                                </div>
                                <div class="col-lg-2">
                                    <input type="date" name="END_DT" value="" class="form-control">
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-lg-2">근무처직무</div>
                                <div class="col-lg-4">
                                    <input name="PLC_JOB" type="text" class="form-control">
                                </div>
                                <div class="col-lg-2">특기사항</div>
                                <div class="col-lg-4">
                                    <input name="NOTE" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-lg-2">증명서파일등록</div>
                                <div class="col-lg-10">
                                    <div class="d-flex justify-content">
                                        <input name="gradFile" type="text" class="form-control me-1" disabled>
                                        <label class="btn btn-sm btn-outline-dark me-1">업로드</label>
                                        <button type="button" class="btn btn-sm btn-outline-dark me-1">다운로드</button>
                                        <button type="button" class="btn btn-sm btn-outline-dark">삭제</button>
                                    </div>
                                </div>
                            </div>
                            <div class="exp_p">
                                <p>※ 파일명규칙 : 기수명-성명-파일명.pdf</p>
                                <p>※ 경력증명 또는 작품증빙파일 등을 등록합니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <%--추가반복 여기까지--%>
                <%--추가할 폼위치--%>

                <div class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-dark" id="add_expInfo">이력추가</button>
                </div>

                <%--버튼--%>
                <div class="d-flex justify-content-between mt-5 ">
                    <button type="button" class="btn btn-second">이전</button>
                    <button type="button" id="save_btn" class="btn btn-dark">저장</button>
                    <button type="button" class="btn btn-second">저장 후 이동</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="jquery-3.6.4.js"></script>
<script>
    var idx=1;
    $(document).ready(function (){
        $("#add_expInfo").on('click',function () {
            idx++;
            var addform = $(this).closest("form");
            var addDiv = addform.find("#repeat_form:first").clone(true);

            addDiv.find('[name="PLC_NM"]').val("");
            addDiv.find('[name="ST_DT"]').val("");
            addDiv.find('[name="END_DT"]').val("");
            addDiv.find('[name="PLC_JOB"]').val("");
            addDiv.find('[name="NOTE"]').val("");
            addform.find("#again:first").append(addDiv);
            addDiv.addClass('dynamic_section');
        });

    });

    $(document).on('click', '#delete_form', function() {
        var section = $(this).closest("#repeat_form");

        // Check if the section is dynamically added or not
        if (section.hasClass('dynamic_section')) {
            section.remove();
        } else {
            section.find('[name="PLC_NM"]').val("");
            section.find('[name="ST_DT"]').val("");
            section.find('[name="END_DT"]').val("");
            section.find('[name="PLC_JOB"]').val("");
            section.find('[name="NOTE"]').val("");
        }
    });

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>