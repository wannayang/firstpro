<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="<%=basePath%>resources/js/jquery.min.js"></script>
    <script src="<%=basePath%>resources/js/ajaxfileupload.js"></script>
    <title>文件上传</title>
    <script type="text/javascript">
     $(function () {
            $('#btn').click(function(){
                ajaxFileUpload();
            })
        })
        function ajaxFileUpload() {
        $("#wait_loading").ajaxStart(function() {
            $(this).show();
        // 文件上传完成将图片隐藏起来
        }).ajaxComplete(function() {
            $(this).hide();
        });
            $.ajaxFileUpload({
                    url: 'fileupload/upload.do', //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId: 'upfile', //文件上传域的ID
                    dataType: 'json', //返回值类型 一般设置为json
					ajaxStart : function() {
						ZENG.msgbox.show(" 正在加载中，请稍后...", 6, 10000);
					},               
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        $("#img1").attr("src", data.imgurl);
                        alert(data.res);alert(status);
                        
                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
                        alert(e);
                    }
                }
            )
            return false;
        }
    </script>
  </head>
  
  <body>
  <div>1.通过简单的form表单提交方式，进行文件的上</br> 2.通过jquery.form.js插件提供的form表单一步提交功能 </div></br>
  	<form method="POST"  enctype="multipart/form-data" id="form1" action="fileupload/upload.do">
  	    <div id="wait_loading" style="padding: 50px 0 0 0;display:none;">
        <div style="width: 103px;margin: 0 auto;"><img src="resources/img/spinner.gif"></img></div>
        <br></br>
        <div style="width: 103px;margin: 0 auto;"><span>请稍等...</span></div>
        <br></br>
    </div>
 	 	<table>
 	 	 <tr>
 	 	 	<td>上传文件: </td>
 	 	 	<td><input id="upfile" type="file" name="upfile"></td>
 	 	 </tr>
  		<tr>
 	 	 	<td><input type="submit" value="提交" onclick="return checkData()"></td>
 	 	 	<td><input type="button" value="ajax方式提交" id="btn" name="btn" ></td>
 	 	 </tr>
  		</table>	
	</form>
	
  </body>
</html>
