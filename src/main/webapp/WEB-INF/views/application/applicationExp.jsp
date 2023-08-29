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
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">경력사항</div>
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
                        <a href="/userInfo/${rcrtNo}">기본정보</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userEdu/${rcrtNo}/${aplyNo}">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userExp/${rcrtNo}/${aplyNo}" class="active">경력사항</a>
                    </li>
                    <li class="py-2">
                        <a href="/userIntroduce/${rcrtNo}/${aplyNo}">자기소개서</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="edu_title" class="col-lg-9">
            <h3 class="mb-3">${courseName}</h3>
            <div class="title mt-5 mb-1">
                경력사항
            </div>

            <form class="exp_form" action="/userExp/${rcrtNo}/${aplyNo}" method="POST">
                <div id="again">
                    <%--추가할때 반복, 여기부터~--%>
                    <c:forEach var="exp" items="${expList}">
                        <div id="repeat_form">
                        <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-dark btn-sm mb-2" id="delete_form">삭제</button>
                        </div>
                        <div class="border-top border-dark border-2">
                            <input type="hidden" value="${exp.careerSeq}" name="careerSeq">
                            <div class="row mt-3">
                                <div class="col-lg-2">근무처명</div>
                                <div class="col-lg-4">
                                    <input type="text" name="plcName" value="${exp.plcName}" class="form-control">
                                </div>
                                <div class="col-lg-2">근무시작년월/종료년월</div>
                                <div class="col-lg-2">
                                    <input type="date" name="startDate" value="${exp.startDate}" class="form-control">
                                </div>
                                <div class="col-lg-2">
                                    <input type="date" name="endDate" value="${exp.endDate}" class="form-control">
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-lg-2">근무처직무</div>
                                <div class="col-lg-4">
                                    <input name="plcJob" type="text" class="form-control" value="${exp.plcJob}">
                                </div>
                                <div class="col-lg-2">특기사항</div>
                                <div class="col-lg-4">
                                    <input name="note" type="text" class="form-control" value="${exp.note}">
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
                    </c:forEach>
                </div>
                <%--추가반복 여기까지--%>
                <%--추가할 폼위치--%>

                <div class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-dark" id="add_expInfo">이력추가</button>
                </div>

                <%--버튼--%>
                <div class="d-flex justify-content-between mt-5 ">
                    <button type="button" class="btn btn-second">이전</button>
                    <button type="submit" id="save_btn" class="btn btn-dark">저장</button>
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

            addDiv.find('[name="careerSeq"]').val("");
            addDiv.find('[name="plcName"]').val("");
            addDiv.find('[name="startDate"]').val("");
            addDiv.find('[name="endDate"]').val("");
            addDiv.find('[name="plcJob"]').val("");
            addDiv.find('[name="note"]').val("");
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
            section.find('[name="careerSeq"]').val("");
            section.find('[name="plcName"]').val("");
            section.find('[name="startDate"]').val("");
            section.find('[name="endDate"]').val("");
            section.find('[name="plcJob"]').val("");
            section.find('[name="note"]').val("");
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
        window.location.href = "/userExp";
    })

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>