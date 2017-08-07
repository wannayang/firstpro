<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css"></link>
<link rel="stylesheet" href="resources/treeview/bootstrap-treeview.css" type="text/css"></link>

<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/treeview/bootstrap-treeview.js"></script>
<script type="text/javascript">
function roleUserModalShow(){$('#myModal').modal('show');
}
</script>
</head>
<body>

<p id="c"></p>

<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal"  data-target="#myModal">
   开始演示模态框
</button>

<button class="btn btn-sm btn-default" onclick="checkallnode()" ><i class="fa fa-plus"></i>checkallnode</button>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               模态框（Modal）标题
            </h4>
         </div>
         <div class="modal-body">
          <div id="tree"></div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" id="btn">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<script type="text/javascript">
	$(function() {
		function getTree() {
			var data = [ {
				text : "p1",
				nodes : [ {
					text : "p1-1",
					id : '00001',
					nodeId : '00001'
				}, {
					text : "p1-2",
					id : '00002'
				}, {
					text : "p1-3",
					id : '00003'
				}, {
					text : "p1-4",
					id : '00004',
					nodes : [ {
						text : 'p1-1-1',
						id : '00005'
					} ]
				} ]
			} ]
			return data;
		}

		$('#tree').treeview({
			data : getTree(), // data is not optional
			levels : 5,
			showCheckbox : true,
			multiSelect : true
		});

		$("#btn").click(function(e) {
			var arr = $('#tree').treeview('getSelected');
			for ( var key in arr) {
				c.innerHTML = c.innerHTML + "," + arr[key].id;
			}

		});

		$('#tree').on('nodeChecked', function(event, data) {
			console.log(JSON.stringify(data));
			console.log(data.text);
			console.log(data.nodeId);
		});

	})

	function checkallnode() {
		$('#tree').treeview('checkAll', {
			silent : true
		});
	}
</script>
</body>
</html>