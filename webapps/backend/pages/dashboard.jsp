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

 String message="";
 String sql = null;
 //var
 String productCount = null;
 String memberCount=null;
 String orderCount=null;
 String revenue = null;

 String pname = null;
 String pplatform = null;
 int oamount = 0;
 String totalSales = null;

 String test= null;

 int[] platformCount = new int[5];
 int[] platformAmount = new int[5];


  try{
       //Fetch data
       database.connectDB();

       //Get product count
       sql = "select COUNT(id) as countp from FPinventory;";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
        rs.next();
        productCount = rs.getInt("countp")+"";
       }else{
        productCount = "Error";
       }

       //Get member count
       sql = "select COUNT(id) as countm from FPpersonal;";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
        rs.next();
        memberCount = rs.getInt("countm")+"";
       }else{
        memberCount = "Error";
       }

       //Get order count
       sql = "select COUNT(order_id) as counto from FPorder;";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
        rs.next();
        orderCount = rs.getInt("counto")+"";
       }else{
        orderCount = "Error";
       }


       //Get total revenue
       sql = "select ord.`order_num`, inv.`price` from `FPorder` as ord, `FPinventory` as inv where ord.`product_id` = inv.`id`;";
       database.query(sql);
       rs = database.getRS();
       int sum=0;
       if(rs!=null){
        while(rs.next()){
          int order = rs.getInt("order_num");
          int price = rs.getInt("price");
          sum += order * price;
        }
        revenue = sum+"";
       }else{
        revenue = "Error";
       }
%>
    <!-- chart.js -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

    <div style="margin-top: 100px;"></div>
    <div class="row" style="height: 20px;"></div>

        <div class="ui grid">
             <div class="four wide column">
                 <div class="ui card statistic">
                     <div class="ui divider"></div>
                     <div class="value"><%=productCount%></div>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                         產品項數
                     </div>
                     <div class="ui divider"></div>
                 </div>
             </div>
             <div class="four wide column">
                 <div class="ui card statistic">
                     <div class="ui divider"></div>
                     <div class="value"><%=memberCount%></div>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                         總會員數
                     </div>
                     <div class="ui divider"></div>
                 </div>
             </div>
             <div class="four wide column">
                 <div class="ui card statistic">
                     <div class="ui divider"></div>
                     <div class="value" id="transaction_number"><%=orderCount%></div>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                         訂單筆數
                     </div>
                     <div class="ui divider"></div>
                 </div>
             </div>
             <div class="four wide column">
                 <div class="ui card statistic">
                     <div class="ui divider"></div>
                     <div class="value" id="income_number"><%=revenue%></div>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                         收入金額
                     </div>
                     <div class="ui divider"></div>
                 </div>
             </div>
        </div>

        <div class="row" style="height: 20px;"></div>
        <div class="ui grid">
          <div class="eight wide column">
                 <div class="ui fluid card statistic">
                     <div class="ui divider"></div>
                     <canvas id="myChart"></canvas>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                     銷售量平台分布
                     </div>
                     <div class="ui divider"></div>
                 </div>
          </div>
          <div class="eight wide column">
                 <div class="ui fluid card statistic">
                     <div class="ui divider"></div>
                     <canvas id="myChart2"></canvas>
                     <div class="label" style="font-size:17px; font-family:Microsoft JhengHei;">
                     銷售額平台分布

                     </div>
                     <div class="ui divider"></div>
                 </div>
          </div>
        </div>
        <div class="row" style="height: 20px;"></div>

        <div class="sixteen wide column">
            <div class="ui card" style="width: 100%;">


                <table class="ui unstackable striped table">
                      <thead>
                      <tr>
                          <th>產品名稱</th>
                          <th>遊戲平台</th>
                          <th>售出總數量</th>
                          <th>售出總金額</th>
                          <th>剩餘庫存</th>
                          <th>控制按鈕</th>
                      </tr>
<%
       //Get inventory list

       String query = request.getParameter("query");////where inv.name like \"%"+query+"%\"
       if(query!=null)
       sql = "select inv.id, inv.name, inv.`platform`, inv.price, sum(ord.order_num),inv.inventory from `FPinventory` as inv left join `FPorder` as ord on inv.`id`=ord.`product_id` group by inv.`id` order by sum(ord.order_num) desc;";
       else
       sql = "select inv.id, inv.name, inv.`platform`, inv.price, sum(ord.order_num),inv.inventory from `FPinventory` as inv  left join `FPorder` as ord on inv.`id`=ord.`product_id` group by inv.`id` order by sum(ord.order_num) desc;";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
        while(rs.next()){
          String id = rs.getString("id");
          pname = rs.getString("name");
          pplatform = rs.getString("platform");
          oamount = rs.getInt("sum(ord.order_num)");
          int price = rs.getInt("price");
          totalSales = (oamount*price) +"";
          int inv = rs.getInt("inventory");
          String invleft = (inv-oamount)+"";

          switch(pplatform){

          case "xboxone":
            platformCount[0]+=oamount;
            platformAmount[0]+=(oamount*price);
            break;
          case "ps4":
            platformCount[1]+=oamount;
            platformAmount[1]+=(oamount*price);
            break;
          case "psv":
            platformCount[2]+=oamount;
            platformAmount[2]+=(oamount*price);
            break;
          case "wiiu":
            platformCount[3]+=oamount;
            platformAmount[3]+=(oamount*price);
            break;
          case "3ds":
            platformCount[4]+=oamount;
            platformAmount[4]+=(oamount*price);
            break;
          }
%>
                      <tr>
                          <td class="left aligned"><h3><%=pname%></h3></td>
                          <td class="left aligned"><h3><%=pplatform%></h3></td>
                          <td class="left aligned"><h3><%=oamount%></h3></td>
                          <td class="left aligned"><h3><%=totalSales%></h3></td>
                          <td class="left aligned"><h3><%=invleft%></h3></td>
                          <td class="left aligned">
                          <form action="javascript:void(0);">
                            <input type="hidden" name="id" value="<%=id%>">
                            <button type="button" class="ui icon button" data-tooltip="Edit product" onclick="EditRedirect(this.form)">
                            <i class="edit icon"></i>
                            </button>
                            <button class="ui red icon button" data-tooltip="Remove product" onclick="RemoveConfirm(this.form);">
                            <i class="remove icon"></i>
                            </button>
                          </form>

                          </td>
                      </tr>
<%
        }
       }else{
        orderCount = "Error";
       }

%>
                      </thead>
                      <tbody id = "top">
                      </tbody>
                  </table>
              </div>
          </div>
<%

       //Debug
       test = "reach";
       //
  }catch(Exception ex){
    out.print(ex);
    test = "err";
  }

%>

<script type="text/javascript">


  function EditRedirect(Tform){
      var productid = Tform[0].value;
      console.log(productid);
      var url="./edit.jsp?pid="+productid;
      window.open(url,"_self");

  }
  function RemoveConfirm(Tform){
        console.log(Tform);

  swal({
    title: "Are you sure?",
    text: "You will not be able to recover this data!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Yes, delete it!",
    closeOnConfirm: false
  },
  function(){
    //confirm delete
    //ajax
    var productid = Tform[0].value;
    var tempdata=null;
    console.log(productid);

        $.post('pages/removeinventory.jsp', {
                    pid: productid,
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

<script type="text/javascript">
    var ctx = document.getElementById("myChart");
    var ctx2 = document.getElementById("myChart2");

    var color = ["#ff0040", "#0080ff", "#80ff00","#ff8000", "#ffbf00"];
    var label = ["XBOX ONE", "PS4", "PS Vita", "Wii U", "3DS"]

    var count = [];
    var money = [];
<%
  for(int ii=0;ii<platformCount.length;ii++){
%>
    count.push(<%=platformCount[ii]%>);
    money.push(<%=platformAmount[ii]%>);
<%
  }
%>
    var datadoughnut = {
      datasets: [{
        data: count,
        backgroundColor: color
      }],
      labels: label
    };

    var datapie = {
      datasets:[{
        data: money,
        backgroundColor: color
      }],
      labels: label
    }

    console.log(datadoughnut);
    new Chart(ctx,{
      type:'doughnut',
      data: datadoughnut
    });

    new Chart(ctx2,{
      type:'doughnut',
      data: datapie
    });

</script>


<%
database.closeDB();
%>
