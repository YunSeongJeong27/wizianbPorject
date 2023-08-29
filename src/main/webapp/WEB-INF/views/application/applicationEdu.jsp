<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-10
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>학력사항</title>
    <style>

        #add_eduInfo, #save_btn{
            background: #003A78;
        }
        #edu_title h3{
            font-weight: bolder;
        }
        #edu_p{
            font-size: 13px;
            color: #245396;
            font-weight: bolder;
            margin-top: 0;
        }
        .btn-second{
            background: #e1e1e1;
        }
        .edu_form{
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
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">학력사항</div>
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
                        <a href="/userEdu/${rcrtNo}/${aplyNo}" class="active">학력사항</a>
                    </li>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/userExp/${rcrtNo}/${aplyNo}">경력사항</a>
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
                학력사항
            </div>

            <form class="edu_form" action="/userEdu/${rcrtNo}/${aplyNo}" method="POST">
                <div id="again">
                    <c:forEach var="edu" items="${eduList}">
                        <%--추가할때 반복, 여기부터~--%>
                        <div id="repeat_form">
                            <div class="d-flex justify-content-end mt-5">
                                <button type="button" class="btn btn-dark btn-sm mb-2" id="delete_form">삭제</button>
                            </div>
                            <div class="border-top border-dark border-2">
                                <input type="hidden" value="${edu.acdmSeq}" name="acdmSeq">
                                <div class="row mt-3">
                                    <div class="col-lg-2">학위구분</div>
                                    <div class="col-lg-2">
                                        <select class="form-select" name="gradeDiv">
                                            <option <c:if test="${edu.gradeDiv == ''}">selected</c:if>></option>
                                            <option <c:if test="${edu.gradeDiv == '학사학위'}">selected</c:if>>학사학위</option>
                                            <option <c:if test="${edu.gradeDiv == '석사학위'}">selected</c:if>>석사학위</option>
                                            <option <c:if test="${edu.gradeDiv == '박사학위'}">selected</c:if>>박사학위</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">
                                        <select class="form-select" name="gradeStatusDiv">
                                            <option <c:if test="${edu.gradeStatusDiv == ''}">selected</c:if>></option>
                                            <option <c:if test="${edu.gradeStatusDiv == '졸업'}">selected</c:if>>졸업</option>
                                            <option <c:if test="${edu.gradeStatusDiv == '졸업예정'}">selected</c:if>>졸업예정</option>
                                            <option <c:if test="${edu.gradeStatusDiv == '재학'}">selected</c:if>>재학</option>
                                            <option <c:if test="${edu.gradeStatusDiv == '수료'}">selected</c:if>>수료</option>
                                            <option <c:if test="${edu.gradeStatusDiv == '중퇴'}">selected</c:if>>중퇴</option>
                                            <option <c:if test="${edu.gradeStatusDiv == '편입'}">selected</c:if>>편입</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2">입학년월/졸업년월</div>
                                    <div class="col-lg-2">
                                        <input type="date" name="startDate" value="${edu.startDate}" class="form-control">
                                    </div>
                                    <div class="col-lg-2">
                                        <input type="date" name="endDate" value="${edu.endDate}" class="form-control">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-lg-2">학위기관명</div>
                                    <div class="col-lg-4">
                                        <input name="orgName" type="text" class="form-control" value="${edu.orgName}">
                                    </div>
                                    <div class="col-lg-2">학과/전공명</div>
                                    <div class="col-lg-4">
                                        <input name="deptName" type="text" class="form-control" value="${edu.deptName}">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-lg-2">학위증명서파일등록</div>
                                    <div class="col-lg-10">
                                        <div class="d-flex justify-content">
                                            <input name="gradFile" id="gradFile" type="text" class="form-control me-1" disabled>
                                            <label for="addFile" class="btn btn-sm btn-outline-dark me-1">업로드</label>
                                            <input type="file" id="addFile" onchange="uploadFile()" style="display: none">
                                            <button type="button" class="btn btn-sm btn-outline-dark me-1">다운로드</button>
                                            <button type="button" class="btn btn-sm btn-outline-dark">삭제</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <p id="edu_p">※파일명규칙:기수명-성명-파일명.pdf</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%--추가반복 여기까지--%>
                <%--추가할 폼위치--%>

                <div class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-dark" id="add_eduInfo">학력추가</button>
                </div>

                <%--버튼--%>
                <div class="d-flex justify-content-between mt-5 ">
                    <button type="button" class="btn btn-second">이전</button>
                    <button type="submit" id="save_btn" class="btn btn-dark">저장</button>
                    <button type="button" class="btn btn-second">저장 후 이동</button>
                </div>
        </div>
        </form>
    </div>
</div>
</div>
<script src="jquery-3.6.4.js"></script>
<script>
    var idx=1;
    $(document).ready(function (){
        $("#add_eduInfo").on('click',function () {
            idx++;
            var addform = $(this).closest("form");
            var addDiv = addform.find("#repeat_form:first").clone(true);

            addDiv.find('[name="acdmSeq"]').val("");
            addDiv.find('[name="gradeDiv"]').val("");
            addDiv.find('[name="gradeStatusDiv"]').val("");
            addDiv.find('[name="startDate"]').val("");
            addDiv.find('[name="endDate"]').val("");
            addDiv.find('[name="orgName"]').val("");
            addDiv.find('[name="deptName"]').val("");
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
            section.find('[name="acdmSeq"]').val("");
            section.find('[name="gradeDiv"]').val("");
            section.find('[name="gradeStatusDiv"]').val("");
            section.find('[name="startDate"]').val("");
            section.find('[name="endDate"]').val("");
            section.find('[name="orgName"]').val("");
            section.find('[name="deptName"]').val("");
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
        window.location.href = "/userEdu";
    })

    function uploadFile() {
        var gradFileInput = document.getElementById('gradFile');
        var addFile = document.getElementById('addFile');

        var formData = new FormData();
        formData.append("file",gradFileInput.files[0]);

        $.ajax({
            url: '/uploadFile',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log("컨트롤러로 보내기성공")
                gradFileInput.value = response.fileName; // response에서 실제 파일명 필드에 따라 수정
            },
            error: function(error) {
                console.log(error)
            }
        });

    }

</script>
<%@include file="../user/footer.jsp" %>
</body>