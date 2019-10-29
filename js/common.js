$(document).ready(function() {
			$("#name").focus(function() {
				$("#name").css("background-color", "#FFFFCC");
			});
			$("#name").blur(function() {
				/* alert(); */
				/*var regtitle = /^[a-zA-Z][a-zA-Z0-9_]*$/;*/
				var uname = $("#name").val();
				$("#name").css("background-color", "white");
				if (uname.length <= 0) {
					$("#nameRight").hide();
					$("#nameError").show();
					$("#nameStart").hide();
				} else {
					$("#nameRight").show();
					$("#nameError").hide();
					$("#nameStart").hide();
				}
			});
			$("#username").focus(function() {
				$("#username").css("background-color", "#FFFFCC");
			});
			$("#username").blur(function() {
				var username = $("#username").val();
				$("#username").css("background-color", "white");
				if (username.length <= 0) {
					$("#usernameRight").hide();
					$("#usernameError").show();
					$("#usernameStart").hide();
				} else {
					$("#usernameRight").show();
					$("#usernameError").hide();
					$("#usernameStart").hide();
				}
			});
			$("#sex").focus(function() {
				$("#sex").css("background-color", "#FFFFCC");
			});
			$("#sex").blur(function() {
				var sex = $("#sex").val();
				var regsex = /^['男'|'女']$/ ;
				$("#sex").css("background-color", "white");
				if (sex.length <= 0 || !regsex.test(sex)) {
					$("#sexRight").hide();
					$("#sexError").show();
					$("#sexStart").hide();
				} else {
					$("#sexRight").show();
					$("#sexError").hide();
					$("#sexStart").hide();
				}
			});
			$("#mobile").focus(function() {
				$("#mobile").css("background-color", "#FFFFCC");
			});
			$("#mobile").blur(function() {
				var mobile = $("#mobile").val();
				var regmobile = /^(13[0-9]|15[0-9]|18[0-9]|16[0-9])\d{8}$/;
				$("#mobile").css("background-color", "white");
				if (mobile.length <= 0 || !regmobile.test(mobile)) {
					$("#mobileRight").hide();
					$("#mobileError").show();
					$("#mobileStart").hide();
				} else {
					$("#mobileRight").show();
					$("#mobileError").hide();
					$("#mobileStart").hide();
				}
			});
			$("#email").focus(function() {
				$("#email").css("background-color", "#FFFFCC");
			});
			$("#email").blur(function() {
				var email = $("#email").val();
				var regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				$("#email").css("background-color", "white");
				if (email.length <= 0 || !regemail.test(email)) {
					$("#emailRight").hide();
					$("#emailError").show();
					$("#emailStart").hide();
				} else {
					$("#emailRight").show();
					$("#emailError").hide();
					$("#emailStart").hide();
				}
			});
			$("#qq").focus(function() {
				$("#qq").css("background-color", "#FFFFCC");
			});
			$("#qq").blur(function() {
				var qq = $("#qq").val();
				var regqq = /^\d{5,13}$/;
				$("#qq").css("background-color", "white");
				if (qq.length <= 0 || !regqq.test(qq)) {
					$("#qqRight").hide();
					$("#qqError").show();
					$("#qqStart").hide();
				} else {
					$("#qqRight").show();
					$("#qqError").hide();
					$("#qqStart").hide();
				}
			});
			$("#company").focus(function() {
				$("#company").css("background-color", "#FFFFCC");
			});
			$("#company").blur(function() {
				var company = $("#company").val();
				$("#company").css("background-color", "white");
				if (company.length <= 0) {
					$("#companyRight").hide();
					$("#companyError").show();
					$("#companyStart").hide();
				} else {
					$("#companyRight").show();
					$("#companyError").hide();
					$("#companyStart").hide();
				}
			});
			$("#address").focus(function() {
				$("#address").css("background-color", "#FFFFCC");
			});
			$("#address").blur(function() {
				var address = $("#address").val();
				$("#address").css("background-color", "white");
				if (address.length <= 0) {
					$("#addressRight").hide();
					$("#addressError").show();
					$("#addressStart").hide();
				} else {
					$("#addressRight").show();
					$("#addressError").hide();
					$("#addressStart").hide();
				}
			});
			$("#postcode").focus(function() {
				$("#postcode").css("background-color", "#FFFFCC");
			});
			$("#postcode").blur(function() {
				var postcode = $("#postcode").val();
				$("#postcode").css("background-color", "white");
				if (postcode.length <= 0) {
					$("#postcodeRight").hide();
					$("#postcodeError").show();
					$("#postcodeStart").hide();
				} else {
					$("#postcodeRight").show();
					$("#postcodeError").hide();
					$("#postcodeStart").hide();
				}
			});
			//密码验证
			$("#password").focus(function() {
				$("#password").css("background-color", "#FFFFCC");
			});
			$("#password").blur(function(){
				var password = $("#password").val();
				$("#password").css("background-color", "white");
				if (password.length > 5 && password.length < 17) {
					$("#passwordRight").show();
					$("#passwordError").hide();
					$("#passwordStart").hide();
				} else {
					$("#passwordRight").hide();
					$("#passwordError").show();
					$("#passwordStart").hide();
				}
			});
			//新密码验证
			$("#newpassword").focus(function() {
				$("#newpassword").css("background-color", "#FFFFCC");
			});
			$("#newpassword").blur(function(){
				var newpassword = $("#newpassword").val();
				$("#newpassword").css("background-color", "white");
				if (newpassword.length > 5 && newpassword.length < 17) {
					$("#passwordRight").show();
					$("#passwordError").hide();
					$("#passwordStart").hide();
				} else {
					$("#passwordRight").hide();
					$("#passwordError").show();
					$("#passwordStart").hide();
				}
			});
			//确认密码
			$("#rnewpassword").focus(function() {
				$("#rnewpassword").css("background-color", "#FFFFCC");
			});
			$("#rnewpassword").blur(function(){
				var newpassword = $("#newpassword").val();
				var rnewpassword = $("#rnewpassword").val();
				$("#rnewpassword").css("background-color", "white");
				if (rnewpassword != newpassword) {
					$("#rnewpasswordRight").hide();
					$("#rnewpasswordError").show();
					$("#rnewpasswordStart").hide();
				} else {
					$("#rnewpasswordRight").show();
					$("#rnewpasswordError").hide();
					$("#rnewpasswordStart").hide();
				}
			});
			//年份
			$("#year").focus(function() {
				$("#year").css("background-color", "#FFFFCC");
			});
			$("#year").blur(function() {
				var year = $("#year").val();
				var regyear = /[0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3}/;
				$("#year").css("background-color", "white");
				if (year.length <= 0 || !regyear.test(year) || year.length >4) {
					$("#yearRight").hide();
					$("#yearError").show();
					$("#yearStart").hide();
				} else {
					$("#yearRight").show();
					$("#yearError").hide();
					$("#yearStart").hide();
				}
			});
			//月份
			$("#month").focus(function() {
				$("#month").css("background-color", "#FFFFCC");
			});
			$("#month").blur(function() {
				var month = $("#month").val();
				var regmonth = /^(0?[1-9]|1[0-2])$/;
				$("#month").css("background-color", "white");
				if (month.length <= 1 || !regmonth.test(month) || month.length >2) {
					$("#monthRight").hide();
					$("#monthError").show();
					$("#monthStart").hide();
				} else {
					$("#monthRight").show();
					$("#monthError").hide();
					$("#monthStart").hide();
				}
			});
			//日期
			$("#day").focus(function() {
				$("#day").css("background-color", "#FFFFCC");
			});
			$("#day").blur(function() {
				var day = $("#day").val();
				var regday = /^((0?[1-9])|((1|2)[0-9])|30|31)$/;
				$("#day").css("background-color", "white");
				if (day.length <= 1 || !regday.test(day) || day.length >2) {
					$("#dayRight").hide();
					$("#dayError").show();
					$("#dayStart").hide();
				} else {
					$("#dayRight").show();
					$("#dayError").hide();
					$("#dayStart").hide();
				}
			});
			//标题
			$("#title").focus(function() {
				$("#title").css("background-color", "#FFFFCC");
			});
			$("#title").blur(function() {
				var title = $("#title").val();
				$("#title").css("background-color", "white");
				if (title.length <= 0) {
					$("#titleRight").hide();
					$("#titleError").show();
					$("#titleStart").hide();
				} else {
					$("#titleRight").show();
					$("#titleError").hide();
					$("#titleStart").hide();
				}
			});
			$("#sendtime").focus(function() {
				$("#sendtime").css("background-color", "#FFFFCC");
			});
			$("#sendtime").blur(function() {
				var sendtime = $("#sendtime").val();
				var regsendtime = /^[1-9][0-9]{3}-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])$/;
				$("#sendtime").css("background-color", "white");
				if (sendtime.length <= 0 || !regsendtime.test(sendtime)) {
					$("#sendtimeRight").hide();
					$("#sendtimeError").show();
					$("#sendtimeStart").hide();
				} else {
					$("#sendtimeRight").show();
					$("#sendtimeError").hide();
					$("#sendtimeStart").hide();
				}
			});
			$("#starttime").focus(function() {
				$("#starttime").css("background-color", "#FFFFCC");
			});
			$("#starttime").blur(function() {
				var starttime = $("#sendtime").val();
				var regstarttime = /^[1-9][0-9]{3}-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])$/;
				$("#sendtime").css("background-color", "white");
				if (starttime.length <= 0 || !regstarttime.test(starttime)) {
					$("#starttimeRight").hide();
					$("#starttimeError").show();
					$("#starttimeStart").hide();
				} else {
					$("#starttimeRight").show();
					$("#starttimeError").hide();
					$("#starttimeStart").hide();
				}
			});
			$("#endtime").focus(function() {
				$("#endtime").css("background-color", "#FFFFCC");
			});
			$("#endtime").blur(function() {
				var endtime = $("#sendtime").val();
				var regendtime = /^[1-9][0-9]{3}-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])$/;
				$("#endtime").css("background-color", "white");
				if (endtime.length <= 0 || !regendtime.test(endtime)) {
					$("#endtimeRight").hide();
					$("#endtimeError").show();
					$("#endtimeStart").hide();
				} else {
					$("#endtimeRight").show();
					$("#endtimeError").hide();
					$("#endtimeStart").hide();
				}
			});
		});