    $(function () {
        $(".datepicker-input-yyyy-mm").datepicker({
			format: 'yyyy-mm',
			weekStart: 1,
			autoclose: true,
			startView: 1,
			maxViewMode: 2,
			minViewMode:1,
			forceParse: false,
			language: 'zh-CN'
        });
        
        $(".datepicker-input-yyyy-mm-dd").datepicker({
            language: "zh-CN",
            autoclose: true,//选中之后自动隐藏日期选择框
            clearBtn: false,//清除按钮
            format: "yyyy-mm-dd",
            todayBtn: false//今日按钮
            
        });
        
        $(".datepicker-input-yyyy").datepicker({
			format: 'yyyy',
			weekStart: 1,
			autoclose: true,
			startView: 2,
			maxViewMode: 2,
			minViewMode:2,
			forceParse: false,
			language: 'zh-CN'
        });

        $("table.sort_table").sort_table({
            "action" : "init"
        });
        

    });

    
    function showmsg(msg){
        var vmsg = "<a href=\"#\" class=\"media list-group-item\"><span class=\"pull-left thumb-sm text-center\"><i class=\"fa fa-envelope-o fa-2x text-success\"></i></span><span class=\"media-body block m-b-none\">"+msg+"<br><small class=\"text-muted\">"+timeStamp2String()+"</small></span></a>";
        setTimeout(function(){
            window.parent.window.addMsg(vmsg);
            window.parent.window.showmsg(msg,2);
        }, 1500);
        }
    
	//时间戳转日期
	function timeStamp2String(time) {
		var datetime = new Date();
		if(time!=null&&time!=''){
		datetime.setTime(time);
		}
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0"
				+ (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
				: datetime.getDate();
		var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
				: datetime.getHours();
		var minute = datetime.getMinutes() < 10 ? "0"
				+ datetime.getMinutes() : datetime.getMinutes();
		var second = datetime.getSeconds() < 10 ? "0"
				+ datetime.getSeconds() : datetime.getSeconds();
		return year + "-" + month + "-" + date + " " + hour + ":" + minute
				+ ":" + second;
	}
