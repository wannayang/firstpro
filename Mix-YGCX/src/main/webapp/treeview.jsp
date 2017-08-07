<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<link rel="stylesheet" href="resources/css/bootstrap.css" type="text/css"></link>
<link rel="stylesheet" href="resources/treeview/bootstrap-treeview.css" type="text/css"></link>

<script type="text/javascript" src="resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="resources/treeview/bootstrap-treeview.js"></script>
</head>
<body>
<div id="tree"></div>
<input type="button" id="btn" value="查询选中横条" />  
<input type="button" id="" onclick="checkallnode()" value="全选" />
<input type="button" id="" onclick="nocheckallnode()" value="反选" />
<input type="button" id="" onclick="getselected()" value="获取所有checkbox" />
<input type="button" id="" onclick="commit()" value="提交" />
<script type="text/javascript">
	$(function() {
		function getTree() {
			// Some logic to retrieve, or generate tree structure
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
					id : '00004x',
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
			multiSelect : false

		});

		$("#btn").click(function(e) {
			var arr = $('#tree').treeview('getSelected');
			console.log(JSON.stringify(arr));
			for ( var key in arr) {
				console.log(arr[key].id);
			}
		});

	});

	function checkallnode() {
		$('#tree').treeview('checkAll', {
			silent : true
		});
	}

	function nocheckallnode() {
		$('#tree').treeview('uncheckAll', {
			silent : true
		});
	}

		function getselected() {
		var arr = $('#tree').treeview('getChecked');
		console.log(JSON.stringify(arr));
		for ( var key in arr) {
			console.log(arr[key].menuid);
			toggleChildren(arr[key], arr[key].state.checked);
		}
	}
		function changenodestate(){
		var arr = $('#tree').treeview('getChecked');
		for ( var key in arr) {
			console.log(arr[key].id);
			toggleChildren(arr[key], arr[key].state.checked);
		}
		}
	
		function toggleChildren(currentNode, state) {
		if (currentNode.state.checked != state) {
			$('#tree').treeview('toggleNodeChecked', [ currentNode.nodeId, { silent : true } ]);
		}
		var sons = currentNode.nodes;
		if (sons) {
			for ( var i in sons) {
				toggleChildren(sons[i], state);
			}
		} else {
			return;
		}
	}
</script>
</body>
</html>