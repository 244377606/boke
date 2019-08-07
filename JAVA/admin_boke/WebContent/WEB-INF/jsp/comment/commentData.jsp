<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

  <style type="text/css">
	  body{padding: 15px;}
	  
	  
	  .formCom{
	  	width:590px;
	 	height:450px;
	 	margin:0px auto;
	  }
	  
	  .formCom span{
		  font:bold 20px/24px '';
		  margin-left:15px;
	  }
	 .formCom .comm textarea{
	 	width:580px;
	 	height:350px;
	 	resize:none;
	 	margin:10px 0;
	 	font:16px/24px '';
	 	letter-spacing:2px;
	 	outline:none;
	 }
	 .formCom .button{
	 	width:100px;
	 	height:40px;
	 	margin-left:260px;
	 	cursor:pointer;
	 }
  </style>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>
                 
</head>
<body>
	<!-- 条件删选  -->
	
	 <form class="formCom" action="">
	 	 <span>留言内容修改 :</span>
		 <div class="comm">
			 <textarea id="commentContent" name="commentContent">${comment.commentContent}</textarea>
		 </div>
		 <input id="edit" class="button" type="button" value="修改">
		 
		 <input type="hidden" id="commentId" name="commentId" value="${comment.commentId}">
	  </form>
	  
	  <script type="text/javascript">
	  	$("#edit").on("click",function(){
	  		$.ajax({
	  			type:"post",
	  			url:"${pageContext.request.contextPath}/commentUpdate",
	  			data:{
	  				commentId:$("#commentId").val(),
	  				commentContent:$("#commentContent").val(),
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
	  		})
	  	})
	  
	  </script>
	  
</body>
</html>