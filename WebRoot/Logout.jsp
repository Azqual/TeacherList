<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>管理员主页面</title>
</head>
<body>
	<center>
		<%
			session = request.getSession();
			//手工调用session.invalidate方法，摧毁session
			session.invalidate();
		%>
		<h2>管理员注销成功！</h2>
		<center>
				<td><a href="AdminLogin.jsp">重新登录</a></td>
				<p>
				<td><a href="index.jsp">回到主页</a></td>
		</center>
</body>
</html>