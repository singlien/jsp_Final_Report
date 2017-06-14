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
String title=null;
 String message="";
 String sql = null;

 //var
String name= null;
String platform= null;
String price= null;
String date= null;
String picture= null;
String video = null;
String inv = null;

//edit
 String queryid = request.getParameter("pid");
if(queryid!=null && queryid!=""){//edit
    title="Edit Product";
    try{
       //Fetch data 
       database.connectDB();

       //Get product count
       sql = "select * from FPinventory where id="+queryid+";";
       database.query(sql);
       rs = database.getRS();
       if(rs!=null){
            rs.next();
             name=rs.getString("name");
             platform=rs.getString("platform");
             price=rs.getString("price");
             date=rs.getString("date");
             picture=rs.getString("picture");
             video = rs.getString("video");
             inv = rs.getString("inventory");


        }

    database.closeDB();
    }catch(Exception ex){
    out.print(ex);
  }
}else{//new entry
    title="New Product Entry";
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><%=title%></title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- bootstrap JavaScript plugin -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <!-- Semantic UI -->
    <link rel="stylesheet" type="text/css" href="./plugins/semantic-ui/semantic.min.css">
    <script type="text/javascript" src="./plugins/semantic-ui/semantic.min.js"></script>
    <!-- Sweetalert -->
    <script src="./plugins/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./plugins/sweetalert/dist/sweetalert.css">
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <jsp:include page="./layouts/navbar.jsp"/>
    </nav>
    <!-- Sidebar -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <jsp:include page="./layouts/sidebar.jsp"/>
        </div>
    </div>


    <div class="container">
        <div style="margin-top: 100px;"></div>

        <div class="ui clearing segment">

<%
if(name!=null){
%>
            <form class="ui form" action="#" method="post">
                <input type="hidden" name="pid" value="<%=queryid%>">
                <h1 class="ui dividing aligned center header">
                  修改資料
                </h1>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">產品名稱：</div>
                    <input type="text" name="product_name" placeholder="Enter name..." value="<%=name%>">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">適用平台：</div>
                    <div class="ui fluid search selection dropdown">
                        <input type="hidden" name="platform" value="<%=platform%>">
                        <i class="dropdown icon"></i>
                        <div class="default text">Select Platform...</div>
                        <div class="menu">
                            <div class="item" data-value="ps4">PS4</div>
                            <div class="item" data-value="xboxone">XBOXONE</div>
                            <div class="item" data-value="wiiu">WiiU</div>
                            <div class="item" data-value="3ds">3DS</div>
                            <div class="item" data-value="psv">PSV</div>
                        </div>
                    </div>
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">日期：</div>
                    <input type="date" name="date" value="<%=date%>">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">存貨：</div>
                    <input type="text" name="inventory" value="<%=inv%>" >
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">售價：</div>
                    <input type="text" name="price" value="<%=price%>">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">圖片URL：</div>
                    <input type="url" name="picture" value="<%=picture%>">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">影片URL：</div>
                    <input type="url" name="video" value="<%=video%>">
                </div>
                <div class="ui horizontal divider"></div>
                    <button type="submit" class="ui right floated green button" onclick="updateInventory(this.form);">儲存</button>
                    <button type="reset" class="ui right floated red button">清除</button>
            </form>
            <button class="ui black button" onclick="window.history.back();">取消</button>
            <div class="ui segment hidden" id="return_segment"> 
			  <p id="return_textarea">讀取中請稍後</p>
			</div>
<%
}else{
%>
            <form class="ui form" action="#" method="post">
                <input type="hidden" name="pid" value="0">
                <h1 class="ui dividing aligned center header">
                  新增資料
                </h1>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">產品名稱：</div>
                    <input type="text" name="product_name" placeholder="Enter name...">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">適用平台：</div>
                    <div class="ui fluid search selection dropdown">
                        <input type="hidden" name="platform">
                        <i class="dropdown icon"></i>
                        <div class="default text">Select Platform...</div>
                        <div class="menu">
                            <div class="item" data-value="ps4">PS4</div>
                            <div class="item" data-value="xboxone">XBOXONE</div>
                            <div class="item" data-value="wiiu">WiiU</div>
                            <div class="item" data-value="3ds">3DS</div>
                        </div>
                    </div>
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">日期：</div>
                    <input type="date" name="date">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">存貨：</div>
                    <input type="text" name="inventory" placeholder="Enter inventory...">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">售價：</div>
                    <input type="text" name="price" placeholder="Enter price...">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">圖片URL：</div>
                    <input type="url" name="picture" placeholder="Enter url...">
                </div>
                <div class="ui horizontal divider"></div>
                <div class="ui left labeled fluid input">
                    <div class="ui basic label">影片URL：</div>
                    <input type="url" name="video" placeholder="Enter url...">
                </div>
                <div class="ui horizontal divider"></div>
                    <button type="submit" class="ui right floated green button" onclick="updateInventory(this.form);">儲存</button>
                    <button type="reset" class="ui right floated red button">清除</button>
            </form>
<%}%>
        </div>
    </div>
    <script type="text/javascript">
    // dropdown
    $('.ui.dropdown')
        .dropdown();
    // menu toggle
    $(".menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });


    function updateInventory(Tform){
    	var pid = Tform[0].value;
    	var product_name = Tform[1].value;
    	var platform = Tform[2].value;
    	var date = Tform[4].value;
    	var inventory = Tform[5].value;
    	var price = Tform[6].value;
    	var picture = Tform[7].value;
    	var video = Tform[8].value;
    	var btn = Tform[9];

    	$.ajax({
    		type: "POST",
    		url: "./pages/updateinventory.jsp", 
    		beforeSend: function(){
    			$(btn).addClass('loading');
    			$('#return_segment').removeClass("hidden");
    		},
    		data:{
    			pid: pid,
    			product_name: product_name,
    			platform: platform,
    			date: date,
    			inventory: inventory,
    			price: price,
    			picture: picture,
    			video: video
    		},
    		success: function(data){
    			$('#return_textarea').html(data); 
    		},
    		complete: function(){
    			window.open("./index.jsp","_self");
    		}
    	})
    	return null;
    }
    </script>
</body>

</html>
