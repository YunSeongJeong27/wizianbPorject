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
    #appBtn{
        margin-top: 50px;
        width: 80%;
        height: 50px;
        border: 1px solid #003A78;
        color: #003A78;
        font-size: 16px;
        margin-left: 35px ;
    }

    #appBtn:hover {
        background: #003A78;
        color: white;
    }
    #selTx{
        margin-top: 30px;
        margin-bottom: 30px;
        margin-left: 30px;
        font-weight: 500;
        font-size: 32px;

    }

    #img1{
        width: 100%;
        height: auto;
        object-fit: contain;

    }


</style>
<body>
<div id="selTx" >모집전형선택</div>
<img id="img1"  src="https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg" alt="keyboard-5017973-1920" >

<div class="container-fluid wrap">
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
        <button id="appBtn">접수바로가기</button>
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
</script>

<%@include file="../user/footer.jsp" %>
</body>
</html>
