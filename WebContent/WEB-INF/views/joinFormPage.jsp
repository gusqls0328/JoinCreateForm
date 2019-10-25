<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinPage</title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<%-- jsp는 8080까지만 생략됨, 상대경로로 찾아가기는 너무 복잡, 그래서 절대 경로로함 --%>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function checkForm() {
		console.log("aaa");
		var result = true;
		
		$(".error").text("");
		$(".error").css("color", "red");
		
		
		if ($("#mname").val() == "") {
			$("#mnameError").text("이름을 입력하세요");
			return false;
		}
		if ($("#mid").val() == "") {
			$("#midError").text("아이디를 입력하세요");
			return false;
		}
		if ($("#mpassword").val() == "") {
			$("#mpasswordError").text("비밀번호를 입력하세요");
			return false;
			
		}
		
		console.log("bbb");
		
		return result;
	}
	
	
	function checkMid() {
		
		$.ajax({
			
			url: "checkMid", 
			data: {mid:$("#mid").val()},
			success: function(data) {
				
				if (data.result) {
					$("#midError").text("사용할 수 있는 아이디입니다");
					$("#midError").css("color", "blue");
					
				} 
				
				else {
					$("#midError").text("사용할 수 없는 아이디입니다");
					$("#midError").css("color", "red");
				}
				
				
			}
			
			
			
			
		});
		
		
	}
	
</script>





<style type="text/css">


html, body {
	background-color: orange;

}

#content {

	margin: 200px;
	height: 200px;
}

</style>

</head>

<body>



	
		<div id="content">

			<form method="post" action="join" onsubmit="return checkForm()">
			
				<div class="form-group">
					<label for="mname">이름</label>
					<input type="text" class="form-control" id="mname" name="mname"
						placeholder="이름을 입력하세요">
					<span id="mnameError" class="error" style="color: red">${mnameError}</span>
				</div>
				
				<div class="form-group">
					<label for="mid">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="mid" name="mid"
							placeholder="아이디를 입력하세요"/>
						<div class="input-group-append">
							<input onclick="checkMid()" type="button" class="btn btn-secondary" value="중복확인"/>	
						</div>
					</div>
					<span id="midError" class="error" style="color: red">${midError}</span>
				</div>	
					
				<div class="form-group">
					<label for="mpassword">비밀번호</label>
					<input type="password" class="form-control" id="mpassword" name="mpassword"
						placeholder="비밀번호를 입력하세요">
					<span id="mpasswordError" class="error" style="color: red">${mpasswordError}</span>
				</div>
				<%-- 
				<div class="form-group">
					<label for="mphonenumber">휴대폰번호</label>
					<input type="text" class="form-control" id="mphonenumber" name="mphonenumber"
						placeholder="휴대폰 번호를 입력하세요">
				</div>
				
				<div class="form-group">
					<label for="mlevel">레벨</label>
					<input type="text" class="form-control" id="mlevel" name="mlevel"
						placeholder="시작 레벨은 0입니다">
				</div>
				--%>
				<div>
					<input type="submit" class="btn btn-danger" value="가입하기"/>
				</div>
				
			</form>

		
		</div>
	




</body>
</html>