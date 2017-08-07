<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<LINK REL="SHORTCUT ICON" HREF="<%=basePath%>resources/notebook/images/dfibpiv.png"> 
<meta charset="utf-8" />
<title>会话过期</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css"></link>
<script src="<%=basePath%>resources/notebook/js/app.v2.js"></script> 
</head>
<body>
	<section id="content">
		<div class="row m-n">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="text-center m-b-lg">
					<h1 class="h text-black animated fadeInDownBig" style="font-size:30px;">会话过期，请重新登陆！</h1>
				</div>				
				<div class="list-group m-b-sm bg-white m-b-lg">
					<a href="javascript:history.go(-1)" class="list-group-item"> <i class="fa fa-chevron-right icon-muted"></i> <i class="fa fa-fw fa-home icon-muted"></i> 返回上一页 </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-chevron-right icon-muted"></i> <i class="fa fa-fw fa-question icon-muted"></i> Send us a tip </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-chevron-right icon-muted"></i> <span class="badge">027</span><i class="fa fa-fw fa-phone icon-muted"></i> Call us </a>
				</div>
			</div>
		</div>
	</section>
	<footer id="footer">
		<div class="text-center padder clearfix">
			<p>
				<small>东风经纪<br>
					&copy; 2016</small>
			</p>
		</div>
	</footer>

</body>
</html>


