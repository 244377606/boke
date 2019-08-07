<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
		div{margin:20px;}
		textarea{
			width:600px;
			height:300px;
		}
		input{
			text-indent:20px;
			width:300px;
			height:30px;
		
		}
	</style>
	
	<form action="${pageContext.request.contextPath }/addArticle" method="post">
		 article表=====<input type="text" name="num" value="${num}"/>
            
		<div>
			title(标题) :<input type="text" name="title"/>
		</div>

		<div>
			author(文章作者) :<input type="text" name="author"/>
		</div>
						
		<div>
			img(图片) :<input type="text" name="img"/>
		</div>
		
		<div>
			articleTime(发表时间) :<input type="text" name="articleTime"/>
		</div>
		
		<div>
			 pageView(浏览量) :<input type="text" name="pageView"/>
		</div>
		
		<div>
			critiques(评论数)  :<input type="text" name="critiques"/>
		</div>
		
		<div>
			articleType(类型/关键字) :<input type="text" name="articleType"/>
		</div>
		
		<div>
			content(内容) :<textarea name="content"></textarea>
		</div>
		
		<div>
			<input type="submit" value="提交"/>
		<div>
	</form>
</body>
</html>