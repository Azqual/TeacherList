<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="databasemanage.DatabaseManage"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<title>添加教师信息页面</title>
</head>
<body onload="fatherDeptOnChange()">
	<h1 align="center">添加教师基本信息</h1>

	<center>
		<%
		ArrayList dept_list = null;
		String username = null;
		session = request.getSession(false);
		if (session != null)
			username = (String) session.getAttribute("username");
		if (username != null) {
			out.println("用户登录成功，欢迎您：" + username);
		%>
		<p>
		<form id="teacheradd" name="teacheradd" method="post"
			action="servlet/TeacherAddServlet">
			<table>
				<tr>
					<td align=right>教师姓名：</td>
					<td><input name="teacher_name" type="text" title="教师姓名" /></td>
				</tr>
				<tr>
					<td align=right>所在学院：</td>
					<td><select id="dept_father" name="teacher_dept_father_id"
						title="所在学院" onchange="fatherDeptOnChange()">

							<%
								DatabaseManage dm = new DatabaseManage();
									Connection con = null;
									ResultSet rs = null;
									con = dm.getConnection();
									String sql = "select * from department";
									if (con != null) {
										rs = dm.executeQuery(sql);
									}
									try {
										if (rs != null && rs.next()) {
											rs.beforeFirst();
											dept_list = new ArrayList();
											while (rs.next()) {
												ArrayList list = new ArrayList();
												list.add(rs.getString("dept_id"));
												list.add(rs.getString("dept_name"));
												list.add(rs.getString("father_id"));
												dept_list.add(list);
												if (rs.getString("father_id").equals("0"))
													out.println("<option value = \"" + rs.getString("dept_id") + "\">"
															+ rs.getString("dept_name") + "</option>");
											}
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
									dm.close();
							%>

					</select></td>
				</tr>
				<tr>
					<td align=right>所在系：</td>
					<td><select id="teacher_dept_id" name="teacher_dept_id"
						title="所在系">
					</select></td>
				</tr>
				<tr>
					<td align=right>职称：</td>
					<td><input name="teacher_title" type="text" title="职称" /></td>
				</tr>
				<tr>
					<td align=right>办公电话号码：</td>
					<td><input name="teacher_tel" type="text" title="办公电话号码" /></td>
				</tr>
				<tr>
					<td align=right>办公地址：</td>
					<td><input name="teacher_address" type="text" title="办公地址" />
					</td>
				</tr>
				<tr>
					<td align=right>电子邮件：</td>
					<td><input name="teacher_email" type="text" title="电子邮件" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="确认添加"/ >
					</td>
				</tr>
			</table>
		</form>
		<form name="getCascadeDept" action="TeacherAdd.jsp"
			id="getCascadeDept" mothed="post" />
		<input id="fatherDept" type="hidden" name="fatherDept">
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
	%>
</body>
<script language="javascript">
  	function fatherDeptOnChange() {
  		var father_dept_id = document.getElementById("dept_father").value;
  		var dept_select=document.getElementById("teacher_dept_id");
		dept_select.options.length=0; //清空选择栏
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