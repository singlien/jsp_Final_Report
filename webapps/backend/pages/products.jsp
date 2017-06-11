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

 String query=request.getParameter("query");

%>

<div style="margin-top: 100px;"></div>

<div class="ui three stackable special cards">
  <!-- card -->

  <%
    try{
       //Fetch data 
       database.connectDB();

       //Get product count
       sql = "select * from `FPinventory`;";
       if(query!=null && query!=""){
       sql = "select * from `FPinventory` where name like '%"+query+"%';";
       }
       database.query(sql);
       rs = database.getRS();
      if(rs!=null){
        while(rs.next()){ 

        String name=rs.getString("name");
        String platform=rs.getString("platform");
        String price=rs.getString("price");
        String date=rs.getString("date");
        String picture=rs.getString("picture");
        String video = rs.getString("video");
        String inv = rs.getString("inventory");
        String id = rs.getString("id");
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
      <img src="<%=picture%>">
    </div>
    <div class="content">
      <a class="header"><%=name%>
            <div class="ui red horizontal label"><%=platform%></div>
      </a>
      <div class="meta">
        <a>日期:</a><%=date%><br>
        <a>存貨:</a><%=inv%><br>
        <a>售價:</a><%=price%>
      </div>
    </div>
    <div class="extra content">
    <form action="javascript:void(0);">  
      <input type="hidden" name="id" value="<%=id%>">
      <div class="two ui buttons">
        <button class="ui blue button" onclick="EditRedirect(this.form)">
          <i class="edit icon"></i>
            編輯
        </button>
        <button class="ui red button" onclick="RemoveConfirm(this.form)">
          <i class="remove icon"></i>
            移除
        </button>
      </div>   
    </form>
      
    </div>
  </div>

  <%
      }//while 

       }else{
        }
       }catch(Exception ex){
          out.print(ex);
       } 
%>
  </div>

<script type="text/javascript">
//Cards dimmer
	$('.special.cards .image').dimmer({
  on: 'hover'
});

function EditRedirect(Tform){
    var productid = Tform[0].value;
    console.log(productid);
    var url="./edit.jsp?pid="+productid;
    window.open(url,"_self");

}

function RemoveConfirm(Tform){
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