<%@ page language="java" import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>jxtxzzw 的数据库作业 - TeacherList</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>

<body>
	<center>
		<table width="80%">
			<tr>
				<td><a href="Teacher.jsp">查看校内所有教师信息</a></td>
				<td><a href="TeacherQuery.jsp">模糊搜索</a></td>
			</tr>
			<tr>
				<td><a href="AdminLogin.jsp">管理员登录</a></td>
			</tr>
		</table>
	</center>
</body>
</html>
