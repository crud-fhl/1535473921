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
    <link rel="stylesheet" href="${path}/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}/bootstrap-4.0.0-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${path}/style/head.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.slim.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
</head>
<body>
		<div class="publicHeader">
			<h2><i class="fa fa-cog fa-spin fa-1x fa-fw"></i>
			<span class="sr-only">Loading...</span>OA办公系统<small>欢迎</small>
			</h2>
			<div class="btn-group">
				<button type="button" class="btn btn-info">
				<i class="fa fa-user-circle" aria-hidden="true"></i>
				${user.username }
				</button>
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="${path }/sys/pwdmdf" role="menuitem"><i class="fa fa-unlock-alt fa-fw" aria-hidden="true"></i>密码修改</a></li>
					<li><a href="${path}/sys/personmdf" role="menuitem"><i class="fa fa-user fa-fw" aria-hidden="true"></i>修改信息</a></li>
					<li><a href="${path }/logout" role="menuitem"><i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>退出系统</a></li>
				</ul>
			</div>
		</div>
		<section class="publicdh">
        	<ul id="menu">
        		<li class="f"><a href="${path }/sys/frame"><i class="fa fa-coffee" aria-hidden="true"></i> 首页</a></li>
        		<li><a class="address" href="${path }/sys/address"><i class="fa fa-address-book" aria-hidden="true"></i> 通讯录</a></li>
        		<li><a href="${path}/sys/schedule"><i class="fa fa-book" aria-hidden="true"></i> 日程</a></li>
        		<li><a href="${path}/sys/worklog"><i class="fa fa-briefcase" aria-hidden="true"></i> 日志</a></li>
        		<li><a href="${path}/sys/notice"><i class="fa fa-bullhorn" aria-hidden="true"></i> 公告</a></li>
        		<li><a href="${path}/sys/meeting"><i class="fa fa-comments-o" aria-hidden="true"></i> 会议</a></li>
        		<li><a href="${path}/sys/sms"><i class="fa fa-commenting" aria-hidden="true"></i> 短消息</a></li>
        	</ul>
        </section>
        <section class="main">
        <div class="middle">
        	<span class="span1"><i class="fa fa-th-list" aria-hidden="true"></i>功能列表 </span>
        	<div class="menu-list">
        		<li class="item" id="e">
        			<a href="#e" class="btnn"><i class="fa fa-user-circle fa-fw" aria-hidden="true"></i>个人功能</a>
        			<div class="smenu">        				
        				<a class="address" href="${path }/sys/address"><i class="fa fa-address-book fa-fw" aria-hidden="true"></i> 通讯录</a>
        				<a href="${path}/sys/worklog"><i class="fa fa-briefcase fa-fw" aria-hidden="true"></i>工作日志</a>
        				<a href="${path}/sys/schedule"><i class="fa fa-book fa-fw" aria-hidden="true"></i>日程安排</a>
        			</div>
        		</li>
        		<li class="item" id="f">
        			<a href="#f" class="btnn"><i class="fa fa-commenting fa-fw" aria-hidden="true"></i>短消息功能</a>
        			<div class="smenu">        				
        				<a href="${path}/sys/smsadd"><i class="fa fa-share-square fa-fw" aria-hidden="true"></i>发送短消息</a>
        				<a href="${path}/sys/sms"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>读/删消息</a>
        			</div>
        		</li>
        		<li class="item" id="a">
        			<a href="#a" class="btnn"><i class="fa fa-user-secret fa-fw" aria-hidden="true"></i>个人中心</a>
        			<div class="smenu">        				
        				<a href="${path }/sys/person"><i class="fa fa-user fa-fw" aria-hidden="true"></i>个人信息</a>
        				<a href="${path}/sys/personmdf" role="menuitem"><i class="fa fa-user fa-fw" aria-hidden="true"></i>修改信息</a>
        				<a href="${path }/sys/pwdmdf"><i class="fa fa-unlock-alt fa-fw" aria-hidden="true"></i>密码修改</a>
        			</div>
        		</li>
        		<li class="item" id="b">
        			<a href="#b" class="btnn js-popover" data-toggle="popover" title="提示" data-content="该功能部分需要权限" data-delay="300" data-trigger="hover"><i class="fa fa-comments-o fa-fw" aria-hidden="true"></i>会议管理</a>
        			<div class="smenu">
        				<a href="${path}/sys/role/meetingadd"><i class="fa fa-plus-square fa-fw" aria-hidden="true"></i> 新增会议</a>
        				<a href="${path}/sys/meeting"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i> 修改会议</a>
        			</div>
        		</li>
        		<li class="item" id="c">
        			<a href="#c" class="btnn js-popover" data-toggle="popover" title="提示" data-content="该功能部分需要权限" data-delay="300" data-trigger="hover"><i class="fa fa-bullhorn fa-fw" aria-hidden="true"></i>公告管理</a>
        			<div class="smenu">
        				<a href="${path}/sys/role/noticeadd"><i class="fa fa-plus-square fa-fw" aria-hidden="true"></i> 新增公告</a>
        				<a href="${path}/sys/notice"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i> 修改公告</a>
        			</div>
        		</li>
        		<li class="item" id="d">
        			<a href="#d" class="btnn js-popover" data-toggle="popover" title="提示" data-content="该功能部分需要权限" data-delay="300" data-trigger="hover"><i class="fa fa-cogs fa-fw" aria-hidden="true"></i>用户管理</a>
        			<div class="smenu">
        				<a href="${path}/sys/role/useradd"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> 新增用户</a>
        				<a href="${path }/sys/user"><i class="fa fa-user-md fa-fw" aria-hidden="true"></i> 修改用户</a>
        			</div>
        		</li>
        		<li class="item">
        			<a href="${path }/logout" class="btnn"><i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>退出</a>        			
        		</li>
        	</div>        
        </div>