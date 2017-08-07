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
	
  $("#sys_form").validate({
	rules : {
				sclb   :{required: true},
				upfile : {
					upfilevali : true
				},
				tbnd : {
					required : true,
					date : true
				}
			},
			messages : {
				sclb   :{required: "请选择上传类别"},
				tbnd : {
					required : "投年度时间不能为空！",
					date : "日期格式错误"
				}
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
		}, "选择需要导入的Excel文件！");

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
			switch ($(this).val()) {
			case 'INFO':
				break;
			case 'PIC':
				break;
			
			default:
			}
		});
	});

	function ajaxFileUpload() {
		var d = $("#sys_form").serializeArray();
		var dv = {
			tbrq : $("#tbrq").val(),
			sclb : $("#sclb").val(),
			bxgxtime : $("#bxgxtime").val(),
			casetbrq : $("#casetbrq").val(),
			fptbrq : $("#fptbrq").val(),
		};
		if (checkData()) {
			$("#btnUpload").button('loading');
			$.ajaxFileUpload({
				url : 'fileupload/ajaxUpload.do',
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
    <section class="hbox stretch"> <!-- .aside -->
      <!-- /.aside -->
      <section id="content">
        <section class="vbox">
          <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
              <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="#">UI kit</a></li>
              <li><a href="#">Form</a></li>
              <li class="active">Validation</li>
            </ul>
            <div class="m-b-md">
              <h3 class="m-b-none">Validation</h3>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <form data-validate="parsley">
                  <section class="panel panel-default">
                    <header class="panel-heading"> <span class="h4">Register</span> </header>
                    <div class="panel-body">
                      <p class="text-muted">Please fill the information to continue</p>
                      <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" data-required="true">
                      </div>
                      <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" data-type="email" data-required="true">
                      </div>
                      <div class="form-group pull-in clearfix">
                        <div class="col-sm-6">
                          <label>Enter password</label>
                          <input type="password" class="form-control" data-required="true" id="pwd">
                        </div>
                        <div class="col-sm-6">
                          <label>Confirm password</label>
                          <input type="password" class="form-control" data-equalto="#pwd" data-required="true">
                        </div>
                      </div>
                      <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" data-type="phone" placeholder="(XXX) XXXX XXX" data-required="true">
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" name="check" checked data-required="true">
                          I agree to the <a href="#" class="text-info">Terms of Service</a> </label>
                      </div>
                    </div>
                    <footer class="panel-footer text-right bg-light lter">
                      <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                    </footer>
                  </section>
                </form>
              </div>
              <div class="col-sm-6">
                <form data-validate="parsley">
                  <section class="panel panel-default">
                    <header class="panel-heading"> <span class="h4">Contact</span> </header>
                    <div class="panel-body">
                      <p class="text-muted">Need support? please fill the fields below.</p>
                      <div class="form-group pull-in clearfix">
                        <div class="col-sm-6">
                          <label>Your name</label>
                          <input type="text" class="form-control" placeholder="Name" data-required="true">
                        </div>
                        <div class="col-sm-6">
                          <label>Email</label>
                          <input type="email" class="form-control" placeholder="Enter email" data-required="true">
                        </div>
                      </div>
                      <div class="form-group">
                        <label>Your website</label>
                        <input type="text" data-type="url" data-required="true" class="form-control" placeholder="Your website url">
                      </div>
                      <div class="form-group">
                        <label>Message</label>
                        <textarea class="form-control" rows="6" data-minwords="6" data-required="true" placeholder="Type your message"></textarea>
                      </div>
                    </div>
                    <footer class="panel-footer text-right bg-light lter">
                      <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                    </footer>
                  </section>
                </form>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <form class="form-horizontal" data-validate="parsley">
                  <section class="panel panel-default">
                    <header class="panel-heading"> <strong>Basic constraints</strong> </header>
                    <div class="panel-body">
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Required</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" data-required="true" placeholder="required field">
                          <select data-required="true" class="form-control m-t">
                            <option value="">Please choose</option>
                            <option value="foo">Foo</option>
                            <option value="bar">Bar</option>
                          </select>
                          <label class="checkbox">
                            <input type="checkbox" name="inlineCheckbox1" value="option1" data-required="true" data-error-message="You must agree to the site policy.">
                            Agree to the policy </label>
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Not blank</label>
                        <div class="col-sm-9">
                          <input type="text" data-notblank="true" class="form-control" placeholder="not blank field">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Min Length</label>
                        <div class="col-sm-9">
                          <input type="text" data-minlength="6" class="form-control" placeholder="minlength = 6">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Max Length</label>
                        <div class="col-sm-9">
                          <input type="text" data-maxlength="6" class="form-control" placeholder="maxlength = 6">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Range Length</label>
                        <div class="col-sm-9">
                          <input type="text" data-rangelength="[5,10]" class="form-control" placeholder="data-rangelength = [5,10]">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Min</label>
                        <div class="col-sm-9">
                          <input type="text" data-min="6" class="form-control" placeholder="min = 6">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Max</label>
                        <div class="col-sm-9">
                          <input type="text" data-max="100" class="form-control" placeholder="max = 100">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Range</label>
                        <div class="col-sm-9">
                          <input type="text" data-range="[6, 100]" class="form-control" placeholder="data-range = [6, 100]">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">RegExp</label>
                        <div class="col-sm-9">
                          <input type="text" data-regexp="#[A-Fa-f0-9]{6}" class="form-control" placeholder="hexa color code">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Equal To</label>
                        <div class="col-sm-9">
                          <div class="row">
                            <div class="col-sm-6">
                              <input type="text" value="foo" id="foo" class="form-control">
                            </div>
                            <div class="col-sm-6">
                              <input type="text" data-equalto="#foo" placeholder="equal to foo" class="form-control">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <footer class="panel-footer text-right bg-light lter">
                      <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                    </footer>
                  </section>
                </form>
              </div>
              <div class="col-sm-6">
                <form class="form-horizontal" data-validate="parsley">
                  <section class="panel panel-default">
                    <header class="panel-heading"> <strong>Type constraints</strong> </header>
                    <div class="panel-body">
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" data-type="email" data-required="true" placeholder="email">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Url</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="url" class="form-control" placeholder="url">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Url strict</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="urlstrict" class="form-control" placeholder="urlstrict">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Digits</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="digits" class="form-control" placeholder="digits">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Number</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="number" class="form-control" placeholder="number">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Alphanum</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="alphanum" class="form-control" placeholder="alphanumeric string">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Date Iso</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="dateIso" class="form-control" placeholder="YYYY-MM-DD">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Phone</label>
                        <div class="col-sm-9">
                          <input type="text" data-type="phone" class="form-control" placeholder="(XXX) XXXX XXX">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Min Words</label>
                        <div class="col-sm-9">
                          <input type="text" data-minwords="6" class="form-control" placeholder="min 6 words">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Max Words</label>
                        <div class="col-sm-9">
                          <input type="text" data-maxwords="6" class="form-control" placeholder="max 6 words">
                        </div>
                      </div>
                      <div class="line line-dashed line-lg pull-in"></div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Range Words</label>
                        <div class="col-sm-9">
                          <input type="text" data-rangewords="[6,10]" class="form-control" placeholder="min 6 words & max 10 words">
                        </div>
                      </div>
                    </div>
                    <footer class="panel-footer text-right bg-light lter">
                      <button type="submit" class="btn btn-success btn-s-xs">Submit</button>
                    </footer>
                  </section>
                </form>
              </div>
            </div>
          </section>
        </section>

    <!-- Bootstrap -->
</body>

</html>
