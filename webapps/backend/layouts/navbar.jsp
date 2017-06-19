<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>

    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <!-- button for mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Homepage</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand menu-toggle" href="#">Menu</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <!-- navbar choices -->
                <li>
                    <%
                    if(session.getAttribute("login")=="ok"){
                        String name = session.getAttribute("user").toString();
                        out.print("<a>"+name+"你好</a>");
                        out.print("</li>");
                    %>
                    <!-- logout -->
                    <li>
                        <a href="./membership/logout.jsp">登出</a>
                    </li>
                    <%

                    }else{
                        out.print("<a href='./membership/login.html'>登入</a>");
                        out.print("</li>");
                    }
                    String f =request.getParameter("page");
                    if(f==null||f.equals("dashboard"))f="products";
                    %>
                    <li>
                        <a href="./edit.jsp">新增產品</a>
                    </li>
            </ul>
            <!-- Search bar -->
            <form class="nav navbar-form navbar-right" action="" method="get">
                <div class="ui left icon input">
                <i class="search icon"></i>
                    <input type="text" name="query" class="form-control" placeholder="Search for products ~" width="30px">
                    <input type="hidden" name="page" value="<%=f%>">
                </div>
                <button type="submit" class="ui inverted basic button" value="search">Search</button>
            </form>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
