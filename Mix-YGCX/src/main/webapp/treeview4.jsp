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
>
<input type="button" id="checkallnode" onclick="checkallnode()" value="全选" />
<input type="button" id="nocheckallnode" onclick="nocheckallnode()" value="反选" />
<input type="button" id="nocheckallnode" onclick="getselected()" value="获取所有checkbox" />
<script type="text/javascript">
	function getData() {
		var tree = [ {
			text : "Parent 1",
			nodes : [ {
				text : "Child 1",
				nodes : [ {
					text : "Grandchild 1"
				}, {
					text : "Grandchild 2"
				} ]
			}, {
				text : "Child 2"
			} ]
		}, {
			text : "Parent 2"
		}, {
			text : "Parent 3"
		}, {
			text : "Parent 4"
		}, {
			text : "Parent 5"
		} ];
		return tree;
	}

	//判断勾选是否由子节点勾选触发(最好作为全局变量)
	var childTrigger = false;
	$(function() {
		$('#tree').treeview({
			data : getData(),
			showCheckbox : true,
			multiSelect : false,

			//勾选事件
			onNodeChecked : function(e, node) {
				var that = $(this);

				//作为父节点：勾选时，同时勾选所有子节点
				var children = node.nodes;
				if (children != undefined) {
					$.each(node.nodes, function(i, child) {
						that.treeview('checkNode', [ child.nodeId ]);
					});
				}

				//作为子节点：勾选所有子节点时，同时勾选父节点
				var siblings = that.treeview('getSiblings', node);
				var boolCheckAll = true;
				if (siblings != undefined) {
					$.each(siblings, function(i, child) {
						if (!child.state.checked) {
							boolCheckAll = false;
						}
					});
				}
				var parentId = node.parentId;
				if (boolCheckAll && parentId != undefined) {
					that.treeview('checkNode', [ parentId ]);
				}
			},

			//取消勾选事件
			onNodeUnchecked : function(e, node) {
				var that = $(this);

				//作为父节点：取消勾选时，同时取消勾选所有子节点
				var children = node.nodes;
				if (children != undefined && !childTrigger) {
					$.each(children, function(i, child) {
						that.treeview('uncheckNode', [ child.nodeId ]);
					});
				}

				//作为子节点：取消勾选时，同时取消勾选父节点
				var parentId = node.parentId;
				if (parentId != undefined) {
					console.log('uncheckParent');
					childTrigger = true;
					that.treeview('uncheckNode', [ parentId ]);
				}
				if (children != undefined) {
					childTrigger = false;
				}

			}
		});
	});
</script>
</body>
</html>