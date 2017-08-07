<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String loginuser = request.getSession().getAttribute(com.mix.core.util.Global.USER_TOKEN)==null?"":"login";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="<%=basePath%>resources/notebook/images/dfibpiv.png"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="Chomo" />
<title>员工车险</title>
<style type="text/css">
* { margin:0; padding:0; list-style:none;}
html,body { height:100%; overflow:hidden; background:#fff;}
div {line-height:1.6;}
.main { position:absolute; left:0px; top:0px; bottom:0px; right:0px;}
</style>
<script src="<%=basePath%>resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
var loginuser = '<%=loginuser%>';
	$(function() {
	if (top != self) {
    window.parent.location.reload();
	}else{
		var srcvar = '';
		if (loginuser == 'login') { //如果登陆了
			srcvar = 'sys/user/index';
		} else {
			srcvar = 'sys/user/userIndex';
		}
		document.getElementById("indexFrame").src = srcvar;		
	}
	});
</script
</head>
<body>
<div class="main">
<iframe name="indexFrame" id="indexFrame" src= "" frameborder= "0" width= "100%" height="100%"></iframe>
</div>
</body>
</html>