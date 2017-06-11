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
 int x = 0;int y = 0;
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
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ // Find duplicate account
           y+=1;
           break;
         }
       }
       if(y!=0){  // If account exists
         message="帳號已被註冊";
         out.print(message);
       }else{     // If account doesn't exist, write a new account into database
         out.print("ok");
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    message="帳號不可為空白";
    out.println(message);
   }

%>
