<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>博客后台管理-登陆</title>
    
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/adminStyle/css/login.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/adminStyle/js/jq.js"></script>
</head>
<body>
<div id="container">
    <div class="admin-login-background">
        <div class="admin-header">请登录</div>
        <form name="userLogin" class="layui-form"  method="post" action="${pageContext.request.contextPath}/index">
            
            <!-- 管理员账户 -->
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input type="text" id="username" name="adminName" value=""
                	   placeholder="请输入用户名" autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            
            <!-- 密码 -->
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="adminPassword" id="password"
                       value="" placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div> 
            
            <!-- 验证码获取 -->
			<div>
			    <input type="text" name="adminCode" id="adminCode"  placeholder="请输入验证码"
			           autocomplete="off"
			           class="layui-input admin-input admin-input-verify">
			           
			    <img style="cursor:pointer;" class="admin-captcha codeimg" id="codeimg" 
			    	src="${pageContext.request.contextPath}/adminCode"
			        onclick="updateVerify()">
			</div> 
			
            <div>
            	<input type="button" class="layui-btn a-button" style="background:rgba(0,0,0,.2)"
                       value="登录" onclick="adminLogin();" />
            </div>

        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>

	//管理员 登陆方法login();
	function adminLogin(){
		
		//获取 文本框中的 帐号/密码/验证码 的值
		var username=$("#username").val();
		var password=$("#password").val();
		var code=$("#adminCode").val();
		
		//判断用户名是否输入
		if(!username){   
			layui.use('layer', function(){
			  	layer.open({
				  title: '提示信息'
				  ,content: '用户名不能为空'
				});     
			});
			return false;
		}
		
		 //判断密码是否输入
		if(!password){   
			layui.use('layer', function(){
			  	layer.open({
				  title: '提示信息'
				  ,content: '密码不能为空'
				});     
			});
			return false;
		}
		 
		//判断验证码是否输入
		if(!code){
			layui.use('layer', function(){
			  	layer.open({
				  title: '提示信息'
				  ,content: '验证码不能为空'
				});     
			});
			return false;
		}
		//都有值 则判断用户是否正确
		$.ajax({
			url:"${pageContext.request.contextPath}/adminIsLogin",
			type:"post",
			data:{
				adminName:username,
				adminPassword:password,
				adminCode:code
			},
			success:function(data){
				if(data=="3"){
					layui.use(['layer', 'form'], function(){
						  layer.open({
							  title: '提示信息'
							  ,content: '验证码错误，请重新输入！'
							});     
						});
					updateVerify(); //刷新验证码
					return false;   //使其不刷新页面
				}
				if(data=="2"){
					layui.use(['layer', 'form'], function(){
						  layer.open({
							  title: '提示信息'
							  ,content: '您输入的账号或者密码错误！'
							});     
						});
					updateVerify();
					return false;
				}
				if(data=="1"){
					document.forms["userLogin"].submit();
				}
			}
		})
	}
	//切换验证码
	function updateVerify() {
        var imgSrc = $("#codeimg");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }  

	//加入时间戳，去缓存机制   
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        if ((url.indexOf("&")) >= 0) {
            url = url + "&timestamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
</script>
</body>
</html>



