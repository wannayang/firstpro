<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="resources/css/fullcalendar.css" />
<link rel="stylesheet" href="resources/css/matrix-style.css" />
<link rel="stylesheet" href="resources/css/matrix-media.css" />
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="resources/css/jquery.gritter.css" />
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' type='text/css'>

<script src="resources/js/excanvas.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.flot.min.js"></script>
<script src="resources/js/jquery.flot.resize.min.js"></script>
<script src="resources/js/jquery.peity.min.js"></script>
<script src="resources/js/fullcalendar.min.js"></script>
<script src="resources/js/matrix.js"></script>
<script src="resources/js/jquery.gritter.min.js"></script>
<script src="resources/js/matrix.interface.js"></script>
<script src="resources/js/matrix.chat.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/matrix.form_validation.js"></script>
<script src="resources/js/jquery.wizard.js"></script>
<script src="resources/js/jquery.uniform.js"></script>
<script src="resources/js/select2.min.js"></script>
<script src="resources/js/matrix.popover.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/matrix.tables.js"></script>
<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
    function adjustIfHt(){
    var ht = $(window).height();//获取浏览器窗口的整体高度；
    var topHeader = $(".warp_header").height();//获取头部高度，定义一个变量名为topHeader
    $(".sidebar").height(ht);
    $("#rightFrame").height(ht);
    $(".sidebar").height(ht-topHeader);//计算左边高度：窗口高度-头部高度
    $("#rightFrame").height(ht-topHeader);//计算右边高度：窗口高度-头部高度
  }  
  function goPage (newURL) {
      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
          if (newURL == "-" ) {
              resetMenu();            
          } 
          else {  
            document.location.href = newURL;
          }
      }
  }
  
  function writeMenu(){
			$.ajax({
            type: "POST",
            url : "sys/getmenuJson",
            data: "codecen=3",
            async: false,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
                var varmenu = eval(data);          //在页面中获取jsonArray数组
				$("#menunavul").append(data.event);   
 				}	
            });
  }

function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}

 function autoHeight(){ 
        var ifr = document.getElementById('auto'); 
        ifr.height = ( ifr.contentDocument && ifr.contentDocument.body.offsetHeight ) ||
                     ( ifr.contentWindow.document.body.scrollHeight ); 
      }
</script>
</head>
<body>

<!--Header-part-->

<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>

<div style="margin-left: 220px;height: 100%">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<iframe name="contentFrame" id="contentFrame" src= "content.jsp" frameborder= "0" width= "100%" height="90%" onload="autoHeight()"></iframe>
</div>
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>
</body>
</html>

