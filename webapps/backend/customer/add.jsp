<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String  account= request.getParameter("account");
String  password= request.getParameter("password");
String  name= request.getParameter("name");
String  email= request.getParameter("email");
String  sql;
String year= request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
if(day!=null&&day.length()==1)day=String.format("%02d", Integer.parseInt(day));
if(month!=null&&month.length()==1)month=String.format("%02d", Integer.parseInt(month));
String  birth= year+"-"+month+"-"+day;
String message= "";
ResultSet rs;
  try{
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4103028026?useUnicode=true&characterEncoding=utf-8", "4103028026", "Ss4103028026!");
    Statement st=con.createStatement();
      sql= "select * from FPpersonal where account =  '"+account+"';";
      rs = st.executeQuery(sql);
      rs.last();
    if(account ==""||password ==""||name ==""||email ==""){
      message = "3";//ID爲空
    }
    else if(rs!=null&& rs.getRow()>=1){
      message = "2";//account重複
    }
    else{
    String insert="INSERT INTO FPpersonal(account,password,name,birth,email) VALUES(?,?,?,?,?)";
    PreparedStatement prestate =  con.prepareStatement(insert);
    prestate.setString(1, account);
    prestate.setString(2, password);
    prestate.setString(3, name);
    prestate.setString(4, birth);
    prestate.setString(5, email);
    prestate.executeUpdate();
    message = "1";
    }
    out.print(message);
    out.flush();

      con.close();
      st.close();
      rs.close();
    }catch(Exception ex){
      out.println(ex);
    }
%>
