<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
	<div class="body">
		<div class="location">
			<span><i class="fa fa-home fa-fw" aria-hidden="true"></i>所处位置:</span>
			<strong>添加通讯录</strong>
		</div>
		<div class="Add">
			<form id="userForm" method="post" action="${path}/sys/saveaddressadd">
					<div class="head">
    					<h1>添加通讯录</h1>
    				</div>
    				<div>
                        <input type="hidden" name="username" id="username" value="${user.username }">
                        <font color="red"></font>
                    </div>
                    <div>
                        <label for="name">联系人名：</label>
                        <input type="text" name="name" id="name" value="" placeholder="请输入联系人名">
                        <font color="red" id="nameStart">*</font>
                        <font color="red" id="nameError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="nameRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="sex">性别：</label>
                        <input type="text" name="sex" id="sex" value="" placeholder="请输入性别：男 / 女">
                        <font color="red" id="sexStart">*</font>
                        <font color="red" id="sexError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="sexRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="mobile">电话：</label>
                        <input type="text" name="mobile" id="mobile" value="" placeholder="请输入电话号码">
                        <font color="red" id="mobileStart">*</font>
                        <font color="red" id="mobileError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="mobileRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="email">邮箱地址：</label>
                        <input type="text" name="email" id="email" value="" placeholder="请输入邮箱地址">
                        <font color="red" id="emailStart">*</font>
                        <font color="red" id="emailError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="emailRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="qq">QQ：</label>
                        <input type="text" name="qq" id="qq" value="" placeholder="请输入qq号">
                        <font color="red" id="qqStart">*</font>
                        <font color="red" id="qqError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i>格式不正确</font>
                        <font color="green" id="qqRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="company">公司：</label>
                        <input type="text" name="company" id="company" value="" placeholder="请输入公司">
                        <font color="red" id="companyStart">*</font>
                        <font color="red" id="companyError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="companyRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="address">地址：</label>
                        <input type="text" name="address" id="address" value="" placeholder="请输入地址">
                        <font color="red" id="addressStart">*</font>
                        <font color="red" id="addressError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="addressRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div>
                        <label for="postcode">邮政编码：</label>
                        <input type="text" name="postcode" id="postcode" value="" placeholder="请输入邮政编码">
                        <font color="red" id="postcodeStart">*</font>
                        <font color="red" id="postcodeError" style="display:none"><i class="fa fa-times-circle" aria-hidden="true"></i></font>
                        <font color="green" id="postcodeRight" style="display: none"><i class="fa fa-check-circle" aria-hidden="true"></i></font>
                    </div>
                    <div class="info">${message}</div>
                    <div class="AddBtn">
                        <input type="submit"  value="添加" class="input-button" ">
                        <input type="button" value="返回" class="input-button" onclick="window.location.href='${path}/sys/address'">
                    </div>
                </form>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>