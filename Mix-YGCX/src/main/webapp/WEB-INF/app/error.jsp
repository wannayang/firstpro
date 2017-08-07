<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>Notebook | Web Application</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css"></link>
<script src="<%=basePath%>resources/notebook/js/app.v2.js"></script> 
<script type="text/javascript">
function send(){
  			$.ajax({
            type: "POST",
            url : "<%=basePath%>sys/user/sendmail",
            data: "",
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				window.parent.window.showmsg(data.res,0);
 				}
            });	
}
</script> 
</head>
<body>
	<section id="content">
		<div class="row m-n">
			
				<div class="text-center m-b-lg">
					<h1 class="h text-black animated fadeInDownBig" style="font-size:40px;">后台出错，请与管理员联系</h1>
				</div>
			<div class="col-sm-4 col-sm-offset-4">				
				<div class="list-group m-b-sm bg-white m-b-lg">
					<a href="javascript:history.go(-1)" class="list-group-item"> <i class="fa fa-chevron-right icon-muted"></i> <i class="fa fa-fw fa-home icon-muted"></i> 返回上一页 </a> 
					<a href="javascript:void(0)" onclick="send();" class="list-group-item"> <i class="fa fa-chevron-right icon-muted"></i> <span class="badge"></span><i class="fa fa-fw fa-envelope icon-muted"></i> Send an e-mail </a>
				</div>
			</div>
		</div>
	</section>
	<footer id="footer">
		<div class="text-center padder clearfix">
			<p>
				<small>dfbx-yangjian@dfl.com.cn<br>
					&copy; 2016</small>
			</p>
		</div>
	</footer>
</body>
</html>


