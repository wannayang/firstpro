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
<title>工作日志信息管理</title>
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
					url : 'worklog/getQueryJsonList?'+vals,   //?idnumber=2&name=比
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
										+"<td> "+ value.cph + "</td>"
										+"<td> "+ value.tbnf + "</td>"
										+"<td> "+ getlb(value.lb) + "</td>"
										+"<td> "+ timeStamp2String(value.logdate)+ "</td>"
										+"<td> "+ getres(value.res)+ "</td>"
										+"<td> "+ value.bak + "</td>"
										+"<td> "+ value.czr + "</td>"												
										+ "</tr>");
							});
						}
					},
			});
	}
			
function getlb(val){
	if(val=='CS'){res = '初始';}
	if(val=='BJ'){res = '报价';}
	if(val=='SJ'){res = '算价';}
	return res;
}

function getres(val){
	if(val=='CS'){res = '初始';}
	if(val=='CG'){res = '成功';}
	if(val=='SB'){res = '失败';}
	if(val=='DD'){res = '待定';}
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
    	var url = "worklog/exportxls?"+params;
    	//window.location= url;
    	$('#queryForm').attr("action", 'customer/exportxls').submit();
}

showmsg("工作日志信息维护");
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
                       <input type="text" class="input-sm form-control" id="cph" name="cph" placeholder="车牌号">
				   </div>
					<div class="form-group">
						<label class=" control-label">投保年份</label> <input class="input-sm datepicker-input-yyyy form-control" type="text" id="tbnf" name="tbnf" placeholder="请选择日期" data-date-format="yyyy" />
					</div>               
					<div class="form-group">
					
							<span class="combodate" ><label class=" control-label">类别</label>
							<select class="form-control" id="lb" name ="lb" style="width: auto;">
									<option value="">全部</option>
									<option value="BJ">报价</option>
									<option value="SJ">算价</option>
							</select>
							</span>
							
							<span class="combodate" ><label class=" control-label">结果</label>
							<select class="form-control" id="res" name ="res" style="width: auto;">
									<option value="">全部</option>
									<option value="CS">初始</option>
									<option value="CG">成功</option>
									<option value="SB">失败</option>
									<option value="DD">待定</option>
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
                <th>车牌号</th>
				<th>投保年份</th>
				<th>类别</th>
				<th>日志时间 </th>
				<th>结果</th>
				<th>说明</th>
				<th>操作人</th>
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
