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

    if(session.getAttribute("login")=="ok"){

      String buyer_id = null;
      String prod_id = null;
      String prod_num = null;

      buyer_id = session.getAttribute("id").toString();
      prod_id = request.getParameter("pid");
  	  prod_num = request.getParameter("pnum");

      try{

          if(buyer_id!=null && prod_id!=null && prod_num!=null){  

            database.connectDB();
            String sql = "INSERT INTO `FPorder` (`person_id`, `product_id`, `order_num`, `last_update`) VALUES ("+buyer_id+","+prod_id+","+prod_num+", NOW());";

            database.insert(sql);
            out.println("已將商品加入購物車！");
          
          }else{
          out.println("失敗");
          out.println("buyer:"+buyer_id);
          out.println("product:"+prod_id);
          out.println("number:"+prod_num);
          }
        }catch(Exception ex){
           out.print(ex);
        }

}else{
	out.print("Please login");
}
database.closeDB();
%>