<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="com/chao/page/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>个人博客——留言板</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <link href="include/css/reset.css"   rel="stylesheet">  <!--重置样式 -->
        <link href="include/css/public.css"   rel="stylesheet">  <!--公共样式 -->
        <link href="include/css/byPage.css"   rel="stylesheet">  <!--分页标签 -->
        <link href="include/iconfont/iconfont.css" rel="stylesheet">   <!--阿里图标css -->
        <link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
        <link href="include/css/articleCritique.css" rel="stylesheet">

        <script src="include/js/jquery-1.8.0.min.js"></script> <!--jq -->
</head>

<body>
    <div id="ibody">
        <!-- 头部导航 -->
        <div id="header" class="rela">
            <div class="title">
                <h1>星之轨迹.梦中的灵魂</h1>
                <h2>
                   &emsp;追随流星的脚步,寻求不止息的梦想====学会做一个有心人,去做一件有心事
                </h2>
            </div>
            <div class="logo abso">
                 <a href="#"></a>
            </div>

			<div class="topnav">
			    <a href="${pageContext.request.contextPath }/index" class="onred">首页</a>
			    <a href="${pageContext.request.contextPath }/aboutMe">关于我</a>
			    <a href="${pageContext.request.contextPath }/album">我的相册</a>
			    <a href="${pageContext.request.contextPath }/comment">留言板</a>
			    <a href="${pageContext.request.contextPath }/admin/adminLogin" target="_blank">后台管理(待隐藏)</a>
			</div>
        </div>

        <!-- 左边文章显示 -->
        <div class="clearFix">
        <div id="articleCritique">
	       <h2 class="about_h">您现在的位置是：
	       	 	<a href="${pageContext.request.contextPath }/index">首页</a>&emsp;&gt;&emsp;
	            <a href="${pageContext.request.contextPath }/articleDetail?articleId=${articleDetail.getArticleId()}">详细内容</a>&emsp;&gt;&emsp;
	            <a href="${pageContext.request.contextPath }/articleCritique?articleId=${articleDetail.getArticleId()}">评论</a>&emsp;&gt;&emsp;
                <span style="color:red;">全部评论<span>
	        </h2>
	        
	        <!-- 显示评论的文章信息 -->
	        <div class="index_about">
	            <h2 class="c_titile">评论文章 : ${articleDetail.getTitle()}</h2>
	            <p class="box_c">
	               <span class="d_time">发布时间：${articleDetail.getArticleTime()}</span>
	               <span>作者：${articleDetail.getAuthor()} </span>
	               <span>浏览(${articleDetail.getPageView()}) </span>  
	               <span>评论(${articleDetail.getCritiques()})</span>
	            </p>
	        </div>      
             
            <div class="template1">
                <div class="newComment">
                   <p>全 部 评 论</p>
                </div>
            </div>
            
	        <!-- 展示 留言 信息 账户信息 -->
			<div class="template">
				<c:forEach items="${page.rows }" var="articleCritique">
				<ul style="margin-bottom:20px;">
				   	<li>
				   		<img src="/img/${articleCritique.user_img}">
				   	</li>
				  	<li>
					  	<span>${articleCritique.user_account}</span>
					   	<time>${articleCritique.critique_time}</time>
					   	<c:if test="${USER.u_id == articleCritique.user_id}">
					   		<b onclick="deleteById(${articleCritique.critique_id})">删 除</b>
					   	</c:if>
				   	</li>
				   	<li>
				      	${articleCritique.critique_content}
				   	</li>
				</ul>
				<div class="hr"></div>
				</c:forEach>
				
				<script type="text/javascript">
					//删除留言
					function deleteById(id){
						if(id){
							if(confirm("确定删除吗?")){
								$.ajax({
									type:"post",
									url:"${pageContext.request.contextPath }/deleteCritiqueByid",
									data:{critique_id:id},
									success:function(){
										window.location.reload();
									}
									
								})
							}
						}else{
							alert("数据异常!!")
						}
					}
				</script>
				
				<!-- 分页 -->
				<div>
					<f:page url="${pageContext.request.contextPath }/articleCritiqueAll?articleId=${articleDetail.getArticleId()}"></f:page>
				</div>

			</div>
    	</div>
		
	    <!-- 右边 推荐文章 展示 -->
	    <div id="rightLink">
	        <!-- 个人头像 -->
	        <a href="aboutMe.html">
	            <div class="avatar">
	                <span>关 于 chao</span>
	            </div>
	        </a>
	
	        <div class="topspaceinfo">
	            <h1>随遇而安，安而随遇</h1>
	            <p>于千万人之中,</p>
	            <p>我遇见了我所遇见的人....</p>
	        </div>
	        <div class="about_c">
	            <p>网名：星痕丶夜中魂</p>
	            <p>职业：一只程序猿</p>
	            <p>籍贯：河北-廊坊</p>
	            <p>QQ：244377606</p>
	            <p>邮箱：244377606@qq.com</p>
	        </div>
	
	        <div class="tj_news">
	            <h2>
	                <p class="tj_t1">最新笔记</p>
	            </h2>
	           <!--  最新笔记 -->
	            <ul>
	                <c:forEach items="${newArticle }" var="newArticle">
	                	<li>
	                		<a href="${pageContext.request.contextPath }/articleDetail?articleId=${newArticle.articleId}">
	                			${newArticle.title}
	                		</a>
	                	</li>
	                </c:forEach>    
	            </ul>
	
	            <!-- 推荐笔记 -->
	            <h2>
	              <p class="tj_t2">推荐笔记</p>
	            </h2>
	
	            <ul>
	               <c:forEach items="${hotArticle}" var="hotArticle">
	               	<li>
	               		<a href="${pageContext.request.contextPath }/articleDetail?articleId=${hotArticle.articleId}">
	               			${hotArticle.title}
	               		</a>
	               	</li>
	               </c:forEach>
	            </ul>
	        </div>
	        <div class="links">
	            <p class="tj_t3">有情连接</p>
	            <a href="http://user.qzone.qq.com/3535305171" target="_blank">QQ 空 间</a>
	        </div>
	        <div class="copyright">
	            Design by  超
	        </div>
	    </div>
		</div>
</div>
    <script type="text/javascript">
        var articleCritique = $("#articleCritique").height();  //获取右边笔记的 高度
        $("#rightLink").css({minHeight:articleCritique});  //设置右边的最小高度
    </script>
</body>
</html>
