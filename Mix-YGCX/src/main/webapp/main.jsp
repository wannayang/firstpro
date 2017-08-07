<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <script src="<%=basePath%>resources/js/jquery.min.js"></script>
    <script src="<%=basePath%>resources/js/jquery.form.js"></script>
    <title>文件上传</title>
    <script type="text/javascript">
    		//ajax 方式上传文件操作
			 $(document).ready(function(){
        $(document).ajaxStart(function() {
            $("#wait_loading").show();
        // 文件上传完成将图片隐藏起来
        });
        $(document).ajaxComplete(function() {
            $("#wait_loading").hide();
        });			 
        		$('#btn').click(function(){
            		if(checkData()){
            			$('#form1').ajaxSubmit({
            				url:'uploadExcel/ajaxUpload.do',
            				dataType: 'json',
            				success: resutlMsg,
            				error: errorMsg
            			}); 
            			function resutlMsg(msg){
  							alert(msg);
  						}
   						function errorMsg(){ 
   							alert("导入excel出错！");    
   						}
            		}
        		});
    	     });
    	     
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
  <div>1.通过简单的form表单提交方式，进行文件的上</br> 2.通过jquery.form.js插件提供的form表单一步提交功能 </div></br>
  	<form method="POST"  enctype="multipart/form-data" id="form1" action="uploadExcel/upload.do">
 	 	<table>
 	 	 <tr>
 	 	 	<td>上传文件: </td>
 	 	 	<td> <input id="upfile" type="file" name="upfile"></td>
 	 	 </tr>
  		<tr>
 	 	 	<td><input type="submit" value="提交" onclick="return checkData()"></td>
 	 	 	<td><input type="button" value="ajax方式提交" id="btn" name="btn" ></td>
 	 	 </tr>
  		</table>	
	</form>
	
  </body>
</html>
