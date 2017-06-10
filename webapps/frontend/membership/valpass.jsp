<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4103028026"/>
  <jsp:setProperty property="user" name="database" value="4103028026"/>
  <jsp:setProperty property="password" name="database" value="Ss4103028026!"/>
</jsp:useBean>

<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = request.getParameter("acct");
 String password = request.getParameter("pass");

 String message="";

//Validate duplicate account
 if(account!=null && account!=""){
 try{
     database.connectDB();
     String sql = "select * from FPpersonal;"; // Catch every data from 'person'
     database.query(sql);
     rs = database.getRS();
           
      if(rs!=null){
        while(rs.next()){
          if(account.equals(rs.getString("account"))){      // Find the account then check password
            if(password.equals(rs.getString("password"))){  // Password also equals
              //登入成功
              session.setAttribute("login", "ok");
              session.setAttribute("user", rs.getString("name"));
              session.setAttribute("id", rs.getString("id"));
              out.println("Success");             
              break;
            }
          }
          out.println("帳號或密碼錯誤！");
        }
      }
      
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    out.println("帳號不能為空！");
   }
database.closeDB();
%>