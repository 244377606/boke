<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	  
	  tbody .layui-table-cell > p{
	     width:100%;
	  	 overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	  }
	  
	     
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script> 
               
</head>
<body>
	<!-- 条件删选  -->
	 <form class="layui-form layui-form-pane" action="">
		 
		 <div class="layui-inline username" >
		    <label class="layui-form-label">相册查询</label>
		    <div class="layui-input-inline sex-select" style="width:100px;">
		      <select name="albumName"  id="albumName">
		          <option value="">请选择</option>
		          <c:forEach items="${albumName}" var="albumName">
		          <option value="${albumName.albumTitle}">${albumName.albumTitle}</option>
		          </c:forEach>
		         
		       </select>
		    </div>
		       <input type="button" id="search" class="layui-btn layui-btn-warm query-btn" value="检索" />  
		  </div>
	  </form>
	  
	  
    <!-- 数据表格 展示数据  -->
	<table class="layui-hide" id="photo" lay-filter="photo"></table>

<!-- 绑定操作事件 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  <a class="layui-btn layui-btn layui-btn-xs" lay-event="setPic">设为封面</a> 
</script>


<script>
	//数据表格列 展示
  layui.use('table', function(){  //依赖模块加载
	var table = layui.table;
	  
	var tableIns = table.render({
	    elem: '#photo', //table标签的 Id 渲染数据
	    url:'${pageContext.request.contextPath}/photoInfo',
	         // 传入参数：page--当前页   limit--每页显示条数
	         // 需要返回对象：PageData{
	    	     //code--请求状态，默认0为成功，
	    	     //msg--提示信息；count--数据总条数；data---数据集合}
	    //数据 对应列 需要和实体类一一对应
	    cols: [[

	            //sort: true可排序  fixed: 'left'固定在右/左边  
	        	//edit: 'text'单元格编辑类型（默认不开启）可直接在表格中修改数据	        	
        	
			{field:'photoId', title:'唯一id号',width:120,sort: true},
			{field:'albumId', title:'所属相册id', width:140},
			{field:'albumName', title:'所属相册', width:150},
			{field:'photoTime', title:'加入相册时间', width:170},
			{field:'photoImg', title:'照片图', width:170,
				templet: function(res){
			        return '<div><img src="/img/'+res.photoImg+'" width="120" height="80"></div>'
			 	}
			},
			
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
	  table.on('tool(photo)', function(obj){
	    var data = obj.data;
	    
	    if(obj.event === 'setPic'){
	    	$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/updateAlbumImgByPhotoId",
				data:{
					albumId:data.albumId,
					photoImg:data.photoImg
				},
				success:function(str){
				  if(str > 0){
					  layer.msg("设置成功!");
				  }else{
					  layer.msg("设置失败!");
				  }
				}
			})
		}
	    
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗?', function(index){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/deletePhotoById",
				data:{
					id:data.photoId
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
	    }
	  });

	    
	  //条件检索 不能使用onclick()事件
	  $("#search").on("click",function(){
			tableIns.reload({
				  where: { //设定异步数据接口的额外参数，任意设
					  albumName: $("#albumName").val()  //相册 id 搜索
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