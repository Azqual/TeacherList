package databasemanage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseManage {
	public String DBDRIVER = "com.mysql.jdbc.Driver";
	public String DBURL = "jdbc:mysql://localhost:3306/addresslist";
	public String DBUSER = "root";
	public String DBPASS = "2019";
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public DatabaseManage() {
		try {
			Class.forName(DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动加载失败!" + e);
		}
	}

	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("数据库连接失败!");
		}
		return conn;
	}

	public ResultSet executeQuery(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("查询成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rs == null) {
			System.out.println("执行查询操作失败！");
		}
		return rs;
	}

	public int executeUpdate(String sql) {
		int result = 0;
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("执行失败！");
			result = 0;
		}
		return result;// 执行影响的行数
	}

	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
