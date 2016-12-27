package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CustomerOrderVO;
import util.Manager;

public class CustomerOrderDAO {
	private CustomerOrderDAO() {
		
	}
	
	private static CustomerOrderDAO instance = new CustomerOrderDAO();
	
	public static CustomerOrderDAO getInstance() {
		return instance;
	} // getInstance()
	
	// 상세 페이지를 호출합니다.
	public CustomerOrderVO getBoardView(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM customerorderboard WHERE customerorder_number= ?";
		
		CustomerOrderVO coVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				coVo = new CustomerOrderVO();
				coVo.setCustomerorder_number(rs.getInt("customerorder_number"));
				coVo.setCustomerorder_id(rs.getString("customerorder_id"));
				coVo.setCustomerorder_name(rs.getString("customerorder_name"));
				coVo.setCustomerorder_subject(rs.getString("customerorder_subject"));
				coVo.setCustomerorder_content(rs.getString("customerorder_content"));
				coVo.setCustomerorder_file(rs.getString("customerorder_file"));
				coVo.setCustomerorder_re_ref(rs.getInt("customerorder_re_ref"));
				coVo.setCustomerorder_re_lev(rs.getInt("customerorder_re_lev"));
				coVo.setCustomerorder_re_seq(rs.getInt("customerorder_re_seq"));
				coVo.setCustomerorder_readcount(rs.getInt("customerorder_readcount"));
				coVo.setCustomerorder_regdate(rs.getTimestamp("customerorder_regdate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return coVo;
	} // getBoardView()
	
	// 고객센터 주문관련 게시물의 전체 개수를 추출합니다.
	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM customerorderboard";
		
		int result = -1;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println("result : "+result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return result;
	} // getListCount
	
	//
	public List<CustomerOrderVO> selectAllBoardList(int page, int limit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM ("
				+ "SELECT ROWNUM RNUM, "
				+ "customerorder_number, customerorder_id, customerorder_name, "
				+ "customerorder_subject, customerorder_content, customerorder_file, "
				+ "customerorder_re_ref, customerorder_re_lev, customerorder_re_seq, "
				+ "customerorder_readcount, customerorder_regdate FROM (SELECT * FROM customerorderboard ORDER BY customerorder_re_ref DESC, customerorder_re_seq ASC)) WHERE RNUM >= ? and RNUM <= ?";
		
		int  startRow = (page -1) * 10 + 1; // 읽기 시작할 행(ROW) 번호
		System.out.println("startRow : "+startRow);
		
		int endRow = startRow + limit - 1; // 읽을 마지막 행(ROW) 번호
		System.out.println("endRow : "+endRow);
		
		CustomerOrderVO coVo = null;
		List<CustomerOrderVO> list = new ArrayList<CustomerOrderVO>();
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coVo = new CustomerOrderVO();
				coVo.setCustomerorder_number(rs.getInt("customerorder_number"));
				coVo.setCustomerorder_id(rs.getString("customerorder_id"));
				coVo.setCustomerorder_name(rs.getString("customerorder_name"));
				coVo.setCustomerorder_subject(rs.getString("customerorder_subject"));
				coVo.setCustomerorder_content(rs.getString("customerorder_content"));
				coVo.setCustomerorder_file(rs.getString("customerorder_file"));
				coVo.setCustomerorder_re_ref(rs.getInt("customerorder_re_ref"));
				coVo.setCustomerorder_re_lev(rs.getInt("customerorder_re_lev"));
				coVo.setCustomerorder_re_seq(rs.getInt("customerorder_re_seq"));
				coVo.setCustomerorder_readcount(rs.getInt("customerorder_readcount"));
				coVo.setCustomerorder_regdate(rs.getTimestamp("customerorder_regdate"));
				
				list.add(coVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		System.out.println("list : "+list);
		return list;
	} // selectAllBoardList()
	
	// 고객센터 주문관련 게시물을 등록합니다.
	public CustomerOrderVO insertBoard(CustomerOrderVO coVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CustomerOrderVO board = new CustomerOrderVO();
		
		int number = 0;
		int result = 0;
		
		String sql ="";
		
		try {
			sql = "SELECT MAX(customerorder_number) FROM customerorderboard";
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("rs : "+rs);
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			System.out.println("number : "+ number);
			
			sql = "INSERT INTO customerorderboard VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, coVo.getCustomerorder_id());
			pstmt.setString(3, coVo.getCustomerorder_name());
			pstmt.setString(4, coVo.getCustomerorder_subject());
			pstmt.setString(5, coVo.getCustomerorder_content());
			pstmt.setString(6, coVo.getCustomerorder_file());
			pstmt.setInt(7, number);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		System.out.println("coVo : "+coVo);
		return coVo;
	} // insertBoard()
}
