<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>修改管理员登录密码</title>
</head>
<body>
	<h1 align="center">修改管理员登录密码</h1>
	<center>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		DatabaseManage dm = new DatabaseManage();
		Connection con = null;
		ResultSet rs = null;
		con = dm.getConnection();
		String username = null;
		session = request.getSession(false);
		if (session != null)
			username = (String) session.getAttribute("username");
		if (username != null) {
			out.println("用户登录成功，欢迎您：" + username);
	%>
	</center>
	<p>
	<center>
		<form id="adminpasswordmodify" name="adminpasswordmodify"
			method="post" action="servlet/AdminPasswordModiServlet">
			<table>
				<tr align=right>
					<td align=right>用户名：</td>
					<td><input name="username" type="text" value="<%=username%>"
						readonly></td>
				</tr>
				<tr align=right>
					<td align=right>新密码：</td>
					<td><input name="password" type="text" value=""></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="修改"/ ></td>
				</tr>
			</table>
		</form>
	</center>
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
		dm.close();
	%>
</body>
</html>
