<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>教师名录查询页面</title>
</head>
<body>
	<h1 align="center">教师查询（模糊查询）</h1>
	<center>
		<form id="teacherquery" name="teacherquery" method="post"
			action="TeacherQueryResult.jsp">
			<table>
				<tr>
					<td>教师姓名：</td>
					<td><input name="teacher_name" type="text" title="教师姓名" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="查询"/ ></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>