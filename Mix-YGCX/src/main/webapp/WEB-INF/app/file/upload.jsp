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
    <title>文件上传 Web Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/select2.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/theme.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/fuelux/fuelux.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/slider/slider.css" type="text/css" cache="false" />
    <script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/my-datepicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/ajaxfileupload.js"></script>    
    <!-- fuelux -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/fuelux/fuelux.js" cache="false"></script>
    <!-- datepicker -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js" cache="false" charset="UTF-8"></script>
    <!-- slider -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/slider/bootstrap-slider.js" cache="false"></script>
    <!-- file input -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/file-input/bootstrap-filestyle.min.js" cache="false"></script>
    <!-- combodate -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/libs/moment.min.js" cache="false"></script>
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/combodate/combodate.js" cache="false"></script>
    <!-- select2 -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/select2/select2.min.js" cache="false"></script>
    <!-- wysiwyg -->
    <script type="text/javascript" src="<%=basePath%>resources/notebook/js/wysiwyg/jquery.hotkeys.js" cache="false"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script type="text/javascript">
	var vbxqjstarttime ="";
	var vbxqjendtime ="";

  $(function(){
	$("#infodiv").hide();
	$("#picdiv").hide();
	
  $("#sys_form").validate({
	rules : {
				sclb   :{required: true},
				upfile : {
					upfilevali : true
				}
			},
			messages : {
				sclb   :{required: "请选择上传类别"}
			}
		});

		jQuery.validator.addMethod("upfilevali", function(value, element) {
			var res = true;
			var fileDir = $("#upfile").val();
			var suffix = fileDir.substr(fileDir.lastIndexOf("."));
			if ("" == fileDir) {
				res = false;
			}
			if(".xls" != suffix && ".xlsx" != suffix&&".zip" != suffix ){
				res = false;
			}
			return res;
		}, "选择需要导入的Excel文件或ZIP文件！");

		$("#btnUpload").click(function() {
			if ($("#sys_form").valid()) {
				ajaxFileUpload();
			} else {
			}
		});
	});

	$(function() {
		$("#sclb").select2();
		$(document).ajaxStart(function() {
			ZENG.msgbox.show(" 正在加载中，请稍后...", 6);
			//$("#wait_loading").show();
		});
		$(document).ajaxComplete(function() {
			//$("#wait_loading").hide();
		});
		$("#sclb").change(function() {
			$("#infodiv").hide();
			$("#picdiv").hide();
			switch ($(this).val()) {
			case 'INFO':
				$("#infodiv").show();
				break;
			case 'PIC':
				$("#picdiv").show();
				break;
			
			default:
				$("#infodiv").hide();
				$("#picdiv").hide();	
			}
		});
	});

	function ajaxFileUpload() {
		var d = $("#sys_form").serializeArray();
		var dv = {
			sclb : $("#sclb").val()
		};
		if (checkData()) {
			$("#btnUpload").button('loading');
			$.ajaxFileUpload({
				url : 'fileupload/ajaxUpload',
				type : 'post',
				secureuri : false, //一般设置为false
				fileElementId : 'upfile', // 上传文件的id、name属性名
				dataType : 'json', //返回值类型，一般设置为json、application/json
				data : dv,//一同上传的数据
				success: function(data, status){
					ZENG.msgbox.show(data.res, 4, 5000);
					$("#btnUpload").button('reset');
				},
				error : function(data, status, e) {
					alert(e);
				}
			});
		}
	}

	function ajaxFileUpload2() {
		if (checkData()) {
			$("#btnUpload").button('loading');
			var formData = new FormData($("#sys_form")[0]);
			$.ajax({
				url : 'fileupload/ajaxUpload.do',
				type : 'POST',
				data : formData,
				async : true,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					ZENG.msgbox.show(returndata.res, 4, 5000);
					$("#btnUpload").button('reset');
				},
				error : function(returndata) {
					alert(returndata);
				}
			});
		}
	}

	//JS校验form表单信息
	function checkData() {
		return true;
	}
</script>

	</script>
	<style>
	</style>

</head>
<body>
    <section class="vbox">
        <section>
            <section class="hbox stretch">
                <section id="content">
                    <section class="vbox">
                        <section class="scrollable padder">
                            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                                <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
                                <li><a href="">系统管理</a></li>
                            </ul>
                            <div class="m-b-md">
                                <h3 class="m-b-none">文件上传</h3>
                            </div>
                            <section class="panel panel-default">
                                <header class="panel-heading font-bold"> Form elements </header>                              
                                <div class="panel-body">
                                    <form id="sys_form" class="form-horizontal"  method="POST"  enctype="multipart/form-data">
                                        <div class="line line-dashed line-lg pull-in"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">选择上传类别</label>
                                            <div class="col-sm-10">
                                                <div class="m-b">
                                                    <select id="sclb" name="sclb" style="width:260px">
                                                        <option value="">请选择</option>
                                                        <optgroup label="员工车险信息上传">
                                                            <option value="INFO">员工车险数据上传</option>
                                                            <option value="PIC">员工车险图片上传</option>
                                                        </optgroup>
                                                    </select>
                                                </div>
                                            </div>
                                            </div>
                                            <div id="infodiv" class="form-group">
                                            <div class="line line-dashed line-lg pull-in"></div>
                                           	 	<label class="col-sm-2 control-label">员工车险数据上传</label>
                                            </div>                                                                                        
                                            <div id="picdiv" class="form-group">
                                            <div class="line line-dashed line-lg pull-in"></div>
                                            		<label class="col-sm-2 control-label">员工车险图片信息上传</label>
                                            </div>
                                         
                                        <div class="line line-dashed line-lg pull-in"></div>                                   
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">选择文件</label>
                                            <div class="col-sm-5">
                                                <input type="file" class="filestyle" id="upfile" name="upfile" data-icon="false" data-classButton="btn btn-default" data-classInput="form-control inline input-s">
                                            </div>                                           
                                        </div>
                                        <div>
                                        <div class="line line-dashed line-lg pull-in"></div>
										<div class="form-group">
											<label class="col-sm-2 control-label">操作</label>
											<div class="col-sm-10">
												<button type="button" class="btn btn-primary nyroModal" id="btnUpload" name="btnUpload" data-loading-text="提交中...">
												<i class="fa fa-cloud-upload text"></i> <span class="text">提交上传</span>  
												</button>			
												</div>
										</div>
										</div>
                                    </form>
                                </div>
                            </section>
                        </section>
                    </section>
                    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
                  
                </section>
                <aside class="bg-light lter b-l aside-md hide" id="notes">
                    <div class="wrapper">Notification</div>
                </aside>
                
            </section>
        </section>
    </section>
    <!-- Bootstrap -->
</body>

</html>
