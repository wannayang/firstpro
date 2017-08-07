<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.mix.core.model.IUserToken" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
IUserToken iusertoken = (IUserToken)request.getSession().getAttribute(com.mix.core.util.Global.IUSER_TOKEN);
String loginusername=  iusertoken.getTsysuser().getUsername();
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=basePath%>resources/jquery/page/page.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/matrix-style.css" />
<link rel="stylesheet" href="<%=basePath%>resources/css/matrix-media.css" />
<link rel="stylesheet" href="<%=basePath%>resources/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'/>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/my-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/page/jquery.myPagination5.0.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/page/jquery-jtemplates.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/page/jquery.jqtransform.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/time.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/messages_zh.js"></script>
<script type="text/javascript">
var loginusername = '<%=loginusername%>';

$(function(){
    init();
});

		function update(obj) {
			var tds = $(obj).parent().parent().find('td');
			$('#u_id').val(tds.eq(0).text());
			$('#u_username').val($.trim(tds.eq(1).text()));
			$('#u_email').val(tds.eq(2).text());
			if (tds.eq(3).text() == "W") {
				$('#u_sex').val(0);
			} else if (tds.eq(3).text() == "M") {
				$('#u_sex').val(1);
			} else {
				$('#u_sex').val(2);
			}
			$('#updateWin').modal('show');
		}
		var clickTrObj;
		function trClick(obj) {
			clickTrObj = obj;
		}

		function updateUser() {
			if (clickTrObj == null) {
				alert("请选中要修改的列");
				return;
			}
			var tds = $(clickTrObj).find('td');
			$('#u_id').val(tds.eq(0).text());
			$('#u_username').val(tds.eq(1).text());
			$('#u_email').val(tds.eq(2).text());
			if (tds.eq(3).text() == "W") {
				$('#u_sex').val(0);
			} else if (tds.eq(3).text() == "M") {
				$('#u_sex').val(1);
			} else {
				$('#u_sex').val(2);
			}

			$('#updateWin').modal('show');
		}

		function deleteUser() {
			var id = $(clickTrObj).find('td').eq(0).text();
			if (id == '') {
				alert("请点击要删除的列");
				return;
			}
			$.ajax("sys/user/deleteUser?userId=" + id + "");
			window.location.reload();
		}

		function sexChange(str) {
			var sexStr;
			if (str == '0') {
				sexStr = "W";
			} else if (str == '1') {
				sexStr = "M";
			} else {
				sexStr = "M/W";
			}
			return sexStr;
		}

		function init() {
			myPagination = $("#pageBar").myPagination(
				{
					currPage : 1,
					pageNumber : 10,
					pageCount: 10,					
					cssStyle : 'jogger',//分页样式，具体样式可以从css/page.css样式中选取

						ajax : {
							on : true,//是否启用异步请求，必须启用
							type : "POST",
							url : "sys/user/getJsonUserList",
							dataType : 'json',
							param : {
								on : true,
								page : 1
							},//参数列表，其中  on 必须开启，page 参数必须存在,其他自定义
							ajaxStart : function() {
								ZENG.msgbox.show(" 正在加载中，请稍后...", 6, 100000);
							},
							onClick : function(page) {
								$.fn.debug(page);
							},
							//回调函数
							callback : function(data) {
								ZENG.msgbox.hide(); //隐藏加载提示
								$("#userTable > tbody").html(""); //每次加载的时候先设为空
									$.each(data.event,function(i, value) {
										var notadmin = true;
										if(value.username=='admin'){
											if(loginusername!='admin'){
											notadmin = false;
												}
										}
										if(notadmin){
										$("#userTable > tbody").append("<tr>"
												+ "<td>" + value.userid + "</td>"
												+ "<td>" + value.username + "</td>"
												+ "<td>" + value.email + "</td>"
												+ "<td>" + sexChange(value.sex) + "</td>"
												+ "<td>" + value.createUser + "</td>"
												+ "<td>" + value.updateUser + "</td>"
												+ "<td>" + timeStamp2String(value.createTime) + "</td>"
												+ "<td>" + timeStamp2String(value.updateTime) + "</td>"
												+ "<td>"
												+ "<a href=\"javascript:void(0)\" onclick=\"update(this);\" class=\"btn btn-primary btn-xs active\" role=\"button\">更新</a>&nbsp;|&nbsp;"
												+ "<a href=\"javascript:void(0)\" onclick=\"deluser('" + value.userid + "','"+value.username+"');\" class=\"btn btn-danger btn-xs active\" role=\"button\">删除</a>"
												+ "</td>"
												+ "</tr>");
										}
									});
								}
							},
					});
			}
			
			function deluser(vid,vname){
			if(window.confirm("你确定要删除用户："+vname+"吗？")){
						$.ajax("sys/user/deleteUser?userId=" + vid + "");
						window.location.reload();
				}
			}
			
$(function(){
   $("#addform").validate(
   {
     rules: {
     username:{required:true,minlength:5,
        remote:{                                         //验证用户名是否存在
               type:"POST",
               url:"sys/user/jsonCheck",
               data:{
                 name:function(){return $("#username").val();}
               }
              }
            },
     password: {required:true,minlength:5}
    },
    messages: {
     username:{
     required:"用户名不能为空！",
     minlength:"用户名位数必须大于等于5个字符！",
     remote:"用户名已经被注册"
     },
     password: {
     required:"密码不能为空！",
     minlength:"密码位数必须大于等于5个字符！"
     }
    },
        submitHandler: function (form) {  
        form.submit();  
    }  
   });
  });
  
  showmsg("用户维护");
  
	</script>
</head>
<body>
	<div id="content">
  <div class="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom">
    <i class="icon-home"></i> Home</a> <a href="#" class="current">系统管理</a> </div>
</div>	
	<div class="container-fluid">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>用户维护</h5>
            <span class="label label-info"></span>
		</div>		
		<div class="row">
			<div class="col-xs-1">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addWin">用户新增</button>
				<!-- <a href="javascript:void(0);" onclick="updateUser();" class="btn btn-primary" role="button">Update</a>
				<a href="javascript:void(0)" onclick="deleteUser();" class="btn btn-danger" role="button">Delete</a> -->
			</div>
		</div>
		<div class="table-responsive">
		<table id="userTable" class="table table-bordered sort_table" data-width="2000px">
			<thead>
				<tr>
					<th>ID</th>
					<th>用户名</th>
					<th>email</th>
					<th>性别</th>
					<th>创建者</th>
					<th>更新者</th>
					<th>创建时间</th>
					<th>更新时间</th>
					<th witdh="200px" data-width="200px">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		</div>
		<hr />

		<div class="modal fade" id="addWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form id="addform" name="addform" class="form-horizontal" action="sys/user/addUser">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Add User</h4>
						</div>
						
						<div class="modal-body">
							<div class="form-group">
								<label for="userName" class="col-xs-2 control-label">用户名</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="username" name="username">
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-xs-2 control-label">密码</label>
								<div class="col-xs-8">
									<input type="password" class="form-control" id="password" name="password">
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-xs-2 control-label">Email</label>
								<div class="col-xs-8">
									<input type="email" class="form-control" id="email"
										name="email">
								</div>
							</div>
							
							<div class="form-group">
								<label for="sex" class="col-xs-2 control-label">性别</label>
								<div class="col-xs-8">
									<select class="form-control" name="sex">
										<option value="1">M</option>
										<option value="0">W</option>
										<option value="2">M/W</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">保存</button>
						</div>
					</div>
					</form>
				</div>
				</div>

		<div class="modal fade" id="updateWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form class="form-horizontal" action="sys/user/updateUser" role="form" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">更新用户</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="u_id" class="col-xs-2 control-label">ID</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="u_id" name="id" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label for="u_username" class="col-xs-2 control-label">用户名</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="u_username" name="username" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label for="u_password" class="col-xs-2 control-label">密码</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="u_password" name="password">
								</div>
							</div>

							<div class="form-group">
								<label for="u_email" class="col-xs-2 control-label">Email</label>
								<div class="col-xs-8">
									<input type="email" class="form-control" id="u_email" name="email">
								</div>
							</div>
							<div class="form-group">
								<label for="u_sex" class="col-xs-2 control-label">性别</label>
								<div class="col-xs-8">
									<select class="form-control" id="u_sex" name="sex">
										<option value="1">M</option>
										<option value="0">W</option>
										<option value="2">M/W</option>
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">更新</button>
						</div>
					</div>
					</form>
			</div>
			</div>
		
		<!-- 分页显示的div块开始 -->
		<div style="float: right;">
			<div id="pageBar" style="float:right"></div>
		</div>
		<!-- 分页显示的div块结束 -->
		</div>
	</div>
</body>
</html>
