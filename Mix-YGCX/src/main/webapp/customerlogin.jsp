<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN" class="app">
  <head>
    <base href="<%=basePath%>">
    
    <title>SMIS客户登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>resources/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>resources/toastr/toastr.css" rel="stylesheet" type="text/css" />
	<script src="<%=basePath%>resources/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>resources/toastr/toastr.js"></script>
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
  <div class="container">
<h1 class="page-header">SMIS客户登陆</h1>
<form action="<%=basePath%>customer/user/userLogin" class="form-horizontal" id="loginform" id="loginform" role="form" method="post">
<div class="row">
	<div class="alert alert-info alert-dismissable col-xs-3 col-xs-offset-2">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>${info }</strong>${errorInfo}
    </div>
    </div>
  <div class="form-group">
    <label for="userName" class="col-xs-2 control-label">用户名x</label>
    <div class="col-xs-3">
      <input type="text" class="form-control" id="idnumber" name="idnumber" value="" placeholder="身份证" />
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-xs-2 control-label">密码</label>
    <div class="col-xs-3">
      <input type="password" class="form-control" name="password" id="inputPassword3" value=""  placeholder="Password" value="963766"/>
    </div>
  </div>
  <div class="form-group">
   <div class="col-xs-offset-2 col-xs-3">
      <button type="submit" class="btn btn-success btn-block">登陆</button>
    </div>
  </div>
</form>
 </div> 

  </body>
</html>
