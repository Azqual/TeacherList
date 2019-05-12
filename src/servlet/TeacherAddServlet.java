package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import databasemanage.DatabaseManage;
import java.sql.*;
import java.math.BigDecimal;

public class TeacherAddServlet extends HttpServlet {
	public TeacherAddServlet() {
		super();
		
	}

	public void destroy() {
		super.destroy();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String teacher_name = request.getParameter("teacher_name");
		if (teacher_name.length()!=0) {
		int teacher_dept_id = Integer.parseInt(request.getParameter("teacher_dept_id"));
		String teacher_title = request.getParameter("teacher_title");
		String teacher_tel = request.getParameter("teacher_tel");
		String teacher_address = request.getParameter("teacher_address");
		String teacher_email = request.getParameter("teacher_email");
		DatabaseManage dm = new DatabaseManage();
		Connection con = dm.getConnection();
		int num = 0;
		int resultid=0;
		System.out.print(resultid);
		try {
			ResultSet rs=null;
			String sql="select max(teacher_id) as id from teacher;";
			if(con!=null){
				rs=dm.executeQuery(sql);
			}
			if(rs!=null){
				rs.next();
				String result=rs.getString("id");
				resultid=Integer.parseInt(result);
				resultid+=1;
			}
			System.out.print(resultid);
			PreparedStatement pstmt = con.prepareStatement("insert into teacher values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, resultid);
			pstmt.setString(2, teacher_name);
			pstmt.setInt(3, teacher_dept_id);
			pstmt.setString(4, teacher_title);
			pstmt.setString(5, teacher_tel);
			pstmt.setString(6, teacher_address);
			pstmt.setString(7, teacher_email);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (num == 0) {
			response.sendRedirect("../TeacherAddFailer.jsp");
		} else {
			response.sendRedirect("../TeacherAddSuccess.jsp");
		}
		dm.close();
		}
		else {
			response.sendRedirect("../TeacherAddFailer.jsp");
		}
	}

	public void init() throws ServletException {
		super.init();
	}
}
