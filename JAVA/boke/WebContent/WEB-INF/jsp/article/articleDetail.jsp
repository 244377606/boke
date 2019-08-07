<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人博客-详细内容具体的一篇文章</title>
		<meta name="keywords" content="个人博客模板,博客模板,响应式">
		<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。">

        <link href="include/css/reset.css"   rel="stylesheet">  <!--重置样式 -->
        <link href="include/css/public.css"   rel="stylesheet">  <!--公共样式 -->
        <link href="include/iconfont/iconfont.css" rel="stylesheet" >   <!--阿里图标css -->

        <link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
        <link href="include/css/article.css"  rel="stylesheet">  <!--首页样 -->

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

	<div class="clearFix">
	<!-- 左边内容展示 -->
    <div id="ArticleContent">
        <h2 class="about_h">您现在的位置是：
            <a href="${pageContext.request.contextPath }/index">首页</a>&emsp;&gt;&emsp;
            <span style="color:red;">详细内容</span>
        </h2>
        <div class="index_about">
            <h2 class="c_titile">${articleDetail.getTitle()}</h2>
            <p class="box_c">
               <span class="d_time">发布时间：${articleDetail.getArticleTime()}</span>
               <span>作者：${articleDetail.getAuthor()} </span>
               <span>浏览(${articleDetail.getPageView()}) </span>  
               <a href="${pageContext.request.contextPath }/articleCritique?articleId=${articleDetail.getArticleId()}">
               	 <span style="color:red;">评论(${articleDetail.getCritiques()})</span>
               </a>
            </p>
            <div class="infos">
            	${articleDetail.getContent()}
            </div>
            <div class="keybq">
            <p><span>关键字词</span>：${articleDetail.getArticleType()}</p>
            </div>
            
            <div class="nextinfo">
                <c:if test="${ articleBefore!=null}">
                    <p>上一篇：
                      <a href="${pageContext.request.contextPath }/articleDetail?articleId=${articleBefore.getArticleId()}">
                        	${articleBefore.title}
                      </a>
                    </p>
                </c:if>
                <c:if test="${ articleAfter!=null}">
                    <p>下一篇：
                       <a href="${pageContext.request.contextPath }/articleDetail?articleId=${articleAfter.getArticleId()}">
                            ${articleAfter.title}
                       </a>
                    </p>
                </c:if>
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
        var articleContent = $("#ArticleContent").height();  //获取左边笔记的 高度
        $("#rightLink").css({minHeight:articleContent});  //设置右边的最小高度
    </script>
</body>
</html>

</body>
</html>