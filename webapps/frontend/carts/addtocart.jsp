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

if(session.getAttribute("login")=="ok"){
    String buyer_id = session.getAttribute("id").toString();
    String prod_id = request.getParameter("pid");
	String prod_num = request.getParameter("pnum");

	out.print("Mr."+buyer_id+"purchased"+prod_num+" of "+prod_id);
}else{
	out.print("Please login");
}



%>