<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4103028026" />
  <jsp:setProperty property="user" name="database" value="4103028026" />
  <jsp:setProperty property="password" name="database" value="Ss4103028026!" />
</jsp:useBean>

<%
if(session.getAttribute("login")!="ok"){
	//redirect to login page
	%><script>window.open('./membership/login.html','_self')</script>
<%
}else{
	out.println("Cart page under-construction");
}

%>