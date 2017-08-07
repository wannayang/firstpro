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
<input type="button" id="checkallnode" onclick="checkallnode()" value="全选" />
<input type="button" id="nocheckallnode" onclick="nocheckallnode()" value="反选" />
<input type="button" id="nocheckallnode" onclick="getselected()" value="获取所有checkbox" />
<script type="text/javascript">
	function getData() {
	var tree = [ {
			"menuid" : 2,
			"name" : "新浪",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : [ {
				"menuid" : 4,
				"name" : "HAO123",
				"parentid" : "2",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "HAO123"
			}, {
				"menuid" : 5,
				"name" : "CSDN",
				"parentid" : "2",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "CSDN"
			} ],
			"text" : "新浪"
		}, {
			"menuid" : 3,
			"name" : "百度",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : [ {
				"menuid" : 6,
				"name" : "注册",
				"parentid" : "3",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "注册"
			}, {
				"menuid" : 7,
				"name" : "登陆",
				"parentid" : "3",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "登陆"
			}, {
				"menuid" : 8,
				"name" : "CC1",
				"parentid" : "3",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "CC1"
			} ],
			"text" : "百度"
		}, {
			"menuid" : 9,
			"name" : "腾讯",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : null,
			"text" : "腾讯"
		}, {
			"menuid" : 10,
			"name" : "保全信息管理",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : [ {
				"menuid" : 11,
				"name" : "保全信息维护",
				"parentid" : "10",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "保全信息维护"
			}, {
				"menuid" : 12,
				"name" : "管理人员列表",
				"parentid" : "10",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "管理人员列表"
			} ],
			"text" : "保全信息管理"
		}, {
			"menuid" : 13,
			"name" : "理赔信息管理",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : [ {
				"menuid" : 14,
				"name" : "理赔信息查询",
				"parentid" : "13",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "理赔信息查询"
			} ],
			"text" : "理赔信息管理"
		}, {
			"menuid" : 15,
			"name" : "系统管理",
			"parentid" : "1",
			"title" : null,
			"target" : null,
			"url" : null,
			"nodes" : [ {
				"menuid" : 16,
				"name" : "角色维护",
				"parentid" : "15",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "角色维护"
			}, {
				"menuid" : 17,
				"name" : "用户维护",
				"parentid" : "15",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "用户维护"
			}, {
				"menuid" : 18,
				"name" : "权限设置",
				"parentid" : "15",
				"title" : null,
				"target" : null,
				"url" : null,
				"nodes" : null,
				"text" : "权限设置"
			} ],
			"text" : "系统管理"
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
				if (children != undefined &&childTrigger==false) {
					$.each(node.nodes, function(i, child) {
						that.treeview('checkNode', [ child.nodeId ]);
					});
				}
				//作为子节点：勾选所有子节点时，同时勾选父节点
				var siblings = that.treeview('getSiblings', node);
				var boolCheckAll = true;
/* 				if (siblings != undefined) {
					$.each(siblings, function(i, child) {
						if (!child.state.checked) {
							boolCheckAll = false;
						}
					});
				} */
				var parentId = node.parentId;
				if (parentId != undefined) {
					childTrigger = true;
					that.treeview('checkNode', [ parentId ]);
				}else{
					childTrigger = false;
				}
			},

		//取消勾选事件
			onNodeUnchecked : function(e, node) {
				var that = $(this);
				var onecheck = false;
				//作为父节点：取消勾选时，同时取消勾选所有子节点
				var children = node.nodes;
				if (children != undefined) {
					$.each(children, function(i, child) {
						that.treeview('uncheckNode', [ child.nodeId ]);
					});
				}

				//作为子节点：取消勾选时，同时取消勾选父节点
				var parentId = node.parentId;
				if (parentId != undefined) {
					childTrigger = true;
					var siblings = that.treeview('getSiblings', node);
					var onecheck = false;
	 				if (siblings != undefined) {
						$.each(siblings, function(i, child) {
							if (child.state.checked) {
								onecheck = true;
							}
						});
					} 				
					if(onecheck ==false){
						that.treeview('uncheckNode', [ parentId ]);  //取消夫节点勾选
					}
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