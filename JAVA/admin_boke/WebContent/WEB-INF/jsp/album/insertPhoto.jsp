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
	  
	#demo2 .upPic{
		display:inline-block;
		position:relative;
		margin:10px 10px 0 0;
	}
	#demo2 .upPic > .indexPic{
		position:absolute;
		border-radius:50%;
		line-height:20px;
		color:#fff;
		border:2px solid black;
		cursor:pointer;
		text-align:center;
		right:0px;top:0px;
		width:20px;
		height:20px;
		background:rgba(0,0,0,.5);
	}
  </style>
  
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>              
</head>
<body>
	 <form class="layui-form layui-form-pane" action="">
	 
		<div class="layui-upload">
		  <button type="button" class="layui-btn" id="photos">多图片添加</button> 
		  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
		    	预览图：
		    	<div class="layui-upload-list" id="demo2"></div>
		  </blockquote>
		</div>

		<div class="layui-form-item">
		   <div style="margin:20px auto;width:90px;">
		     <button id="ralSummit" type="button" class="layui-btn">立即提交</button>
		   </div>
		</div>
		
		<input type="hidden" id="albumId" value="${albumId}"/>
		<input type="hidden" id="albumTitle" value="${albumTitle}"/>
		
		  
	  </form>		 
		 <script type="text/javascript">
	
		 var files,uploadInst;
		 
		 layui.use('upload', function(){
		   upload = layui.upload;
		   
		   //多图片上传
		  uploadInst = upload.render({
		     elem: '#photos'
		     ,url: '${pageContext.request.contextPath}/insertPhotoForAlbum'
		     ,multiple: true
		     ,auto: false //选择文件后不自动上传
		     ,bindAction: '#ralSummit' //指向一个按钮触发上传
		     ,choose: function(obj){
		       //预读本地文件示例，不支持ie8
		       files = obj.pushFile();
		       obj.preview(function(index, file, result){
		         $('#demo2').append('<div class="upPic"><input type="hidden" id="hiddenPicIndex" value="'+index+'"/><img width=180 height=120 src="'
		        		 + result +'" alt="'+ file.name 
		        		 +'" class="layui-upload-img"/><i onclick="delPic(this)" class="indexPic">X</i></div>');	
		       });
		     }
		     ,data:{
		    	 flie:files,
		    	 albumId:$("#albumId").val(),
		    	 albumTitle:$("#albumTitle").val(),
		     }
		     //,done: function(res){}
		     ,allDone: function(obj){ //当文件全部提交后触发
		    	 window.parent.location.reload();
		     }
		   });
		   
		   
		   //提交 增加照片操作
		   $("#ralSummit").on("click",function(){
			   if(!files){layer.msg("图片不能为空!")}
		   });
		   
		});
		 
		//删除 图片
		function delPic(o){
			delete files[$("#hiddenPicIndex").val()];
			uploadInst.config.elem.next()[0].value = '';
			o.parentNode.parentNode.removeChild(o.parentNode);
		}
		</script>
		 

  
</body>
</html>