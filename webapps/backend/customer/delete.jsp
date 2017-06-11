<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String  id= request.getParameter("id");
String  sql;
String message= "";
ResultSet rs;
  try{
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4103028026?useUnicode=true&characterEncoding=utf-8", "4103028026", "Ss4103028026!");
    Statement st=con.createStatement();
      sql= "select * from FPpersonal where id =  '"+id+"';";
      rs = st.executeQuery(sql);
    if(id ==null){
      message = "3";//ID爲空
    }
    else if(rs.next()){
      sql= "DELETE FROM FPpersonal WHERE id = '"+id+"';";
      st.executeUpdate(sql);
      message = "2";//刪除成功
    }
    else
    message = "1";//沒有此ID

      out.print(message);
      out.flush();

      con.close();
      st.close();
      rs.close();
    }catch(Exception ex){
      out.println(ex);
    }
%>

<script>
window.history.go(-1);
</script>
