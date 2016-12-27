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
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle"); // jdbc/myoracle이란 이름을 가지고있는 객체를 찾아서 DataSource가 받습니다.
			conn = ds.getConnection(); // ds가 생성되었으므로 Connection을 추출합니다.
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	} // getConnection()
	
	// SELECT 문을 수행 후 RESOURCE 해제를 위한 메서드
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
	
	// INSERT, UPDATE, DELETE 문을 수행 후 RESOURCE 해제를 위한 메서드
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
