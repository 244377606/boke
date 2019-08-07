<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
       <title>个人博客——相册</title>
       <meta charset="utf-8">
       <meta name="keywords" content="个人博客模板,博客模板,响应式">
       <meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。">

      <link href="include/css/reset.css"   rel="stylesheet">  <!--重置样式 -->
      <link href="include/css/public.css"   rel="stylesheet">  <!--公共样式 -->
      <link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
      <link href="include/css/index.css"  rel="stylesheet">  <!--首页样 -->

      <link href="include/css/album.css"  rel="stylesheet">  <!--我的相册样式 -->

      <script src="include/js/jquery-1.8.0.min.js"></script> <!--jq -->
      <script src="include/js/jquery.gallery.js"></script> <!--引人相册 翻页效果 -->

</head>
<body>

<div id="ibody">
    <!-- 头部导航 -->
    <div id="header" class="rela">
        <div class="title">
            <h1>提拉米苏.甜腻的苦涩</h1>
            <h2>我的手挽留不住你离去的脚步,
                爱情是甜蜜的苦涩,无奈的别离
                苦涩的怕不是味道,而是心绪
            </h2>
        </div>
        <div class="logo abso">
             <a href="#"></a>
        </div>
		<div class="topnav">
		    <a href="${pageContext.request.contextPath }/index">首页</a>
		    <a href="${pageContext.request.contextPath }/aboutMe">关于我</a>
		    <a href="${pageContext.request.contextPath }/album" class="onred">我的相册</a>
		    <a href="${pageContext.request.contextPath }/comment">留言板</a>
		    <a href="${pageContext.request.contextPath }/admin/adminLogin" target="_blank">后台管理(待隐藏)</a>
		</div>
    </div>

    <!-- 左边相册 -->
    <div class="clearFix">
    <div id="album">
        <h2 class="about_h">您现在的位置是：
              <a href="${pageContext.request.contextPath }/album">相册</a>&emsp;&gt;&emsp;
              <span style="color:red;">${albumName.getAlbumTitle()}</span>
        </h2>

        <div class="photoShow">
            <div class="ablumNew">
                <p>相 片 集</p>
            </div>

			<!-- 最新照片展示 -->
			     
			<!-- 大于2张则显示位3d模式 -->
            <div class="container">
                <div id="dg-container" class="dg-container">
                  <div class="dg-wrapper">
                  <c:if test="${photoNum > 2 }">
	                  <c:forEach items="${photo}" var="photo">
                  		<a href="###">
                          <img src="/img/${photo.photoImg}" width="480px" height="260">
                      	</a>
	                  </c:forEach>
                  </c:if>
                  
                  <c:if test="${photoNum < 3 }">
                  		<c:forEach items="${photo}" var="photo">
	               		<a href="###">
	                       <img src="/img/${photo.photoImg}" width="480px" height="260">
	                   	</a>
	                    </c:forEach>
	                    
	                  	<a href="###">
	                       <img src="" width="480px" height="260">
	                   	</a>
	                   	<a href="###">
	                       <img src="" width="480px" height="260">
	                   	</a>
				  </c:if>
                  </div>
					
				  <c:if test="${photoNum != 0 }">
                  <div class="firstOne">这是第 <span>1</span> 张照片</div>

                  <nav class="onNext">
                    <span class="dg-prev"> &lt;</span>
                    <span class="dg-next"> &gt;</span>
                  </nav>
                  </c:if>

                </div>
            </div>
            
            
        </div>

        <div class="template1">
            <div class="newComment">
               <p>最 新 留 言</p>
            </div>
        </div>
        <!-- 展示 留言 信息 账户信息 -->
        <div class="template2">

        <c:forEach items="${comment}" var="comment">
        	<ul style="margin-bottom:20px;">
				<li>
				    <img src="/img/${comment.userImg}">
				    <div class="hiddenInfo">
			   		    <img alt="图片加载失败" src="/img/${comment.userImg}" width=100 height=100>
			   		</div>
				</li>
				<li>
				    <span>${comment.userAccount}</span>
				    <time>${comment.commentTime}</time>
				</li>
				<li>
				    ${comment.commentContent}
				</li>
	         </ul>
	         <div class="hr"></div>
        </c:forEach>
            
        </div>
        <!-- 结尾 -->
        <div class="aa">
             快乐的猿猴
        </div>
    </div>

    <!-- 右边信息 -->
    <div id="rightAlbum">
        <ul class="rnav">
            <li class="rnav1 ">
                <a href="###">个人博客</a>
            </li>
            <li class="rnav2 ">
                <a href="http://user.qzone.qq.com/657682618">QQ空间</a>
            </li>
            <li class="rnav3 ">
                <a href="###">个人作品</a>
            </li>
            <li class="rnav4 ">
                <a href="###">原创程序</a>
            </li>
        </ul>

        <div class="zx_news">
             <div class="new1">
                <p>最新信息</p>
                <ul>
                    <li><a href="###">最新1号</a></li>
                    <li><a href="###">最新2号</a></li>
                    <li><a href="###">最新3号</a></li>
                    <li><a href="###">最新4号</a></li>
                </ul>
             </div>

             <div class="new2">
                <p>推荐信息</p>
                <ul>
                    <li><a href="###">1111</a></li>
                    <li><a href="###">1111</a></li>
                    <li><a href="###">1111</a></li>
                    <li><a href="###">1111</a></li>
                </ul>
             </div>
        </div>

        <div class="copyright">
            <p> Design by <span>chao<span></p>
        </div>
    </div>
	</div>
</div>

    <!-- 控制翻页 -->
    <script type="text/javascript">
          var album = $("#album").height();  //获取右边笔记的 高度
          $("#rightAlbum").css({minHeight:album});  //设置右边的最小高度
          $(function() {$('#dg-container').gallery();});  //翻页显示

          var text = $(".container .firstOne span"); //给第几张照片重新赋值
          var index1 = $(".container .dg-wrapper a").index(); //得到共有几张照片
          var num = 1;  //初始化第几张照片
          var lastTime = new Date().getTime();  //最后一次的刷新时间
          var delay = 500;  //延迟

          /*切换数字减一*/
          $(".container .dg-prev").click(function(){
              var newTime1 = new Date().getTime();  //点击之后的时间
              if((newTime1-lastTime) > delay){  //防止点击过快
                  num--;
                  if(num < 1){ num = index1 + 1;}
                  text.text(num);
                  lastTime = new Date().getTime();
              }else{
                  return;
              }
          })
          /*切换数字加一*/
          $(".container .dg-next").click(function(){
                  var newTime = new Date().getTime();
                  if((newTime-lastTime) > delay){
                       num++;
                       if(num > (index1 +1)){ num = 1;}
                       text.text(num);
                       lastTime = new Date().getTime();
                  }else{
                    return;
                  }
          })
    </script>
</body>
</html>
