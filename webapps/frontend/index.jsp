<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>TV Game Shopping Center</title>
    <!-- 最新編譯和最佳化的 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- For carousel customize -->
    <link rel="stylesheet" type="text/css" href="./css/custom-bootstrap.css">
    <!-- 選擇性佈景主題 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <!-- load custom css -->
    <link rel="stylesheet" type="text/css" href="./css/custom.css">
</head>

<body>
    <!-- Navigation -->
    <jsp:include page="./layouts/navbar.jsp"/>
    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <image class="fill center-block" src="./images/1.png"></image>
                <div class="carousel-caption">
                    <h2>Top Hit this week</h2>
                </div>
            </div>
            <div class="item">
                <image class="fill center-block" src="./images/2.png"></image>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <image class="fill center-block" src="./images/3.png"></image>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>
    <!-- End of Header Carousel -->
    <!-- Products -->
    <div class="container">
    <%String query = request.getParameter("q");%>
        <jsp:include page="./layouts/products.jsp?query=<%=q%>"/>

    </div>

    <footer>
    </footer>
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- bootstrap JavaScript plugin -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <!-- Semantic UI -->
    <link rel="stylesheet" type="text/css" href="./plugins/semantic-ui/semantic.min.css">
    <script type="text/javascript" src="./plugins/semantic-ui/semantic.min.js"></script>
    <!-- Sweetalert -->
    <script src="./plugins/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/sweetalert/dist/sweetalert.css">
    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    $('.ui.dropdown')
        .dropdown()
    ;
    </script>
</body>

</html>
