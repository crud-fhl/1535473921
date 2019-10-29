<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function replysms(id){				
		location.href="${pageContext.request.contextPath}/sys/smsreply?id="+id;
		}
	</script>
	<script type="text/javascript">
		function mdfsms(id){				
		location.href="${pageContext.request.contextPath}/sys/smsmdf?id="+id;
		}
	</script>
	<script type="text/javascript">
		function delsms(id){	
		/* alert(); */
		var msg="提示 ：确认删除该消息吗?";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/smsdel?id="+id;		
		}else{
			return false;
		}
		}
	</script>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>短消息管理</strong>
		</div>
		<div class="search">
			<form method="get" action="${path }/sys/sms" id="myform">
					<span><i class="fa fa-user-secret" aria-hidden="true"></i>${user.username }的短消息</span>
					<%-- <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索发送人：</span>
					<input name="querysender" class="input-text"	type="text" value="${querysender }">
					 <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索消息状态：</span>
					<input name="queryisRead" class="input-text" type="text" value="${queryisRead }"> --%>
					<div class="s-box">
						<input name="querysender" class="s-txt" type="text" value="${querysender }" placeholder="搜索发送人：" />
							
						<input name="queryisRead" class="s-txt" type="text" value="${queryisRead }" placeholder="搜索消息状态：" />
							<a class="s-btn" href="#" onclick="document.getElementById('myform').submit();return false;">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</div>
					<input type="hidden" name="pageIndex" value="1"/>
					<a href="${path}/sys/smsadd" class="aaa"><i class="fa fa-share-square" aria-hidden="true"></i>发送短消息</a>
			</form>
		</div>
		<table class="Table" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="15%"><i class="fa fa-user-circle-o" aria-hidden="true"></i>发送人</th>
                    <th width="22%"><i class="fa fa-hourglass-start" aria-hidden="true"></i>发送时间</th>
                    <th width="32%"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>消息内容</th>
                    <th width="15%"><i class="fa fa-question-circle" aria-hidden="true"></i>消息状态</th>
                    <th width="16%"><i class="fa fa-cog fa-spin  fa-fw"></i>操作</th>
                </tr>
                   <c:forEach var="sms" items="${smsList }" varStatus="status">
					<tr>
						<td>
						<span>${sms.sender }</span>
						</td>
						<td>
						<span>${sms.sendtime }</span>
						</td>
						<td>
						<span>${sms.message }</span>
						</td>
						<td>
							<c:if test="${sms.isRead == 0}"><i class="fa fa-square-o fa-fw" aria-hidden="true"></i>未读消息</c:if>
							<c:if test="${sms.isRead == 1}"><i class="fa fa-check-square-o fa-fw" aria-hidden="true"></i>已读消息</c:if>
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
								<li><c:if test="${sms.isRead == 0}"><a class="mdfsms" href="#"   onclick="mdfsms(${sms.id })"  role="menuitem"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>标记已读</a></c:if>
									<c:if test="${sms.isRead == 1}"><a href="#" onclick="javascript:return delsms(${sms.id } )" role="menuitem"><i class="fa fa-trash fa-fw" aria-hidden="true"></i>删除消息</a></c:if>
								</li>
								<li><a href="#" onclick="replysms(${sms.id } )" role="menuitem"><i class="fa fa-reply fa-fw" aria-hidden="true"></i>回复消息</a></li>
							
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
