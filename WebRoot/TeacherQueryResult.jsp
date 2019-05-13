<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>查询结果</title>
</head>
<body>
	<h1 align="center">查询结果</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String teacher_name = request.getParameter("teacher_name");
		DatabaseManage dm = new DatabaseManage();
		Connection con = null;
		ResultSet rs = null;
		boolean adminLoggedIn = false;
		String username = null;
		session = request.getSession(false);
		if (session != null)
			username = (String) session.getAttribute("username");
		if (username != null)
			adminLoggedIn = true;
		con = dm.getConnection();
		String sql = "select * from teacher,department where dept_id=teacher_dept_id and teacher_name like '%" + teacher_name + "%'";
		if (con != null) {
			rs = dm.executeQuery(sql);
		}
		try {
			if (rs != null && rs.next()) {
				out.println("<table width=100% border=1 cellspacing=0>");
				out.println("<tr>");
				out.println("<th>编号</th>");
				out.println("<th>教师姓名</th>");
				out.println("<th>所在系</th>");
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
					out.println("<td>" + rs.getString("dept_name") + "</td>");
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
				out.println("<p><center><a href=\"index.jsp\">返回主页</a></center>");
			}
			else{
				out.println("<p>");
				out.println("<h3 align=\"center\">查无此人</h3>");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dm.close();
	%>
</body>
</html>
