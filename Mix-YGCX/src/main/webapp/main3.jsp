<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ajax文件上传</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<%=basePath%>resources/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>resources/js/ajaxfileupload.js"></script>
    <script type="text/javascript">
    $(function(){
       //上传图片
       $("#btnUpload").click(function() {
              ajaxFileUpload();
       });
    });
    
        $(document).ajaxStart(function() {
            $("#wait_loading").show();
        });
        $(document).ajaxComplete(function() {
            $("#wait_loading").hide();
        });	
    function ajaxFileUpload() {
    if(checkData()){
        $.ajaxFileUpload({
            url: 'uploadExcel/ajaxUpload.do', 
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'upfile', // 上传文件的id、name属性名
            dataType: 'json', //返回值类型，一般设置为json、application/json
            data:{name:'logan'},//一同上传的数据
            success: function(data, status){
                alert(data.res);
            },
            error: function(data, status, e){ 
                alert(e);
            }
        });
    }
    }
    
    //JS校验form表单信息
    	     function checkData(){
    	     	var fileDir = $("#upfile").val();
    	     	var suffix = fileDir.substr(fileDir.lastIndexOf("."));
    	     	if("" == fileDir){
    	     		alert("选择需要导入的Excel文件！");
    	     		return false;
    	     	}
    	     	if(".xls" != suffix && ".xlsx" != suffix ){
    	     		alert("选择Excel格式的文件导入！");
    	     		return false;
    	     	}
    	     	return true;
    	     }
    </script>
  </head>
  
  <body>
    <div id="wait_loading" style="padding: 50px 0 0 0;display:none;">
        <div style="width: 103px;margin: 0 auto;"><img src="resources/img/spinner.gif"/></div>
        <br></br>
        <div style="width: 103px;margin: 0 auto;"><span>请稍等...</span></div>
        <br></br>
    </div>
  	<form method="POST"  enctype="multipart/form-data" id="form1" action="uploadExcel/upload.do">
 	 	<table>
 	 	 <tr>
 	 	 	<td>上传文件: </td>
 	 	 	<td> <input id="upfile" type="file" name="upfile"></td>
 	 	 </tr>
  		<tr>
 	 	 	<td><input type="submit" value="提交" onclick="return checkData()"></td>
 	 	 	<td><input type="button" value="ajax方式提交" id="btnUpload" name="btnUpload" ></td>
 	 	 </tr>
  		</table>
	</form>
  </body>
</html>