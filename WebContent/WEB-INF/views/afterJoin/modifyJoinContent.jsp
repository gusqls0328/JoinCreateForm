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




<script type="text/javascript">





</script>

</head>

<body>

<%--
<%@ page import="com.mycompany.web.dao.JoinMemberDao" %>
<%@ page import="com.mycompany.web.dto.JoinMember" %>
<%@ page import="java.util.List" %>
--%>

<%--
	String mid = session.getAttribute("mid").toString();
--%>

	
	
	<%-- 
	
		String mid = session.getAttribute("mid").toString();
		JoinMemberDao joinMemberDao = JoinMemberDao.getInstance();
		JoinMember joinMember = joinMemberDao.getMid();
		
			<jsp:useBean id="JoinMember" class="com.mycompany.web.dto.JoinMember"/>
			<jsp:setProperty name="JoinMember" property="*"/>
	
	
		<% 
		
			JoinMemberDao joinMemberDao = JoinMemberDao.getInstance();
		
			joinMemberDao.showJoinMemberContent(JoinMember);
	
		%>
	
		
		
	--%>
	
	
	<form method="post" action="correctJoinContent">
		
		<div class="form-group">
			<label for="mname">이름</label>
			<input type="text" class="form-control" id="mname" name="mname" value="${joinMember.mname}"/>
		</div>
	
		<div class="form-group">
			<label for="mid">아이디</label>
			<input type="text" class="form-control" id="mid" name="mid" value="${joinMember.mid}" readonly/>
		</div>
		
		<div class="form-group">
			<label for="mpassword">비밀번호</label>
			<input type="password" class="form-control" id="mpassword" name="mpassword" value="${joinMember.mpassword}"/>
		</div>
		<!-- 
		<div class="form-group">
			<label for="mpassword2">비밀번호 확인하기</label>
			<input type="password" class="form-control" id="mpassword2" value="${joinMember.mpassword}"/>
		</div>
		 -->
		<input type="submit" class="btn btn-primary" value="수정하기"/>	
		<!-- <input type="submit" class="btn btn-primary" value="취소하기"/> -->
		
	</form>
	
	<form method="post" action="redirectToCongratulation">
		<button>취소하기</button>
	</form>
	
</body>
</html>