<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>员工车险基础信息列表</title>
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
$(function(){
    //init();
    	$.ajax({
            type: "POST",
            url:  "bases/getAllAJsonList",
            data: {vid:'1',viewFlg:'1'},
            error: function(request) {
                alert("查询失败");
            },
            success: function(data) {
            	$("#queryForm select").empty();
            	$("#queryForm select[id='fl']").append("<option value=''>全部</option>");
            	$.each(data.event,function(i, value) {
            	$("#queryForm select[id='fl']").append("<option value='"+value.fl+"'>"+value.fl+"</option>"); 
            	});
            	
            	$("#addform select").empty();
            	$("#addform select[id='fl']").append("<option value=''></option>"); 
            	$.each(data.event,function(i, value) {
            	$("#addform select[id='fl']").append("<option value='"+value.fl+"'>"+value.fl+"</option>"); 
            	});
            }
		});
});

		function update(obj) {
			var tds = $(obj).parent().parent().find('td');
			$("#addform select[id='fl']").val(tds.eq(0).text());
			$("#addform input[id='value']").val(tds.eq(1).text());
			$("#addform h4").html("更新信息");
			$('#addWin').modal('show');
		}
		
		function addInfo(){
			$("#addform h4").html("新增信息");
			$("#addform select[id='fl']").val('');
			$("#addform input[id='value']").val('');			
			$('#addWin').modal('show');
		}


		function deleteInfo() {
			var id = $(clickTrObj).find('td').eq(0).text();
			if (id == '') {
				alert("请点击要删除的列");
				return;
			}
			$.ajax("sys/user/deleteInfo?userId=" + id + "");
			window.location.reload();
		}

		function init() {
		var vals = $('#queryForm').serialize();
			myPagination = $("#pageBar").myPagination(
				{
					currPage : 1,
					pageNumber : 10,
					pageCount: 10,					
					cssStyle : 'jogger',//分页样式，具体样式可以从css/page.css样式中选取
						ajax : {
							on : true,//是否启用异步请求，必须启用
							type : "POST",
							url : 'bases/getQueryBJsonList?'+vals,
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
								$("#basesTable > tbody").html(""); //每次加载的时候先设为空
									$.each(data.event,function(i, value) {
										$("#basesTable > tbody").append("<tr>"
												+ "<td>" + value.id.fl + "</td>"
												+ "<td>" + value.id.value + "</td>"
												+ "<td>"
											//	+ "<a href=\"javascript:void(0)\" onclick=\"update(this);\" class=\"btn btn-primary btn-xs active\" role=\"button\">更新</a>&nbsp;|&nbsp;"
												+ "<a href=\"javascript:void(0)\" onclick=\"delInfo('" + value.id.fl + "','"+value.id.value+"');\" class=\"btn btn-danger btn-xs active\" role=\"button\">删除</a>"
												+ "</td>"
												+ "</tr>");
									});
								}
							},
					});
			}
			
			function delInfo(vfl,vvalue){
			if(window.confirm("你确定要删除值："+vvalue+"吗？")){
				$.ajax("bases/deleteBases?fl=" + vfl + "&value="+vvalue+"");
				window.location.reload();
				}
			}
			
		function queryck(){
          init();
		}			

$(function(){
   $("#addform").validate(
   {
     rules: {
     fl:{required:true},
     value: {required:true}
    },
    messages: {
     fl:{
     required:"分类不能为空！"
     },
     value: {
     required:"值不能为空！"
     }
    },
        submitHandler: function (form) {  
        form.submit();  
    }  
   });
  });
			
  showmsg("基础信息维护");
  
	</script>
	<style>
.error{
	color:red;
}
</style>
</head>
<body>
	<div id="content">
  <div class="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom">
    <i class="icon-home"></i> Home</a> <a href="#" class="current">系统管理</a> </div>
</div>	
	<div class="container-fluid">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>基础信息维护</h5>
            <span class="label label-info"></span>
			</div>
			<form id = "queryForm" name="queryForm" class="form-inline" method="post">
               <div class="panel-body">
					<div class="form-group">
							<span class="combodate" ><label class=" control-label">分类</label>
							<select name="fl" id="fl" type="text" class="form-control" value="" style="width: auto;">
							</select>
							</span>
					</div>
					<a href="javascript:void(0);" onclick="queryck();" class ="btn btn-sm btn-info">查询</a>
                </div>
               </form>	
		<div class="row">
			<div class="col-xs-1">
			<a href="javascript:void(0);" onclick="addInfo();" class="btn btn-primary" role="button">信息新增</a>
				<!-- <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addWin">基础信息新增</button> -->
				<!--<a href="javascript:void(0)" onclick="deleteInfo();" class="btn btn-danger" role="button">Delete</a> -->
			</div>
		</div>
		<div class="table-responsive">
		<table id="basesTable" class="table table-bordered sort_table">
			<thead>
				<tr>
					<th witdh="50%">分类</th>
					<th witdh="30%" >值</th>
					<th witdh="20%">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		</div>
		<hr />

		<div class="modal fade" id="addWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form id="addform" name="addform" class="form-horizontal" action="bases/saveBases">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">新增</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="sex" class="col-xs-2 control-label">分类</label>
								<div class="col-xs-8">
								<select name="fl" id="fl" type="text" class="form-control" value="" style="width: auto;">
								</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-xs-2 control-label">值</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="value" name="value">
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
						
		<!-- 分页显示的div块开始 -->
		<div style="float: right;">
			<div id="pageBar" style="float:right"></div>
		</div>
		<!-- 分页显示的div块结束 -->
		</div>
	</div>
</body>
</html>
