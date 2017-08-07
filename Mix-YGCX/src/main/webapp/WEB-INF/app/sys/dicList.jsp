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
<title>字典设置</title>
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
  function writeDic(){
			$.ajax({
            type: "POST",
            url : "sys/dic/getJsonDicList",
            data: "codecen=3",
            async: false,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
                var varmenu = eval(data);
				$("#dicnavul").append(data.event);
 				}
            });
  }
  
  function writeDicbRef(){
  	writeDicb($("#dicid").val(),$("#dicname").val());
  }
  
  function procRun(value){
			$.ajax({
            type: "POST",
            url : "sys/dic/procRun",
            data : {value:value},
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				alert(data.res);
 				}
            });  	
  }


//单击左边显示右边菜单
    function writeDicb(dicid,dicname){
    if(dicid==null||dicid==''){
    	window.parent.window.showmsg("请先选择左边字典！",1);
    	return;
    }
    $("#dicname").val(dicname);
    $("#dicid").val(dicid);
    var a_dicname = $("#a_dicname").val();
    $("#dictable tbody").html(""); //每次加载的时候先设为空
			$.ajax({
            type: "POST",
            url : "sys/dic/getJsonDicbList",
            data: {zdbm:dicid,a_dicname:a_dicname},
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				$("#dictable tbody").append(data.event);
 				}
            });
  }

    function saveDicuser(){
		    var dicid = $("#dicid").val();
		    var userids =[];
//			console.log("length:"+ $("input[name='dicuserbox']:checked").length);
			  $('input[name="dicuserbox"]:checked').each(function(){
//			  console.log($(this).val());
			  userids.push($(this).val());
		 	 });
  			$.ajax({
            type: "POST",
            url : "sys/saveJsonDicbList",
            data: "userids="+userids+"&dicid="+dicid,
            async: true,
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				window.parent.window.showmsg(data.res,0);
 				}
            });
	}

	function removeDicb(){
		var dicid = $("#dicid").val();
		var dicname = $("#dicname").val();
		if(dicid==''||dicid==null){
			window.parent.window.showmsg("请先选择字典！",1);
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
				  text: "您将删除选中该字典用户!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定,删除!",
				  closeOnConfirm: false
				},
				function(){
                    $.ajax({
		            type: "POST",
		            url : "sys/delJsonDicbList",
		            data: "userids="+userids+"&dicid="+dicid,
		            async: true,
		            error: function(request) {
		                alert("系统错误，请联系管理员！");
		            },
		            success: function(data) {
						window.parent.window.showmsg(data.res,0);
						writeDicb(dicid,dicname);
						swal(data.res, "", "success");
		 				}
		            });
	                 return;
				});
				}
		 	}
		}


	function addDic(){
	  	$('#addDicmodal').modal('show');
  		$("#addDicmodalheader").html('新建字典');
		var path = "<%=basePath%>sys/addDic";
    	$('#form1').attr("action", path);  //修改actionpath;
	}

  function removeDic(){
  var dicid = $("#dicid").val();
  var dicname = $("#dicname").val();
  if(dicid==''||dicid==null){
	window.parent.window.showmsg("请先选择左边字典！",1);
	return;
	}
	var path = "<%=basePath%>sys/dic/deleteDic?dicid="+dicid+"";
	swalremoveDic(path);
  }

  function updateDic(){
  		var dicid = $("#dicid").val();
		if(dicid==''||dicid==null){
		  	window.parent.window.showmsg("请先选择左边字典！",1);
		  	return;
		}
	  	$('#addDicmodal').modal('show');
  		$("#addDicmodalheader").html('修改字典');
  		$("#updatedic").html("修改");
  		$("#up_dicname").val($("#dicname").val());
		var path = "<%=basePath%>sys/dic/updateDic?dicid="+dicid+"";
    	$('#form1').attr("action", path);  //修改actionpath;
  }

    $(function() {
    	window.parent.window.showmsg('${res}',2);
        $("#btn5").click(function(){
             $(this).button('loading').delay(1000).queue(function() {
             		    var dicid = $("#dicid").val();
             		    var dicname = $("#dicname").val();
					    var userids =[];
						  $('input[name="dicuserbox"]:checked').each(function(){
//						  console.log($(this).val());
						  userids.push($(this).val());
					 	 });
			  			$.ajax({
			            type: "POST",
			            url : "sys/dic/saveJsonDicbList",
			            data: "userids="+userids+"&dicid="+dicid,
			            async: true,
			            error: function(request) {
			                alert("系统错误，请联系管理员！");
			            },
			            success: function(data) {
							window.parent.window.showmsg(data.res,0);
							$('#addDicbmodal').modal('hide');
							writeDicb(dicid,dicname);
			 				}
			            });
			              $(this).button('reset');
			              $(this).dequeue();
             });
        });
    });

    
//模态框菜单加载
function swalremoveDic(path){
  swal({
  title: "您确定要执行此操作?",
  text: "您将删除选中字典!",
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

showmsg("字典维护");
</script>
<style type="text/css">
.nav-fx>li.active a {
	background-color: #3AC5BE;
}
/*#65bd77 f1f1f1 3AC5BE*/
</style>
</head>
<body>
	<input type="hidden" id="dicname">
	<input type="hidden" id="dicid">
	<section class="content">
		<section id="vbox">
			<section class="padder">
				<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
					<li><a href="content.jsp"><i class="fa fa-home"></i> Home</a>
					</li>
					<li>系统管理</li>
					<li>字典维护</li>
				</ul>
			</section>
			<section class="hbox stretch">
				<aside class="aside-md bg-white b-r" id="subNav">
					<section class="vbox scrollable">
						<div class="wrapper b-b header">
							字典列表&nbsp;&nbsp;&nbsp;
							<div class="btn-group">
							<!-- 
								<button type="button" class="btn btn-sm btn-default" onclick="addDic()" title="新增字典">
									<i class="fa fa-plus"></i>
								</button>
								<button type="button" class="btn btn-sm btn-default" onclick="removeDic()" title="删除字典">
									<i class="fa fa-minus"></i>
								</button>
							 -->
								<button type="button" class="btn btn-sm btn-default" onclick="updateDic()" title="修改字典名">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</div>
						<div style="height:400px; overflow-y:scroll;">
							<ul class="nav nav-fx nav-white" id="dicnavul">
								<script>writeDic();</script>
							</ul>
						</div>

					</section>
				</aside>
				<aside class="bg-white">
					<header class="header bg-light bg-gradient">
						<ul class="nav nav-tabs nav-white">
							<li class="active"><a href="#dicpane" data-toggle="tab">字典管理</a></li>
						</ul>
					</header>
					<section class="scrollable">
						<div class="tab-content">
							<div class="tab-pane active" id="dicpane">
								<header>
									<div class="row m-t-sm">
										<div class="col-sm-6 m-b-xs">
											<a href="#subNav" data-toggle="class:hide" class="btn btn-sm btn-default active"><i class="fa fa-caret-right text fa-lg"></i><i class="fa fa-caret-left text-active fa-lg"></i> </a>
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-default" title="Refresh" onclick="writeDicbRef()">
													<i class="fa fa-refresh"></i>
												</button>
											</div>									
										</div>
									</div>
								</header>
								<section class="scrollable wrapper w-f">
									<section class="panel panel-default">
										<div class="table-responsive" style="overflow-y:scroll; height: 350px">
											<table id="dictable" class="table table-striped sort_table">
												<thead>
													<tr>
														<th>字典编码</th>
														<th>分类编码</th>
														<th>VALUE</th>
														<th>说明</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</section>
								</section>
							</div>
						</div>
					</section>
				</aside>
			</section>
		</section>
	</section>

	<div class="modal fade" id="addDicbmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="dicusermodalh4">字典新增</h4>
				</div>
				<div class="modal-body" style="height:300px; overflow-y:scroll;">
					<table class="table table-striped m-b-none text-sm" id="modaltable">
						<thead>
							<tr>
								<th width="20px" no-sort>选择</th>
								<th width="20px" class="no-sort">字典ID</th>
								<th width="20px">字典名</th>
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

	<div class="modal fade" id="addDicmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addDicmodalheader">字典维护</h4>
				</div>
				<div class="modal-body">
					<form id="form1" class="bs-example form-horizontal" action="" dic="form" method="post">
						<div class="form-group">
							<label class="col-lg-2 control-label">字典名</label>
							<div class="col-lg-10">
								<input type="text" id="up_dicname" name="up_dicname" required="required" class="form-control" placeholder="字典ID">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button id="updatedic" name="updatedic" type="submit" class="btn btn-sm btn-default">增加</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
