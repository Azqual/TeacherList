package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import databasemanage.DatabaseManage;
import java.sql.*;

public class TeacherModiServlet extends HttpServlet {
	public TeacherModiServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
		String teacher_name = request.getParameter("teacher_name");
		int teacher_dept_id = Integer.parseInt(request.getParameter("teacher_dept_id"));
		String teacher_title = request.getParameter("teacher_title");
		String teacher_tel = request.getParameter("teacher_tel");
		String teacher_address = request.getParameter("teacher_address");
		String teacher_email = request.getParameter("teacher_email");
		DatabaseManage dm = new DatabaseManage();
		Connection con = dm.getConnection();
		int num = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement(
					"update teacher set teacher_name=?,teacher_dept_id=?,teacher_title=?,teacher_tel=?,teacher_address=?,teacher_email=? where teacher_id=?");
			pstmt.setString(1, teacher_name);
			pstmt.setInt(2, teacher_dept_id);
			pstmt.setString(3, teacher_title);
			pstmt.setString(4, teacher_tel);
			pstmt.setString(5, teacher_address);
			pstmt.setString(6, teacher_email);
			pstmt.setInt(7, teacher_id);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (num == 0) {
			response.sendRedirect("../TeacherModiFailer.jsp");
		} else {
			response.sendRedirect("../TeacherModiSuccess.jsp");
		}
		dm.close();
	}

	public void init() throws ServletException {
		super.init();
	}
}
