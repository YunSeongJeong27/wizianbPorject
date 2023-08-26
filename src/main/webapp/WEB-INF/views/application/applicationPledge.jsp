<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>등록서약/포기</title>
    <script src="jquery-3.6.4.js"></script>
    <style>
        #radioBox{
            display: inline-block;
        }
        #noticeBox{
            text-align: center;
            padding: 20px;
        }
        #save_btn{
            background: #003A78;
        }
        #giveupReason{
            height: 150px;
            border-style: none;
            resize: none;
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
                        <div id="breadcrumbDiv2" class="breadcrumb-item" style="cursor:pointer;">합격자발표</div>
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">등록서약/포기</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="container-lg mt-5">
    <div>
        <form>
            <div id="noticeBox" class="row border border-1 m-1">
                <div class="pledgeNotice">
                    '${course.courseName}'을 수강하겠습니다.
                </div>
                <div class="pledgeNotice">
                    [교육기간 : ${course.eduStartDate}~${course.eduEndDate}(예정)]
                </div>
            </div>

            <%--라디오버튼--%>
            <div id="radioBox" class="d-flex justify-content-center">
                <label><input type="radio" id="radio_yes" name="pledge" value="Y" checked>예(YES)</label>
                <label><input type="radio" id="radio_no" class="ms-5" name="pledge" value="N">아니오(NO)</label>
            </div>

            <%--등록포기 선택시, 보여지는 div--%>
            <div id="select_no" style="display: none">
                <div class="border border-1 p-3 mt-3 mb-3 text-center">
                    등록을 포기하고자하는 사유를 제출하며 불합격 처리에 대한 이의를 제기하지 아니할 것을 서약합니다.
                </div>
                <div id="text_box" class="form-floating border border-1 p-3 mt-3 mb-3 text-center">
                    <textarea id="giveupReason" class="form-control" placeholder="Leave a comment here"></textarea>
                </div>
            </div>

            <%--버튼--%>
            <div class="d-flex justify-content-center m-5">
                <button type="button" id="saveBtn" class="btn btn-dark">제출</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(function (){
        $('input:radio[id=radio_no]').on('click', function(){
            if($('input:radio[id=radio_no]:checked')){
                $('#select_no').show();
            }
        });
        $('input:radio[id=radio_yes]').on('click', function(){
            if($('input:radio[id=radio_yes]:checked')){
                $('#select_no').hide();
            }
        });
    });

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    const breadcrumbDiv2 = document.getElementById("breadcrumbDiv2");
    const breadcrumbDiv3 = document.getElementById("breadcrumbDiv3");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
    breadcrumbDiv2.addEventListener("click",function(){
        window.location.href = "/pass";
    })
    breadcrumbDiv3.addEventListener("click",function(){
        window.location.href = "/pledge";
    })

    // 제출 버튼
    const saveBtn = document.getElementById("saveBtn");
    saveBtn.addEventListener('click', function(){
        if(confirm("제출하시겠습니까?\n(제출 후 철회가 불가능합니다.)")){
            var check = document.querySelector('input[type="radio"]:checked').value;

            if(check === 'N'){

            }
        }
    })

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>