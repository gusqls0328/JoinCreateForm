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

<!-- 
<script>
	$(document).ready(function() {
		$("#mid").blur(function() {
			alert("중복체크를 해야 회원가입 진행이 가능합니다");
				
		});
		
	});

</script>
 -->
 
<script type="text/javascript">
	
	var midCheck = "N";
	var mid1;
	
	function checkForm() {
		
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
		if ($("#mpassword").val() != $("#mpassword2").val()) {
			alert("비밀번호가 같지 않습니다");
			//$("input[name=midpassword2]").value("");
			return false;
			
		} //$("input[name=first]").value("value 값 바꾸기");
		
		if ($("#midCheck").val() == midCheck) {
			if (midCheck == "N") {alert("중복체크를 하세요");
			//$("#midCheckError").text("중복체크를 하세요");
			return false;}
			else if (midCheck == "Y") {
				return true;
				
			}
			
			
		}
		if ($("#mid").val() != mid1) {
			alert("중복체크를 다시하세요");
			return false;
		}
		
		
		
		
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
					
					//$("#afterCheckMid").hide();
					midCheck = "Y";
					mid1 = $("#mid").val()
						
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

#content_wrap {
	width:100%;
	height:100%;
	

}

#content_wrap #content {

	position:absolute;
	left:35%;
	top:20%;
	transform:tlanslateX(-50%)tlanslateY(-50%);
	width:500px;
	height:500px;
	padding:75px;
	padding-top:45px;
	background-color:white;
	border-radius:25px;
	
}

</style>

</head>

<body>
																	
													
														
	<div id="content_wrap">													
		<div id="content">
													
			<form method="post" action="join" onsubmit="return checkForm()">
				<div id="head_text"><h5>회원가입</h5></div>					
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
						<div id="afterCheckMid" class="input-group-append">
							<input onclick="checkMid()" type="button" class="btn btn-secondary" value="중복확인"/>
							<!-- <input name="midCheck" id="midCheck" type="hidden" value="N"/>  -->
						</div>
					</div>
					<span id="midError" class="error" style="color: red">${midError}</span>
				</div>
				 
				<div class="form-group">
					<input name="midCheck" id="midCheck" type="hidden" value="N"/>
					<span id="midCheckError" class="error" style="color: red"></span>
				</div>
				
					
				<div class="form-group">
					<label for="mpassword">비밀번호</label>
					<input type="password" class="form-control" id="mpassword" name="mpassword"
						placeholder="비밀번호를 입력하세요">
					<span id="mpasswordError" class="error" style="color: red">${mpasswordError}</span>
				</div>
				
				<div class="form-group">
					<label for="mpassword2">비밀번호 확인</label>
					<input type="password" class="form-control" id="mpassword2" name="mpassword2"
						placeholder="비밀번호를 입력하세요">
					<span id="mpasswordError2" class="error" style="color: red"></span>
				</div>
				
				<%-- 
				<div class="form-group">
					<label for="mphonenumber">휴대폰번호</label>
					<input type="text" class="form-control" id="mphonenumber" name="mphonenumber"
						placeholder="휴대폰 번호를 입력하세요">
				</div>
				
				<div class="form-group">
					<label for="mlevel">레벨</label>
					<input type="hidden" class="form-control" id="mlevel" name="mlevel"
						value="1" placeholder="시작 레벨은 0입니다">
				</div>
				--%>
				<div>
					<input type="submit" class="btn btn-danger" value="가입하기"/>
				</div>
				
			</form>
				<form method="get" action="loginPage01">
					<input type="submit" class="btn btn-success" value="로그인"/>
				</form>
		</div>
	</div>




</body>
</html>