<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<script type="text/javascript">
		function mdfaddress(aid){
		
		
		location.href="${pageContext.request.contextPath}/sys/addressmdf?aid="+aid;
		}
	</script>
	<script type="text/javascript">
		function deladdress(aid){	
		/* alert(); */
		var msg="提示 ：确认删除该联系人吗?";
		if(confirm(msg)==true){
			return location.href="${pageContext.request.contextPath}/sys/addressdel?aid="+aid;		
		}else{
			return false;
		}
		}
	</script>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>个人通讯录</strong>
		</div>
		<div class="search">
			<form method="get" action="${path }/sys/address" id="myform">
					<span><i class="fa fa-user-secret" aria-hidden="true"></i>${user.username }的通讯录</span>
					<%-- <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索联系人：</span>
					<input name="queryname" class="input-text"	type="text" value="${queryname }">
					 <span>&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i>搜索联系人电话：</span>
					<input name="querymobile" class="input-text" type="text" value="${querymobile }"> --%>
					 
					<div class="s-box">
						<input name="queryname" class="s-txt" type="text" value="${queryname }" placeholder="搜索联系人：" />
							
						<input name="querymobile" class="s-txt" type="text" value="${querymobile }" placeholder="搜索联系人电话：" />
							<a class="s-btn" href="#" onclick="document.getElementById('myform').submit();return false;">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</div>
					<input type="hidden" name="pageIndex" value="1"/>
					<%-- <input	value="查询" type="submit" id="searchbutton">--%>
					<a href="${path}/sys/addressadd" class="aaa"><i class="fa fa-plus-circle" aria-hidden="true"></i>添加联系人</a> 
			</form>
		</div>
		<table class="Table" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%"><i class="fa fa-address-book" aria-hidden="true"></i>联系人名</th>
                    <th width="8%"><i class="fa fa-user" aria-hidden="true"></i>性别</th>
                    <th width="15%"><i class="fa fa-phone-square" aria-hidden="true"></i>电话</th>
                    <th width="15%"><i class="fa fa-envelope" aria-hidden="true"></i>邮箱地址</th>
                    <th width="10%"><i class="fa fa-qq" aria-hidden="true"></i>QQ</th>
                    <th width="8%"><i class="fa fa-building" aria-hidden="true"></i>公司</th>
                    <th width="8%"><i class="fa fa-map-marker" aria-hidden="true"></i>地址</th>
                    <th width="10%"><i class="fa fa-location-arrow" aria-hidden="true"></i>邮政编码</th>
                    <th width="16%"><i class="fa fa-cog fa-spin  fa-fw"></i>操作</th>
                </tr>
                   <c:forEach var="address" items="${addressList }" varStatus="status">
					<tr>
						<td>
						<span>${address.name }</span>
						</td>
						<td>
						<span>${address.sex }</span>
						</td>
						<td>
						<span>${address.mobile }</span>
						</td>
						<td>
						<span>${address.email }</span>
						</td>
						<td>
						<span>${address.qq }</span>
						</td>
						<td>
						<span>${address.company }</span>
						</td>
						<td>
						<span>${address.address }</span>
						</td>
						<td>
						<span>${address.postcode }</span>
						</td>
						<td>
						<div class="butn-group">
							<button type="button" class="butn butn-info">
								<i class="fa fa-cog fa-spin fa-fw"></i>
							</button>
							<button type="button" class="butn butn-info dropdown-toggle" data-toggle="dropdown">
							
							<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a class="mdfaddress" href="#"   onclick="mdfaddress(${address.aid })" aid=${address.aid } role="menuitem"><i class="fa fa-wrench fa-fw" aria-hidden="true"></i>修改</a></li>
								<li><a href="#" onclick="javascript:return deladdress(${address.aid } )" role="menuitem"><i class="fa fa-trash fa-fw" aria-hidden="true"></i>删除</a></li>
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
