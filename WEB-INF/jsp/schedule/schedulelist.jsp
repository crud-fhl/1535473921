<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function mdfschedule(sid){				
		location.href="${pageContext.request.contextPath}/sys/schedulemdf?sid="+sid;
		}
	</script>
	<script type="text/javascript">
		function delschedule(sid){	
		/* alert(); */
		var msg="提示 ：确认删除该日程吗?";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/scheduledel?sid="+sid;		
		}else{
			return false;
		}
		}
	</script>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>日程安排</strong>
		</div>
		<div class="search">
			<form method="get" action="${path }/sys/schedule" id="myform">
					<span><i class="fa fa-user-secret" aria-hidden="true"></i>${user.username }的日程安排</span>
					<%-- <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索日期(天)：</span>
					<input name="queryday" class="input-text"	type="text" value="${queryday }">
					 <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索计划：</span>
					<input name="queryplan" class="input-text" type="text" value="${queryplan }"> --%>
					<div class="s-box">
						<input name="queryday" class="s-txt" type="text" value="${queryday }" placeholder="搜索日期(天)：" />
							
						<input name="queryplan" class="s-txt" type="text" value="${queryplan }" placeholder="搜索计划：" />
							<a class="s-btn" href="#" onclick="document.getElementById('myform').submit();return false;">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</div>
					<input type="hidden" name="pageIndex" value="1"/>
					<a href="${path}/sys/scheduleadd" class="aaa" ><i class="fa fa-plus-circle" aria-hidden="true"></i>添加日程安排</a>
			</form>
		</div>
		<table class="Table" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="14%"><i class="fa fa-address-card" aria-hidden="true"></i>日程计划人</th>
                    <th width="18%"><i class="fa fa-hourglass-start" aria-hidden="true"></i>年份</th>
                    <th width="14%"><i class="fa fa-hourglass-half" aria-hidden="true"></i>月份</th>
                    <th width="14%"><i class="fa fa-hourglass-end" aria-hidden="true"></i>日期</th>
                    <th width="24%"><i class="fa fa-calendar" aria-hidden="true"></i>计划</th>
                    <th width="16%"><i class="fa fa-cog fa-spin  fa-fw"></i>操作</th>
                </tr>
                   <c:forEach var="schedule" items="${scheduleList }" varStatus="status">
					<tr>
						<td>
						<span>${user.username }</span>
						</td>
						<td>
						<span>${schedule.year }&nbsp;&nbsp;(年)</span>
						</td>
						<td>
						<span>${schedule.month }&nbsp;&nbsp;(月)</span>
						</td>
						<td>
						<span>${schedule.day }&nbsp;&nbsp;(日)</span>
						</td>
						<td>
						<span>${schedule.plan }</span>
						</td>
						<td>
						<div class="btn-group">
							<button type="button" class="btn btn-info">
								<i class="fa fa-cog fa-spin fa-fw"></i>
							</button>
							<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a class="mdfaddress" href="#"   onclick="mdfschedule(${schedule.sid })"  role="menuitem"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>修改</a></li>
								<li><a href="#" onclick="javascript:return delschedule(${schedule.sid } )" role="menuitem"><i class="fa fa-trash fa-fw" aria-hidden="true"></i>删除</a></li>
							</ul>
						</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		<input type="hidden" id="totalPageCount" value="${Page.totalPage}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${Page.totalCount}"/>
	          	<c:param name="currPageNo" value="${Page.currPageNo}"/>
	          	<c:param name="totalPageCount" value="${Page.totalPage}"/>
          	</c:import>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>

