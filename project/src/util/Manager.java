package util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Manager {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle"); // jdbc/myoracle�̶� �̸��� �������ִ� ��ü�� ã�Ƽ� DataSource�� �޽��ϴ�.
			conn = ds.getConnection(); // ds�� �����Ǿ����Ƿ� Connection�� �����մϴ�.
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	} // getConnection()
	
	// SELECT ���� ���� �� RESOURCE ������ ���� �޼���
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn != null) {
				conn.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(rs != null) {
				rs.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // SELECT close()
	
	// INSERT, UPDATE, DELETE ���� ���� �� RESOURCE ������ ���� �޼���
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(conn != null) {
				conn.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // INSERT, UPDATE, DELETE close()
}
