<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function mdfnotice(nid){	
		location.href="${pageContext.request.contextPath}/sys/role/noticemdf?nid="+nid;
		}
	</script>
	<script type="text/javascript">
		function delnotice(nid){	
		/* alert(); */
		var msg="提示 ：确认取消该公告吗?";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/role/noticedel?nid="+nid;		
		}else{
			return false;
		}
		}
	</script>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>公告管理</strong>
		</div>
		<div class="search">
			<form method="get" action="${path }/sys/notice" id="myform">
					<span></span>
					<%-- <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索公告发起人：</span>
					<input name="querysender" class="input-text"	type="text" value="${querysender }">
					<span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索公告标题：</span>
					<input name="querytitle" class="input-text" type="text" value="${querytitle }"> --%>
					<div class="s-box">
						<input name="querysender" class="s-txt" type="text" value="${querysender }" placeholder="搜索公告发起人：" />
							
						<input name="querytitle" class="s-txt" type="text" value="${querytitle }" placeholder="搜索公告标题：" />
							<a class="s-btn" href="#" onclick="document.getElementById('myform').submit();return false;">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</div>
					<input type="hidden" name="pageIndex" value="1"/>
					<a href="${path}/sys/role/noticeadd" class="aaa"><i class="fa fa-plus-circle" aria-hidden="true"></i>添加公告</a>
			</form>
		</div>
		<table class="Table" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%"><i class="fa fa-user-circle" aria-hidden="true"></i>公告发起人</th>
                    <th width="15%"><i class="fa fa-pencil-square" aria-hidden="true"></i>公告标题</th>
                    <th width="35%"><i class="fa fa-commenting" aria-hidden="true"></i>公告内容</th>
                    <th width="24%"><i class="fa fa-hourglass-half" aria-hidden="true"></i>公告发起时间</th>
                    <th width="16%"><i class="fa fa-cog fa-spin  fa-fw"></i>操作</th>
                </tr>
                   <c:forEach var="notice" items="${noticeList }" varStatus="status">
					<tr>
						<td>
						<span>${notice.sender }</span>
						</td>
						<td>
						<span>${notice.title }</span>
						</td>
						<td>
						<span>${notice.content }</span>
						</td>
						<td>
						<span>${notice.sendtime }</span>
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
								<li><a class="mdfnotice" href="#"   onclick="mdfnotice(${notice.nid })"  role="menuitem"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>修改</a></li>
								<li><a href="#" onclick="javascript:return delnotice(${notice.nid } )" role="menuitem"><i class="fa fa-trash fa-fw" aria-hidden="true"></i>删除</a></li>
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

