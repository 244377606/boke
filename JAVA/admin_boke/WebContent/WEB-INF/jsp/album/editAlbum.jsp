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
	 
		 <div class="username" >
		    <label class="layui-form-label">相册名称</label>
		    <div class="layui-input-block">
		      <input type="text" id="albumTitle" name="albumTitle" value="${album.albumTitle}" lay-verify="required" autocomplete="off" class="layui-input">
		    </div>
		 </div>
		 
		 <div class="username" >
		    <label class="layui-form-label">类型</label>
		    <div class="layui-input-inline">
		      <input type="text" id="albumType" name="albumType" value="${album.albumType}" lay-verify="required" autocomplete="off" class="layui-input">
		    </div>
		 </div>
		 
		 <div class="layui-upload username">
			  <button type="button" class="layui-btn" id="updateImg">封面修改</button>
			  <div class="layui-upload-list" style="display:inline-block;margin-left:20px;">
			    <img class="layui-upload-img" src="/img/${album.albumImg}" id="quImg" width="180" height="120";>
		  	  </div>
		</div> 
		 
<script>
	layui.use('upload', function(){
	  var upload = layui.upload;
	  
	  //普通图片上传
	  var uploadInst = upload.render({
	    elem: '#updateImg'
	    ,url: '${pageContext.request.contextPath}/updateAlbumImg'
	    ,field: "file"     //添加这个属性与后台名称保存一致
	    
	    ,auto: false //选择文件后不自动上传
	    ,bindAction: '#ralSummit' //指向一个按钮触发上传
	    
	    ,choose: function(obj){
	    	
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#quImg').attr('src', result);
	      });
	    }
	    ,done: function(res){
	     	newImg:$("#newImg").val(res.msg);
	    }
	  });
	});
</script>
		 
		 <div class="layui-form-item layui-form-text username">
		    	<label class="layui-form-label">相册描述</label>
			    <div class="layui-input-block">
			      <textarea id="albumDescribe" name="albumDescribe" class="layui-textarea" style="height:200px;">${album.albumDescribe}</textarea>
			    </div>
		  </div>
		  
		  <div class="layui-form-item">
			    <div style="margin:20px auto;width:90px;">
			      <button id="ralSummit" type="button" class="layui-btn">立即提交</button>
			    </div>
		  </div>
		  
		  <input type="hidden" id="oldImg"  name="oldImg" value="${album.albumImg}"/>
		  <input type="hidden" id="newImg"  name="newImg" value=""/>
		  <input type="hidden" id="albumId"  name="albumId" value="${album.albumId}"/>
		  
	  </form>
  
	  <script type="text/javascript">
	  	$("#ralSummit").on("click",function(){
	  		setTimeout(t,200);
	  	})
	  
	  	function t(){
	  		
  			if($("#newImg").val() || $("#oldImg").val()){
  				$.ajax({
		  			type:"post",
		  			url:"${pageContext.request.contextPath}/updateAlbumById",
		  			data:{
		  				albumTitle:$("#albumTitle").val(),
		  				albumType:$("#albumType").val(),
		  				albumDescribe:$("#albumDescribe").val(),
		  				albumImg:$("#newImg").val(),
		  				albumId:$("#albumId").val()
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
	  		}else{
	  			alert("图片传送中,请一会再次提交");
	  		}
	  	}
	  </script>
	  
</body>
</html>