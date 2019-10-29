<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head lang="en">
    <meta charset="UTF-8">
    <title>OA办公系统</title>    
	<meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/login">
	<script type='text/javascript'>
    var i = 5;
    function getTime() {
        document.getElementById('num').innerHTML = "<font color='red'>" + i
                + "</font>";
        i -= 1;
        var x = setTimeout('getTime()', 1000);
        if (i <= 0) {
            clearTimeout(x);
        }
    }
    window.onload = getTime;
	</script>
	
	<style type="text/css">
		.401{
			position: absolute;
			
		}
		.msg{
			text-align: center;
			
			padding-top: 160px;
			font-family: “Arial”,”Microsoft YaHei”,”黑体”,”宋体”,sans-serif;
		}
		.msg a{
			text-decoration: none;
			color: #3399FF;
		}
		.msg a:hover{
			text-decoration: none;
			color: blue;
		}
	</style>
  </head>
  
  <body>
  	<div class="msg">
    <img src="${pageContext.request.contextPath}/img/user401.png" class="401"></img>
    <h2>
     	您还未登陆!!页面将于<div id='num' style='display=inline;'>5</div>
     	秒后跳转至<a href="${pageContext.request.contextPath}/login">登陆页面</a>
    </h2>
    </div>
  </body>
</html>
