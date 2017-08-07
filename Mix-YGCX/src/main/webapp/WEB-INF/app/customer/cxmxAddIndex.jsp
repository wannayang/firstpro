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
<title>员工信息编辑</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/select2.css" type="text/css" cache="false" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/select2/theme.css" type="text/css" cache="false" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/fuelux/fuelux.css" type="text/css" cache="false" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.css" type="text/css" cache="false" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/js/slider/slider.css" type="text/css" cache="false" />
<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/my-datepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/datepicker/bootstrap-datepicker.js" cache="false" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script type="text/javascript">
var url1 = '';
var url2 = '';
var sysvali = '';
var xbnxget = true;
var pagestate = '${pagestate }'
var pagecph = '${pagecph }';
var pagetbnf = '${pagetbnf }';
var xzmcrow = '';
var xzformstr = '';

$(function(){
	$("#btnUploadbj").hide();
	$("#btnUploadzc").hide();
	$("#btnUploadsj").hide();
	$("#btnUploadcg").hide();
	$("#btnUploadsb").hide();
	$("#btnUploaddd").hide();
	$("#pagestate").val(pagestate);
	//$("#btntext").text("修改后的span的值");
	if(pagestate=='U'){
	$("#btnUploadbj").show();
	$("#pageval").html("修改信息");
	url1 = 'getCustomer';
	url2 = 'addCustomer';
	
	$('#cph').attr("readonly","readonly");
	$('.removedate').datepicker("remove");
	
	
	}
	else if(pagestate=='SJ'){
	$("#btnUploadzc").show();
	$("#btnUploadsj").show();
	$("#pageval").html("续保-算价信息");
 	url1 = 'sjCustomer';
	url2 = 'saveXb';	
	}else if(pagestate=='BJ'){
	$("#btnUploadzc").show();
	$("#btnUploadcg").show();
	$("#btnUploadsb").show();
	$("#btnUploaddd").show();	
	$("#pageval").html("续保-报价信息");
 	url1 = 'bjCustomer';
	url2 = 'saveXb';
	}
	else if(pagestate=='A'){
	$("#btnUploadbj").show();
	$("#pageval").html("新保信息");
	}
	
    $('body').click( function() {
    		  pagecalc();
    		  sysvali.form();
    });
});

$(function(){
  	pagecalc();
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
            	$("#sys_form select[id='dw']").append("<option value=''></option>");
            	$("#sys_form select[id='jb']").append("<option value=''></option>");
            	$("#sys_form select[id='cbgs']").append("<option value=''></option>");
            	$("#sys_form select[id='cbqd']").append("<option value=''></option>");
            	$("#sys_form select[id='jqxsq']").append("<option value=''></option>");
            	$("#sys_form select[id='ccs']").append("<option value=''></option>");
            	$("#sys_form select[id='cpys']").append("<option value=''></option>");
            	$.each(data.event,function(i, value) {
            	switch(value.id.fl)
					{
					case "单位":
					$("#sys_form select[id='dw']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "级别":
					$("#sys_form select[id='jb']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "承保公司":
					$("#sys_form select[id='cbgs']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "承保渠道":
					$("#sys_form select[id='cbqd']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "交强险（税前）":
					$("#sys_form select[id='jqxsq']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "车船税":
					$("#sys_form select[id='ccs']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "车牌颜色":
					$("#sys_form select[id='cpys']").append("<option value='"+value.id.value+"'>"+value.id.value+"</option>");
					break;
					case "险种名称":
					xzmcrow = xzmcrow+"<option value='"+value.id.value+"'>"+value.id.value+"</option>";
					break;
					default:;
					}
            	});
            }
		});

	  if(pagestate=='U'||pagestate=='SJ'||pagestate=='BJ'){
	  			xbnxget = false;
	  			$.ajax({
					url: "customer/"+url1,
					data: {cph:pagecph,tbnf:pagetbnf},
					type: 'POST',
					async:false,
					error: function(request) {
						alert(request);
					},
					success: function(data) {
						$("#cph").val(data.obj.id.cph);
						$("#tbnf").val(data.obj.id.tbnf);
						$("#xbnx").val(data.obj.xbnx);
						$("#jfrq").val(data.obj.jfrq);
						$("#qbrq").val(data.obj.qbrq);
						$("#zbrq").val(data.obj.zbrq);
						$("#czxm").val(data.obj.czxm);
						$("#czsfzh").val(data.obj.czsfzh);
						$("#czlxfs").val(data.obj.czlxfs);
						$("#jbrxm").val(data.obj.jbrxm);
						$("#jbrdh").val(data.obj.jbrdh);
						$("#dw").val(data.obj.dw);
						$("#jb").val(data.obj.jb);
						$("#cllx").val(data.obj.cllx);
						$("#cx").val(data.obj.cx);
						$("#cjh").val(data.obj.cjh);
						$("#fdjh").val(data.obj.fdjh);
						$("#cpys").val(data.obj.cpys);
						$("#bllb").val(data.obj.bllb);
						$("#syxz").val(data.obj.syxz);
						$("#cdrq").val(data.obj.cdrq);
						$("#cbgs").val(data.obj.cbgs);
						$("#syxbdh").val(data.obj.syxbdh);
						$("#jqxbdh").val(data.obj.jqxbdh);
						$("#cbqd").val(data.obj.cbqd);
						$("#syxsq").val(data.obj.syxsq);
						$("#jqxsq").val(data.obj.jqxsq);
						$("#syxsh").val(data.obj.syxsh);
						$("#jqxsh").val(data.obj.jqxsh);
						$("#bfzjesh").val(data.obj.bfzjesh);
						$("#ccs").val(data.obj.ccs);
						$("#hccs").val(data.obj.hccs);
						$("#bhccs").val(data.obj.bhccs);
						$("#flfbl").val(data.obj.flfbl);
						$("#flffs1").val(data.obj.flffs1);
						$("#flffs2").val(data.obj.flffs2);
						$("#flffs3").val(data.obj.flffs3);
						$("#flfzje").val(data.obj.flfzje);
						$("#sjzfbfje").val(data.obj.sjzfbfje);
						$("#jszdzrq").val(data.obj.jszdzrq);
						$("#czrq").val(data.obj.czrq);
						$("#czr").val(data.obj.czr);
						
						$("#sjsbfje").val(data.obj.sjsbfje);
						$("#flfdx").val(data.obj.flfdx);
						$("#gh").val(data.obj.gh);
						$("#bak").val(data.obj.bak);
						$("#tempsyxbdh").val(data.obj.syxbdh);
						if(pagestate=='U'){
							getbd();
						}
					}
				});
		}else{
			xbnxget = true;
		}

  sysvali = $("#sys_form").validate({
	rules : {
				cph   :{required: true},
				tbnf : {
					required : true,
					date : true
				},
				  czsfzh:{
				   required:true,
				   idCardCheck:true
				  },
				  czlxfs:{
				  isPhone: true
				  },
				  jbrdh:{
				  isPhone: true
				  },
				  syxsq:{
				  number:true
				  },
				  syxsh:{
				  number:true
				  },
				  jqxsh:{
				  number:true
				  },
				  bfzjesh:{
				  number:true
				  },
				  flfbl:{
				  number:true
				  },
				  flffs1:{
				  number:true
				  },
				  flffs2:{
				  number:true
				  },
				  flffs3:{
				  number:true
				  },
				  bhccs:{
				  number:true
				  },
				  hccs:{
				  number:true
				  },
				  flfzje:{
				  number:true
				  },
				  sjzfbfje:{
				  number:true
				  },
				  sjsbfje:{
				  number:true
				  }				  
			},
			messages : {
				cph   :{required: "车牌号不能为空"},
				tbnf : {
					required : "投保年份不能为空！",
					date : "日期格式错误"
				},
				  czsfzh:{
				  required:"请输入身份证号",
				  idCardCheck:"请输入正确的身份证号"
				  }
			}
		});

		$("#btnUploadbj").click(function() {
			if($("#jfrq").val()!=''&&$("#qbrq").val()!=''){
			 	var oDate1 = new Date(Date.parse($("#jfrq").val()));
	    		var oDate2 = new Date(Date.parse($("#qbrq").val()));
				    if(oDate1 > oDate2){
			        	console.log('第一个大');
			    	}else {
				        console.log('第二个大');
				        alert("缴费日期必须大于起保日期");
				        return;
			    	}
	    	}
			  pagecalc();
    		  sysvali.form();
			if ($("#sys_form").valid()) {
				bjajaxsubmit();
			} else {
			}
		});
		
		

		$("#btnUploadzc").click(function() {
			  pagecalc();
    		  sysvali.form();
			if ($("#sys_form").valid()) {
				formajaxsubmit(true);
				$("#pagestate").val(pagestate);
			} else {
			}
		});
		
		$("#btnUploadsj").click(function() {
			  pagecalc();
    		  sysvali.form();
			if ($("#sys_form").valid()) {
				formajaxsubmit(false);
			} else {
			}
		});		
		
		$("#btnUploadcg").click(function() {
			//$("#jqxbdh").rules("add", {required: true});
			if($("#jqxbdh").val()==''){
				alert("交强险保单号不能为空");
				return;
			}
			if($("#syxbdh").val()!=''){
				if($("#xzallval").val()==''){
					alert("险保表单不能为空");
					return;
				};
				
			}
			$('#syxbdh').rules('add',{
			    remote:{
			             type:"POST",
			             url:"customer/syxbdhjsonCheck",
			             async:false,
			             data:{
			               syxbdh:function(){return $("#syxbdh").val();}
			             }
			            },
			    messages:{
			        remote :'错误：已经存在的商业性保单号'
			    }
			});
			
			
			$("#pagestate").val('CG');
			if ($("#sys_form").valid()) {
			$('#updateWin').modal('show');
			}
		});
		$("#btnUploadsb").click(function() {
			$("#pagestate").val('SB');
			if ($("#sys_form").valid()) {
			$('#updateWin').modal('show');
			}			
		});
		$("#btnUploaddd").click(function() {
			$("#pagestate").val('DD');
			if ($("#sys_form").valid()) {
			$('#updateWin').modal('show');
			}			
		});
		$("#btnUploadsms").click(function() {
			    var obj = document.getElementById("psms");  
    			obj.innerText= "knowledge";
				$('#getsmsWin').modal('show');
		});

	});

function bjajaxsubmit() {
	var d = $("#sys_form").serializeArray();
		$("#btnUploadbj").button('loading');
		$.ajax({
				url: 'customer/addCustomer',
				data: d,
				type: 'POST',
				async:false,
				error: function(request) {
					alert(request);
				},
				success: function(data) {
					alert(data.event);
					window.location.reload();
					$("#btnUpload").button('reset');
				}
			});
}

function formajaxsubmit(iszc) {
	if(iszc){
		$("#pagestate").val('ZC'+'${pagestate }');
	}
	var d = $("#sys_form").serializeArray();
		$("#btnUploadzc").button('loading');
		$.ajax({
				url: 'customer/saveXb',
				data: d,
				type: 'POST',
				async:false,
				error: function(request) {
					alert(request);
				},
				success: function(data) {
					alert(data.event);
					//window.location.reload();
					custom_close();
					//$("#btnUpload").button('reset');
				}
			});
}

$(function(){
  $.validator.setDefaults({
     submitHandler: function(form) {
      form.submit();
     }
  });
  // 字符验证
  jQuery.validator.addMethod("stringCheck", function(value, element) {
     return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
  }, "只能包括中文字、英文字母、数字和下划线");
  // 中文字两个字节

    jQuery.validator.addMethod("idCardCheck", function(value, element) {
     return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
  }, "只能包括英文字母和数字");

// 联系电话(手机/电话皆可)验证
jQuery.validator.addMethod("isPhone", function(value,element) {
  var length = value.length;
  var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
  var tel = /^\d{3,4}-?\d{7,9}$/;
  return this.optional(element) || (tel.test(value) || mobile.test(value));
}, "请正确填写联系电话");

if(pagestate=='A'){
$('#syxbdh').rules('add',{
    remote:{
             type:"POST",
             url:"customer/syxbdhjsonCheck",
             data:{
               syxbdh:function(){return $("#syxbdh").val();}
             }
            },
    messages:{
        remote :'错误：已经存在的商业性保单号'
    }
});
$("#jfrq").rules("add", {required: true});
$("#syxbdh").rules("add", {required: true});
$("#jqxbdh").rules("add", {required: true});
$("#sjsbfje").rules("add", {required: true});
}

if(pagestate=='U'){
$("#jfrq").rules("add", {required: true});
$("#syxbdh").rules("add", {required: true});
$("#jqxbdh").rules("add", {required: true});
$("#sjsbfje").rules("add", {required: true});
}

if(pagestate=='SJ'){
$("#jfrq").attr("readonly","readonly");
$("#syxbdh").attr("readonly","readonly");
$("#jqxbdh").attr("readonly","readonly");
$("#sjsbfje").attr("readonly","readonly");

$("#jfrq").rules("remove", "required");
$("#syxbdh").rules("remove", "required");
$("#jqxbdh").rules("remove", "required");
$("#sjsbfje").rules("remove", "required");

}
});
  
function pagecalc(){
			  var syxsq = parseFloat($("#syxsq").val());
      		  var ccs = parseFloat($("#ccs").val());
      		  var jqxsq = parseFloat($("#jqxsq").val());
      		  var jqxsh = parseFloat($("#jqxsh").val());
      		  var syxsh = parseFloat($("#syxsh").val());
      		  var hccs = parseFloat($("#hccs").val());
      		  var bhccs = parseFloat($("#bhccs").val());
      		  var bfzjesh = parseFloat($("#bfzjesh").val());
      		  var flfzje = parseFloat($("#flfzje").val());
      		  var sjzfbfje = parseFloat($("#sjzfbfje").val());
      		  var flfbl = parseFloat($("#flfbl").val());

      		  $("#hccs").val((jqxsq+syxsq+ccs).toFixed(2));
              $("#bhccs").val((jqxsq+syxsq).toFixed(2));
              $("#syxsh").val((syxsq/1.06).toFixed(2));
              $("#jqxsh").val((jqxsq/1.06).toFixed(2));
              $("#bfzjesh").val((syxsq/1.06+ jqxsq/1.06).toFixed(2));
              $("#flfzje").val((syxsq/1.06*flfbl/100).toFixed(2));
              $("#sjzfbfje").val((syxsq+jqxsq+ccs-syxsq/1.06*flfbl/100).toFixed(2));
              
              gettabstr();
              // console.log("onclis："+sysvali.form());
}




function getvalxbnx(){
	if(xbnxget){
		$.ajax({
	            type: "POST",
	            url:  "customer/getvalxbnx",
	            data: {czsfzh:$("#czsfzh").val()},
	            error: function(request) {
	                alert("查询失败");
	            },
	            success: function(data) {
	            	$("#xbnx").val(data.event);
	            }
			});
	}
}

function addpanelrow(xzmc,bxje){
	$("#xzTable> tbody").append("<tr><td><select name=\"xzmc\" id=\"xzmc\" type=\"text\" class=\"form-control\">"+xzmcrow+"</select></td>"
	+"<td><input type=\"number\" class=\"form-control\" style=\"text-transform: uppercase;\" id=\"bxje\" name=\"bxje\" value=\""+bxje+"\" maxlength=\"10\"/></td>"
	+"<td><a href=\"javascript:void(0)\" onclick=\"deltr(this);\" class=\"btn btn-danger btn-xs active\" role=\"button\">删除行</a></td></tr>");	
	
}

function deltr(clickTd){
	var tr = $(clickTd).parent().parent();  
    tr.remove();  
}


function gettabstr(){
//       var  valss1 = $("#xzTable> tbody").find("tr").eq(0).find("td").eq(0).find('select').val();
//       var  valss2 = $("#xzTable> tbody").find("tr").eq(0).find("td").eq(1).find('input').val();
       var  valss1 = '';
       var  valss2 = '';
       xzformstr = '';
       $("#xzTable> tbody >tr").each(function(i,value){
            valss1 = $("#xzTable> tbody").find("tr").eq(i).find("td").eq(0).find('select').val();
       		valss2 = $("#xzTable> tbody").find("tr").eq(i).find("td").eq(1).find('input').val();
       		if(valss1!=''&&valss2!=''){
       			if(i==0){
       			xzformstr = xzformstr+valss1+":"+valss2;
       			}else{
       			xzformstr = xzformstr+"#"+valss1+":"+valss2;
       			}
      		}else{
      		 xzformstr='';
      		}
       });
       if($("#syxbdh").val()==''){
       		xzformstr = '';
       }
       $("#xzallval").val(xzformstr);
}

window.onload=function(){
    if(pagestate=='SJ'){
	$("#jfrq").val('');
	$("#syxbdh").val('');
	$("#jqxbdh").val('');
	$("#sjsbfje").val('');
    }
};


function getbd(){
$.ajax({
	url: 'customer/getjsontb001b',
	data: {syxbdh:$("#tempsyxbdh").val()},
	type: 'POST',
	async:false,
	error: function(request) {
		alert(request);
	},
	success: function(data) {
		$("#xzTable> tbody").html("");
		$(data.event).each(function(i,value){
		addpanelrow(value.xzmc,value.bxje);
		$("#xzTable> tbody> tr:last").find("td").eq(0).find('select').val(value.xzmc);
		});
	}
});
}

function saveobj(){
			  pagecalc();
    		  sysvali.form();
			if ($("#sys_form").valid()) {
				formajaxsubmit(false);
			}
custom_close();
}

function custom_close(){
window.opener=null;
window.open('','_self');
window.close();
}

</script>
<style>
.error{
	color:red;
}
</style>
</head>

<body>
    <section class="hbox stretch">
      <section id="content">
        <section class="vbox">
          <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
              <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
              <li>员工车险信息管理</li>
              <li>员工信息维护</li>
            </ul>
            <div class="row">
              <div class="col-sm-12">
                <form id="sys_form" name="sys_form" class="form-horizontal">
                <div>
                <input type ="text" id='tempsyxbdh' name='tempsyxbdh' value=""/>
                <input type ="text" id='xzallval' name='xzallval' value=""/>
                <input type ="text" id='pagestate' name='pagestate' value=""/>
                </div>
                  <section class="panel panel-default">
                    <header class="panel-heading"> <span class="h4">员工信息维护</span>
                    </header>
                    <div class="panel-body">
                      <p id="pageval" class="text-muted">请输入下面信息</p>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车牌号</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="cph" name="cph" maxlength="7"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>投保年份</label>
                          <input class="form-control datepicker-input-yyyy removedate" id="tbnf" name="tbnf" type="text" placeholder="请选择日期" data-date-format="yyyy"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>续保年限</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="xbnx" name="xbnx" maxlength="2" readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>驾驶证到证日期</label>
                          <input class="form-control datepicker-input-yyyy-mm-dd" id="jszdzrq" name="jszdzrq" type="text" placeholder="请选择日期" data-date-format="yyyy-mm-dd">
                        </div>                        
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>缴费日期</label>
                          <input class="form-control datepicker-input-yyyy-mm-dd" id="jfrq" name="jfrq" type="text" placeholder="请选择日期" data-date-format="yyyy-mm-dd"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>起保日期 </label>
                          <input class="form-control datepicker-input-yyyy-mm-dd" id="qbrq" name="qbrq" type="text" placeholder="请选择日期" data-date-format="yyyy-mm-dd" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>终保日期</label>
                          <input class="form-control datepicker-input-yyyy-mm-dd" id="zbrq" name="zbrq" type="text" placeholder="请选择日期" data-date-format="yyyy-mm-dd" required/>
                        </div>

                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车主姓名</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="czxm" name="czxm" maxlength="100" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车主身份证号</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;"  id="czsfzh" name="czsfzh" maxlength="18" onKeyUp="getvalxbnx()" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>车主联系方式</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="czlxfs" name="czlxfs" maxlength="20"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>经办人姓名</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;"  id="jbrxm" name="jbrxm" maxlength="100" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>经办人电话</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="jbrdh" name="jbrdh" maxlength="20" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>单位</label>
                          <select name="dw" id="dw" type="text" class="form-control" required></select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>级别</label>
                          <select name="jb" id="jb" type="text" class="form-control" required></select>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车辆类型</label>
                          <select name="cllx" id="cllx" type="text" class="form-control" required>
                          <option value=''></option>
                          <option value="个人">个人</option>
                          <option value="单位">单位</option>
                          </select>
                          
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车型</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="cx" name="cx" maxlength="100" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车架号</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="cjh" name="cjh" maxlength="20" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>发动机号</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="fdjh" name="fdjh" maxlength="30" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车牌颜色</label>
                          <select name="cpys" id="cpys" type="text" class="form-control" required></select>
                        </div>
                        <div class="col-sm-3">
                          <label>玻璃类别</label>
                          <select name="bllb" id="bllb" type="text" class="form-control">
                          <option value=''></option>
                          <option value="国产">国产</option>
                          <option value="进口">进口</option>
                          </select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>使用性质</label>
                          <select name="syxz" id="syxz" type="text" class="form-control" required>
                          <option value=""></option>
                          <option value="家庭自用">家庭自用</option>
                          <option value="营运">营运</option>
                          <option value="非营运">非营运</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>初登日期</label>
                          <input class="form-control datepicker-input-yyyy-mm-dd" id="cdrq" name="cdrq" type="text" placeholder="请选择日期" data-date-format="yyyy-mm-dd" required>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>承保公司</label>
                          <select name="cbgs" id="cbgs" type="text" class="form-control" required></select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>承保渠道</label>
                          <select name="cbqd" id="cbqd" type="text" class="form-control" required></select>
                        </div>

                      </div>

					  <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red"></font>商业险保单号</label>
                          
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="syxbdh" name="syxbdh" maxlength="50"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>交强险保单号</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="jqxbdh" name="jqxbdh" maxlength="50"/>
                        </div>
                        </div>
                        <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>商业险（税前） </label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="syxsq" name="syxsq" maxlength="10" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>交强险（税前）</label>
                          <select name="jqxsq" id="jqxsq" type="text" class="form-control" required></select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>商业险（税后） </label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="syxsh" name="syxsh" maxlength="10" required readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>交强险（税后）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="jqxsh" name="jqxsh" maxlength="10" required readonly="readonly"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>保费总金额（税后）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="bfzjesh" name="bfzjesh" maxlength="10" required readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>车船税</label>
                          <select name="ccs" id="ccs" type="text" class="form-control" required></select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>保单保费（不含车船税）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="bhccs" name="bhccs" maxlength="10" required readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>保单保费（含车船税）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="hccs" name="hccs" maxlength="10" required readonly="readonly"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>福利费比例（%）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="flfbl" name="flfbl" maxlength="10" required/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>福利费方式1（现金） </label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="flffs1" name="flffs1" maxlength="10"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>福利费方式2（服务券）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="flffs2" name="flffs2" maxlength="10"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>福利费方式3（积分）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="flffs3" name="flffs3" maxlength="10"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>福利费总金额</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="flfzje" name="flfzje" maxlength="10" required readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>实际支付保费金额（净保费）</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="sjzfbfje" name="sjzfbfje" maxlength="10" required readonly="readonly"/>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red">*</font>实际收保费金额</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="sjsbfje" name="sjsbfje" maxlength="10"/>
                        </div>                                             
                      </div>
                      <div class="form-group">
                        <div class="col-sm-3">
                          <label><font color="red">*</font>福利费是否兑现</label>
                          <select name="flfdx" id="flfdx" type="text" class="form-control" required>
                          <option value=""></option>
                          <option value="否">否</option>
                          <option value="是">是</option>
                          </select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>是否过户</label>
                          <select name="gh" id="gh" type="text" class="form-control" required>
                          <option value=""></option>
                          <option value="否">否</option>
                          <option value="是">是</option>
                          </select>
                        </div>
                        <div class="col-sm-3">
                          <label><font color="red"></font>备注</label>
                          <input type="text" class="form-control" style="text-transform: uppercase;" id="bak" name="bak" maxlength="10"/>
                        </div>                          
                      </div>
                      
                      <div class="line line-dashed line-lg pull-in"></div>
                      <section class="panel panel-default">
                      	<header class="panel-heading font-bold">险种表单</header>
                      	<div class="widget-title">
            		  	<span><a href="javascript:void(0);" onclick="addpanelrow('','');" class ="btn btn-rounded btn-sm btn-twitter"><i class="fa fa-fw fa-plus"></i>新增行</a></span>
            		  	<span><a href="javascript:void(0);" onclick="getbd();" class ="btn btn-rounded btn-sm btn-twitter"><i class="fa fa-fw fa-plus"></i>获取上年保单</a></span>
						</div>
                      <div id="xzpanel" name="xzpanel" class="panel-body">
	                       <div class="form-group">
							<table id="xzTable" class="table table-bordered table-striped">
				              <thead>
					                <tr>
					                <th>险种名称</th>
					                <th>保险金额</th>
					                <th>操作</th>
					                </tr>
				              </thead>
				              <tbody>
				              </tbody>
							 </table>                      	
	                       </div>
                       </div>
                       </section>
                 
                      
                    </div>
                    <footer class="panel-footer text-right bg-light lter">
					<button type="button" class="btn btn-primary nyroModal" id="btnUploadbj" name="btnUploadbj" data-loading-text="提交中...">
					<i class="fa fa-save text"></i> <span id="btntext" class="text">编辑保存</span>
					</button>                    
                    
					<button type="button" class="btn btn-primary nyroModal" id="btnUploadzc" name="btnUploadzc" data-loading-text="提交中...">
					<i class="fa fa-save text"></i> <span id="btntext" class="text">暂存</span>
					</button>
					
					<button type="button" class="btn btn-primary nyroModal" id="btnUploadsj" name="btnUploadsj" data-loading-text="提交中...">
					<i class="fa fa-save text"></i> <span id="btntext" class="text">算价完成</span>
					</button>					
					
					<button type="button" class="btn btn-s-md btn-success btn-rounded" id="btnUploadcg" name="btnUploadcg" data-loading-text="提交中...">
					<i class="fa fa-cloud-upload text"></i> <span id="btntext" class="text">成功</span>
					</button>
					<button type="button" class="btn btn-s-md btn-danger btn-rounded" id="btnUploadsb" name="btnUploadsb" data-loading-text="提交中...">
					<i class="fa fa-cloud-upload text"></i> <span id="btntext" class="text">失败</span>
					</button>
					<button type="button" class="btn btn-s-md btn-default btn-rounded" id="btnUploaddd" name="btnUploaddd" data-loading-text="提交中...">
					<i class="fa fa-cloud-upload text"></i> <span id="btntext" class="text">待定</span>
					</button>
					<button type="button" class="btn btn-s-md btn-info btn-rounded" id="btnUploadsms" name="btnUploadsms" data-loading-text="提交中...">
					<i class="fa fa-edit text"></i> <span id="btntext" class="text">生成短信</span>
					</button>	
                    </footer>
                    
		<div class="modal fade" id="updateWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">填写原因</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="u_password" class="col-xs-2 control-label">原因</label>
								<div class="col-xs-8">
									<input type="text" class="form-control" id="reason" name="reason">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
							<button type="button" onclick="saveobj()" class="btn btn-primary">保存</button>
						</div>
					</div>
			</div>
			</div>
		<div class="modal fade" id="getsmsWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">短信生成</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<p id="psms">xxxxxx</p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
						</div>
					</div>
			</div>
			</div>			
                  </section>
                </form>
              </div>
            </div>
          </section>
        </section>
</section>
</body>

</html>
