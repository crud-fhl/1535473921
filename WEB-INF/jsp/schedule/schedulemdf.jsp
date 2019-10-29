<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>修改日程安排</strong>
		</div>
		<div class="Add">
			<form id="userForm" method="post" action="${path}/sys/saveschedulemdf">
					<div class="head">
    					<h1>修改日程安排</h1>
    				</div>
    				<div>
                        <input type="hidden" name="sid" id="sid" value="${schedule.sid }">
                        <font color="red"></font>
                    </div>
                    <div>
                        <label for="year">年份：</label>
                        <input type="text" name="year" id="year" value="${schedule.year }" placeholder="请输入年份XXXX">
                        <font color="red" id="yearStart">*</font>
                        <font color="red" id="yearError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="yearRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="month">月份：</label>
                        <input type="text" name="month" id="month" value="${schedule.month }" placeholder="请输入月份XX(两位数)">
                        <font color="red" id="monthStart">*</font>
                        <font color="red" id="monthError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="monthRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="day">日期：</label>
                        <input type="text" name="day" id="day" value="${schedule.day }" placeholder="请输入日期XX(两位数)">
                        <font color="red" id="dayStart">*</font>
                        <font color="red" id="dayError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="dayRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="plan">计划：</label>
                        <textarea rows="4" cols="26" name="plan" id="plan" placeholder="请输入计划">${schedule.plan }</textarea>
                        <font color="red"></font>
                    </div>
                    <div class="info">${message}</div>
                    <div class="AddBtn">
                        <input type="submit"  value="修改" class="input-button" ">
                        <input type="button" value="返回" class="input-button" onclick="window.location.href='${path}/sys/schedule'">
                    </div>
                </form>
		</div>
		
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>

