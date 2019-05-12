<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>删除教师信息</title>
</head>
<body>
	<h1 align="center">删除教师信息</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
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
			String sql = "delete from teacher where teacher_id='" + teacher_id + "'";
			if (con != null) {
				if (dm.executeUpdate(sql) > 0)
					out.println("删除成功");
				else
					out.println("删除失败");

			}
		} else {
			out.println("请先登录");
		}
		dm.close();
	%>
</body>
</html>
