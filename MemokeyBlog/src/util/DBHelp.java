package util;

import java.sql.*;

public class DBHelp {
	private String driverName = "com.mysql.jdbc.Driver";
	private String dbURL = "jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8";
	private String userName = "root";
//	private String driverName ="com.microsoft.jdbc.sqlserver.SQLServerDriver";
//	private String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=BOOKS";
//	private String userName = "sa";
	private String userPwd = "123456";

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public Connection getConnection() {
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, userName, userPwd);
			//System.out.println("Connection Successful!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;

	}

	public void closeAll(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		DBHelp dbhelp = new DBHelp();
		Connection conn = dbhelp.getConnection();
		System.out.println(conn);
	}

}