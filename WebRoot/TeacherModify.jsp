<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<title>修改教师信息</title>
</head>
<body>
	<h1 align="center">修改教师信息</h1>
	<%
		ArrayList dept_list = null;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
		DatabaseManage dm = new DatabaseManage();
		Connection con = null;
		ResultSet rs = null;
		con = dm.getConnection();
		String sql = "select * from teacher where teacher_id='" + teacher_id + "'";
		if (con != null) {
			rs = dm.executeQuery(sql);
			rs.absolute(1);
		}
	%>
	<%
		String username = null;
		session = request.getSession(false);
		if (session != null)
			username = (String) session.getAttribute("username");
		if (username != null) {
			out.println("用户登录成功，欢迎您：" + username);
	%>
	<center>
		<form id="teachermodify" name="teachermodify" method="post"
			action="servlet/TeacherModiServlet">
			<table>
				<tr>
					<td align=right>编号：</td>
					<td><input name="teacher_id" type="text"
						value=<%=rs.getInt(1)%> readonly></td>
				</tr>
				<tr align=right>
					<td align=right>教师姓名：</td>
					<td><input name="teacher_name" type="text"
						value=<%=rs.getString(2)%>></td>
				</tr>
				<tr>
					<td align=right>所在学院：</td>
					<td><select id="dept_father" name="teacher_dept_father_id"
						title="所在学院" onchange="fatherDeptOnChange()">

							<%
								DatabaseManage dm2 = new DatabaseManage();
									Connection con2 = null;
									ResultSet rs2 = null;
									con2 = dm2.getConnection();
									String sql2 = "select * from department";
									ResultSet father_dept = null;
									String sql_father_dept = "select father_id from department where dept_id='" + rs.getString(3) + "'";
									if (con2 != null) {
										rs2 = dm2.executeQuery(sql2);
										father_dept = dm2.executeQuery(sql_father_dept);
									}
									String father_id = null;
									try {

										if (father_dept != null && father_dept.next()) {
											father_dept.beforeFirst();
											while (father_dept.next())
												father_id = father_dept.getString(1);
										}
										if (rs2 != null && rs2.next()) {
											rs2.beforeFirst();
											dept_list = new ArrayList();
											while (rs2.next()) {
												ArrayList list = new ArrayList();
												list.add(rs2.getString("dept_id"));
												list.add(rs2.getString("dept_name"));
												list.add(rs2.getString("father_id"));
												dept_list.add(list);
												if (rs2.getString("father_id").equals("0")) {
													out.println("<option value = \"" + rs2.getString("dept_id") + "\"");
													if (rs2.getString("dept_id").equals(father_id)) {
														out.println(" selected ");
													}
													out.println(">" + rs2.getString("dept_name") + "</option>");
												}
											}
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
							%>

					</select></td>
				</tr>
				<tr>
					<td align=right>所在系：</td>
					<td><select id="teacher_dept_id" name="teacher_dept_id"
						title="所在系">
							<%
								rs2.beforeFirst();
									while (rs2.next()) {
										if (rs2.getString("father_id").equals(father_id)) {
											out.println("<option value = \"" + rs2.getString("dept_id") + "\"");
											if (rs2.getString("dept_id").equals(rs.getString(3))) {
												out.println(" selected ");
											}
											out.println(">" + rs2.getString("dept_name") + "</option>");

										}
									}
							%>
					</select></td>
				</tr>
				<tr>
					<td align=right>职称：</td>
					<td><input name="teacher_title" type="text"
						value=<%=rs.getString(4)%>></td>
				</tr>
				<tr>
					<td align=right>办公电话号码：</td>
					<td><input name="teacher_tel" type="text"
						value=<%=rs.getString(5)%>></td>
				</tr>
				<tr>
					<td align=right>办公地址：</td>
					<td><input name="teacher_address" type="text"
						value=<%=rs.getString(6)%>></td>
				</tr>
				<tr>
					<td align=right>电子邮件：</td>
					<td><input name="teacher_email" type="text"
						value=<%=rs.getString(7)%>></td>
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
		}
	%>
	<%
		dm.close();
	%>
</body>
<script language="javascript">
  	function fatherDeptOnChange() {
  		var father_dept_id = document.getElementById("dept_father").value;
  		var dept_select=document.getElementById("teacher_dept_id");
		dept_select.options.length=0; // 清空
		<%int len = 0;
			if (dept_list != null)
				len = dept_list.size();
			for (int i = 0; i < len; i++) {
				ArrayList list = (ArrayList) dept_list.get(i);
				String dept_id = (String) list.get(0);
				String dept_name = (String) list.get(1);
				String father_id = (String) list.get(2);%>
			if(father_dept_id==<%=father_id%>){
				dept_select.options.add(new Option("<%=dept_name%>","<%=dept_id%>"));
			}
		<%}%>
  	}
  </script>
</html>
