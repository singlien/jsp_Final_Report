<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4103028026"/>
  <jsp:setProperty property="user" name="database" value="4103028026"/>
  <jsp:setProperty property="password" name="database" value="Ss4103028026!"/>
</jsp:useBean>

<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = request.getParameter("acct");
 int x = 0;int y = 0;
 String message="";
 String sql = null;


%>
		<!-- margin leave black -->
		<div style="margin-top: 100px;"></div>
   		<div class="row" style="height: 20px;"></div>
   		<!-- table -->
   		<div class="container">
		<div class="sixteen wide column">
		                 <h1 class="ui aligned center header">訂單總覽</h1>

            <div class="ui card" style="width: 100%;">

                <table class="ui unstackable striped table">

                      <tr>
                          <th>買家名稱</th>
                          <th>購買產品</th>
                          <th>購買數量</th>
                          <th>小計</th>
                          <th>控制按鈕</th>
                      </tr>
<%
try{
	   database.connectDB();
       //Get inventory list
       String query=request.getParameter("query");//where inv.name like \"%"+query+"%\"
       if(query!=null)
       sql = "select * from FPorder as ord left join FPpersonal as per on ord.person_id=per.id left join FPinventory as inv on inv.id=ord.product_id where inv.name like \"%"+query+"%\" or per.name like \"%"+query+"%\" order by order_id desc;";
       else
       sql = "select * from FPorder as ord left join FPpersonal as per on ord.person_id=per.id left join FPinventory as inv on inv.id=ord.product_id order by order_id desc;";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
        while(rs.next()){
          String oid = rs.getString("order_id");
          String person_name = rs.getString("per.name");
          String prod_name = rs.getString("inv.name");
          int oamount = rs.getInt("order_num");
          int price = rs.getInt("price");
          String totalSales = (oamount*price) +"";
          int status = rs.getInt("confirmation");
%>
                      <tr>
                          <td class="left aligned"><h3><%=person_name%></h3></td>
                          <td class="left aligned"><h3><%=prod_name%></h3></td>
                          <td class="left aligned"><h3><%=oamount%></h3></td>
                          <td class="left aligned"><h3><%=totalSales%></h3></td>
                          <td class="left aligned">
                          <form action="javascript:void(0);">
                            <input type="hidden" name="id" value="<%=oid%>">
<%
if(status==1){
%>
                            <button type="button" class="positive ui icon button" data-tooltip="Confirmed" onclick="">
                            <i class="checkmark icon"></i>
                            </button>
<%
}else{
%>
                            <button type="button" class="negitave ui icon button" data-tooltip="Press to confirm" onclick="">
                            <i class="remove icon"></i>
                            </button>
<%}%>
                            <button class="ui red icon button" data-tooltip="Remove product" onclick="RemoveConfirm(this.form);">
                            <i class="remove icon"></i>
                            </button>
                          </form>

                          </td>
                      </tr>

<%
        }
       }else{
        message = "Error";
       }

%>
                      </thead>
                      <tbody id = "top">
                      </tbody>
                  </table>
              </div>
          </div>
          </div>
<%
  }catch(Exception ex){
    out.print(ex);
    message = "err";
  }

%>

<script type="text/javascript">

  function RemoveConfirm(Tform){
        console.log(Tform);

  swal({
    title: "Are you sure?",
    text: "You will not be able to recover this order!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Yes, delete it!",
    closeOnConfirm: false
  },
  function(){
    //confirm delete
    //ajax
    var orderid = Tform[0].value;
    var tempdata=null;
    console.log(orderid);

        $.post('pages/removeorder.jsp', {
                    oid: orderid,
                },
                function(data){
                    console.log(data);
                    tempdata=data;
                }
        );

    swal({
      title: "Deleted!",
      text: tempdata,
      type: "success",
      closeOnConfirm: false
    },
    function(){location.reload()});

   });

}
</script>
<%
database.closeDB();
%>
