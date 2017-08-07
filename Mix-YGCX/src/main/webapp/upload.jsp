<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>文件上传 Web Application</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/select2.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/theme.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/fuelux/fuelux.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css" type="text/css" cache="false" />
    <link rel="stylesheet" href="<%=basePath%>resources/notebook/js/slider/slider.css" type="text/css" cache="false" />
    <script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
    <script src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
    <script src="<%=basePath%>resources/js/ajaxfileupload.js"></script>    
    <!-- fuelux -->
    <script src="<%=basePath%>resources/notebook/js/fuelux/fuelux.js" cache="false"></script>
    <!-- datepicker -->
    <script src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js" cache="false" charset="UTF-8"></script>
    <!-- slider -->
    <script src="<%=basePath%>resources/notebook/js/slider/bootstrap-slider.js" cache="false"></script>
    <!-- file input -->
    <script src="<%=basePath%>resources/notebook/js/file-input/bootstrap-filestyle.min.js" cache="false"></script>
    <!-- combodate -->
    <script src="<%=basePath%>resources/notebook/js/libs/moment.min.js" cache="false"></script>
    <script src="<%=basePath%>resources/notebook/js/combodate/combodate.js" cache="false"></script>
    <!-- select2 -->
    <script src="<%=basePath%>resources/notebook/js/select2/select2.min.js" cache="false"></script>
    <!-- wysiwyg -->
    <script src="<%=basePath%>resources/notebook/js/wysiwyg/jquery.hotkeys.js" cache="false"></script>
    <script src="<%=basePath%>resources/notebook/js/wysiwyg/bootstrap-wysiwyg.js" cache="false"></script>
    <script src="<%=basePath%>resources/notebook/js/wysiwyg/demo.js" cache="false"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/jquery.validate.js"></script>
<script type="text/javascript">
  $(function(){
  var validate =  $("#sys_form").validate(
   {
     rules: {
   //  bxqjstarttime:{required:true},
     bxqjendtime: {required:true},
     bxgxtime:{required:true}
    },
    messages: {
   //  bxqjstarttime:{required:"保险区间开始时间不能为空！"},
     bxqjendtime: {required:"保险区间截止时间不能为空！"},
     bxqjendtime: {required:"保险更新时间不能为空！"}
    },
        submitHandler: function (form) {
        alert(form);
    }
   });
   

	$("#btnUpload").click(function() {
			alert("AA");
			if ($("#sys_form").valid()) {
				alert("成功验证");
			}else{
			}

		});

		$("#ybnd").datepicker().on('changeDate', function(ev) {
			alert(ev);
			var startTime = ev.date.valueOf();
			alert(startTime);
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
			$("#nddiv").hide();
			$("#yddiv").hide();
			switch ($(this).val()) {
			case 'ND':
				$("#nddiv").show();
				$("#bxqjstarttime").rules("add",{required : true,messages:{required:"此项必填"}});
				break;
			case 'YD':
				$("#yddiv").show();
				break;
			default:
				$("#nddiv").hide();
				$("#yddiv").hide();
			}
		});
		//	$("#nddiv").hide();
		//	$("#yddiv").hide();

	});

	function ajaxFileUpload() {
		var d = $("#sys_form").serializeArray();
		var data = {
			bxqjstarttime : $("#bxqjstarttime").val(),
			bxqjendtime : $("#bxqjendtime").val(),
			ybnd : $("#ybnd").val(),
			sclb : $("#sclb").val()
		};
		alert($("#bxqjstarttime").val());
		if (checkData()) {
			$("#btnUpload").button('loading');
			$.ajaxFileUpload({
				url : 'fileupload/ajaxUpload',
				type : 'post',
				secureuri : false, //一般设置为false
				fileElementId : 'upfile', // 上传文件的id、name属性名
				dataType : 'JSON', //返回值类型，一般设置为json、application/json
				data : data,//一同上传的数据
				success : function(data, status) {
					ZENG.msgbox.show(data.res, 4, 2000);
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
					ZENG.msgbox.show(returndata.res, 4, 2000);
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
		var fileDir = $("#upfile").val();
		var suffix = fileDir.substr(fileDir.lastIndexOf("."));
		if ("" == fileDir) {
			alert("选择需要导入的Excel文件！");
			return false;
		}
		//    	     	if(".xls" != suffix && ".xlsx" != suffix ){
		//    	     		alert("选择Excel格式的文件导入！");
		//    	     		return false;
		//   	     	}
		return true;
	}
</script>  
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
                                <li><a href="#">UI kit</a></li>
                                <li><a href="#">Form</a></li>
                                <li class="active">Elements</li>
                            </ul>
                            <div class="m-b-md">
                                <h3 class="m-b-none">Elements</h3>
                            </div>
                            <section class="panel panel-default">
                                <header class="panel-heading font-bold"> Form elements </header>                              
                                <div class="panel-body">
                                    <form id="sys_form" class="form-horizontal"  method="POST"  enctype="multipart/form-data" id="form1">
                                        <div class="line line-dashed line-lg pull-in"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Switch</label>
                                            <div class="col-sm-10">
                                                <label class="switch">
                                                    <input type="checkbox">
                                                    <span></span> </label>
                                            </div>
                                        </div>                                      
                                        <div class="line line-dashed line-lg pull-in"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">选择上传类别</label>
                                            <div class="col-sm-10">
                                                <div class="m-b">
                                                    <select id="sclb" name="sclb" style="width:260px">
                                                        <option value="">请选择</option>
                                                        <optgroup label="保全信息上传">
                                                            <option value="ND">年度初始保全信息上传</option>
                                                            <option value="YD">月度保全更新信息上传</option>
                                                        </optgroup>
                                                        <optgroup label="理赔信息上传">
                                                            <option value="LPAJ">理赔案件上传</option>
                                                            <option value="LPFP">理赔发票上传</option>
                                                        </optgroup>
                                                        <optgroup label="其他上传">
                                                            <option value="TM">特门信息上传</option>
                                                            <option value="ZW">驻外信息上传</option>
                                                        </optgroup>
                                                    </select>
                                                </div>
                                            </div>
                                            <div id="nddiv">
                                            <label class="col-sm-2 control-label">年度初始保全信息上传</label>
	                                            <div class="col-sm-10">
	                                                    <div class="form-group">
	                                                    	<label class="col-sm-2">保险区间开始时间</label>
	                                                    	<div class="col-xs-3">
	                                                        <input class="input-sm input-s datepicker-input form-control" id="bxqjstarttime" name="bxqjstarttime" size="16" type="text" placeholder="请选择日期"  data-date-format="yyyy-mm-dd">
	                                                    	</div>
	                                                    </div>                                                   
	                                                    <div class="form-group">
	                                                    	<label class="col-sm-2">保险区间截止时间</label>
	                                                    	<div class="col-xs-3">
	                                                        <input class="input-sm input-s datepicker-input form-control" id="bxqjendtime" name="bxqjendtime" size="16" type="text" placeholder="请选择日期"  data-date-format="yyyy-mm-dd">
	                                                    	</div>
	                                                    </div>
	                                                    <div class="form-group">
	                                                    	<label class="col-sm-2">医保年度</label>
	                                                    	<div class="col-xs-3">
	                                                        <input class="input-sm input-s datepicker-input form-control" id="ybnd" name="ybnd" size="16" type="text" value="2017" placeholder="请选择日期" data-date-format="yyyy">
	                                                    	</div>
	                                                    </div>
	                                            </div>
                                            </div>
                                            <div id="yddiv">
                                            <label class="col-sm-2 control-label">月度保全更新信息上传</label>
                                            <div class="col-sm-10">
                                               <div class="row">
                                                    <div class="m-b">
                                                    	<label class="col-sm-2">保险更新时间</label>
                                                    	<div class="col-xs-3">
                                                        <input class="input-sm input-s datepicker-input form-control" id="bxgxtime" name="bxgxtime" size="16" type="text" value="2017-01-01" data-date-format="yyyy-mm-dd">
                                                    	</div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>                                            
                                        </div>
                                        <div class="line line-dashed line-lg pull-in"></div>                                   
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">选择文件</label>
                                            <div class="col-sm-5">
                                                <input type="file" class="filestyle" id="upfile" name="upfile" data-icon="false" data-classButton="btn btn-default" data-classInput="form-control inline input-s">
                                            </div>                                           
                                        </div>
                                        <div>
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
