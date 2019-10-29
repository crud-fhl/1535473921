<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<%-- <div class="frame">
			<h2><i class="fa fa-user-secret" aria-hidden="true"></i>${user.username }</h2>
			<p>欢迎使用OA办公系统!</p>
		</div>
		<div class="frame-box">
			
			<h1><i class="fa fa-book" aria-hidden="true"></i>日程管理</h1>
			<h5>简介</h5>
			<p>aaaaa</p>
		</div> --%>
		<div class="services-section">
			<div class="inner-width">
				<h1 class="section-title">Welcome</h1>
				<div class="border"></div>
				<div class="services-container">
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-address-book" aria-hidden="true"></i>
						</div>
						<div class="service-title">通讯录 功能</div>
						<div class="service-desc">
							根据登陆用户以及搜索联系人名，联系人电话分页查询个人通讯录联系人。通过联系人管理实现对个人通讯录的增删改查联系人。
						</div>
					</div>
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-book" aria-hidden="true"></i>
						</div>
						<div class="service-title">日程 功能</div>
						<div class="service-desc">
							根据登陆用户以及搜索日期(天)，搜索计划内容分页查询个人日程安排。通过日程管理实现对个人日程安排的增删改查。
						</div>
					</div>
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-briefcase" aria-hidden="true"></i>
						</div>
						<div class="service-title">日志 功能</div>
						<div class="service-desc">
							根据登陆用户以及搜索日期(天)，搜索日志标题分页查询个人工作日志。通过日志管理实现对个人工作日志的增删改查。						
							</div>
					</div>
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-bullhorn" aria-hidden="true"></i>
						</div>
						<div class="service-title">公告 功能</div>
						<div class="service-desc">
							通过搜索公告发起人，搜索公告标题分页查询符合条件公告。通过公告管理实现对公告内容的增删改查。公告管理需要管理员及以上权限。
						</div>
					</div>
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-comments-o" aria-hidden="true"></i>
						</div>
						<div class="service-title">会议 功能</div>
						<div class="service-desc">
							通过搜索会议发起人，搜索会议标题及会议地点分页查询符合条件会议。通过会议管理实现对会议内容的增删改查。会议管理需要管理员及以上权限。						
							</div>
					</div>
					<div class="service-box">
						<div class="service-icon">
							<i class="fa fa-commenting" aria-hidden="true"></i>
						</div>
						<div class="service-title">短消息 功能</div>
						<div class="service-desc">
							根据登陆用户以及搜索发送人，搜索消息状态分页查询个人短消息。只有已读消息可进行删除操作，未读信息可以通过标记已读来完成消息已读。发送消息可以选择系统内用户发送短消息。可以对消息进行回复操作
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
