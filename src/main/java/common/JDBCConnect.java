package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBCConnect {
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBCConnect(ServletContext application) {
		try {
			
			String driver = application.getInitParameter("MysqlDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("MysqlURL");
			String id = application.getInitParameter("MysqlUSER");
			String pw = application.getInitParameter("MysqlPW");
			
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("success DB connect");
			
		} catch (ClassNotFoundException cNotFound) {
			cNotFound.printStackTrace();
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
	}
	
	public void close() {
		
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("JDBC 자원 해제");
	}
	
}
