<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="com/chao/page/"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <title>个人博客——主页</title>
        <meta name="keywords" content="博客,星之轨迹">
        <meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。">

        <link href="include/css/reset.css"   rel="stylesheet">  <!--重置样式 -->
        <link href="include/css/public.css"   rel="stylesheet">  <!--公共样式 -->
        <link rel="stylesheet" href="include/iconfont/iconfont.css">   <!--阿里图标css -->

		<link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
		
        <link href="include/css/index.css"  rel="stylesheet">  <!--首页样 -->
        <link href="include/css/byPage.css"  rel="stylesheet">

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

    <div id="ArticleContent" class="clearFix">
        <!-- 左边文章 -->
        <div class="article">
            <!-- 轮播展示 -->
            <div class="banner">
                <div class="texts">
                    <p>The best life is use of willing attitude, a happy-go-lucky life. </p>
                    <p>最好的生活是用心甘情愿的态度，过随遇而安的生活。</p>
                </div>
            </div>
            <!-- 笔记内容 -->
            <div class="bloglist">
                <h2><p><span>我的笔记</span></p></h2>

            	<!-- 右边 大概 内容 展示 -->
				<c:forEach items="${page.rows}" var="article">
                <div class="blogs rela clrarFix">
                    <h3>
                        <a href="${pageContext.request.contextPath }/articleDetail?articleId=${article.articleId}">
                           <i class="iconfont icon-biaoti"></i>
                           ${article.title}
                        </a>
                    </h3>
                    <div class="leftImg fl">
                        <img src="/img/${article.img}" width=180 height=120 alt=""/>
                    </div>

                    <div class="rightContent fr">
                        <div class="content">
                             ${article.content}
                        </div>
                        <a href="${pageContext.request.contextPath }/articleDetail?articleId=${article.articleId}" class="readmore">阅读全文 &gt; &gt;</a>
                    </div>

                    <p class="autor">
                        <i class="iconfont icon-zuozhe"></i>
                        <span>作者：<b>${article.author}</b></span>
                        <i class="iconfont icon-fenlei"></i>
                        <span>分类：【<b>${article.articleType}</b>】</span>
                        <i class="iconfont icon-liulan"></i>
                        <span>浏览（<b>${article.pageView}</b>）</span>
                        <a href="${pageContext.request.contextPath }/articleCritique?articleId=${article.articleId}">
                           <i class="iconfont icon-pinglun"></i>
                           <b>评论（${article.critiques}）</b>
                        </a>
                    </p>
                    <div class="dateview">${article.articleTime}</div>					
				</div>	
				</c:forEach>
              
            </div>

            <!-- 分页 -->
            <div>
               <f:page url="${pageContext.request.contextPath }/index"></f:page>
            </div>
            
        </div>
        

        <!-- 右边 推荐文章 展示 -->
        <div class="aside">
            <!-- 个人头像 -->
            <a href="${pageContext.request.contextPath }/aboutMe">
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
        var articleH = $(".article").height();  //获取右边笔记的 高度
        $(".aside").css({minHeight:articleH});  //设置右边的最小高度
    </script>
</body>
</html>
