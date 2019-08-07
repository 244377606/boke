<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="com/chao/page/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人博客——关于我</title>
		<meta name="keywords" content="个人博客模板,博客模板,响应式">
		<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。">

		<link href="include/css/reset.css" rel="stylesheet">
		<link href="include/css/public.css" rel="stylesheet">
		<link href="include/css/byPage.css" rel="stylesheet">

		<link href="include/css/aboutMe.css" rel="stylesheet">
		<link href="include/css/header.css"  rel="stylesheet">

		<script src="include/js/jquery-1.8.0.min.js"></script> <!--jq -->
  </head>

  <body>
	<div id="ibody">

		<!-- 头部导航 -->
		<div id="header" class="rela">
			<div class="title">
				<h1>暗之黎明.归途的微笑</h1>
				<h2>
				   &emsp;无助的时候请不要感到迷惘,迷惘只会增加更大的无助========

				</h2>
			</div>
			<div class="logo abso">
				 <a href="#"></a>
			</div>

			<div class="topnav">
			    <a href="${pageContext.request.contextPath }/index">首页</a>
			    <a href="${pageContext.request.contextPath }/aboutMe"  class="onred">关于我</a>
			    <a href="${pageContext.request.contextPath }/album">我的相册</a>
			    <a href="${pageContext.request.contextPath }/comment">留言板</a>
			    <a href="${pageContext.request.contextPath }/admin/adminLogin" target="_blank">后台管理(待隐藏)</a>
			</div>
		</div>

		<!-- 座右铭 -->
		<div class="clearFix">
		<div id="aboutMe">
			<h3 class="about_h">
				您现在的位置是： 
				<a href="${pageContext.request.contextPath }/aboutMe">关于我</a>&emsp;&gt;&emsp;
				<span style="color:red;">错误集合</span>
			</h3>
			<div class="about">
				<h2>Just about bug</h2>
				
				<div class="search">
					<form name="searchForm" action="${pageContext.request.contextPath }/aboutMyBug" >
						<p>不妨搜一搜 :</p>
						<input class="textInput" placeholder="请输入关键字"
							   type="text" name="bugSearch" id="bugSearch" value="${bugSearch}"/>
						<input class="btnSearch" type="submit" value="搜索" />
					</form>
				</div>
				
				<c:forEach items="${page.rows}" var="mybug">
				<ul class="aboutBug">
					<li>
					    <span style="color:red">错 误 : </span>
					    <div>${mybug.bugError}</div>
					</li>
					<li>
					    <span style="color:skyblue">原 因 : </span>
					    <div>${mybug.bugReason}</div>
					    
					</li>
					<li>
					    <span style="color:green">解 决 : </span>
					    <div>${mybug.bugSolve}</div>
					</li>
				</ul>
				</c:forEach>
				
				<div>
					<c:if test="${!empty page.rows}">
						<f:page url="${pageContext.request.contextPath }/aboutMyBug"></f:page>
					</c:if>
					<c:if test="${empty page.rows}">
						<div class="noData">抱歉,没有找到相关数据!</div>
					</c:if>
				</div>
				
				<h2>About my blog</h2>
				<ul class="blog_a">
					<p>域 名：www.chaolike.top</p>
					<p>服务器：阿里云</p>
					<p>程 序：漂移程序</p>
				</ul>
			</div>
		</div>

		<!-- 右边区域 -->
		<div id="rightAside">
			<div class="avatar">
				<img src="include/images/aboutChao.jpg" width="160" height="160" alt=""/>
			</div>

			<div class="topspaceinfo">
				<h1>执念，思</h1>
				<p>革命尚未成功,同志仍需努力....</p>
			</div>

            <div class="tj_news">
                <h2>
                    <p class="tj_t1">个 人 简 介</p>
                </h2>
               	<div class="about_c">
					<p>姓&emsp;名 : <span>苗小超</span></p>
					<p>性&emsp;别 : <span>男</span></p>
					<p>爱&emsp;好 : <span>敲代码</span></p>
					<p>走&emsp;向 : <span>后台工程师 </span></p>
					<p>Q&emsp;&nbsp;Q : <span>244377606 </span></p>
					<p>简&emsp;历 : <span><a href="${pageContext.request.contextPath }/aboutResume">详 情</a></span></p>
				</div>

                <!-- 推荐笔记 -->
                <h2>
                  <p class="tj_t2">惊 现 BUG</p>
                </h2>

                <ul class="leftYan">
                  <c:forEach items="${rightBug}" var="rightBug">
                  	<li>
                  		<a href="${pageContext.request.contextPath }/aboutMyBug">
                  			${rightBug.bugError}
                  		</a>
                  	</li>
                  </c:forEach>
                </ul>

            </div>
			
			
		    <div class="links">
                <p class="tj_t3">分 享 到 :</p>
                <div class="fenXiang">
					<a href="http://user.qzone.qq.com/3535305171" target="_blank" title="分享到QQ空间"></a>
					<a href="https://weibo.com/#_loginLayer_1554283733963" target="_blank" title="分享到新浪微博"></a>
					<a href="http://t.qq.com/" target="_blank" title="分享到腾讯微博"></a>
					<a href="https://wx.qq.com/" target="_blank" title="分享到微信"></a>	
				 </div>
            </div>
			 
		</div>
		</div>
	</div>
		<script type="text/javascript">
			//关于我
			var aboutMe = $("#aboutMe").height();       //获取右边笔记的 高度
			$("#rightAside").css({minHeight:aboutMe});  //设置右边的最小高度	
		</script>
</body>
</html>
