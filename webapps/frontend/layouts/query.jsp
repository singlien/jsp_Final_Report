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
 	String query = request.getParameter("query");
	ResultSet rs = null;
  	int rowLimit=3;
  	int rowCount=1;

	try{
	 database.connectDB();
     String sql = "select * from productst;"; // Catch every data from 'person'
     if(query!="" && query!=null){
      sql = "select * from productst where `name`='"+query+"' or `products`='"+query+"';"
     }
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){	//Start loading data
      while(rs.next()){
      String name = rs.getString("name");
      String price = rs.getString("price");
      String pict = rs.getString("picture");
      String type = rs.getString("platform");
        if(rowCount==rowLimit){
          out.print("<div class='row'>");
        }
%>
  <div class='col-md-4 portfolio-item' id='div_index20'>
    <div class="header-margin"></div>
    <h2 class="ui header"><%=name%><a class="ui red label"><%=type%></a></h2>
    <a><img class='img-responsive' src='<%=pict%>'/></a>
    <h3 id='price' class="ui header">Price</h3><h3 class="ui header" style="text-align: right; ">NT$ <%=price%></h3>
    <div class="ui compact selection dropdown" >
      <i class="dropdown icon"></i>
      <div class="text">購買數量</div>
      <div class="menu">
        <div class="item">1</div>
        <div class="item">2</div>
        <div class="item">3</div>
        <div class="item">4</div>
        <div class="item">5</div>
      </div>
    </div>
    <button id='buy" + data[j].id+ "' class='ui labeled icon button pull-right' style='font-family: "Microsoft JhengHei";' onclick=''>
    <i class="shop icon"></i>加入購物車</button>
  </div>


<%
        if(rowCount==rowLimit){
          out.print("</div>");
          rowCount=0;
        }
        rowCount++;

      }
    }else{
      out.print("No result found!");
    }
  

}catch(Exception e){
	out.println(e);
}


%>