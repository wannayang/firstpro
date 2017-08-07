<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.mix.core.util.Global" %>
<%@ page import="com.mix.core.entity.Tsysuser" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Tsysuser tsysuser=(Tsysuser)request.getSession().getAttribute(Global.USER_TOKEN);
String tsysusername = tsysuser==null?"":tsysuser.getUsername();
%>

<!DOCTYPE html>
<html lang="zh-CN" class="app">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>DIFB 员工车险 | Web Application</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resources/jquery/page/page.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css"/>
<link href="<%=basePath%>resources/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>resources/js/jquery.min.js"></script>
<script src="<%=basePath%>resources/notebook/js/app.v2.js"></script> 
<script src="<%=basePath%>resources/notebook/js/charts/easypiechart/jquery.easy-pie-chart.js" cache="false"></script> 
<script src="<%=basePath%>resources/notebook/js/charts/sparkline/jquery.sparkline.min.js" cache="false"></script>
<script src="<%=basePath%>resources/notebook/js/charts/flot/jquery.flot.min.js" cache="false"></script>
<script src="<%=basePath%>resources/notebook/js/charts/flot/jquery.flot.tooltip.min.js" cache="false"></script>
<script src="<%=basePath%>resources/notebook/js/charts/flot/jquery.flot.resize.js" cache="false"></script> 
<script src="<%=basePath%>resources/notebook/js/charts/flot/jquery.flot.grow.js" cache="false"></script> 
<script src="<%=basePath%>resources/notebook/js/charts/flot/demo.js" cache="false"></script> 
<script src="<%=basePath%>resources/notebook/js/calendar/bootstrap_calendar.js" cache="false"></script>
<script src="<%=basePath%>resources/notebook/js/calendar/demo.js" cache="false"></script> 
<script src="<%=basePath%>resources/notebook/js/sortable/jquery.sortable.js" cache="false"></script>
<script src="<%=basePath%>resources/toastr/toastr.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/my-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script type="text/javascript">
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
  
        function addMsg($msg) {
            var $el = $('.nav-user'), $n = $('.count:first', $el), $v = parseInt($n.text());
            $('.count', $el).fadeOut().fadeIn().text($v + 1);
            $($msg).hide().prependTo($el.find('.list-group')).slideDown().css('display', 'block');
        }
        var vmsg = "<a href=\"#\" class=\"media list-group-item\"><span class=\"pull-left thumb-sm text-center\"><i class=\"fa fa-envelope-o fa-2x text-success\"></i></span><span class=\"media-body block m-b-none\">欢迎使用DFIB 数据仓库-员工车险系统<br><small class=\"text-muted\">"+timeStamp2String()+"</small></span></a>";
        setTimeout(function() {
            addMsg(vmsg);
        }, 1500);
        
        function showmsg(msg,v){
	        if(msg==null||msg==''){
	        	return;
	        }
	        if(v==0){
	        toastr.success(msg);
	        }else if(v==1){
	        toastr.error(msg);
	        }
	        else if(v==2){
	        toastr.info(msg);
	        }
	        else if(v==3){
	        toastr.warning(msg);
	        }
	        else if(v==4){
	        }
        }
</script>
</head>
<body>
<section class="vbox">
  <header class="bg-black dk header navbar navbar-fixed-top-xs">
			<div class="navbar-header aside-md">
				<a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i class="fa fa-bars"></i></a> 
				<a href="#" class="navbar-brand" data-toggle="fullscreen"><img src="resources/notebook/images/logo.png" class="m-r-sm">DFIB EAIS</a>
				<a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> <i class="fa fa-cog"></i></a>
			</div>
    <ul class="nav navbar-nav navbar-right hidden-xs nav-user">
      <li class="hidden-xs"> <a href="#" class="dropdown-toggle dk" data-toggle="dropdown"> <i class="fa fa-bell"></i> <span class="badge badge-sm up bg-danger m-l-n-sm count">2</span> </a>
        <section class="dropdown-menu aside-xl">
          <section class="panel bg-white">
            <header class="panel-heading b-light bg-light"> <strong>您有 <span class="count"></span> 通知</strong> </header>
							<div class="list-group list-group-alt animated fadeInRight">
								<a href="#" class="media list-group-item"> 
								<span class="pull-left thumb-sm"> <img src="<%=basePath%>resources/notebook/images/avatar.jpg" alt="John said" class="img-circle"></span> 
								<span class="media-body block m-b-none"> Use awesome animate.css<br> <small class="text-muted">10 minutes ago</small> </span> 
								</a> 
								<a href="#" class="media list-group-item">
								<span class="media-body block m-b-none"> 1.0 initial released<br><small class="text-muted">1 hour ago</small></span>
								</a>
							</div>
							<footer class="panel-footer text-sm"> <a href="#" class="pull-right"><i class="fa fa-cog"></i></a> <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a> </footer>
          </section>
        </section>
      </li>
      <li class="dropdown hidden-xs"> <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i class="fa fa-fw fa-search"></i></a>
        <section class="dropdown-menu aside-xl animated fadeInUp">
          <section class="panel bg-white">
            <form role="search">
              <div class="form-group wrapper m-b-none">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <span class="input-group-btn">
                  <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-search"></i></button>
                  </span> </div>
              </div>
            </form>
          </section>
        </section>
      </li>
      <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="thumb-sm avatar pull-left"> <img src="resources/notebook/images/avatar.jpg"> </span> <%=tsysusername %> <b class="caret"></b> </a>
        <ul class="dropdown-menu animated fadeInRight">
          <span class="arrow top"></span>
          <li> <a href="#">设置</a> </li>
          <li> <a href="#"> <span class="badge bg-danger pull-right">3</span>通知</a> </li>
          <li> <a href="#">帮助</a> </li>
          <li class="divider"></li>
          <li> <a href="sys/user/userLogout">登出</a></li>
        </ul>
      </li>
    </ul>
  </header>
  <section>
    <section class="hbox stretch">
      <aside class="bg-black lter aside-md hidden-print" id="nav">
        <section class="vbox">
          <header class="header bg-primary lter text-center clearfix">
            <div class="btn-group">
              <button type="button" class="btn btn-sm btn-dark btn-icon" title="New project"><i class="fa fa-plus"></i></button>
              <div class="btn-group hidden-nav-xs">
                <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown"> 选择项目 <span class="caret"></span> </button>
                <ul class="dropdown-menu text-left">
                  <li><a href="http://192.168.0.53:8080/SMIS/" target="_blank">SMIS Project</a></li>
                  <li><a href="http://192.168.0.53:8080/YGCX/" target="_blank">EAIS Project</a></li>
                  <li><a href="#"># Projects</a></li>
                </ul>
              </div>
            </div>
          </header>
          <section class="w-f scrollable">
            <div class="" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color=""> <!-- nav -->
              <nav class="nav-primary hidden-xs">
               <ul class="nav" id = "menunavul">
               <script>writeMenu();</script>
               <li class="active"> <a href="content.jsp" class="active" target="contentFrame"> <i class="fa fa-dashboard icon"> <b class=""></b> </i> <span>Workset</span> </a> </li>
               </ul>
              </nav>
              <!-- / nav --> </div>
          </section>
          <footer class="footer lt hidden-xs b-t b-dark">
            <div id="chat" class="dropup">
              <section class="dropdown-menu on aside-md m-l-n">
                <section class="panel bg-white">
                  <header class="panel-heading b-b b-light">Active chats</header>
                  <div class="panel-body animated fadeInRight">
                    <p class="text-sm">No active chats.</p>
                    <p><a href="#" class="btn btn-sm btn-default">Start a chat</a></p>
                  </div>
                </section>
              </section>
            </div>
            <div id="invite" class="dropup">
              <section class="dropdown-menu on aside-md m-l-n">
                <section class="panel bg-white">
                  <header class="panel-heading b-b b-light"> John <i class="fa fa-circle text-success"></i> </header>
                  <div class="panel-body animated fadeInRight">
                    <p class="text-sm">No contacts in your lists.</p>
                    <p><a href="#" class="btn btn-sm btn-facebook"><i class="fa fa-fw fa-facebook"></i> Invite from Facebook</a></p>
                  </div>
                </section>
              </section>
            </div>
            <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon"> <i class="fa fa-angle-left text"></i> <i class="fa fa-angle-right text-active"></i> </a>
            <div class="btn-group hidden-nav-xs">
              <button type="button" title="Chats" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#chat"><i class="fa fa-comment-o"></i></button>
              <button type="button" title="Contacts" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#invite"><i class="fa fa-facebook"></i></button>
            </div>
          </footer>
        </section>
      </aside>
      <!-- /.aside -->
      <section id="content">
          <iframe name="contentFrame" id="contentFrame" src= "content.jsp" frameborder= "0" width= "100%" height="100%"></iframe>
        </section>
      <aside class="bg-light lter b-l aside-md hide" id="notes">
        <div class="wrapper">Notification</div>
      </aside>
    </section>
  </section>
</section>

</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

