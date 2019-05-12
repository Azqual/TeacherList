<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>管理员登录页面</title>
</head>
<body>
	<h1 align="center">校内教师名录</h1>
	<center>
		<img src="images/login.jpg" width="600" height="200" />
		<form id="adminlogin" name="adminlogin" method="post"
			action="servlet/AdminLoginCheck">
			<table>
				<tr>
					<td>管理员名称：</td>
					<td><input name="adminname" type="text" title="管理员名称" /></td>
				</tr>
				<tr>
					<td>管理员密码：</td>
					<td><input name="password" type="password" title="管理员密码" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="登录"/ ></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>