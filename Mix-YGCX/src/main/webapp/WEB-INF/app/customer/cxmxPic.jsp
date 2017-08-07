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
<title>图片明细</title>
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
<script type="text/javascript">
        function queryck(){
		  var params = $('#queryForm').serialize();
          init();
		}

		$(function() {
			var vcph=  '${info.cph }';
			$("#cph").val(vcph);
			var params = $('#queryForm').serialize();
         	init();
		});

		function init() {
			var vals = $('#queryForm').serialize();
			$.ajax({
            type: "POST",
            url : "customer/getQueryPicJsonList?"+vals,
            error: function(request) {
                alert("查询失败");
            },
            success: function(data) {
            	$("#tabdiv> ul").html("");
            	$("#divtabspan").html("");
				$.each(data.event,function(i, value) {
					var vclass = "active";
					if(i==0){
						vclass = "active";
					}else{
						vclass = " ";
					}
					
					$("#tabdiv> ul").append(
					"<li class=\""+vclass+"\"><a data-toggle=\"tab\" href=\"#tab"+i+"\">Tab"+i+"</a></li>"
					);
				});
				
				$.each(data.event,function(i, value) {
					var picstr = "<%=basePath %>customer/showImage?pic_name="+value;
					var vclass = "active";
					if(i==0){
						vclass = "active";
					}else{
						vclass = " ";
					}
					$("#divtabspan").append(
						"<div id=\"tab"+i+"\" class=\"tab-pane "+vclass+"\">  <a href=\"javascript:void(0);\" onclick=\"delpic('"+value+"');\" class =\"btn btn-sm btn-danger\">删除图像</a> </br> <img src=\""+picstr+"\" height=\"600\" width=\"800\"  alt=\"demo-image\"/></div>"
					);
				});
 				}
            });			
			}
			
function delpic(val){
			var vcph=  '${info.cph }';
			$("#pic_name").val(val);
			var params = $('#queryForm').serialize();
			if(window.confirm('你确定要删除该图片吗？')){
				$.ajax({
	            type: "POST",
	            url : "customer/deletePic?"+params,
	            error: function(request) {
	                alert("查询失败");
	            },
				success: function(data) {
					alert(data.event);
					init();
	 			}
	            });	
            }
            }


function getstate(val){
	var res = '状态错误';
	return res;
}

function exportfile(){
    	var url = encodeURI(encodeURI("customer/exportxls"));
    	window.location= url;
}

function getval(val){
	if(val==null||val==''){
		return '';
	}else{
		val = val.replace(",", "");
		return val;
	}
}


</script>
</head>
<body>

<div id="content">
<div class="content-header">
    <div id="breadcrumb">
    <a href="content.jsp" title="Go to Home" class="tip-bottom" ><i class="icon-home"></i> Home</a>
    <a class="current">图片信息管理</a>
    </div>
</div>
		<div class="container-fluid">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>${info.cph }</h5>
		</div>
				<form id = "queryForm" name="queryForm" class="form-inline" method="post">
               		<div class="panel-body">
                   	<div class="form-group">
                       <input type="text" class="form-control" id="cph" name="cph" placeholder="车牌号">
                       <input type="hidden" class="form-control" id="pic_name" name="pic_name" placeholder="文件名">
                    </div>
					<div class="form-group">
					 <a href="javascript:void(0);" onclick="queryck();" class ="btn btn-sm btn-info">查询</a>
					 </div>
                </div>
               </form>
		        <div id="picdiv" class="widget-box">
		        
		          <div id="tabdiv" class="widget-title">
		            <ul class="nav nav-tabs">

		            </ul>
		          </div>
		          <div id="divtabspan" class="widget-content tab-content">

		          </div>
          		</div>
        </div>

</body>
</html>
