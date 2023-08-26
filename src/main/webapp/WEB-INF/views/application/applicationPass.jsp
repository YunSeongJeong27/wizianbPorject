<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../user/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        #img1{
            width: 100%;
            height: auto;
            object-fit: contain;

        }

        .title {
            font-size: 16px;
            font-weight: 600;
        }


        .application_div {
            border: none;
        }

        .application_div:focus {
            outline: none;
            box-shadow: none;
        }

        .stn{
            font-weight: bold;
        }


        .thin-line {
            border-top: 1px solid rgba(186, 185, 192, 0.68);
            margin-top: 3px;
            margin-bottom: 3px;
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
                        <div id="breadcrumbDiv3" class="breadcrumb-item fw-bold" style="cursor:pointer;">합격자발표</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="my-5 container">
    <div class="row">
        <%--좌측탭--%>
        <div class="col-lg-2 p-2 d-flex flex-column justify-content-between">
            <div class="list-group" id="list-tab" role="tablist">
                <div id="attribute-li" >
                    <a class="fw-bold list-group-item list-group-item-action active">합격자발표</a>
                </div>
            </div>
        </div>

        <%--우측탭1--%>
        <div class="col-lg-9">
            <div class="mb-3">
                <select class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div" aria-label="select_list">
                    <c:forEach var="course" items="${courseList}" varStatus="status">
                        <option value="${course.rcrtNo}" <c:if test="${status.first}">selected</c:if>>${course.courseName}</option>
                    </c:forEach>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">지원정보</h3>
            <div class="border-top border-dark border-2">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row" style="min-height: 40px">
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="courseName" class="me-1 col-4 stn">모집과정명</label>
                                <div id="courseName" class="p-2 col"></div>
                            </div>
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="courseDiv" class="me-1 col-4 stn">과정구분</label>
                                <div id="courseDiv" class="p-2 col">${application.courseDiv}</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row" style="min-height: 40px">
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="aplyNo" class="me-1 col-4 stn">지원서번호</label>
                                <div id="aplyNo" class="p-2 col">${application.aplyNo}</div>
                            </div>
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="applicantsName" class="me-1 col-4 stn">성명</label>
                                <div id="applicantsName" class=" p-2 col">${application.nameKor}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <h3 class="title mt-5 mb-1">전형결과발표</h3>
            <div class="border-top border-dark border-2">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row" style="min-height: 40px">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="docPassYn" class="me-1 col-2 stn">서류전형결과</label>
                                <div id="docPassYn" class="p-2 col-10">${application.docPassYn}</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row" style="min-height: 40px">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="docNReason" class="me-1 col-2 stn">부적격사유</label>
                                <div id="docNReason" class="p-2 col-10">${application.docNReason}</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row mb-2" style="min-height: 40px">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="fnlPassYn" class="me-1 col-2 stn">최종합격결과</label>
                                <div id="fnlPassYn" class="p-2 col-10">${application.fnlPassYn}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="title mt-5 mb-1">일정안내</h3>
            <div class="border-top border-dark border-2">
                <div id="message" class="border mt-3" style="width: 100%; height:150px;"></div>
            </div>

            <div class="d-flex justify-content-center mt-5">
                <button class="btn bg-primary bg-opacity-25" id="pledgeBtn" disabled>등록서약/포기</button>
            </div>
    </div>
</div>
</div>

<script>
    const pledgeBtn = document.getElementById("pledgeBtn");
    pledgeBtn.addEventListener("click", function(){
        window.location.href = "/pledge/"+courseSelect.options[courseSelect.selectedIndex].value+"/"+aplyNo.innerText;
    })

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
        window.location.href = "/pass";
    })

    // select에서 선택한 과정명 가져오기
    const courseName = document.getElementById("courseName");
    const courseDiv = document.getElementById("courseDiv");
    const aplyNo = document.getElementById("aplyNo");
    const docPassYn = document.getElementById("docPassYn");
    const docNReason = document.getElementById("docNReason");
    const fnlPassYn = document.getElementById("fnlPassYn");
    const schdlMessage = document.getElementById("message");

    const courseSelect = document.querySelector("select");
    courseName.innerText = courseSelect.options[courseSelect.selectedIndex].text;

    courseSelect.addEventListener('change', async function(){
        docPassYn.innerText = "";
        docNReason.innerText = "";
        fnlPassYn.innerText = "";
        schdlMessage.innerText = "";
        pledgeBtn.disabled = true;
        pledgeBtn.innerText = '등록서약/포기'

        await fetch("/pass/findApplication/" + courseSelect.options[courseSelect.selectedIndex].value)
            .then((response) => response.json())
            .then((data) => {
                let application = data['application'];
                let message = data['message'];
                let aplyStsDiv = application['aplyStsDiv'];

                console.log("aplyStsDiv"+aplyStsDiv)

                courseName.innerText = courseSelect.options[courseSelect.selectedIndex].text;
                courseDiv.innerText = application['courseDiv'];
                aplyNo.innerText = application['aplyNo'];

                let docPass = application['docPassYn'];
                if(docPass === 'N') {
                    docPassYn.innerText = "불합격";
                    docNReason.innerText = application['docNReason'];
                }
                else if(docPass === 'Y') {
                    docPassYn.innerText = "합격";

                    let fnlPass = application['fnlPassYn'];
                    if(fnlPass === 'Y') {
                        fnlPassYn.innerText = "합격";
                        if(aplyStsDiv === null)pledgeBtn.disabled = false;
                        else if(aplyStsDiv === '30') pledgeBtn.innerText = '등록 완료'
                        else if(aplyStsDiv === '40') pledgeBtn.innerText = '등록 포기'
                    }
                    else if(fnlPass === 'N') fnlPassYn.innerText = "불합격";
                }

                if(message != null){
                    schdlMessage.innerHTML = message['msgCont'];
                }
            });
    });

</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
