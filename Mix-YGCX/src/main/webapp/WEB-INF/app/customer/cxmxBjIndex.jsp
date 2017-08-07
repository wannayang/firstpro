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
<title>员工车险报价信息管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/page/page.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="<%=basePath%>resources/css/matrix-style.css" />
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
<script type="text/javascript">
	function trClick(obj) {
		var clickTrObj = obj;
	}

	$(function() {
		init();
		initquery();
	});
		
		
function initquery(){
$.ajax({
            type: "POST",
            async:false,
            url:  "bases/getAllBJsonList",
            data: {vid:'1',viewFlg:'1'},
            error: function(request) {
                alert("查询失败");
            },
            success: function(data){
            	//$("#sys_form select").empty();
            	xzmcrow = "<option value=''></option>";
            	$("#queryForm select[id='dw']").append("<option value=''></option>");
            	$("#queryForm select[id='jb']").append("<option value=''></option>");
            	$("#queryForm select[id='cbgs']").append("<option value=''></option>");
            	$("#queryForm select[id='cbqd']").append("<option value=''></option>");
            	$("#queryForm select[id='jqxsq']").append("<option value=''></option>");
            	$("#queryForm select[id='ccs']").append("<option value=''></option>");
            	$("#queryForm select[id='cpys']").append("<option value=''></option>");
            	$.each(data.event,function(i, value) {
            	switch(value.id.fl)
					{
					case "单位":
					$("#queryForm select[id='dw']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "级别":
					$("#queryForm select[id='jb']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "承保公司":
					$("#queryForm select[id='cbgs']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "承保渠道":
					$("#queryForm select[id='cbqd']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "交强险（税前）":
					$("#queryForm select[id='jqxsq']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "车船税":
					$("#queryForm select[id='ccs']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "车牌颜色":
					$("#queryForm select[id='cpys']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "险种名称":
					xzmcrow = xzmcrow+"<option value='"+value.id.value+"'>"+value.id.value+"</option>";
					break;
					default:;
					}
            	});
            }
		});
}

	function queryck(){
	  var params = $('#queryForm').serialize();
      init();
	}

	function init() {
	var vals = $('#queryForm').serialize();
	var jsonMyPagination = $("#pageBar").myPagination(
		{
			currPage : 1,
			pageNumber : 10,
			pageCount: 10,
			cssStyle : 'jogger',//分页样式，具体样式可以从css/page.css样式中选取   jogger
				ajax : {
					on : true,//是否启用异步请求，必须启用
					url : 'customer/getQueryBjJsonList?'+vals,   //?idnumber=2&name=比
					dataType : 'json',
					//param : {acode:'44',i_idnumber:'111'},//参数列表，其中  on 必须开启，page 参数必须存在,其他自定义
					ajaxStart : function() {
						ZENG.msgbox.show(" 正在加载中，请稍后...", 6, 1000000);
					},
					onClick : function(page) {
						//ZENG.msgbox.show(" 正在加载" + page + "页，请稍后...", 6, 1000);
					},
					//回调函数
					callback : function(data) {
						ZENG.msgbox.hide(); //隐藏加载提示
						$("#customerTable> tbody").html(""); //每次加载的时候先设为空
							$.each(data.event,function(i, value) {
								$("#customerTable> tbody").append("<tr>"
										+"<td> "+ (i+1) + "</td>"
										+ "<td>"
										+ "<a href=\"javascript:void(0)\" onclick=\"cxmxPic('" + value.id.cph + "','"+value.id.tbnf+"');\" class=\"btn btn-primary btn-xs active\" role=\"button\">查看明细</a>&nbsp;|&nbsp;"
										+ "<a href=\"javascript:void(0)\" onclick=\"cxmxAddIndex('" + value.id.cph + "','"+value.id.tbnf+"');\" class=\"btn btn-warning btn-xs active\" role=\"button\" >编辑</a>&nbsp;"
										+ "</td>"										
										+"<td> "+ value.id.cph + "</td>"
										+"<td> "+ value.id.tbnf + "</td>"
										+"<td> "+ value.xbnx + "</td>"
										+"<td> "+ value.jfrq + "</td>"
										+"<td> "+ value.qbrq + "</td>"
										+"<td> "+ value.zbrq + "</td>"
										+"<td> "+ value.czxm + "</td>"
										+"<td> "+ value.czsfzh + "</td>"
										+"<td> "+ value.czlxfs + "</td>"
										+"<td> "+ value.jbrxm + "</td>"
										+"<td> "+ value.jbrdh + "</td>"
										+"<td> "+ value.dw + "</td>"
										+"<td> "+ value.jb + "</td>"
										+"<td> "+ value.cllx + "</td>"
										+"<td> "+ value.cx + "</td>"
										+"<td> "+ value.cjh + "</td>"
										+"<td> "+ value.fdjh + "</td>"
										+"<td> "+ value.cpys + "</td>"
										+"<td> "+ value.bllb + "</td>"
										+"<td> "+ value.syxz + "</td>"
										+"<td> "+ value.cdrq + "</td>"
										+"<td> "+ value.cbgs + "</td>"
										+"<td> "+ value.syxbdh + "</td>"
										+"<td> "+ value.jqxbdh + "</td>"
										+"<td> "+ value.cbqd + "</td>"
										+"<td> "+ value.syxsq + "</td>"
										+"<td> "+ value.jqxsq + "</td>"
										+"<td> "+ value.syxsh + "</td>"
										+"<td> "+ value.jqxsh + "</td>"
										+"<td> "+ value.bfzjesh + "</td>"
										+"<td> "+ value.ccs + "</td>"
										+"<td> "+ value.hccs + "</td>"
										+"<td> "+ value.bhccs + "</td>"
										+"<td> "+ value.flfbl + "</td>"
										+"<td> "+ value.flffs1 + "</td>"
										+"<td> "+ value.flffs2 + "</td>"
										+"<td> "+ value.flffs3 + "</td>"
										+"<td> "+ value.flfzje + "</td>"
										+"<td> "+ value.sjzfbfje + "</td>"
										+"<td> "+ value.jszdzrq + "</td>"
										+"<td> "+ value.czrq + "</td>"
										+"<td> "+ value.czr + "</td>"
										+"<td> "+ value.state + "</td>"	
																		
										+ "</tr>");
							});
									$("#rowCount").text(data.pageBean.totalRow);
									$("#pageCount").text(data.pageBean.totalPage);
									$("#pageSize").text(data.pageBean.pageSize);
						}
					},
			});
}

function cxmxAddIndex(cph,tbnf){
	$("#opercph").val(cph);
	$("#opertbnf").val(tbnf);
	$("#queryForm").attr("target", '_blank');
	$("#queryForm").attr("action", 'customer/cxmxBjAddIndex').submit();
}

function cxmxPic(cph,tbnf){
	$("#opercph").val(cph);
	$("#opertbnf").val(tbnf);
	$("#queryForm").attr("target", '_blank');
	$("#queryForm").attr("action", 'customer/cxmxPic').submit();
}

function delcustomer(cph,tbnf){
	if(confirm('确定删除吗 ？')){
	window.location.href = "customer/deleteCustomer?cph=" + cph + "&tbnf="+tbnf;
	}
}

function btnclear(){
	if (confirm('您确定要清除所有信息吗？')==true){
	$('#queryForm').attr("action", 'customer/deleteCustomer').submit();
	}
}

function exportfile(){
		var params = $('#queryForm').serialize();
    	var url = "customer/exportxls?"+params;
    	$('#queryForm').attr("action", 'customer/exportxls').submit();
}
        
showmsg("员工车险续保信息管理");
</script>
</head>
<body>

<div id="content">
  <div class="content-header">
    <div id="breadcrumb">
    <a href="content.jsp" title="Go to Home" class="tip-bottom" ><i class="icon-home"></i> Home</a> 
    <a  class="current">员工车险信息管理</a>
    </div>
</div>
		<div class="container-fluid">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>员工车险续保信息管理</h5>
            <span class="label label-info"></span>
		</div>
               <form id = "queryForm" name="queryForm" class="form-inline" method="post">
               <input type="hidden" class="input-sm form-control" id="opercph" name="opercph">
               <input type="hidden" class="input-sm form-control" id="opertbnf" name="opertbnf">
               
               <div class="panel-body">
               <div class="col-sm-12">
                   <div class="form-group">
                       <input type="text" class="input-sm form-control" id="cph" name="cph" placeholder="车牌号">
				   </div>
					<div class="form-group">
						<label class=" control-label">投保年份</label> <input class="input-sm datepicker-input-yyyy form-control" type="text" id="tbnf" name="tbnf" placeholder="请选择日期" data-date-format="yyyy" />
					</div>				   
				</div>
					<div class="form-group">					
					<a href="javascript:void(0);" onclick="queryck();" class ="btn btn-sm btn-info">查询</a>
                	</div>
                </div>
               </form>
		
          <div class="table-responsive">
            <table id="customerTable" class="table table-bordered table-striped sort_table">
              <thead>
                <tr>
                <th>序号</th>
                <th>操作</th>
                <th>车牌号</th>
				<th>投保年份</th>
				<th>续保年限</th>
				<th>缴费日期</th>
				<th>起保日期</th>
				<th>终保日期</th>
				<th>车主姓名</th>
				<th>车主身份证号</th>
				<th>车主联系方式</th>
				<th>经办人姓名</th>
				<th>经办人电话</th>
				<th>单位</th>
				<th>级别</th>
				<th>车辆类型</th>
				<th>车型</th>
				<th>车架号</th>
				<th>发动机号</th>
				<th>车牌颜色</th>
				<th>玻璃类别</th>
				<th>使用性质</th>
				<th>初登日期</th>
				<th>承保公司</th>
				<th>商业险保单号</th>
				<th>交强险保单号</th>
				<th>承保渠道</th>
				<th>商业险（税前）</th>
				<th>交强险（税前）</th>
				<th>商业险（税后）</th>
				<th>交强险（税后）</th>
				<th>保费总金额（税后）</th>
				<th>车船税</th>
				<th>含车船税</th>
				<th>不含车船税</th>
				<th>福利费比例</th>
				<th>福利费方式1（现金）</th>
				<th>福利费方式2（服务券）</th>
				<th>福利费方式3（积分）</th>
				<th>福利费总金额</th>
				<th>实际支付保费金额</th>
				<th>驾驶证到期日期</th>
				<th>操作日期</th>
				<th>操作人</th>
				<th>状态</th>
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
