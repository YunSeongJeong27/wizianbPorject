<%@include file="../user/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<style>
    .selectionContainer {
        width: 350px;
        height: 500px;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .wrap {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 50px;
        max-width: 1300px;
        margin: 0 auto;
        cursor: pointer;
    }

    .col-md-auto {
        font-size: 14px;
    }
    .status{
        width: 60px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        margin-bottom: 20px;
        background: #003A78;
        color: white;
        border-radius: 5px;

    }
    .title{
        font-weight: bold;
        font-size: 16px;
    }
    hr {
        margin: 0;
    }
    .tx{
        margin-top: 15px;
        color: gray;
    }
    .appBtn{
        margin-top: 50px;
        width: 80%;
        height: 50px;
        border: 1px solid #003A78;
        color: #003A78;
        font-size: 16px;
        margin-left: 35px ;
    }

    .appBtn:hover {
        background: #003A78;
        color: white;
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

<div class="container-fluid wrap" onclick="window.location.href ='/selectInfo';">
    <%--hidden으로 첫번째요소는 숨겨야됨--%>
    <div id="selectionContainerId" class="selectionContainer" hidden>
        <div class="col-md-auto status"></div>
        <div class="col-md-auto title"></div>
        <div class="col-md-auto subtitle"></div>
        <hr>
        <div class="col-md-auto tx" >기수</div>
        <div class="col-md-auto progressNum"></div>
        <div class="col-md-auto tx" >접수기간</div>
        <div class="col-md-auto submitPeriod"></div>
        <div class="col-md-auto tx" >서류전형합격자발표</div>
        <div class="col-md-auto passDocumentPre"></div>
        <div class="col-md-auto tx" >필기전형합격자발표</div>
        <div class="col-md-auto writeDocumentPre"></div>
        <div class="col-md-auto tx" >최종합격자발표</div>
        <div class="col-md-auto finalDocumentPre"></div>
        <button class="appBtn">접수바로가기</button>

    </div>

</div>


<script>
    async function fetchData() {
        const response = await fetch('/getTestData');
        const dataList = await response.json();

        dataList.map((data, index) => {
            const container = document.getElementById('selectionContainerId').cloneNode(true);
            container.removeAttribute('hidden');
            //1.  뷰에 처음나올떄 하나는 출력되므로 첫번째요소는 숨겼지만
            // 여기가 시작할때부터는 hidden제거

            //2. cloneNode() 메서드는 DOM(div같은 것들) 노드를 복제합니다
            //true이면 해당 노드와 모든 자식 노드를 깊게 복사한,false이면 자식x

            container.querySelector('.status').innerText = data.status;
            container.querySelector('.title').innerText = data.title;
            container.querySelector('.subtitle').innerText = data.subtitle;
            container.querySelector('.progressNum').innerText = data.progressNum;
            container.querySelector('.submitPeriod').innerText = data.submitPeriod;
            container.querySelector('.passDocumentPre').innerText = data.passDocumentPre;
            container.querySelector('.writeDocumentPre').innerText = data.writeDocumentPre;
            container.querySelector('.finalDocumentPre').innerText = data.finalDocumentPre;

            document.querySelector('.wrap').appendChild(container);
            //appendChild(container):이 요소 내부의 마지막 자식 위치에 container 변수의 요소(복사한 행)를 추가한다.
        });
    }

    fetchData();

    const selectionContainerId = document.getElementById("selectionContainerId");
    selectionContainerId.addEventListener("click", function(){
        console.log("test");
    })

    ////상단에 홈>마이페이지> (이벤트리스너)
    const breadcrumbDiv1 = document.getElementById("breadcrumbDiv1");
    breadcrumbDiv1.addEventListener("click",function(){
        window.location.href = "/app";
    })
</script>

<%@include file="../user/footer.jsp" %>
</body>
</html>