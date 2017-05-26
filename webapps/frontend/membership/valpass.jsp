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
 String account = request.getParameter("account");
 String password = request.getParameter("passwd");
 String name = request.getParameter("name");
 String gender = request.getParameter("gender");
 String birth = request.getParameter("bday");
 String email = request.getParameter("mail");
 int x = 0;int y = 0;
 String message="";

//Validate duplicate account
 if(account!=null){
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
         message="註冊失敗";
         out.print(message);
       }else{     // If account doesn't exist, write a new account into database
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    message="登入成功！";
   }
}

//Create new Account
 if(account !=null && password !=null && name !=null && birth !=null && email !=null ){ 
   try{
     database.connectDB();
     String sql = "select * from person;"; // Catch every data from 'person'
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){ // Find if any duplicate account
           y+=1;
           break;
         }
       }
       if(y!=0){  // If account exists
         message="註冊失敗";
       }else{     // If account doesn't exist, write a new account into database
         database.insertData(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else
   {
    message="登入成功！";
   }
 try{ //登入
   database.connectDB();
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }




%>
