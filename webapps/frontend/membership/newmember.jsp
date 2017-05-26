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
 ResultSet rs = null;
 String account = request.getParameter("account");
 String password = request.getParameter("passwd");
 String name = request.getParameter("name");
 String gender = request.getParameter("gender");
 String birth = request.getParameter("bday");
 String email = request.getParameter("mail");
 int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && gender!=null && birth !=null && email !=null){  //註冊
   try{
     database.connectDB();
     String sql = "select * from FPpersonal;"; // Catch every data from 'person'
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
         database.insertData(account,password,name,gender,birth,email);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       message="註冊失敗"+ex;
       out.println(ex);
     }
}else{
  message="註冊失敗";
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>註冊確認</title>
    <!-- 最新編譯和最佳化的 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- 選擇性佈景主題 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <!-- medal css -->
    <link rel="stylesheet" type="text/css" href="../css/login-medel.css">
</head>

<body style="background-image:url(./image/cod.jpg)">
    <!-- Leave blank margin for Login -->
    <header class="leave-blank"></header>
    <!-- Login -->
    <div class="container">
        <div class="loginmodal-container">
            <h1><%=message%></h1>
            <br>
            <button class="ui button primary" onclick="window.open('login.html', '_self');">返回登入頁面</button>
        </div>
    </div>
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Semantic UI -->
    <link rel="stylesheet" type="text/css" href="../plugins/semantic-ui/semantic.min.css">
    
</body>

</html>



