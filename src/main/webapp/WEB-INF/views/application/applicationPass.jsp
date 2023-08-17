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
        .breadcrumbs,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-title {
            font-size: 30px;
            font-weight: 600;
        }

        .breadcrumbs li {
            display: inline-block;
            font-size: 12px;
        }

        .menu ul li a {
            display: inline-block;
            color: #646464;
            padding: 10px;
            font-weight: 600;
        }

        #apply_current {
            font-weight: bolder;
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
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">합격자발표</p>

            <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ul class="breadcrumbs">
                    <li class="breadcrumb-item">홈</li>
                    <li class="breadcrumb-item">합격자발표</li>
                    <%--탭에맞게 바뀌게--%>
                    <li id="apply_current" class="breadcrumb-item" aria-current="page">합격자발표</li>
                </ul>
            </div>
        </div>
        <div>
            <div></div>
        </div>
    </div>
</div>
<img id="img1"  src="https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg" alt="keyboard-5017973-1920" >

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
                <select  class="form-select border-bottom border-dark rounded-0 border-2 fw-bold application_div"
                         aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">지원정보</h3>
            <div class="border-top border-dark border-2">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row ">
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="recruitmentProgress" class="me-1 col-4 stn">모집과정명</label>
                                <div id="recruitmentProgress" class="p-2 col">자바 웹 개발 과정</div>
                            </div>
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="detailProgress" class="me-1 col-4 stn">상세과정</label>
                                <div id="detailProgress" class="p-2 col">프론트-백앤드</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row ">
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="applicantsCategorizing" class="me-1 col-4 stn">지원자구분</label>
                                <div id="applicantsCategorizing" class="p-2 col">일반</div>
                            </div>
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="applicantsName" class="me-1 col-4 stn">성명</label>
                                <div id="applicantsName" class=" p-2 col">홍길동이</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row mb-2">
                            <div class="col-12 col-md-6 d-flex align-items-center">
                                <label for="note" class="me-1 col-4 stn">지원서번호</label>
                                <div id="note" class="p-2 col">18521528</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <h3 class="title mt-5 mb-1">전형결과발표</h3>
            <div class="border-top border-dark border-2">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="documentResult" class="me-1 col-2 stn">서류전형결과</label>
                                <div id="documentResult" class="p-2 col-10">불합격</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="unqualified" class="me-1 col-2 stn">부적격사유</label>
                                <div id="unqualified" class="p-2 col-10">없음</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="writeResult" class="me-1 col-2 stn">필기전형결과</label>
                                <div id="writeResult" class="p-2 col-10">합격</div>
                            </div>
                        </div>
                        <div class="thin-line"></div>

                        <div class="row mb-2">
                            <div class="col-12 col-md-12 d-flex align-items-center">
                                <label for="finalResult" class="me-1 col-2 stn">최종합격결과</label>
                                <div id="finalResult" class="p-2 col-10">불합격</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="title mt-5 mb-1">일정안내</h3>
            <div class="border-top border-dark border-2">
                <div class="border mt-3" style="width: 100%; height:150px;"></div>
            </div>

            <div class="d-flex justify-content-center mt-5">
                <div class="btn bg-primary bg-opacity-25" id="pledgeBtn">등록서약/포기</div>
            </div>
    </div>
</div>
</div>

<script>
    const pledgeBtn = document.getElementById("pledgeBtn");
    pledgeBtn.addEventListener("click", function(){
        window.location.href = "/pledge"
    })
</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
