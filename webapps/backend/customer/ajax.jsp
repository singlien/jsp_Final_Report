<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<%
request.setCharacterEncoding("UTF-8");
String  name= request.getParameter("name");
String  s_object= request.getParameter("s_object");
String  sql;
String sqlresult= "";
ResultSet rs;
  try{
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4103028026?useUnicode=true&characterEncoding=utf-8", "4103028026", "Ss4103028026!");
    Statement st=con.createStatement();
    if(name!=null&&!name.isEmpty()){
      if(s_object.equals("1"))s_object="account";
      else if(s_object.equals("2"))s_object="name";
      else if(s_object.equals("3"))s_object="birth";
      else s_object="email";
    sql= "select * from FPpersonal where "+s_object+" LIKE  '%"+name+"%';";
    }
    else
    sql= "select * from FPpersonal ;";

    rs = st.executeQuery(sql);

    while(rs.next()){
      sqlresult += "<tr class=\"replace\">";
      sqlresult += "<td><input type=\"checkbox\" name=\""+rs.getString("account")+"\" value=\""+rs.getString("id")+"\"/></td>";
      sqlresult += "<td>"+rs.getString("account")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("gender")+"</td><td>"+rs.getString("birth")+"</td>";
      sqlresult += "<td>"+rs.getString("email")+"</td>";
      sqlresult += "<td class=\"options-width\"><a href=\"modifyp.jsp?id="+rs.getString("id")+"\" title=\"Edit\" class=\"icon-1 info-tooltip\"></a><a href=\"delete.jsp?id="+rs.getString("id")+"\" title=\"Delete\" class=\"icon-2 info-tooltip\"  onclick=\"dcheck2()\"></a></td></tr>";
    }
      out.println(sqlresult);
      out.flush();

      con.close();
      st.close();
      rs.close();
    }catch(Exception ex){
      out.println(ex);
    }

%>
