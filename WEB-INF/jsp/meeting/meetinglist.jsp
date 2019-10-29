<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function mdfmeeting(mid){	
		location.href="${pageContext.request.contextPath}/sys/role/meetingmdf?mid="+mid;
		}
	</script>
	<script type="text/javascript">
		function delmeeting(mid){	
		/* alert(); */
		var msg="提示 ：确认取消该会议吗?";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/role/meetingdel?mid="+mid;		
		}else{
			return false;
		}
		}
	</script>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>会议管理</strong>
		</div>
		<div class="search">
			<form method="get" action="${path }/sys/meeting" id="myform">
					<span></span>
					<%-- <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索会议发起人：</span>
					<input name="querysender" class="input-text"	type="text" value="${querysender }">
					<span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索会议地点：</span>
					<input name="queryaddress" class="input-text" type="text" value="${queryaddress }">
					<span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索会议标题：</span>
					<input name="querytitle" class="input-text" type="text" value="${querytitle }"> --%>
					<div class="s-box">
						<input name="querysender" class="s-txt" type="text" value="${querysender }" placeholder="搜索会议发起人：" />
						<input name="queryaddress" class="s-txt" type="text" value="${queryaddress }" placeholder="搜索会议地点：" />
						<input name="querytitle" class="s-txt" type="text" value="${querytitle }" placeholder="搜索会议标题：" />
							<a class="s-btn" href="#" onclick="document.getElementById('myform').submit();return false;">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</div>
					<input type="hidden" name="pageIndex" value="1"/>
					<a href="${path}/sys/role/meetingadd" class="aaa"><i class="fa fa-plus-circle" aria-hidden="true"></i>添加会议</a>
			</form>
		</div>
		<table class="Table" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%"><i class="fa fa-user-circle" aria-hidden="true"></i>会议发起人</th>
                    <th width="10%"><i class="fa fa-hourglass-start" aria-hidden="true"></i>开始时间</th>
                    <th width="10%"><i class="fa fa-hourglass-end" aria-hidden="true"></i>结束时间</th>
                    <th width="10%"><i class="fa fa-map-marker" aria-hidden="true"></i>会议地点</th>
                    <th width="15%"><i class="fa fa-pencil-square" aria-hidden="true"></i>会议标题</th>
                    <th width="29%"><i class="fa fa-commenting" aria-hidden="true"></i>会议内容</th>
                    <th width="16%"><i class="fa fa-cog fa-spin  fa-fw"></i>操作</th>
                </tr>
                   <c:forEach var="meeting" items="${meetingList }" varStatus="status">
					<tr>
						<td>
						<span>${meeting.sender }</span>
						</td>
						<td>
						<span>${meeting.starttime }</span>
						</td>
						<td>
						<span>${meeting.endtime }</span>
						</td>
						<td>
						<span>${meeting.address }</span>
						</td>
						<td>
						<span>${meeting.title }</span>
						</td>
						<td>
						<span>${meeting.content }</span>
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
								<li><a class="mdfmeeting" href="#"   onclick="mdfmeeting(${meeting.mid })"  role="menuitem"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>修改</a></li>
								<li><a href="#" onclick="javascript:return delmeeting(${meeting.mid } )" role="menuitem"><i class="fa fa-trash fa-fw" aria-hidden="true"></i>删除</a></li>
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