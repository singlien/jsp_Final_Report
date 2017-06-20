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
  int pcount  = 0;
	ResultSet rs = null;
  int rowLimit=3;
  int rowCount=1;

	try{
	   database.connectDB();
     String sql = "select * from FPinventory;"; // Catch every data from 'person'
     if(query!="" && query!=null){
      sql = "select * from FPinventory where platform='"+query+"' or name like '%"+query+"%';";
     }
     //out.print(sql);
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){	//Start loading data
      while(rs.next()){
      pcount++;
      String name = rs.getString("name");
      String id = rs.getString("id");
      String price = rs.getString("price");
      String pict = rs.getString("picture");
      String video = rs.getString("video");
      String date = rs.getString("date");
      String type = rs.getString("platform");
        if(rowCount==rowLimit){
         //out.print("<div class='row'>");
        }
%>
  <div class="card">
    <div class="blurring dimmable image">
        <div class="ui dimmer">
            <div class="content">
                <div class="center">
                    <div class="ui inverted button"><a href="<%=video%>">Video link</a></div>
                </div>
            </div>
        </div>
        <img src="<%=pict%>">
    </div>
    <div class="content">
        <div class="header">
            <%=name%>
                <div class="ui red horizontal label">
                    <%=type%>
                </div>
        </div>
        <div class="meta">
           <span class="date">上市日期：<%=date%></span>
        </div><br>
        <div class="header"><p>售價:<%=price%></p></div>
    </div>
    <div class="extra content">
        <span class="right floated">
        </span>
        <input type="hidden" name="id" value="<%=id%>">
        <div class="ui bottom">
            <form action="javascript:AddToCart(this)" class="product">
                <input type="hidden" value='<%=id%>'>
                <select class="ui compact selection dropdown">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <button type="submit" class='ui labeled icon button' style='font-family: "Microsoft JhengHei";' onclick="AddToCart(this.form)">
                    <i class="shop icon"></i>加入購物車</button>
            </form>
        </div>
    </div>
</div>


<%
        if(rowCount==rowLimit){
          //out.print("</div>");
          rowCount=0;
        }
        rowCount++;

      }
      if(pcount==0){%>
        <h1>No result found</h1>
      <%}
    }else{
      out.print("keyword:");
      out.print(query);
      out.print(", No result found!");

    }
  

}catch(Exception e){
	out.println(e);
}
%>

<script type="text/javascript">
<%
if(session.getAttribute("login")=="ok"){
%>
	function AddToCart(Tform){
    var productid = Tform[0].value;
    var purchasenum = Tform[1].value;

    console.log(productid+", "+purchasenum);

		$.ajax({
      type: 'GET',
      url: 'carts/addtocart.jsp',
      beforeSend: function(){
        $(Tform[2]).addClass("loading");
      },
      data: {
                pid: productid,
                pnum: purchasenum
            },
      success: function(data){
        swal("Add to cart!", "Product has been added into your cart.", "success");
      },
      complete: function(){
        $(Tform[2]).removeClass("loading");
      }
        });
		return null;	
	}
<%
}
else{
%>
	function AddToCart(){
		//not logged in
		swal({
      title: "Error!",
      text: "Please login first before adding things to cart.",
      type: "error"
    },
    function(){
      window.open("./membership/login.html","_self");
    });

	}
<%
}
%>
</script>

<%
database.closeDB();
%>