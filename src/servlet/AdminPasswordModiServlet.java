package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import databasemanage.DatabaseManage;
import java.sql.*;

public class AdminPasswordModiServlet extends HttpServlet {
	public AdminPasswordModiServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		DatabaseManage dm = new DatabaseManage();
		Connection con = dm.getConnection();
		int num = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement("update user set password=? where username=?");
			pstmt.setString(1, password);
			pstmt.setString(2, username);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (num == 0) {
			response.sendRedirect("../AdminPasswordModiFailer.jsp");
		} else {
			response.sendRedirect("../AdminPasswordModiSuccess.jsp");
		}
		dm.close();
	}

	public void init() throws ServletException {
		super.init();
	}
}
