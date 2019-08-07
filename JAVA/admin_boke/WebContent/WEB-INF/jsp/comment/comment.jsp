<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>数据展示</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet"  media="all">

  <style type="text/css">
	  .username{
	  	margin-top: 20px;
	    margin-left: 20px;
	    margin-bottom: 10px;
	  }
	  .query-btn{
	  	margin-left:10px;
	  }
	  body{padding: 15px;}
	  
	  
	 body{padding: 15px;}
	  
	  form{
	  	min-width:400px;
	  }
	  
	  thead .layui-table-header{
	  	height:50px;
	  	line-height:50px;
	  }
	  
	  tbody .layui-table-cell{
	  	height:82px;
	  	line-height:82px;
	  	overflow:hidden;
	  }
	  tbody .layui-form-checkbox i{
	  	top:28px;
	  } 
	  
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>
               
</head>
<body>
	<!-- 条件删选  -->
	 <form class="layui-form layui-form-pane" action="">
		 <div class="layui-inline username" >
		    <label class="layui-form-label">帐号搜索</label>
		    <div class="layui-input-inline">
		      <input type="text" id="username" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
		    </div>
		    <input type="button" id="query" class="layui-btn layui-btn-warm query-btn" value="检索" />  
		  </div>
	  </form>
  
    <!-- 数据表格 展示数据  -->
	<table class="layui-hide" id="comment" lay-filter="comment"></table>
 
<!-- 批量删除 -->	
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">批量删除</button>
  </div>
</script>
 
<!-- 绑定操作事件 -->
<script type="text/html" id="barDemo"> 
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>
	//数据表格列 展示
	layui.use('table', function(){  //依赖模块加载
	  var table = layui.table;
	  
	  var tableIns = table.render({
	    elem: '#comment', //table标签的 Id 渲染数据
	    toolbar: '#toolbarDemo',  
	    defaultToolbar:['filter'],    
	    url:'${pageContext.request.contextPath}/commentInfo',
	         // 传入参数：page--当前页   limit--每页显示条数
	         // 需要返回对象：PageData{
	    	     //code--请求状态，默认0为成功，
	    	     //msg--提示信息；count--数据总条数；data---数据集合}
	    //数据 对应列 需要和实体类一一对应
	    cols: [[
			{type: 'checkbox', fixed: 'left'}, 
			
	       	 	//sort: true可排序  fixed: 'left'固定在右/左边  
	        	//edit: 'text'单元格编辑类型（默认不开启）可直接在表格中修改数据
	        	        	       	
			{field:'commentId', title:'留言id号',width:120,sort: true},
			{field:'userId', title:'用户id', width:120},
			{field:'userImg', title:'帐号头像', width:120,
				templet: function(res){
			        return '<div><img src="/img/'+res.userImg+'" width="70" height="70"></div>'
			 	}
			},
			{field:'userAccount', title:'留言帐号', width:120},
			{field:'commentTime', title:'留言时间', width:170},
			{field:'commentContent', title:'留言内容', width:120},
				    
		 		//绑定操作 栏  删除 编辑 事件
			{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
	      
	    ]],
	    page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
	    	layout: [ 'limit', 'prev', 'page', 'next','count', 'skip'] //自定义分页布局
		    ,first: '首页'
		    ,last: '尾页'
	        ,limits : [5,10,15,20]
            ,limit:5
	      } 
	  });
	  
	  //监听 table 行工具  '#barDemo'  操作 事件
	  table.on('tool(comment)', function(obj){
	    var data = obj.data;
	    //console.log(obj)
	    if(obj.event === 'del'){
	    	
	      layer.confirm('确定删除 该 条数据吗?', function(index){
	    	  $.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/deleteCommentById",
					data:{
						id:data.commentId
					},
					success:function(str){
					  if(str > 0){
						  obj.del();
						  layer.close(index);
						  layer.msg("删除成功!");
					  }else{
						  layer.msg("删除失败!");
					  }
					}
				})
	      });
	    } else if(obj.event === 'edit'){ //点击编辑弹出新窗体
	    	
			layer.open({
				type: 2,   //打开的类型
				title: '修改留言内容',
				maxmin: true,  //是否现在最小化/最大化
				area: ['650px', '600px'], //打开的区域大小
				content: '${pageContext.request.contextPath}/commentData?id='+data.commentId, //这里content是一个普通的String,请求资源路径
			});
	    }
	  });
	  
	  //头工具栏事件 批量删除
	  table.on('toolbar(comment)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    if(obj.event == 'getCheckLength'){
			var data = checkStatus.data;
	    	
	        if(data.length==0){
	        	 layer.msg('未选中数据,请选择数据！');
	        	 return false;
	        }
	       
	        //将id一次性存入  
			var ids=new Array();
			for(var i=0;i<data.length;i++){
			 	ids.push(data[i].commentId);
			}
			
	        layer.confirm('确定删除这 '+data.length+' 记录？', function(index){
			  	  $.ajax({
			  			type:"post",
						url:"${pageContext.request.contextPath}/deleteCommentByIds",
						data:{ids:ids},
						success:function(data){
							if(data>0){
								 window.location.reload();//刷新页面
							}else{
								layer.msg("删除失败!,请联系boss");
							}
						}
			  	  });
	        });
	    }; 
	    
      });
	  
	  //条件检索 不能使用onclick()事件
	  $("#query").on("click",function(){
			tableIns.reload({
				  where: { //设定异步数据接口的额外参数，任意设
					  username: $("#username").val()
				  }
				  ,page: {
				 	 curr: 1 //重新从第 1 页开始
				  }
			});
		});
	  
	});
</script>

</body>
</html>