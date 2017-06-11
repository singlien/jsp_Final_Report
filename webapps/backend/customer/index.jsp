<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
if(!(session.getAttribute("login")=="ok"))response.sendRedirect("../membership/login.html");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Admin System</title>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>
<!--  checkbox styling script -->
<script src="js/jquery/ui.core.js" type="text/javascript"></script>
<script src="js/jquery/ui.checkbox.js" type="text/javascript"></script>
<script src="js/jquery/jquery.bind.js" type="text/javascript"></script>
<script type="text/javascript">
</script>
<![if !IE 7]>
<!--  styled select box script version 1 -->
<script src="js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.styledselect').selectbox({ inputClass: "selectbox_styled" });
});
</script>
<![endif]>
<!--  styled select box script version 3 -->
<script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.styledselect_pages').selectbox({ inputClass: "styledselect_pages" });
});
</script>
<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>
<!-- Tooltips -->
<script src="js/jquery/jquery.tooltip.js" type="text/javascript"></script>
<script src="js/jquery/jquery.dimensions.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('a.info-tooltip ').tooltip({
		track: true,
		delay: 0,
		fixPNG: true,
		showURL: false,
		showBody: " - ",
		top: -35,
		left: 5
	});
});
</script>
<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
$(document).pngFix( );
});
function refresh(){
			$(".replace").remove();
			$.post("ajax.jsp",
				function(data){
						$(".replace").remove();
						$("#mainform").after(data);
						$('input').checkBox();
					});
}
//firsttime
$(document).ready(function(){
	refresh();
	$(".icon-1 info-tooltip").click(function(){
	});


});
//ajax
$(document).ready(function(){
    	$("#pushsearch").click(function(){
			$.post("ajax.jsp",{name:$("#name").val(),s_object:$("#s_object").val()},
				function(data){
						$(".replace").remove();
						$("#mainform").after(data);
						$('input').checkBox();
					});

				});
    });
$(document).ready(function(){
		$('#toggle-all').click(function(){
	 	$('#toggle-all').toggleClass('toggle-checked');
		$('#product-table input[type=checkbox]').checkBox('toggle');
		return false;
		});
});


		function dcheck() {

			$("input[type=checkbox]:checked").each(function () {
    			var r = confirm("確定刪除？ID ="+this.value);
    				if (r == true) {
  					$.post("delete.jsp",{id:this.value},function(result){
						  });
    				}
		    })
			};

</script>
</head>








<body>
	<!-- Start: page-top-outer -->
	<div id="page-top-outer">

	<!-- Start: page-top -->
	<div id="page-top">
		<!--  start top-search -->
		<div id="top-search">
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><input id="name" type="text" class="top-search-inp" /></td>
			<td>

			<select  id="s_object"class="styledselect">
				<option value="1" selected>Account</option>
				<option value="2">Name</option>
				<option value="3">Birth</option>
				<option value="4">E-mail</option>
			</select>

			</td>
			<td>
			<input id="pushsearch"type="image" src="images/shared/top_search_btn.gif"  />
			</td>
			</tr>
			</table>
		</div>
	 	<!--  end top-search -->
	 	<div class="clear"></div>

	</div>
	<!-- End: page-top -->

	</div>
	<!-- End: page-top-outer -->

	<div class="clear">&nbsp;</div>

<!--  start nav-outer-repeat................................................................................................. START -->
<div class="nav-outer-repeat">
<!--  start nav-outer -->
<div class="nav-outer">

				<!--  start nav -->
				<div class="nav">
				<div class="table">

				<ul class="select"><li><a href="../"><b>Products</b><!--[if IE 7]><!--></a><!--<![endif]-->

				</li>
				</ul>

				<div class="nav-divider">&nbsp;</div>

				<ul class="current"><li><a href="#nogo"><b>Clients</b><!--[if IE 7]><!--></a><!--<![endif]-->
				<!--[if lte IE 6]><table><tr><td><![endif]-->
				<div class="select_sub show">
					<ul class="sub">
						<li class="sub_show"><a href="index.jsp">View</a></li>
						<li><a href="addp.jsp">Add</a></li>

					</ul>
				</div>
				<!--[if lte IE 6]></td></tr></table></a><![endif]-->
				</li>
				</ul>

				<div class="nav-divider">&nbsp;</div>

				<div class="clear"></div>
				</div>
				<div class="clear"></div>
				</div>
				<!--  start nav -->


</div>
<div class="clear"></div>
<!--  start nav-outer -->
</div>
<!--  start nav-outer-repeat................................................... END -->

 <div class="clear"></div>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>ClientS</h1>
	</div>
	<!-- end page-heading -->

	<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
	<tr>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
		<th class="topleft"></th>
		<td id="tbl-border-top">&nbsp;</td>
		<th class="topright"></th>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
	</tr>
	<tr>
		<td id="tbl-border-left"></td>
		<td>
		<!--  start content-table-inner ...................................................................... START -->
		<div id="content-table-inner">

			<!--  start table-content  -->
			<div id="table-content">


				<!--  start product-table ..................................................................................... -->
				<form  action="">
				<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
				<tr id="mainform">
					<th class="table-header-check"><a id="toggle-all" ></a> </th>
					<th class="table-header-repeat line-left minwidth-1"><a >ID</a>	</th>
					<th class="table-header-repeat line-left minwidth-1"><a >Account</a></th>
					<th class="table-header-repeat line-left"><a >Name</a></th>
					<th class="table-header-repeat line-left"><a >Birth</a></th>
					<th class="table-header-repeat line-left"><a >E-mail</a></th>
					<th class="table-header-options line-left"><a >Options</a></th>
				</tr>
				</table>
				<!--  end product-table................................... -->
				</form>
			</div>
			<!--  end content-table  -->

			<!--  start actions-box ............................................... -->
			<div id="actions-box">
				<a href="" class="action-slider"></a>
				<div id="actions-box-slider">
					<a href=""class="action-delete"  onclick="dcheck()">Delete</a>
				</div>
				<div class="clear"></div>
			</div>
			<!-- end actions-box........... -->


		</div>
		<!--  end content-table-inner ............................................END  -->
		</td>
		<td id="tbl-border-right"></td>
	</tr>
	<tr>
		<th class="sized bottomleft"></th>
		<td id="tbl-border-bottom">&nbsp;</td>
		<th class="sized bottomright"></th>
	</tr>
	</table>
	<div class="clear">&nbsp;</div>

</div>
<!--  end content -->
<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer........................................................END -->

<div class="clear">&nbsp;</div>

<!-- start footer -->
<div id="footer">
<!--  start footer-left -->
<div id="footer-left">

All rights reserved.</div>
<!--  end footer-left -->
<div class="clear">&nbsp;</div>
</div>
<!-- end footer -->

</body>
</html>
