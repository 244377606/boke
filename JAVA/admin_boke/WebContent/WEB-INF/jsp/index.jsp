<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>博客后台管理</title>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
  <script src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>
  
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" style="color:#fff;font:bold italic 20px/60px '';">
    	博 客 后 台 管 理
    </div>
    
    <!-- 头部区域  水平导航 中部区域
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
	-->

	<!-- 水平导航 右边区域 -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="/img/chao.png" class="layui-nav-img">${ADMIN_ACCOUNT.adminName}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;">功能待加</a></dd>
          <dd><a href="javascript:;">功能待加</a></dd>
          <dd><a href="${pageContext.request.contextPath}/adminExit">安全退出</a></dd>
        </dl>
      </li>
    </ul>
    
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">帐号管理</a>
          <dl class="layui-nav-child">
            <dd class="layui-this"><a href="javascript:;" onclick="adminInfo()">管理员信息</a></dd>
            <dd><a href="javascript:;" onclick="userInfo()">用户信息</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">笔记管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="article()">笔记列表</a></dd>
            <dd><a href="javascript:;" onclick="critique()">笔记评论</a></dd>
            <dd><a href="javascript:;" onclick="myBug()">bug信息</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:;">留言管理</a>
        	<dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="comment()">所有留言</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:;">相册管理</a>
        	<dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="album()">所有相册</a></dd>
            <dd><a href="javascript:;" onclick="photo()">所有照片</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域  加载后自动请求 展示路径 用户信息 页 -->
    <div style="width:100%; height:100%;">
		<iframe id="iframe" src="${pageContext.request.contextPath}/adminAccount" 
		        width="100%" height="100%" scrolling="auto" 
		        frameborder="no" border="0">
		</iframe>
	</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
	
	<script>
		//模块加载
		layui.use('element', function(){
		  var element = layui.element;
		});
		
		//普通账号页面
		function userInfo(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/userAccount");
		}
		
		//进入管理员账号页面
		function adminInfo(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/adminAccount");
		}
		
		//进入留言管理
		function comment(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/comment");
		}
		
		//进入笔记管理页面
		function article(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/article");
		}
		
		//进入文章评论管理页面
		function critique(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/critique");
		}
		
		//进入相册管理
		function album(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/album");
		}
		
		//进入myBug管理
		function myBug(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/myBug");
		}
		
		//进入所有照片页面
		function photo(){
			$("#iframe").attr("src","${pageContext.request.contextPath}/photoShow");
		}
	</script>
</body>
</html>