<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>会议修改</strong>
		</div>
		<div class="Add">
			<form id="userForm" method="post" action="${path}/sys/role/savemeetingmdf">
					<div class="head">
    					<h1>修改会议</h1>
    				</div>
    				<div>
                        <input type="hidden" name="mid" id="mid" value="${meeting.mid }">
                        <font color="red"></font>
                    </div>
                    <div>
                        <label for="starttime">开始时间：</label>
                        <input type="text" name="starttime" id="starttime" value="${meeting.starttime }" placeholder="请输入开始时间(格式：XXXX-XX-XX)">
                        <font color="red" id="starttimeStart">*</font>
                        <font color="red" id="starttimeError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="starttimeRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="endtime">结束时间：</label>
                        <input type="text" name="endtime" id="endtime" value="${meeting.endtime }" placeholder="请输入结束时间(格式：XXXX-XX-XX)">
                        <font color="red" id="endtimeStart">*</font>
                        <font color="red" id="endtimeError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="endtimeRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="address">会议地点：</label>
                        <input type="text" name="address" id="address" value="${meeting.address }" placeholder="请输入会议地点">
                        <font color="red" id="addressStart">*</font>
                        <font color="red" id="addressError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="addressRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="title">会议标题：</label>
                        <input type="text" name="title" id="title" value="${meeting.title }" placeholder="请输入会议标题">
                        <font color="red" id="titleStart">*</font>
                        <font color="red" id="titleError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="titleRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="content">会议内容：</label>
                        <textarea rows="4" cols="26" name="content" id="content" placeholder="请输入会议内容">${meeting.content }</textarea>
                        <font color="red"></font>
                    </div>
                    <div class="info">${message}</div>
                    <div class="AddBtn">
                        <input type="submit"  value="修改" class="input-button" ">
                        <input type="button" value="返回" class="input-button" onclick="window.location.href='${path}/sys/meeting'">
                    </div>
                </form>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>