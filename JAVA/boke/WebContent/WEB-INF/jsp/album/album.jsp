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
            <span style="color:red;">相册<span>
        </h2>
        <div class="template">
            <div class="ablumMe">
               <p>个 人 相 册</p>
            </div>
            <ul class="fl_child">
              <c:forEach items="${album}" var="album">
              	<li>
                  <a href="${pageContext.request.contextPath }/albumDetail?albumId=${album.albumId}" title="${album.albumDescribe}">
                      <img src="/img/${album.albumImg}" alt="这里啥也没有"/>  
                      <span>${album.albumTitle}</span>
                      <span>( ${album.albumType} )</span>
                      
                  </a>
              	</li>
              </c:forEach>
            </ul>
        </div>
        <div class="photoShow">
            <div class="ablumNew">
                <p>最 新 照 片</p>
            </div>

            <!-- 最新照片展示 -->
            <div class="photo fl_child">
                <ul class="moveLeft fl_child">
                	<c:forEach items="${photo}" var="photo">
                   	<li>
                    	<a href="${pageContext.request.contextPath }/albumDetail?albumId=${photo.albumId}">
                    		<img src="/img/${photo.photoImg}" width="480px" height="260">
                    	</a>
                   	</li>
                	</c:forEach>
                </ul>
            </div>
        </div>

        <div class="aa">
             快乐的星球
        </div>
    </div>

    <!-- 右边信息 -->
    <div id="rightAlbum">
        <ul class="rnav">
            <li class="rnav1 ">
              <a href="###">?????????</a>
            </li>
            <li class="rnav2 ">
              <a href="http://user.qzone.qq.com/657682618">QQ空间</a>
            </li>
            <li class="rnav3 ">
              <a href="###">?????????</a>
            </li>
            <li class="rnav4 ">
              <a href="###">?????????</a>
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

    <script type="text/javascript">
        //图片轮播
        var index = 0;
        var liIndex =  $("#album .moveLeft li").index();
        var oUl = $("#album .moveLeft");
        var oLi = $("#album .moveLeft li");

        var photo = setInterval(function(){
            index++;
            if(index > liIndex){index = 0;}
            oLi.eq(index).show(2000).siblings().slideUp(800);

            //   oUl.stop(true,true).animate(function(){
            //        console.log(1);
            //        $("#album .moveLeft li").eq(index).show(4000).siblings().hide(2000);
            //    },4000);

        },4000);


        var album = $("#album").height();  //获取右边笔记的 高度
        $("#rightAlbum").css({minHeight:album});  //设置右边的最小高度
    </script>
</body>
</html>
