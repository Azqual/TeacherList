<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>教师信息管理</title>
</head>
<body>
	<h1 align="center">教师信息管理</h1>
	<center>
		<%
			boolean adminLoggedIn = false;
			String username = null;
			session = request.getSession(false);
			if (session != null)
				username = (String) session.getAttribute("username");
			if (username != null)
				adminLoggedIn = true;
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			DatabaseManage dm = new DatabaseManage();
			Connection con = null;
			ResultSet rs = null;
			con = dm.getConnection();
			String sql = "select * from (teacher join department as d1 on teacher_dept_id = dept_id) join department as d2 on d1.father_id = d2.dept_id";
			if (con != null) {
				rs = dm.executeQuery(sql);
			}
			try {
				if (rs != null && rs.next()) {
					out.println("<table width=100% border=1 cellspacing=0>");
					out.println("<tr>");
					out.println("<th>编号</th>");
					out.println("<th>教师姓名</th>");
					out.println("<th>学院</th>");
					out.println("<th>系</th>");
					out.println("<th>职称</th>");
					out.println("<th>办公电话号码</th>");
					out.println("<th>办公地址</th>");
					out.println("<th>电子邮件</th>");
					if (adminLoggedIn) {
						out.println("<th>操作</th>");
					}
					out.println("</tr>");
					rs.beforeFirst();
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString("teacher_id") + "</td>");
						out.println("<td>" + rs.getString("teacher_name") + "</td>");
						out.println("<td>" + rs.getString("d2.dept_name") + "</td>");
						out.println("<td>" + rs.getString("d1.dept_name") + "</td>");
						out.println("<td>" + rs.getString("teacher_title") + "</td>");
						out.println("<td>" + rs.getString("teacher_tel") + "</td>");
						out.println("<td>" + rs.getString("teacher_address") + "</td>");
						out.println("<td>" + rs.getString("teacher_email") + "</td>");
						if (adminLoggedIn) {
							out.println("<td><a href=" + "TeacherModify.jsp?teacher_id=" + rs.getString("teacher_id")
									+ ">修改</a>");
							out.println("<a href=" + "TeacherDelete.jsp?teacher_id=" + rs.getString("teacher_id")
									+ ">删除</a></td>");
						}
						out.println("</tr>");
					}
					out.println("</table>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			dm.close();
		%>
		<br> <br>
		<%
			if (adminLoggedIn) {
		%>
		<a href="AdminMain.jsp">返回</a>
		<%
			} else {
		%>
		<a href="index.jsp">返回</a>
		<%
			}
		%>

	</center>
</body>
</html>
