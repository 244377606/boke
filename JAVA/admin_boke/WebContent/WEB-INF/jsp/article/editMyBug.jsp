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
	  	margin:20px 0 20px 20px;
	  }
	  body{padding: 15px;}
	  
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>              
</head>
<body>
	 <form class="layui-form layui-form-pane" action="">
	 
		 <div class="layui-form-item layui-form-text username">
		    	<label class="layui-form-label">错误信息</label>
			    <div class="layui-input-block">
			      <textarea id="bugError" name="bugError" class="layui-textarea" style="height:150px;">${myBug.bugError}</textarea>
			    </div>
		  </div>
		  
		  <div class="layui-form-item layui-form-text username">
		    	<label class="layui-form-label">大概原因</label>
			    <div class="layui-input-block">
			      <textarea id="bugReason" name="bugReason" class="layui-textarea" style="height:100px;">${myBug.bugReason}</textarea>
			    </div>
		  </div>
		  
		  <div class="layui-form-item layui-form-text username">
		    	<label class="layui-form-label">解决方案</label>
			    <div class="layui-input-block">
			      <textarea id="bugSolve" name="bugSolve" class="layui-textarea" style="height:100px;">${myBug.bugSolve}</textarea>
			    </div>
		  </div>
		  
		  <div class="layui-form-item">
			    <div style="margin:20px auto;width:90px;">
			      <button id="ralSummit" type="button" class="layui-btn">立即提交</button>
			    </div>
		  </div>
		  
		  <input type="hidden" id="bugId" name="bugId" value="${myBug.bugId}">
	  </form>
  
	  <script type="text/javascript">
	  	$("#ralSummit").on("click",function(){
 			$.ajax({
	  			type:"post",
	  			url:"${pageContext.request.contextPath}/updateMyBug",
	  			data:{
	  				bugReason:$("#bugReason").val(),
	  				bugError:$("#bugError").val(),
	  				bugSolve:$("#bugSolve").val(),
	  				bugId:$("#bugId").val()
	  			},
	  			success:function(d){
	  				if(d > 0){
	  					window.parent.location.reload();
	  				}
	  				else{
	  					alert("修改失败,请联系超级管理员");
	  					window.parent.location.reload();
	  				}
	  			}
	  		});
	  	})
	  </script>
	  
</body>
</html>