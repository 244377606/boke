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
	
  <script src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>

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
	  
	  div{
	  	width:350px;
	  	margin:50px auto;
	  	font:24px/24px '';
	  	color:red;
	  	text-align:center;
	  }
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>              
</head>
<body>
	<div>此账号权限不足!!</div>
	<div>=== 需联系超级管理员 ===</div>
	
	<!-- 条件删选 
	<form name="adminName" class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/adminAccountInfo">
		<div class="layui-inline username" >
			<label class="layui-form-label">帐号查询</label>
			<div class="layui-input-inline">
			    <input type="text" value="" id="username" name="username" placeholder="此账号权限不足!!" class="layui-input">
			</div>
			<input type="button" class="layui-btn layui-btn-warm query-btn" value="检索" id="search"/>  
		</div>
	</form>
   
	<table class="layui-hide" id="adminAccount" lay-filter="admin"></table>  -->

<script>
/*
	//数据表格列 展示
	layui.use('table', function(){  //依赖模块加载
	  var table = layui.table;
	
	  var tableIns = table.render({
	    elem: '#adminAccount', //table标签的 Id 渲染数据
	    url:'${pageContext.request.contextPath}/adminAccountInfo',
	         // 传入参数：page--当前页   limit--每页显示条数
	         // 需要返回对象：PageData{
	    	     //code--请求状态，默认0为成功，
	    //数据 对应列 需要和实体类一一对应
	    cols: [[
	       	 	//sort: true可排序  fixed: 'left'固定在右/左边  
	        	//edit: 'text'单元格编辑类型（默认不开启）可直接在表格中修改数据
			{field:'adminId', title:'唯一id号',width:120,sort: true},
			{field:'adminName', title:'账号', width:120},
			{field:'adminPassword', title:'密码', width:120},
			{field:'adminSex', title:'性别', width:80},
			{field:'state', title:'状态', width:150,
			 	//模版对象 在表格中 添加 非数据库中的数据
				 templet: function(res){
				        return '<input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">'
				 }
			}
	    ]],
	    page: true,//开启分页
	    done:function(data){ //成功之后的回调
      		//layer.msg(data.msg);
     	 }     
	  });
	  
	  //条件检索 不能使用onclick()事件
	  $("#search").on("click",function(){
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
*/
</script>

	
</body>
</html>