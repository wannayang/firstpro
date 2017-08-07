<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="app">
<head>
<base href="<%=basePath%>">
<title>权限管理</title>
<link rel="stylesheet" href="<%=basePath%>resources/css/bootstrap.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>resources/treeview/bootstrap-treeview.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/treeview/bootstrap-treeview.js"></script>
<script type="text/javascript">
var parentroleid = $("#roleid",window.parent.document).val();
	var arrmenuid = new Array();
	function getData() {
	var vd = '';
			$.ajax({
            type: "POST",
            url : "sys/getmenuTreeJson",
            data: "roleid="+parentroleid,
            async: false,   //false 同步  true（默认） 异步
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				vd  = data.event;
				arrmenuid  = data.eventmenu;
 				}
            });
            console.log(vd);
            return vd;
	}

	//判断勾选是否由子节点勾选触发(最好作为全局变量)
	var childTrigger = false;
	$(function() {
	if(parentroleid!=null&&parentroleid!=''){
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
		initselected();
		}else{
		 $("#iroleid").html("请先选择角色");
		}
	});
	
		function checkallnode() {
		$('#tree').treeview('checkAll', { silent : true });
	}

	function nocheckallnode() {
		$('#tree').treeview('uncheckAll', { silent : true });
	}
	
		function getselected() {
			var arr = $('#tree').treeview('getChecked');
			var arr2 = $('#tree').treeview('getNode',0);
			console.log(JSON.stringify(arr2));
			console.log(JSON.stringify(arr));
			var myarrs=new Array();
			for ( var key in arr) {
			var tparr  = {     //建立object对象
						  menuid: arr[key].menuid,
						  parentid: arr[key].parentid
						};
			console.log(arr[key].menuid,arr[key].parentid);
			myarrs[key]=tparr;
		}
			console.log(JSON.stringify(myarrs));
			return JSON.stringify(myarrs);
	}
	
		function toggleChildren(currentNode, state) {
		if (currentNode.state.checked != state) {
			$('#tree').treeview('toggleNodeChecked', [ currentNode.nodeId, {
				silent : true
			} ]);
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
	
	function vcommit(){
		var arr = $('#tree').treeview('getChecked');
		var arrval = getselected();
		$.ajax({
            type: "POST",
            url : "sys/addRoleMenuJson",
            data: {oper:arrval,roleid:parentroleid},
            async: false,   //false 同步  true（默认） 异步
            error: function(request) {
                alert("系统错误，请联系管理员！");
            },
            success: function(data) {
				alert( data.res);
				window.location.reload();
 				}
            });
	}
	
	function chosenode(){
		$('#tree').treeview('checkNode', [ 3, { silent : true }]);
		$('#tree').treeview('checkNode', [ 15, { silent : true }]);
	}
	
		function initselected() {
			checkallnode();  //全选
			var arr = $('#tree').treeview('getChecked');
			nocheckallnode();
			//console.log(JSON.stringify(arr));
			var myarrs=new Array();
			var tpmenuid = '';
			for ( var key in arr) {
			var tparr  = {     //建立object对象
						  menuid: arr[key].menuid,
						  parentid: arr[key].parentid,
						  nodeid:arr[key].nodeId
						};
						
			//console.log(arr[key].menuid,arr[key].parentid,arr[key].nodeId);
			//$('#tree').treeview('toggleNodeChecked', [ 0, { silent : false }]);
			tpmenuid= arr[key].menuid;
			if(arrmenuid.indexOf(tpmenuid)!=-1){
			$('#tree').treeview('checkNode', [ arr[key].nodeId, { silent : true }]);
			};
		}
	}

</script>
</head>
<body>
<div id="tree"></div>
<div>
<h5 id="iroleid"></h5>
<button type="button" class="btn btn-primary" onclick="checkallnode()">全选</button>
<button type="button" class="btn btn-primary" onclick="nocheckallnode()">反选</button>
<button type="button" onclick = "vcommit()" class="btn btn-info">提交修改</button>
<!-- 
<input type="button" id="btn" value="查询选中横条" /> 
<input type="button" id="" onclick="getselected()" value="获取所有checkbox" />
<input type="button" id="" onclick="chosenode()" value="指定选中" />
<input type="button" id="" onclick="initselected()" value="初始化选中" />
<input type="button" id="" onclick="test()" value="test" />
 -->

</div>
</body>
</html>