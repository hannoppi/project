package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CartVO;
import util.Manager;

public class CartDAO {
	private CartDAO() {
		
	}
	
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		return instance;
	} // getInstance()
	
	// 장바구니 등록
	public int insertCart(CartVO cartVO) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		String sql ="INSERT INTO cart(cseq, id, pseq, quantity) VALUES(cart_seq.nextval, ?, ?, ?)";
		
		int result = -1;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartVO.getId());
			pstmt.setInt(2, cartVO.getPseq());
			pstmt.setInt(3, cartVO.getQuantity());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt);
		}

		return result;
	} // insertCart()
	
	// 장바구니 목록
	public ArrayList<CartVO> listCart(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM cart_view WHERE id = ? ORDER BY cseq DESC";
		
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		CartVO cartVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cartVo = new CartVO();
				cartVo.setCseq(rs.getInt("cseq"));
				cartVo.setId(rs.getString("id"));
				cartVo.setPseq(rs.getInt("pseq"));
				cartVo.setMname(rs.getString("mname"));
				cartVo.setPname(rs.getString("pname"));
				cartVo.setQuantity(rs.getInt("quantity"));
				cartVo.setPrice2(rs.getInt("price2"));
				cartVo.setIndate(rs.getTimestamp("indate"));
				
				cartList.add(cartVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return cartList;
	} //listCart()
	
	// 장바구니 삭제
	public int deleteCart(int cseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE cart WHERE cseq = ?";
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt);
		}
		
		
		int result = -1;
		
		return result;
	}
	
}
