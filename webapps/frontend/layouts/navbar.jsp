<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
            <a class="navbar-brand" href="index.jsp">HomePage</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <!-- navbar choices -->
                <li>
                    <%
                    if(session.getAttribute("login")=="ok"){
                        String name = session.getAttribute("user").toString();
                        out.print("<a href='./membership/logout.jsp'>"+name+"你好，登出</a>");
                    }else{
                        out.print("<a href='./membership/login.html'>登入</a>");
                    }
                    %>
                        
                </li>
                <li>
                    <a href="#">購物車</a>
                </li>
                <!-- navbar choice dropdown -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="portfolio-1-col.html">1 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-2-col.html">2 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-3-col.html">3 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-4-col.html">4 Column Portfolio</a>
                        </li>
                        <li>
                            <a href="portfolio-item.html">Single Portfolio Item</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Search bar -->
            <form class="nav navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search for games ~" width="30px">
                </div>
                <button type="submit" class="btn btn-default" value="search">Search</button>
            </form>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
