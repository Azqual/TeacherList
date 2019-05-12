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
			System.out.println("��������ʧ��!" + e);
		}
	}

	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("���ݿ�����ʧ��!");
		}
		return conn;
	}

	public ResultSet executeQuery(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("��ѯ�ɹ�");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rs == null) {
			System.out.println("ִ�в�ѯ����ʧ�ܣ�");
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
			System.out.println("ִ��ʧ�ܣ�");
			result = 0;
		}
		return result;// ִ��Ӱ�������
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
