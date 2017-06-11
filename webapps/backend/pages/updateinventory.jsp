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

    String prod_id = request.getParameter("pid");
    int id = Integer.parseInt(prod_id);

    String name = request.getParameter("product_name");
    String platform = request.getParameter("platform");
    String price = request.getParameter("price");
    String date = request.getParameter("date");
    String picture = request.getParameter("picture");
    String video = request.getParameter("video");
    String inv = request.getParameter("inventory");

      try{

          if(id!=0){ //update  
            database.connectDB();
            database.insertInventory(id, name, platform, price, date, picture, video, inv);
            out.println("ID:"+id+"之商品資料已更新");
          
          }else{  //insert
            database.connectDB();
            database.insertInventory(0, name, platform, price, date, picture, video, inv);
            out.println("商品資料已新增");
          }
        }catch(Exception ex){
           out.print(ex);
        }
%>
<script type="text/javascript">
  window.open("../index.jsp?page=products", "_self")
</script>