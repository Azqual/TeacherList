<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>管理员主页面</title>
</head>
<body>
	<center>
		<%
			String username = null;
			session = request.getSession(false);
			if (session != null)
				username = (String) session.getAttribute("username");
			if (username != null) {
				out.println("用户登录成功，欢迎您：" + username);
		%>
		<h2>校内教师名录</h2>
		<table width="80%">
			<tr>
				<td><a href="TeacherAdd.jsp">添加教师信息</a></td>
				<td><a href="AdminPasswordModify.jsp">修改管理员登录密码</a></td>
				<td><a href="Logout.jsp">管理员注销</a></td>
			</tr>
			<tr>
				<td><a href="Teacher.jsp">查看校内所有教师信息</a></td>
				<td><a href="TeacherQuery.jsp">模糊搜索</a></td>
			</tr>
		</table>
		<%
			} else {
				out.println("请先登录");
		%>
		<p>
		<center>
				<td><a href="AdminLogin.jsp">登录</a></td>
				<p>
				<td><a href="index.jsp">回到主页</a></td>
		</center>
	<%
		}
	%>
	</center>
</body>
</html>