<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN" class="app">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<title>角色设置</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/page/page.css" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/sweetalert/sweetalert.css">
<link rel="stylesheet" href="<%=basePath%>resources/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'/>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/page/jquery.myPagination5.0.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/my-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/sweetalert/sweetalert-dev.js"></script>
<script type="text/javascript">
  function writeRole(){
			$.ajax({
            type: "POST",
            url : "sys/getJsonRoleList",
            data: "codecen=3",
            async: false,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
                var varmenu = eval(data);
				$("#rolenavul").append(data.event);
 				}
            });
  }
  
  function writeRoleUserRef(){
  writeRoleUser($("#roleid").val(),$("#rolename").val());
  }

    function writeRoleUser(roleid,rolename){
    if(roleid==null||roleid==''){
    	window.parent.window.showmsg("请先选择左边角色！",1);
    	return;
    }
    window.frames["treeFrame"].location.reload(true);
    $("#rolename").val(rolename);
    $("#roleid").val(roleid);
    var a_rolename = $("#a_rolename").val();
    $("#roletable tbody").html(""); //每次加载的时候先设为空
			$.ajax({
            type: "POST",
            url : "sys/getJsonRoleUserList",
            data: {roleid:roleid,a_rolename:a_rolename},
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				$("#roletable tbody").append(data.event);
 				}
            });
  }


  function roleUserModalShow(){
  var roleid = $("#roleid").val();
  if(roleid==''||roleid==null){
  	window.parent.window.showmsg("请先选择左边角色！",1);
  	return;
  }else{
  $('#addRoleUsermodal').modal('show');
  $("#roleusermodalh4").html($("#rolename").val()+'-人员维护');
  $("#modaltable tbody").html(""); //每次加载的时候先设为空
  			$.ajax({
            type: "POST",
            url : "sys/listAddJsonRoleUser",
            data: "roleid="+roleid,
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				$("#modaltable tbody").append(data.event);
 				}
            });
  }
  }

    function saveRoleuser(){
		    var roleid = $("#roleid").val();
		    var userids =[];
//			console.log("length:"+ $("input[name='roleuserbox']:checked").length);
			  $('input[name="roleuserbox"]:checked').each(function(){
//			  console.log($(this).val());
			  userids.push($(this).val());
		 	 });
  			$.ajax({
            type: "POST",
            url : "sys/saveJsonRoleUserList",
            data: "userids="+userids+"&roleid="+roleid,
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				window.parent.window.showmsg(data.res,0);
 				}
            });
	}

	function removeRoleUser(){
		var roleid = $("#roleid").val();
		var rolename = $("#rolename").val();
		if(roleid==''||roleid==null){
			window.parent.window.showmsg("请先选择角色！",1);
		  	return;
		}else{
				var len = $("input[name='userbox']:checked").length;
				if(len==0){
				window.parent.window.showmsg("请勾选需要删除的人员！",1);
				return;
				}else{
					var userids =[];
					$('input[name="userbox"]:checked').each(function(){
					userids.push($(this).val());
					});
				
				  swal({
				  title: "您确定要执行此操作?",
				  text: "您将删除选中该角色用户!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定,删除!",
				  closeOnConfirm: false
				},
				function(){
				                     $.ajax({
							            type: "POST",
							            url : "sys/delJsonRoleUserList",
							            data: "userids="+userids+"&roleid="+roleid,
							            async: true,
							            error: function(request) {
							                alert("系统错误，请联系管理员！");
							            },
							            success: function(data) {
											window.parent.window.showmsg(data.res,0);
											writeRoleUser(roleid,rolename);
											swal(data.res, "", "success");
							 				}
							            });
						                 return;
				});
				}
		 	}
		}


	function addRole(){
	  	$('#addRolemodal').modal('show');
  		$("#addRolemodalheader").html('新建角色');
		var path = "<%=basePath%>sys/addRole";
    	$('#form1').attr("action", path);  //修改actionpath;
	}

  function removeRole(){
  var roleid = $("#roleid").val();
  var rolename = $("#rolename").val();
  if(roleid==''||roleid==null){
	window.parent.window.showmsg("请先选择左边角色！",1);
	return;
	}
	var path = "<%=basePath%>sys/deleteRole?roleid="+roleid+"";
	swalremoveRole(path);
  }

  function updateRole(){
  		var roleid = $("#roleid").val();
		if(roleid==''||roleid==null){
		  	window.parent.window.showmsg("请先选择左边角色！",1);
		  	return;
		}  		
	  	$('#addRolemodal').modal('show');
  		$("#addRolemodalheader").html('修改角色');
  		$("#updaterole").html("修改");
  		$("#up_rolename").val($("#rolename").val());
		var path = "<%=basePath%>sys/updateRole?roleid="+roleid+"";
    	$('#form1').attr("action", path);  //修改actionpath;
  }

    $(function() {
    	window.parent.window.showmsg('${res}',2);
        $("#btn5").click(function(){
             $(this).button('loading').delay(1000).queue(function() {
             		    var roleid = $("#roleid").val();
             		    var rolename = $("#rolename").val();
					    var userids =[];
						  $('input[name="roleuserbox"]:checked').each(function(){
//						  console.log($(this).val());
						  userids.push($(this).val());
					 	 });
			  			$.ajax({
			            type: "POST",
			            url : "sys/saveJsonRoleUserList",
			            data: "userids="+userids+"&roleid="+roleid,
			            async: true,
			            error: function(request) {
			                alert("系统错误，请联系管理员！");
			            },
			            success: function(data) {
							window.parent.window.showmsg(data.res,0);
							$('#addRoleUsermodal').modal('hide');
							writeRoleUser(roleid,rolename);
			 				}
			            });
			              $(this).button('reset');
			              $(this).dequeue();
             });
        });
    });

    
//模态框菜单加载
function swalremoveRole(path){
  swal({
  title: "您确定要执行此操作?",
  text: "您将删除选中角色!",
  type: "warning",
  showCancelButton: true,
  confirmButtonColor: "#DD6B55",
  confirmButtonText: "确定,删除!",
  closeOnConfirm: false
},
function(){
    $('#form1').attr("action", path).submit();
});
}

showmsg("角色维护");
</script>
<style type="text/css">
.nav-fx>li.active a {
	background-color: #3AC5BE;
}
/*#65bd77 f1f1f1 3AC5BE*/
</style>
</head>
<body>
	<input type="hidden" id="rolename">
	<input type="hidden" id="roleid">
	<section class="content">
		<section id="vbox">
			<section class="padder">
				<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
					<li><a href="content.jsp"><i class="fa fa-home"></i> Home</a>
					</li>
					<li>系统管理</li>
					<li>角色维护</li>
				</ul>
			</section>
			<section class="hbox stretch">
				<aside class="aside-md bg-white b-r" id="subNav">
					<section class="vbox scrollable">
						<div class="wrapper b-b header">
							角色列表&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-default" onclick="addRole()" title="新增角色">
									<i class="fa fa-plus"></i>
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="removeRole()" title="删除角色">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="updateRole()" title="修改角色">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</div>
						<div style="height:400px; overflow-y:scroll;">
							<ul class="nav nav-fx nav-white" id="rolenavul">
								<script>writeRole();</script>
							</ul>
						</div>

					</section>
				</aside>
				<aside class="bg-white">
					<header class="header bg-light bg-gradient">
						<ul class="nav nav-tabs nav-white">
							<li class="active"><a href="#rolepane" data-toggle="tab">角色管理</a></li>
							<li><a href="#rolemenupane" data-toggle="tab">角色菜单管理</a></li>
							<li class=""><a href="#interaction" data-toggle="tab">Info</a></li>
						</ul>
					</header>
					<section class="scrollable">
						<div class="tab-content">
							<div class="tab-pane active" id="rolepane">
								<header>
									<div class="row m-t-sm">
										<div class="col-sm-8 m-b-xs">
											<a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active"><i class="fa fa-caret-right text fa-lg"></i><i class="fa fa-caret-left text-active fa-lg"></i> </a>
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-default" title="Refresh" onclick="writeRoleUserRef()">
													<i class="fa fa-refresh"></i>
												</button>
												<!-- <button type="button" class="btn btn-sm btn-default" title="Remove"><i class="fa fa-trash-o"></i></button> -->
											</div>
											<button class="btn btn-sm btn-default" onclick="roleUserModalShow()" data-toggle="modal">
												<i class="fa fa-plus"></i>新增人员
											</button>
											<button class="btn btn-sm btn-default" onclick="removeRoleUser()">
												<i class="fa fa-minus"></i>删除人员
											</button>
								<!-- 		<button class="btn btn-sm btn-default" onclick="writeRole()">
												<i class="fa fa-minus"></i>wiriterole
											</button>
								 -->												
										</div>
										<div class="col-sm-4 m-b-xs">
											<div class="input-group">
												<input type="text" class="input-sm form-control" id="a_rolename" name="a_rolename" placeholder="Search Name"> <span class="input-group-btn">
													<button class="btn btn-sm btn-default" onclick="writeRoleUserRef()" type="button">Go!</button> </span>
											</div>
										</div>
									</div>
								</header>
								<section class="scrollable wrapper w-f">
									<section class="panel panel-default">
										<div class="table-responsive" style="overflow-y:scroll; height: 350px">
											<table id="roletable" class="table table-striped sort_table">
												<thead>
													<tr>
														<th width="20" class="no-sort"><input type="checkbox"></th>
														<th width="20" class="no-sort"></th>
														<th>用户ID</th>
														<th id="sort_header">用户名</th>
														<th>创建时间</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</section>
								</section>
							</div>

							<div class="tab-pane" id="rolemenupane">
								<div>
									<iframe name="treeFrame" id="treeFrame" src="sys/roleTreeView" frameborder="0" width="100%" height="400px"></iframe>
								</div>
							</div>

							<div class="tab-pane" id="interaction">
								<div class="text-center wrapper">
									<i class="fa fa-spinner fa fa-spin fa fa-large"></i>
								</div>
							</div>
						</div>
					</section>
				</aside>
			</section>
		</section>
	</section>

	<div class="modal fade" id="addRoleUsermodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="roleusermodalh4">角色用户新增</h4>
				</div>
				<div class="modal-body" style="height:300px; overflow-y:scroll;">
					<table class="table table-striped m-b-none text-sm" id="modaltable">
						<thead>
							<tr>
								<th width="20px" no-sort>选择</th>
								<th width="20px" class="no-sort">用户ID</th>
								<th width="20px">用户名</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-info" id="btn5" data-loading-text="Updating...">Save changes</button>
					<!-- data-loading-text="Updating..." -->
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addRolemodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addRolemodalheader">角色维护</h4>
				</div>
				<div class="modal-body">
					<form id="form1" class="bs-example form-horizontal" action="" role="form" method="post">
						<div class="form-group">
							<label class="col-lg-2 control-label">角色名</label>
							<div class="col-lg-10">
								<input type="text" id="up_rolename" name="up_rolename" required="required" class="form-control" placeholder="角色ID">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button id="updaterole" name="updaterole" type="submit" class="btn btn-sm btn-default">增加</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
