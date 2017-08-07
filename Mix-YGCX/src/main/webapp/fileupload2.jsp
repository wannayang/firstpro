<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Files using XMLHttpRequest - Minimal</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="<%=basePath%>resources/notebook/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/page/page.css" />
<link rel="stylesheet" href="<%=basePath%>resources/jquery/msgbox/msgbox.css" />
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/notebook/js/app.v2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/page/jquery.myPagination5.0.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/msgbox/msgbox.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery/time.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.table-sort.js"></script>
<script src="<%=basePath%>resources/sweetalert/sweetalert-dev.js"></script>
<link rel="stylesheet" href="<%=basePath%>resources/sweetalert/sweetalert.css">	
    <script type="text/javascript">
   function doUpload() {
     var formData = new FormData($( "#uploadForm" )[0]);  
     $.ajax({  
          url: 'uploadExcel/ajaxUpload.do' ,  
          type: 'POST',  
          data: formData,  
          async: false,  
          cache: false,  
          contentType: false,  
          processData: false,  
          success: function (returndata) {  
              alert(returndata);  
          },  
          error: function (returndata) {  
              alert(returndata);  
          }  
     });  
}

 function UpladFile() {
            var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
            var FileController = "uploadExcel/ajaxUpload.do";                    // 接收上传文件的后台地址 
            // FormData 对象
            var form = new FormData($( "#uploadForm" )[0]);

            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", FileController, true);
            xhr.onload = function () {
               // alert("上传完成!");
            };

            xhr.upload.addEventListener("progress", progressFunction, false);
            xhr.send(form);
        }

        function progressFunction(evt) {
            var progressBar = document.getElementById("progressBar");
            var percentageDiv = document.getElementById("percentage");
            if (evt.lengthComputable) {
                progressBar.max = evt.total;
                progressBar.value = evt.loaded;
                percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
                if(evt.loaded==evt.total){
                    alert("上传完成100%");
                }
            }
        }  

    </script>
    
    <br />
    <br />
    <br />
    <br />

    <progress id="progressBar" value="0" max="100"></progress>
    <span id="percentage"></span>

    <br />
    <br />
    <br />
    <br />
</script>
</head>
<body>
<form id= "uploadForm">  
      <p >指定文件名： <input type="text" name="filename" value= ""/></p >  
      <p >上传文件： <td> <input id="upfile" type="file" name="upfile"></td></ p>  
      <input type="button" value="上传" onclick="doUpload()" />  
</form>  

</body>
</html>