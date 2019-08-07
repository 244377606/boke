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
        <link href="include/iconfont/iconfont.css" rel="stylesheet">   <!--阿里图标css -->
		<link href="include/css/header.css"  rel="stylesheet">  <!--头部公用样式 -->
		<link href="include/css/zhuce.css"  rel="stylesheet">
		<link href="include/css/comment.css" rel="stylesheet">
		<link href="include/css/byPage.css" rel="stylesheet">
		

        <script src="include/js/jquery-1.8.0.min.js"></script> <!--jq -->
</head>

<body>
	<div id="ibody">
	    <!-- 头部导航 -->
	    <div id="header" class="rela">
	        <div class="title">
	            <h1>无尽轮回.途中的笑脸</h1>
	            <h2>
	               &emsp;do( a++,b++ ) while( a & b){ a=b; b=a; System.out.print("永恒!")}
	            </h2>
	        </div>
	        <div class="logo abso">
	             <a href="#"></a>
	        </div>

			<div class="topnav">
			    <a href="${pageContext.request.contextPath }/index">首页</a>
			    <a href="${pageContext.request.contextPath }/aboutMe">关于我</a>
			    <a href="${pageContext.request.contextPath }/album">我的相册</a>
			    <a href="${pageContext.request.contextPath }/comment" class="onred">留言板</a>
			    <a href="${pageContext.request.contextPath }/admin/adminLogin" target="_blank">后台管理(待隐藏)</a>
			</div>
	    </div>

		<!-- 左边评论区 -->
		<div class="clearFix">
		<div id="comment">
	       <h2 class="about_h">您现在的位置是：
	            <span style="color:red;">留言板<span>
	        </h2>
	        <div class="template1">
	            <div class="newComment">
	               <p>最 新 留 言</p>
	            </div>
	        </div>
	        <!-- 展示 留言 信息 账户信息 -->
			<div class="template">
				<c:forEach items="${page.rows}" var="comment">
				<ul>
					<li>
				   		<img src="/img/${comment.userImg}"/>
				   		<div class="hiddenInfo">
				   		    <img alt="图片加载失败" src="/img/${comment.userImg}" width=100 height=100>
				   		</div>
				   	</li>
				   	<li>
					   	<span>${comment.userAccount}</span>
					   	<time>${comment.commentTime}</time>
					   	<c:if test="${USER.u_id == comment.userId}">
					   		<b onclick="deleteById(${comment.commentId})">删 除</b>
					   	</c:if>
				   	</li>
				   	<li>
				      	${comment.commentContent}
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
									url:"${pageContext.request.contextPath }/deleteCommentByid",
									data:{commentId:id},
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
				
				<!-- 分页 标签-->
				<div>
					<f:page url="${pageContext.request.contextPath }/comment"></f:page>
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
				<p style="margin-bottom:10px;">=====================================</p>

				<form name="f1" action="${pageContext.request.contextPath }/commentContent"  method="post">
					<textarea id="hasContent" name="critique_content" ></textarea>
					<input type="button" class="button"
						   value="留言" onclick="ifLogin(${USER.u_id})"/>

					<!-- 数据传递 ${USER.u_id} -->
					<input type="hidden" name="user_account" value="${USER.u_account}" />
					<input type="hidden" name="user_img" value="${USER.u_img}" />
					<input type="hidden" name="user_id" value="${USER.u_id}" />
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
											alert("图片上传出现错误,请留言管理..")
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

		<!-- 右边区域 -->
		<div id="rightComment">
			<div class="rnav">
				<li class="rnav1 "><a
					href="###">个人博客</a></li>
				<li class="rnav2 "><a href="http://user.qzone.qq.com/3535305171">QQ空间</a></li>
				<li class="rnav3 "><a
					href="###">个人作品</a></li>
				<li class="rnav4 "><a
					href="###">随便逛逛</a></li>
			</div>
	
	        <div class="zx_news">
	             <div class="new1">
	                <p>前端技术</p>
	                <ul>
	                    <li><a href="http://www.runoob.com/vue2/vue-tutorial.html" target="_blank"> VUE</a></li>
	                    <li><a href="https://www.angular.cn/" target="_blank">AngularJs</a></li>
	                    <li><a href="https://react.docschina.org/" target="_blank">React</a></li>
	                    <li><a href="https://www.layui.com/" target="_blank">偏后端的前端框架 layui</a></li>
	                    <li><a href="http://www.bootcss.com/" target="_blank">UI框架 bootstrap</a></li>
	                </ul>
	             </div>
	
	             <div class="new2">
	                <p>推荐网站</p>
	                <ul>
	                    <li><a href="https://www.baidu.com/" target="_blank">百度</a></li>
	                    <li><a href="https://www.aliyun.com/?utm_content=se_1000301881" target="_blank">阿里云</a></li>
	                    <li><a href="https://www.csdn.net/" target="_blank">CSDN---专业IT社区</a></li>
	                    <li><a href="https://www.oschina.net/project" target="_blank">gethub---开源中国</a></li>
	                </ul>
	             </div>
	        </div>
	
			<div class="copyright" >
				<ul>
					<p>
						Design by <span style="color:skyblue">chao</span>
					</p>
					<p></p>
					<p></p>
				</ul>
			</div>
		</div>
		</div>
</div>
	<script type="text/javascript">
		var comment = $("#comment").height();  //获取右边笔记的 高度
		$("#rightComment").css({minHeight:comment});  //设置右边的最小高度
	</script>
</body>
</html>
