<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>个人博客——留言板</title>
		<meta charset="utf-8">
        <link href="include/css/reset.css"   rel="stylesheet">  <!--重置样式 -->
        <link href="include/css/public.css"   rel="stylesheet">  <!--公共样式 -->
        <link href="include/iconfont/iconfont.css" rel="stylesheet">   <!--阿里图标css -->
		<link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
		<link href="include/css/zhuce.css"  rel="stylesheet">
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

		<!-- 左边文章信息 -->
		<div class="clearFix">
		
		<div id="articleCritique">
	       <h2 class="about_h">您现在的位置是：
	       	 	<a href="${pageContext.request.contextPath }/index">首页</a>&emsp;&gt;&emsp;
	            <a href="${pageContext.request.contextPath }/articleDetail?articleId=${articleDetail.getArticleId()}">详细内容</a>&emsp;&gt;&emsp;
	            <span style="color:red;">评论<span>
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
	               <p>最 新 评 论</p>
	            </div>
	        </div>
	        <!-- 展示 留言 信息 账户信息 -->
			<div class="template">
				<c:forEach items="${articleCritique }" var="articleCritique">
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
				
				<!-- 更多评论 -->
				<div class="more">
					<a href="${pageContext.request.contextPath }/articleCritiqueAll?articleId=${articleDetail.getArticleId()}">
					   全部评论 &gt;&gt; 
					</a>
				</div>

			</div>

			<!-- 评论内容 -->
			<div class="suiBian">
				<div class="zhuXiao">  留下足迹 : 
					<c:if test="${!empty USER.u_id}">
						<img src="/img/${USER.u_img}">
						<span>${USER.u_account}</span>
						<b onclick="zhuXiao()">退 出</b>
					</c:if>
				</div>
				<p style="margin-bottom:10px;">=================================</p>

				<form name="f1" action="${pageContext.request.contextPath }/insertArticleCritique"  method="post">
					<textarea id="hasContent" name="critique_content" ></textarea>
					<input type="button" class="button"
						   value="留言" onclick="ifLogin(${USER.u_id})"/>

					<!-- 数据传递 ${USER.u_id} -->
					<input type="hidden" name="user_account" value="${USER.u_account}" />
					<input type="hidden" name="user_img" value="${USER.u_img}" />
					<input type="hidden" name="user_id" value="${USER.u_id}" />
					<input type="hidden" name="articleId" value="${articleDetail.getArticleId()}" />
				</form>
			</div>

			<!--引入 登录页面  -->
			<div id="mainLogin" class="fixed">
			    <div class="topA">
			        <span class="denglu1 dengluOn">登录</span>
			        <i>|</i>
			        <span class="zhuce1">注册</span>
			    </div>
			    <!-- 左边登录 -->
			    <div class="leftLogin rela">
			        <form name="f2" action="${pageContext.request.contextPath }/articleCritique" method="post">
			            <div class="accountInput rela">
			                <span>账 号 : </span>
			                <input id="account" type="text" name="u_account"/>
			                <div class="hidden1 abso"></div>
			            </div>
			            <div class="padInput rela">
			                <span>密 码 : </span>
			                <input id="password" type="password" name="u_password"/>
			                <div class="hidden2 abso"></div>
			            </div>
			            <!-- 密码错误出现 -->
			            <div class="cunZai"></div>

						<!-- 登录取消按钮 -->
			            <div class="btnLogin clearFix">
			            	<input type="button" value="确定" class="submit" onclick="login()">
			            	<input type="button" value="取消" class="submit quxiao">
			            </div>

			          	<!-- 数据传递 -->
			            <input type="hidden" name="articleId" value="${articleDetail.getArticleId()}" />
			        </form>
			    </div>

			    <!-- 右边注册 -->
			    <div class="right_zhuce">
			        <form name="f3" action="${pageContext.request.contextPath }/zhuCe" method="post">
			              <div class="aAccount rela">
			                  <span>用户名:</span>
			                  <input type="text" placeholder="请输入用户名"
			                         id="Account" name="user_account" value=""/>
			                  <div class="absAccount abso"></div>
			              </div>
			              <div class="apassWord rela">
			                  <span>密码:</span>
			                  <input type="password" placeholder="请输入密码"
			                         id="Password" name="user_password"/>
			                  <div class="absPassWord abso"></div>
			              </div>
			              <div class="realPassWord rela">
			                  <span>确认密码:</span>
			                  <input type="password" value="" placeholder="请再次输入密码"
			                         id="realPassWord">
			                  <div class="realPass abso"></div>
			              </div>
			              <div class="sex">
			                  <span>性别:</span>
			                  <input type="radio" name="user_sex" checked value="男"><i>男</i>
			                  <input type="radio" name="user_sex"  value="女"><i>女</i>
			                  <input type="radio" name="user_sex"  value="东方不败"><i>东方不败</i>
			              </div>
						<div>
							<span>上传脑袋:</span>
							<input type="file" id="file" name="file" onchange="upImg()" class="imgFile"/>
							<img id="imgLoad" class="imgUp" src="" width="100" height="100" alt="预 览" title=""/>

							<input type="hidden" name="user_img" id="imgTouXing"/>
						</div>
						<div class="error"></div>
		               	<div class="btnZhuCe fl_child">
		               		<input type="button" class="sub1" value="注册" onclick="zhuce()">
		             		<input type="button" value="取 消" class="sub2 quxiao">
		               	</div>

			             <!-- 数据传递 -->
						 <input type="hidden" name="articleId" value="${articleDetail.getArticleId()}" />

			        </form>
			    </div>

			</div>

			<script type="text/javascript">
		    	//判断是 账号   否为空   为空则弹出登录框
		    	function ifLogin(id){
		    	  	if(!id){
		    	  		$("#mainLogin").css({display:"block"});
		    		}else{
		    			if(!$("#hasContent").val()){
		    				alert("内容不能为空");
		    			}else{document.forms["f1"].submit();}
		    		}
		    	}

		    	//取消时隐藏登录框
		    	$(" #mainLogin .quxiao").click(function(){
		    	    $("#mainLogin").css({display:"none"});
		        })

		        //显示/隐藏  注册/登录
		    	$(".zhuce1").click(function(){
		    		$(".right_zhuce #Account").val("");
		    	    $(".right_zhuce").css({display:"block"});
		    	    $(".topA .denglu1").removeClass("dengluOn");
		    	    $(".topA .zhuce1").addClass("dengluOn");
		    	    $(".leftLogin").css({display:"none"});
		    	})
		    	$(".denglu1").click(function(){
		    	    $(".right_zhuce").css({display:"none"});
		    	    $(".topA .denglu1").addClass("dengluOn");
		    	    $(".topA .zhuce1").removeClass("dengluOn");
		    	    $(".leftLogin").css({display:"block"});
		    	})

		    	//===========注册页面==================
		    	
				//帐号获得焦点
				$(".right_zhuce #Account").focus(function(){
					$(".aAccount .absAccount").css({display:"block"});
					$(".aAccount .absAccount").html("用户名由4-8位组成 ");
				})
				
				//失去焦点
				$(".right_zhuce #Account").blur(function(){
		        	if( !$(".right_zhuce #Account").val() ){
		        		$(".aAccount .absAccount").css({"display":"block"});
		        		$(".aAccount .absAccount").html("<b style='color:red'>用户名不能为空 !</b>" )
		        	}else{
		        		$.ajax({
		        			type:"get",
		        			url:"${pageContext.request.contextPath }/relaAccount",
		        			data:{"u_account":$(".right_zhuce #Account").val()},
		        			success:function(data){
		        				if(data){
		        					$(".aAccount .absAccount").html("<b style='color:red'>用户名已存在</b>" );
		        				}else{
		        					$(".aAccount .absAccount").css({"display":"none"});
		        				}
		        			}
		        		})
		        	}
		        })
				
				//密码获得焦点
				$(".right_zhuce #Password").focus(function(){
					$(".apassWord .absPassWord").css({display:"block"});
					$(".apassWord .absPassWord").html("密码长度..... ");
				})
				//密码 失去焦点
				$(".right_zhuce #Password").blur(function(){
					if( !$(".right_zhuce #Password").val() ){
		        		$(".apassWord .absPassWord").css({"display":"block"});
		        		$(".apassWord .absPassWord").html("<b style='color:red'>密码不能为空!</b>" );
		        	}else{
		        		$(".apassWord .absPassWord").css({"display":"none"});
		        	}
				})
				
				//确定密码 获得焦点 给提示
				$(".right_zhuce #realPassWord").focus(function(){
					$(".realPassWord .realPass").css({display:"block"});
					$(".realPassWord .realPass").html("两次密码必须一致..... ");
				})
				//确认密码 失去焦点 判断两次密码是否一致
				$(".right_zhuce #realPassWord").blur(function(){
					var a = $(".right_zhuce #Password").val();    //密码
					var b = $(".right_zhuce #realPassWord").val();
					if(a!=b){
		        		$(".realPassWord .realPass").css({"display":"block"});
		        		$(".realPassWord .realPass").html("<b style='color:red'>两次密码不一致</b>" );
		        	}else{
		        		$(".realPassWord .realPass").css({"display":"none"});
		        	}
				})
				

				//头像上传
				function upImg(){
					var name = $("#file").val();
				    if(name){
				    	 //正则判断是否为图片
				    	 if(/\.(?:png|PNG|jpg|JPG|gif|GIF)$/.test(name)){
				    		 var formData=new FormData(); //创建表单数据对象
							     formData.append('file', $('#file')[0].files[0]);
				    		 $.ajax({
									type:"post",
									url:"${pageContext.request.contextPath}/upImg",
									data:formData,
									cache: false, //上传文件不需要缓存
									processData: false,// 告诉jQuery不要去处理发送的数据
									contentType: false,// 告诉jQuery不要去设置Content-Type请求头
									encType:"multipart/form-data",
									success:function(data){
										if(data){
											$("#imgLoad").attr("src","/img/"+data);
											$("#imgTouXing").val(data);
										 }else{
											 alert("图片上传出现错误..不用填了..");
										 }
									}
								});
					     }else{
					    	 alert("格式错误");
					     }
				    }
				}


				//判断是否可以成功登录
				function zhuce(){
					
					var a = $(".right_zhuce #Password").val();    //密码
					var b = $(".right_zhuce #realPassWord").val();

	        		$.ajax({
	        			type:"get",
	        			url:"${pageContext.request.contextPath }/relaAccount",
	        			data:{"u_account":$(".right_zhuce #Account").val()},
	        			success:function(data){
	        				if(data){
	        					$(".aAccount .absAccount").css({"display":"block"});
	        					$(".aAccount .absAccount").html("<b style='color:red'>用户名已存在</b>" );
	        				}else{
	        					$(".aAccount .absAccount").css({"display":"none"});
	        					//判断注册条件是否成立
	        					if(b===a){
	        		    			document.forms["f3"].submit();
	        		    		}else{
	        		    			$(".right_zhuce .error").html("信息<i style='color:red'> 有 误 </i>,请修改后在提交")
	        		    		}
	        				}
	        			}
	        		})
		    	}

		    	//=====================登录页面==================
		    	//登录判断
		    	function login(){
		    		if($('#account').val() && $('#password').val()){
		    			$.ajax({
		    				type:"post",
		    				url:"${pageContext.request.contextPath }/userLogin",
		    				data:{
		    					  u_account:$('#account').val(),
		    					  u_password:$('#password').val()
		    				},
		    				success:function(data) {
		    					  if(data){
		    						  window.location.reload();
		    				      }
		    					  if(!data){
		    						  $("#mainLogin .hidden1").css({display:"none"});
		    						  $("#mainLogin .hidden2").css({display:"none"});
		    						  $("#mainLogin .cunZai").html("帐号或密码错误!!");
		    					  }
		    			   }
		    			})
		    		}else{
		    			//账号 密码都为空 提示输入
		    			if(!$('#account').val() && !$('#password').val()){
		    				 $("#mainLogin .hidden1").css({display:"block"});
		    				 $("#mainLogin .hidden2").css({display:"block"});
		    				 $("#mainLogin .hidden1").html("请输入帐号");
		    				 $("#mainLogin .hidden2").html("请输入密码");
		    				 $("#mainLogin .cunZai").html("");
		    			}
		    			//账号为空 密码 不空  提示输入账号
		    			if(!$('#account').val() && $('#password').val()){
		    				$("#mainLogin .hidden1").css({display:"block"});
		    				 $("#mainLogin .hidden2").css({display:"none"});
		    				 $("#mainLogin .hidden1").html("请输入帐号");
		    				 $("#mainLogin .hidden2").html("")
		    				 $("#mainLogin .cunZai").html("");
		    			}
		    			if($('#account').val() && !$('#password').val()){
		    				$("#mainLogin .hidden2").css({display:"block"});
		    				 $("#mainLogin .hidden1").css({display:"none"});
		    				 $("#mainLogin .hidden1").html("");
		    				 $("#mainLogin .hidden2").html("请输入密码")
		    				 $("#mainLogin .cunZai").html("");
		    			}
		    		}
		    	}
				
		    	//注销
		    	function zhuXiao(){
		    		$.ajax({
		    			type:"post",
		    			url:"${pageContext.request.contextPath}/zhuXiao",
		    			success:function(){
		    				window.location.reload();
		    			}
		    		})
		    	}
			</script>
			
			<!-- 登录页面 结束 -->
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
