<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="UTF-8">
    <title>OA办公系统</title>
    <link type="text/css" rel="stylesheet" href="style/login.css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.slim.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function() {
			$("#reusername").focus(function() {
				/* alert(); */
				$("#reusername").css("background-color", "#9fbaa8");
			});
			$("#reusername").blur(function() {
				/* alert(); */
				var reusername = $("#reusername").val();
				$("#reusername").css("background-color", "#ffffff28");
				if (reusername.length <= 0) {
					$("#reusernameRight").hide();
					$("#reusernameError").show();
				} else {
					$("#reusernameRight").show();
					$("#reusernameError").hide();
				}
			});
			//密码验证
			$("#newpassword").focus(function() {
				$("#newpassword").css("background-color", "#9fbaa8");
			});
			$("#newpassword").blur(function(){
				var newpassword = $("#newpassword").val();
				$("#newpassword").css("background-color", "#ffffff28");
				if (newpassword.length > 5 && newpassword.length < 17) {
					$("#passwordRight").show();
					$("#passwordError").hide();
					$("#passwordStart").hide();
				} else {
					$("#passwordRight").hide();
					$("#passwordError").show();
					$("#passwordStart").hide();
				}
			});
			//确认密码
			$("#rnewpassword").focus(function() {
				$("#rnewpassword").css("background-color", "#9fbaa8");
			});
			$("#rnewpassword").blur(function(){
				var newpassword = $("#newpassword").val();
				var rnewpassword = $("#rnewpassword").val();
				$("#rnewpassword").css("background-color", "#ffffff28");
				if (rnewpassword != newpassword) {
					$("#rnewpasswordRight").hide();
					$("#rnewpasswordError").show();
					$("#rnewpasswordStart").hide();
				} else {
					$("#rnewpasswordRight").show();
					$("#rnewpasswordError").hide();
					$("#rnewpasswordStart").hide();
				}
			});
			$("#email").focus(function() {
				$("#email").css("background-color", "#9fbaa8");
			});
			$("#email").blur(function() {
				var email = $("#email").val();
				var regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				$("#email").css("background-color", "#ffffff28");
				if (email.length <= 0 || !regemail.test(email)) {
					$("#emailRight").hide();
					$("#emailError").show();
					$("#emailStart").hide();
				} else {
					$("#emailRight").show();
					$("#emailError").hide();
					$("#emailStart").hide();
				}
			});
		});
	</script>
    <script type="text/javascript">
		function hasClass(ele, cls) {
    		return ele.className.match(new RegExp("(\\s|^)" + cls + "(\\s|$)"));
		}
		//为指定的dom元素添加样式
		function addClass(ele, cls) {
    		if (!this.hasClass(ele, cls)) ele.className += " " + cls;
		}
		//删除指定dom元素的样式
		function removeClass(ele, cls) {
    		if (hasClass(ele, cls)) {
       	 	var reg = new RegExp("(\\s|^)" + cls + "(\\s|$)");
        	ele.className = ele.className.replace(reg, " ");
    		}
		}
		//如果存在(不存在)，就删除(添加)一个样式
		function toggleClass(ele,cls){ 
   		 	if(hasClass(ele,cls)){ 
        		removeClass(ele, cls); 
    		}else{ 
        		addClass(ele, cls); 
    		} 
		}
		//调用
		function toggleClassTest(){ 
			/* alert(); */
    		var ele = document.getElementById('regist-box');
    		/* alert(ele); */
    		/* alert('showed'); */
    	    toggleClass(ele,"showed"); 
    	    var ele = document.getElementById('login');
    	    toggleClass(ele,"hide"); 
		}
	</script>
  </head>  
  <body>
  	<div id="regist-box">
  		<div id="hide-btn" onclick="toggleClassTest();"><i class="fa fa-times" aria-hidden="true"></i></div>
  		<form class="regist-from" action="${pageContext.request.contextPath }/doregister" method="post">  			
  			<h1>Register</h1>
			<br><i class="fa fa-user-o" aria-hidden="true"></i>用户名:
  			<!-- <span><i class="fa fa-user-o" aria-hidden="true"></i>用户名:</span> -->
  			<!-- <span><i class="fa fa-unlock-alt" aria-hidden="true"></i>密码:</span> -->
  			<input class="txtb" type="text" name="username" id="reusername"  value="" placeholder="请输入用户名">
  			<font color="red" id="reusernameError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>用户名不能为空</font>
            <font color="green" id="reusernameRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
  			<br><i class="fa fa-unlock-alt" aria-hidden="true"></i>密码:
  			<input class="txtb" type="password" name="password" id="newpassword"  value="" placeholder="请输入密码">
  			<font color="red" id="passwordError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>密码需6-16位</font>
           	<font color="green" id="passwordRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
  			<br><i class="fa fa-unlock-alt" aria-hidden="true"></i>再次输入:
  			<input class="txtb" type="password" name="rnewpassword" id="rnewpassword"  value="" placeholder="请再次输入密码">
  			<font color="red" id="rnewpasswordError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>两次密码不一致</font>
   	   		<font color="green" id="rnewpasswordRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
  			<br><i class="fa fa-envelope" aria-hidden="true"></i>邮箱:
  			<input class="txtb" type="text" name="email" id="email" value="" placeholder="请输入邮箱">  			
  			<font color="red" id="emailError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
            <font color="green" id="emailRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
  			<input type="hidden" name="role" value="1">
  			<div></div>
  			<input class="regist-btn" type="submit" name="" value="注册">
  			<input class="regist-btn" type="button" onclick="toggleClassTest();" value="转至登陆">
  		</form> 		 	
  	</div>
  	
  	<div class="login-box" id="login">
  		<h2>Login</h2>
  		<form action="${pageContext.request.contextPath }/dologin" name="actionForm" id="actionForm"  method="post">  			
  			<div class="inputbox">
  				<input type="text" id="username" name="username" required>
  				<label>
  				<i class="fa fa-user" aria-hidden="true"></i>  				
  				账号:
  				</label>
  			</div>
  			<div class="inputbox">
  				<input type="password"  id="password" name="password" required>
  				<label>
  				<i class="fa fa-lock" aria-hidden="true"></i>
  				密码:
  				</label>
  			</div>
  			<div class="in">${success }</div>
  			<div class="info">${error }</div>
  			<div>					
                    <input class="subBtn" type="submit" value="登录" style="margin-left: 40px;"/>
          			<input class="subBtn" id="show-btn" type = "button" value = "注册" onclick = "toggleClassTest();" style="margin-left: 90px;"/> 
          	</div>
  		</form>
  	</div>
     
  </body>
</html>
