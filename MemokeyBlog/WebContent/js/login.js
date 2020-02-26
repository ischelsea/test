$(function(){

	$("input[type='text']").blur(function(){
		var username = $(this).val();
		if(username ==null || username==""){
			alert("用户名不能为空！");
			$("#1").css("color","red");
			$("#s").html("");
			return false;
		}else{
			
			$("#1").css("color","green");
			$("#s").html("√").css("color","green");
		}
	});
	
	$("input[type='password']").blur(function(){
		var passwd = $(this).val();
		if(passwd ==null || passwd==""){
			alert("密码不能为空！");
			$("#2").css("color","red");
			$("#s2").html("");
			return false;
		}else{
			$("#2").css("color","green");
			$("#s2").html("√").css("color","green");
		}
	});
});