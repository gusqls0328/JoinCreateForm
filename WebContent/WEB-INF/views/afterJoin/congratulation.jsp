<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
			<%-- jsp는 8080까지만 생략됨, 상대경로로 찾아가기는 너무 복잡, 그래서 절대 경로로함 --%>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
			
		<script type="text/javascript" src="../views/joinFormPage.jsp"></script>
		
		<script type="text/javascript">
			
			
			
			
		</script>
		
		

		<style type="text/css">

			html {
				background: url(<%=application.getContextPath()%>/resources/images/congratulation.png);
			}
			
			#content_wrap {
			
				width:100%;
				height:100%
				background-color:white;
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
				background-color:gray;
				border-radius:25px;
				
						
				
			}
			
		</style>


	</head>
	
	<body>
		
			<div id="content_wrap">	
				<div id="content">
					<h4>회원정보</h4>
		
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">비밀번호</th>
								</tr>
							</thead>
		
							<tbody>
				
								<tr>
									<td scope="row">${joinMember.mname}</td>
									<td scope="row"> ${joinMember.mid}</td>
									<td scope="row" style="visibility:hidden" id="checkMpassword">${joinMember.mpassword}</td>
								</tr>
				
				
							</tbody>
		
		
		
						</table>
		
					<div>
						<form method="post" action="modifyJoinContent">
							<button>수정하기</button>
						</form>
						<form method="post" action="redirectToMainPage01">
							<button>확인완료</button>
						</form>
					</div>
					
				</div>
			</div>
			
			</body>

	
</html>
