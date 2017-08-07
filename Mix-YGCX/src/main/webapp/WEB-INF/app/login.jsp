<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="bg-light">
<head>
<meta charset="utf-8" />
<title>员工车险管理系统</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
<link href="<%=basePath%>resources/toastr/toastr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/toastr/toastr.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.validate.js"></script>
<script type="text/javascript">
  $(function(){
  toastr.info('欢迎光临！');
  });

  $(function(){
   $("#loginform").validate(
   {
     rules: {
     username:{required:true},
     password: {required:true}
    },
    messages: {
     username:{required:"用户名不能为空！"},
     password: {required:"密码不能为空！"}
    },
        submitHandler: function (form) {
        form.submit();
    }
   });
  });
  </script>
</head>
<body>
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
  <div class="container aside-xxl"> <a class="navbar-brand block" href="#"><h1 class="">员工车险管理系统</h1>
</a>
  	<div class="alert alert-info alert-dismissable">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>${info }</strong>${errorInfo}
    </div>
    <section class="panel panel-default bg-white m-t-lg">
      <header class="panel-heading text-center"> <strong>登陆</strong> </header>
      <form action="<%=basePath%>sys/user/userLogin" class="panel-body form-horizontal wrapper-lg" id="loginform" id="loginform" role="form" method="post">
        <div class="form-group">
          <label class="control-label">用户名</label>
          <input type="text" id="username" name="username" placeholder="UserName" class="form-control input-lg">
        </div>
        <div class="form-group">
          <label class="control-label">密码</label>
          <input type="password" id="password" name="password" placeholder="Password" class="form-control input-lg">
        </div>

        <button type="submit" class="btn btn-primary">登陆</button>
        <div class="line line-dashed"></div>
        <p class="text-muted text-center"><small>Do not have an account?</small></p>
      </form>
    </section>
  </div>
</section>
<!-- footer -->
<footer id="footer">
  <div class="text-center padder">
    <p> <small>Web app framework base on Bootstrap<br>
      &copy; 2013</small> </p>
  </div>
</footer>
</body>
</html>
