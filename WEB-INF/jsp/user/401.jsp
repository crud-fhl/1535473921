<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function qrole(){	
		
		var msg="提示 ：确认向超级管理员admin发送申请权限消息？";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/qrole";		
		}else{
			return false;
		}
		}
	</script>
	<div class="img">
		<img src="${pageContext.request.contextPath }/img/401.png" class="401"></img>
		<div class="message">
		<h1>Sorry,</h1>
		<h6>您没有权限访问该页面</h6>
		<h5><a href="${pageContext.request.contextPath }/sys/frame">返回首页</a></h5>
		<h5><a href="#" onclick="qrole()">申请权限</a></h5>
		</div>	
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
