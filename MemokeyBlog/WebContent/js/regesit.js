$(function() {
	$("#username").blur(function() {
		var uname = $("#username").val();
		//定义用户名正则表达式
		var unameReg = /^(\w|[\u4e00-\u9fa5]){2,8}$/;
		if (unameReg.test(uname) == false) {
			
			//取消默认行为
			$("#1").css("color", "red");
			//return false;
		} else {
			$("#1").css("color", "green");
		}

	});

	
	$("#password").blur(function() {
		//验证用户密码
		var passwd = $("#password").val();
		var passwdReg = /^(\w){6}$/;
		if (passwdReg.test(passwd) == false) {
			
			$("#2").css("color", "red");
			return false;
		} else {
			$("#2").css("color", "green");
		}
	});

	$("#repwd").blur(function() {
		var passwd = $("#password").val();
		//确认密码
		var checkpsswd = $("#repwd").val();
		if (passwd != checkpsswd) {
			
			$("#3").css("color", "red");
			return false;
		} else {
			$("#3").css("color", "green");
		}
	});

	$("#email").blur(function() {
		//使用正则验证邮箱
		//取邮箱值
		var email = $("#email").val();
		//定义正则验证邮箱 13645644564@163.com
		//^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
		var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (emailReg.test(email) == false) {
			
			$("#4").css("color", "red");
			return false;
		} else {
			$("#4").css("color", "green");
		}
	});

	$("#code").blur(function() {
		//验证码
		var code = $("#code").val();
		if (code != "6n6np") {
		
			$("#5").css("color", "red");
			return false;
		} else {
			$("#5").css("color", "green");
		}
	});

});
