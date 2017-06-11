<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String  id= request.getParameter("id");
String  account= request.getParameter("account");
String  password= request.getParameter("password");
String  name= request.getParameter("name");
String  email= request.getParameter("email");
String year= request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String  sql;
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
    if(id==""||account ==""||password ==""||name ==""||email ==""){
      message = "2";//有空格
    }
    else if(rs!=null&& rs.getRow()>1){
      message = "3";//account重複
    }
    else{
    String insert="UPDATE FPpersonal SET account = ?, password = ?, name = ?, birth = ?, email = ? WHERE id = ?";
    PreparedStatement prestate =  con.prepareStatement(insert);
    prestate.setString(1, account);
    prestate.setString(2, password);
    prestate.setString(3, name);
    prestate.setString(4, birth);
    prestate.setString(5, email);
    prestate.setString(6, id);
    prestate.executeUpdate();
    message = "1";
    }
    out.print(message);
    out.flush();

      con.close();
      st.close();
    }catch(Exception ex){
      out.println(ex);
    }
%>
