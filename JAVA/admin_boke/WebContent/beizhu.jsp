<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		       <input type="button" id="query" class="layui-btn layui-btn-warm query-btn" value="检索" />  
		  </div>
	  </form>

    <!-- 数据表格 展示数据  -->
	<table class="layui-hide" id="userList" lay-filter="user"></table>
 
 
<!-- 绑定操作事件 -->
<script type="text/html" id="barDemo"> 
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script>
	//数据表格列 展示
	layui.use('table', function(){  //依赖模块加载
	  var table = layui.table;
	  
	  table.render({
	    elem: '#userList', //table标签的 Id 渲染数据
	    url:'${pageContext.request.contextPath}/admin/selectAllAdmin',
	         // 传入参数：page--当前页   limit--每页显示条数
	         // 需要返回对象：PageData{
	    	     //code--请求状态，默认0为成功，
	    	     //msg--提示信息；count--数据总条数；data---数据集合}
	    //数据 对应列 需要和实体类一一对应
	    cols: [[
			{type: 'checkbox', fixed: 'left'}, 
			
	       	 	//sort: true可排序  fixed: 'left'固定在左左边  
	        	//edit: 'text'单元格编辑类型（默认不开启）可直接在表格中修改数据
	        	
			{field:'admin_id', title:'u_id',width:80, fixed: 'right', sort: true},
			{field:'admin_name', title:'用户名', width:120},
			{field:'admin_password', title:'密码', width:120, edit: 'text'},
			{field:'admin_sex', title:'性别', width:120},
			{field:'state', title:'状态', width:150,
			 	//模版对象 在表格中 添加 非数据库中的数据
				 templet: function(res){
				        return '<input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">'
				    }},
				    
		 		//绑定操作 栏删除 编辑 事件
			{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
	      
	    ]],
	    page: true,//开启分页
	    done:function(data){ //成功之后的回调
      		layer.msg(data.msg);
     	 }     
	  });
	  
	  //监听 table 行工具  '#barDemo'  操作 事件
	  table.on('tool(user)', function(obj){
	    var data = obj.data;
	    //console.log(obj)
	    if(obj.event === 'del'){
	    	
	      layer.confirm('真的删除行么', function(index){
	        obj.del();
	        layer.close(index);
	      });
	    } else if(obj.event === 'edit'){ //点击编辑弹出新窗体
	    	
			layer.open({
				type: 2,   //打开的类型
				title: '编辑管理员',
				maxmin: true,  //是否现在最小化/最大化
				area: ['850px', '500px'],
				content: '${pageContext.request.contextPath}/admin/list', //这里content是一个普通的String
			});
	    }
	  });
	});
</script>




</body>
</html>