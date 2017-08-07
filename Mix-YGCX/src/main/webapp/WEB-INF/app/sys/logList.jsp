<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<LINK REL="SHORTCUT ICON" HREF="<%=basePath%>resources/notebook/images/dfibpiv.png"> 
<base href="<%=basePath%>">
<meta charset="UTF-8" />
<title>信息管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
var jsonMyPagination;

		var clickTrObj;
		function trClick(obj) {
			clickTrObj = obj;
		}

		$(function() {
			init();
		});
		
		function queryck(){
		  var params = $('#queryForm').serialize();
          init();
		}

function init() {
	var vals = $('#queryForm').serialize();
	jsonMyPagination = $("#pageBar").myPagination(
		{
			currPage : 1,
			pageNumber : 10,
			pageCount: 10,
			cssStyle : 'jogger',//分页样式，具体样式可以从css/page.css样式中选取   jogger
				ajax : {
					on : true,//是否启用异步请求，必须启用
					url : 'sys/log/getQueryJsonList?'+vals,   //?idnumber=2&name=比
					dataType : 'json',
					//param : {acode:'44',i_idnumber:'111'},//参数列表，其中  on 必须开启，page 参数必须存在,其他自定义
					ajaxStart : function() {
						ZENG.msgbox.show(" 正在加载中，请稍后...", 6, 10000);
					},
					onClick : function(page) {
						//ZENG.msgbox.show(" 正在加载" + page + "页，请稍后...", 6, 1000);
					},
					//回调函数
					callback : function(data) {
						ZENG.msgbox.hide(); //隐藏加载提示
						$("#ccustomerTable> tbody").html(""); //每次加载的时候先设为空
							$.each(data.event,function(i, value) {
								$("#ccustomerTable> tbody").append("<tr>"
										+"<td> "+ (i+1) + "</td>"
										+"<td> "+ value.id + "</td>"
										+"<td> "+ getprotype(getval(value.protype)) + "</td>"
										+"<td> "+ gettype(getval(value.type)) + "</td>"
										+"<td> "+ getstate(getval(value.state)) + "</td>"
										+"<td> "+ getval(value.bak) + "</td>"
										+"<td> "+ getval(value.czr) + "</td>"
										+"<td> "+ timeStamp2String(value.date) + "</td>"												
										+ "</tr>");
							});
						}
					},
			});
	}
			
function getstate(val){
	var res = '0';
	if(val=='0'){res = '失败';}
	if(val=='1'){res = '成功';}
	if(val=='3'){res = '变更';}
	return res;
}

function getprotype(val){
	var res = '1';
	if(val=='1'){res = '后台程序';}
	if(val=='2'){res = 'Web程序';}
	return res;
}

function gettype(val){
	var res = '0';
	if(val=='1'){res = '员工日志';}
	else if(val=='2'){res = '';}
	else if(val=='3'){res = '';}
	else{
		res = '其他';
	}
	return res;
}

function getval(val){
	if(val==null||val==''){
		return '';
	}else{
		val = val.replace(",", "");
		return val;
	}
}

function exportfile(){
		var params = $('#queryForm').serialize();
    	var url = "customer/exportxls?"+params;
    	//window.location= url;
    	$('#queryForm').attr("action", 'customer/exportxls').submit();
}

showmsg("日志信息维护");
</script>
</head>
<body>

<div id="content">
  <div class="content-header">
    <div id="breadcrumb">
    <a href="content.jsp" title="Go to Home" class="tip-bottom" ><i class="icon-home"></i> Home</a> 
    <a  class="current">日志信息管理</a>
    </div>
</div>
		<div class="container-fluid">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>日志信息维护</h5>
		</div>
               <form id = "queryForm" name="queryForm" class="form-inline" method="post">
               <div class="panel-body">
					<div class="form-group">
							<span class="combodate" ><label class=" control-label">程序类型</label>
							<select class="form-control" id="protype" name ="protype" style="width: auto;">
									<option value="">全部</option>
									<option value="1">后台程序</option>
									<option value="2">Web程序</option>
							</select>
							</span>
			

					</div>
					<a href="javascript:void(0);" onclick="queryck();" class ="btn btn-sm btn-info">查询</a>
                </div>
               </form>
		
          <div class="table-responsive">
            <table id="ccustomerTable" class="table table-bordered table-striped sort_table">
              <thead>
                <tr>
                <th>序号</th>
                <th>日志ID</th>
				<th>程序类型</th>
				<th>分类</th>
				<th>状态</th>
				<th>说明</th>
				<th>操作人</th>
				<th>日期</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
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
