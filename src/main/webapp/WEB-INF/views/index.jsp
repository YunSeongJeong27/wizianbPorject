<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="user/header.jsp"%>

<html> <head> <title>Title</title>

    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        /* CSS for full height of the page and flex layout */
        html, body {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* Styling for the buttons */
        .centered-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1; /* Allows the buttons container to grow and push footer down */
        }

        .centered-buttons button {
            margin-right: 20px;
            margin-left: 20px;
            font-size: large;
        }

    </style>
</head>
<body>

<div class="centered-buttons"> <button type="button" class="btn btn-primary btn-lg">회원페이지</button>
    <button type="button" class="btn btn-secondary btn-lg">관리자페이지</button> </div>

<script>
    const userPageButton = document.querySelector('.btn-primary');
    const adminPageButton = document.querySelector('.btn-secondary');

    userPageButton.addEventListener('click', function() {
        window.location.href = '/userPage';
    });

    adminPageButton.addEventListener('click', function() {
        window.location.href = '/adminPage';
    });
</script>

<%@include file="user/footer.jsp"%>
</body>
</html>


