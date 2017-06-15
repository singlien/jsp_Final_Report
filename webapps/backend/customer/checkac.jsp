<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<%
request.setCharacterEncoding("UTF-8");
String  account= request.getParameter("account");
String  sql;
  try{
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4103028026?useUnicode=true&characterEncoding=utf-8", "4103028026", "Ss4103028026!");
    Statement st=con.createStatement();
    ResultSet rs;
    if(account!=null&&!account.isEmpty()){
    sql= "select * from FPpersonal where account = '"+account+"';";
    rs = st.executeQuery(sql);
    if(rs.next())
    out.println("已經有人使用此賬戶");
    else
    out.println("可以使用");
    rs.close();
    }

      out.flush();
      st.close();
      con.close();
    }catch(Exception ex){
      out.println(ex);
    }

%>
