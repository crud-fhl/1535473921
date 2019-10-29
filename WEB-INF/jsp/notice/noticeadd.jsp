<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>添加公告</strong>
		</div>
		<div class="Add">
			<form id="userForm" method="post" action="${path}/sys/role/savenoticeadd">
					<div class="head">
    					<h1>添加公告</h1>
    				</div>
                    <div>
                        <input type="hidden" name="sender" id="sender" value="${user.username }">
                    </div>
                    <div>
                        <label for="title">公告标题：</label>
                        <input type="text" name="title" id="title" value="" placeholder="请输入公告标题">
                        <font color="red" id="titleStart">*</font>
                        <font color="red" id="titleError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="titleRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="content">公告内容：</label>
                        <textarea rows="4" cols="26" name="content" id="content" placeholder="请输入公告内容"></textarea>
                        <font color="red"></font>
                    </div>
                    <div>
                        <label for="sendtime">公告发起时间：</label>
                        <input type="text" name="sendtime" id="sendtime" value="" placeholder="请输入发起时间(格式：XXXX-XX-XX)">
                        <font color="red" id="sendtimeStart">*</font>
                        <font color="red" id="sendtimeError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="sendtimeRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div class="info">${message}</div>
                    <div class="AddBtn">
                        <input type="submit"  value="添加" class="input-button" ">
                        <input type="button" value="返回" class="input-button" onclick="window.location.href='${path}/sys/notice'">
                    </div>
                </form>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>