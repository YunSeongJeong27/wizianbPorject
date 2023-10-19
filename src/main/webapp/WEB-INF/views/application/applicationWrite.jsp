<%@ include file="../user/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<style>

    .entryWrap:hover .shortCutBtn{
        background-color: #003A78;
        color: white !important;
    }
</style>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-100" style="background-image: url('https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg'); background-size: cover; background-repeat: no-repeat; height: 330px;"></div>

<div class="d-flex flex-wrap justify-content-start mx-auto m-5" style="width: 1400px;">
    <c:forEach items="${entrySelMaster}" var="master">
        <form action="/selectInfo" method="get" class="m-2" style="width: 32%; height: 480px;">
            <input type="hidden" name="entryRcrtNo" value="${master.rcrtNo}">
            <button class="p-4 border shadow-sm btn text-start w-100 h-100 entryWrap">
                <div class="h-75">
                    <div class="rounded-2 text-white text-center p-1 statusDiv" style="background-color: #003A78; width: 80px;">
                       ${master.statusDiv}
                    </div>
                    <div class="mt-2 fw-bold fs-5">${master.courseName}</div>
                <%--<div class="m-1 border-bottom border-1 border-secondary"></div>--%>
                    <div class="mt-2 text-secondary fw-bold">기수</div>
                    <div class="mt-1">
                        ${master.courseDiv}과정 ${master.courseName}
                    </div>
                    <c:forEach items="${entrySelSchdl}" var="schdl">
                        <c:if test="${schdl.rcrtNo eq master.rcrtNo}">
                            <c:choose>
                                <c:when test="${schdl.schdlName eq '모집'}">
                                    <div class="mt-2 text-secondary fw-bold">${schdl.schdlName}</div>
                                    <div class="mt-1">
                                            ${schdl.startDate} ~ ${schdl.endDate}
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="mt-2 text-secondary fw-bold">${schdl.schdlName}</div>
                                    <div class="mt-1">
                                            ${schdl.endDate}
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </div>
                <div><input type="hidden" name="courseDiv" value="${master.courseDiv}"></div>
                <div class="col-10 text-center p-2 mt-5 fw-bold mx-auto shortCutBtn" style="color: #003A78; border: 1px solid #003A78;">접수바로가기</div>
            </button>
        </form>
    </c:forEach>
</div>

<script>
    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    });

    //statusDiv 상태변화에 따른 disable 유무
    document.addEventListener("DOMContentLoaded", function(){
        var statusDivs = document.querySelectorAll(".statusDiv");
        statusDivs.forEach(function(statusDiv){
            if(statusDiv.innerText !== "진행중"){
                statusDiv.parentElement.parentElement.disabled = true;
            }else{
                statusDiv.parentElement.parentElement.disabled = false;
            }
        });
    });
</script>

<%@include file="../user/footer.jsp" %>
</body>
</html>