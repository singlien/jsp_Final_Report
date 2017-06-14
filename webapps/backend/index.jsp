<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>

<%
if(!(session.getAttribute("login")=="ok")){
    out.print("please login first to manage backend");
    response.sendRedirect("./membership/login.html");
}else{
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>TV Game Shopping Center Backend</title>
    <!-- 最新編譯和最佳化的 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- For carousel customize -->
    <!-- <link rel="stylesheet" type="text/css" href="./css/custom-bootstrap.css"> -->
    <!-- 選擇性佈景主題  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <!-- load custom css -->
    <!-- <link rel="stylesheet" type="text/css" href="./css/custom.css"> -->


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
    <!-- chart.js -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js"></script>

</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <jsp:include page="./layouts/navbar.jsp"/>
    </nav>
    <!-- Sidebar -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <jsp:include page="./layouts/sidebar.jsp"/>
        </div>
    </div>

    <!-- Products -->
    <div class="container">
     <%
        String f =request.getParameter("page");
        String q=request.getParameter("search");
        if(f==null||f==""){
        %>
            <jsp:include page="pages/dashboard.jsp"/>
        <%
        }else{
            switch(f){

            case "dashboard":
                out.print("dashboard");
            %>
                <jsp:include page="pages/dashboard.jsp"/>
            <%
            break;

            case "member":
                out.print("member");
                response.sendRedirect("./customer/index.jsp");
            %>
            <%
            break;

            case "products":
                out.print("products");
            %>
                <input type="hidden" name="query" value="<%=q%>">
                <jsp:include page="pages/products.jsp"/>
            <%
            break;

            case "order":
                out.print("order");
            %>
                <jsp:include page="pages/order.jsp"/>
            <%
            break;

            case "edit":
                out.print("edit");
            %>
                <jsp:include page="pages/edit.html"/>
            <%
            break;

            default:
                out.print("default");
            %>
                <jsp:include page="pages/dashboard.jsp"/>
            <%
            break;
            }
        }
        %>
    </div>

    <footer>
    </footer>

    <!-- Menu Toggle Script -->
    <script>
    $(".menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>

<%}%>
