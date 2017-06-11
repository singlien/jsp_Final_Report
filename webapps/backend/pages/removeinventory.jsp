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
    request.setCharacterEncoding("UTF-8");
    String url = "";
    String driver = "com.mysql.jdbc.Driver";

    if(session.getAttribute("login")=="ok"){

      String prod_id = request.getParameter("pid");

      try{

          if(prod_id!=null){  

            database.connectDB();
            String sql = "delete from `FPinventory` where id="+prod_id+";";

            database.insert(sql);
            out.println("已將商品從資料庫移除");
          
          }else{
          out.println("失敗");
          out.println("product:"+prod_id);
          }
        }catch(Exception ex){
           out.print(ex);
        }
  }else{
  	out.print("Please login");
  }

%>