<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人博客——关于我</title>
		<meta name="keywords" content="个人博客模板,博客模板,响应式">
		<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。">

		<link href="include/css/reset.css" rel="stylesheet">
		<link href="include/css/public.css"   rel="stylesheet">

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
				您现在的位置是： <span style="color:red;">关于我</span>
			</h3>
			<div class="about">
				<h2>Just about me</h2>
				<ul style="font:bold 18px '宋体' ;">
					<li>生活中，</li>
					<li>多少人每天睁开双眼,</li>
					<li>便要咬牙撑过今日份的痛苦？</li>
					<li>多少人为了所爱之人 </li>
					<li> 甘愿负重前行？</li>
					<li> ……</li><p> </p>
					<p>没有谁能轻轻松松度过这一生,</p>
					觉得撑不下去的时候<p> </p>
					把更多的注意力用在提高自己，<p> </p>
					这样你就会慢慢地享受着你努力所带来的喜悦了！<p> </p>
					别再有一点不如意就抱怨不断，你肆意挥霍，毫不珍惜的现在，<p> </p>
					可能正是很多人向往的明天。<p> </p>
					小时候，总想着长大了，生活就容易了。<p> </p>
					真正长大后，才发现成年人的世界根本没有“容易”二字。<p> </p>
					长大意味着承担更多的责任，意味着很多时候，<p> </p>
					你必须单枪匹马面对生活的兵荒马乱。<p> </p>
					但你还这么年轻，尚有大把的时光，别焦虑别慌张。<p> </p>
					没有谁的人生是轻松度过的，还没到万劫不复的境地，<p> </p>
					就埋头苦干，总有柳暗花明的那天<p> </p>
					这个世界最可怕的不是有人比你聪明，<p> </p>
					而是那些比你聪明的人，还比你努力。<p> </p>
					做有用的事，说勇敢的话，想美好的事，睡安稳的觉，你要把时间用在进步上<p> </p>
					别再动不动就把“年纪大了”挂在口边，<p> </p>
					你过得油腻颓废，身材走样和年纪没有丝毫关系，不过是“懒”而已。<p> </p>
					人生哪有什么胜利可言，撑下去才有后来的一切,<p> </p>
					生活真的很多麻烦，不断战胜麻烦便是每一天的意义。<p> </p>
					你看再成功的人背后也有你看不见的艰辛，<p> </p>
					这样想会不会更有力量面对人生的风雨？<p> </p>
					必须承认，有些时候，我们对一些事无能为力。<p> </p>
					所能做得无非是使出浑身力气，努力靠近理想的样子。<p> </p>
					但那位少年一定很感激，你一直未曾放弃过他。 <p> </p>
					事到万难须放胆，人处逆境须从容。<p> </p>
					走自己的路，听别人的劝。人生如戏，为他人演还是为自己。<p> </p>
					大多数人想着改造这个世界，却罕见有人想改造自己。<p> </p>
					心胸决定了境界，心态决定了命运。你来自何处其实并不重要，<p> </p>
					重要的是你要去往何方，人生最重要的不是所站的位置，而是所去的方向。<p> </p>
					人只要不失去方向，就永远不会失去自己<p> </p>
					就算全世界都否定你，你也要相信你自己。<p> </p>
					不去想别人的看法，旁人的话不过是阳光里的尘埃，下一秒就被风吹走。<p> </p>
					这是你的生活，没有人能插足，除了你自己，谁都不重要.<p> </p>

					任何人都不可能随随便便地成功，它来自完全的自我约束和坚韧不拔的毅力。<p> </p>
					给自己一点掌声，让我战胜内心的怯懦；<p> </p>
					给自己一点掌声，无畏的心更加的坚定；<p> </p>
					给自己一点掌声，温暖我独自前行的路。<p> </p>
					失败不可怕，可怕的是从来没有努力过，还怡然自得地安慰自己，<p> </p>
					连一点点的懊悔都被麻木所掩盖下去。不能怕，没什么比自己背叛自己更可怕。<p> </p>
					比我差的人还没放弃，比我好的人仍在努力，<p> </p>
					我就更没资格说，我无能为力！<p> </p>

				</ul>
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

                <ul>
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
