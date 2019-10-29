<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>发送短消息</strong>
		</div>
		<div class="Add">
			<form id="userForm" method="post" action="${path}/sys/savesmsreply">
					<div class="head">
    					<h1>回复短消息</h1>
    				</div>
    				<div>
                        <input type="hidden" name="sender" id="sender" value="${user.username }">
                        <font color="red"></font>
                    </div>
                    <div>
                        <label for="username">接收人：${sms.sender }</label>
                        <input type="hidden" name="username" id="username" value="${sms.sender }">
                    </div>
                   	<div>
                        <label for="message">短消息内容：</label>
                        <textarea rows="4" cols="26" name="message" id="message" placeholder="请输入回复内容"></textarea>
                    </div>                   
                    <div>
                        <input type="hidden" name="isRead" id="isRead" value="0">
                    </div>
                    <div class="info">${message}</div>
                    <div class="AddBtn">
                        <input type="submit"  value="发送" class="input-button" ">
                        <input type="button" value="返回" class="input-button" onclick="window.location.href='${path}/sys/sms'">
                    </div>
                </form>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>