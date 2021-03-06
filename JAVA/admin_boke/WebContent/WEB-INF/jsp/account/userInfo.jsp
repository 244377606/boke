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

  <script type="text/javascript" src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>

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
	  
	  
	  tbody tr td{height:82px;}
	  thead tr th{height:28px;}
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>              
</head>
<body>
	<!-- 条件删选  -->
	 <form class="layui-form layui-form-pane" action="">
		 <div class="layui-inline username" >
		    <label class="layui-form-label">用户名</label>
		    <div class="layui-input-inline">
		      <input type="text" id="username" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
		    </div>
		 </div>
		 <div class="layui-inline username" >
		    <label class="layui-form-label">性别</label>
		    <div class="layui-input-inline sex-select" style="width:100px;">
		      <select name="sex"  id="sex">
		          <option value="">请选择</option>
		          <option value="男">男</option>
		          <option value="女">女</option>
		       </select>
		    </div>
		       <input type="button" id="search" class="layui-btn layui-btn-warm query-btn" value="检索" />  
		  </div>
	  </form>
  
    <!-- 数据表格 展示数据  -->
	<table class="layui-hide" id="userAccount" lay-filter="user"></table>

<!-- 批量删除 -->	
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">批量删除</button>
  </div>
</script> 
 
<!-- 绑定操作事件 -->
<script type="text/html" id="barDemo"> 
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>
	//数据表格列 展示
  layui.use('table', function(){  //依赖模块加载
	var table = layui.table;
	  
	var tableIns = table.render({
	    elem: '#userAccount', //table标签的 Id 渲染数据
	    toolbar: '#toolbarDemo',  // 工具条 批量删除
	    defaultToolbar:['filter'],    //显示右边 ['filter', 'print', 'exports']
	    url:'${pageContext.request.contextPath}/userAccountInfo',
	         // 传入参数：page--当前页   limit--每页显示条数
	         // 需要返回对象：PageData{
	    	     //code--请求状态，默认0为成功，
	    	     //msg--提示信息；count--数据总条数；data---数据集合}
	    //数据 对应列 需要和实体类一一对应
	    cols: [[
			{type: 'checkbox',height:100,fixed: 'left'}, 
			
	       	 	//sort: true可排序  fixed: 'left'固定在右/左边  
	        	//edit: 'text'单元格编辑类型（默认不开启）可直接在表格中修改数据	        	
	        	
			{field:'u_id', title:'唯一id号',width:120,sort: true},
			{field:'u_account', title:'用户名', width:120},
			{field:'u_password', title:'密码', width:120},
			{field:'u_img', title:'头像', width:120,
				templet: function(res){
			        return '<div><img src="/img/'+res.u_img+'" width="70" height="70"></div>'
			 	}
			},
			{field:'u_sex', title:'性别', width:120},
			{field:'u_time', title:'创建时间', width:170},
			
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
	  
	  //监听 table 行工具  '#barDemo'  操作 删除 事件
	  table.on('tool(user)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/deleteUserById",
				data:{
					id:data.u_id,
					img:data.u_img
				},
				success:function(str){
				  if(str === 1){
					  obj.del();
					  layer.close(index);
					  layer.msg("删除成功!");
				  }else{
					  layer.msg("删除失败!");
				  }
				}
			})
			
	      });
	    }
	  });

	  //头工具栏事件 批量删除
	  table.on('toolbar(user)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    
	    if(obj.event == 'getCheckLength'){
	    	var data = checkStatus.data;
	    	
	        if(data.length==0){
	        	 layer.msg('未选中数据,请选择数据！');
	        	 return false;
	        }
	       
	        //将id一次性存入  存入删除的图片名称
			var ids=new Array();
			var imgs = new Array();
			
			for(var i=0;i<data.length;i++){
			 	ids.push(data[i].u_id);
			 	imgs.push(data[i].u_img);
			}
			
	        layer.confirm('确定删除这 '+data.length+' 记录？', function(index){
			  	  $.ajax({
			  			type:"post",
						url:"${pageContext.request.contextPath}/deleteUserByIds",
						data:{ids:ids,img:imgs},
						success:function(data){
							if(data>0){
								 window.location.reload();//刷新页面
							}else{
								layer.msg("删除失败!,请联系boss");
							}
						}
			  	});
	        });
	    }
	    
	    
	    
	    
	    /*  多事件判断
	    switch(obj.event){
	    
	    //新增事件
	      case 'getCheckData':
	       	// var data = checkStatus.data;
	        //layer.alert(JSON.stringify(data));
	        layer.open({
	    	  type: 2,
		      title: '新增管理员',
		      maxmin: true,
		      shadeClose: true, //点击遮罩关闭层
		      area : ['900px' , '720px'],
		      content: '${pageContext.request.contextPath}/customer/returnAddCutomer.action'
		    });
	      break;
	     
	      
	      //批量删除
	      case 'getCheckLength':
	        var data = checkStatus.data;
	        if(data.length==0){
	        	 layer.msg('未选中数据,请选择数据！');
	        	 return false;
	        }
	       
			var ids=new Array();
			for(var i=0;i<data.length;i++){
			 	ids.push(data[i].id);
			}
	        layer.confirm('确定删除这 '+data.length+' 记录？', function(index){
			  	  $.ajax({
						url:"${pageContext.request.contextPath}/customer/deleteByIds.action",
						data:{"ids":ids},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data>0){
								 layer.msg("删除成功!");
								 location.reload(true);//刷新页面
								 layer.close(index);
							}
						}
			  	});
	        });
	      break;
	     
	    }; */
	  });	  
	  
	  
	  //条件检索 不能使用onclick()事件
	  $("#search").on("click",function(){
			tableIns.reload({
				  where: { //设定异步数据接口的额外参数，任意设
					  username: $("#username").val(),
					  sex:$("#sex").val()
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