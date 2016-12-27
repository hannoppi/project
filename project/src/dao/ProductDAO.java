package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ProductVO;
import util.Manager;

public class ProductDAO {
	private ProductDAO() {
		
	}
	
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	} // getInstance()
	
	// 신상품 목록을 추출합니다.
	public ArrayList<ProductVO> newProductList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM new_pro_view";
		
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		ProductVO pVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pVo = new ProductVO();
				pVo.setPseq(rs.getInt("pseq"));
				pVo.setName(rs.getString("name"));
				// pVo.setKind(rs.getString("kind"));
				pVo.setPrice2(rs.getInt("price2"));
				pVo.setImage(rs.getString("image"));
				productList.add(pVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return productList;
	} // newProductList();
	
	// 베스트 상품 목록을 추출합니다.
	public ArrayList<ProductVO> bestProductList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM best_pro_view";
		
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		ProductVO pVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pVo = new ProductVO();
				pVo.setPseq(rs.getInt("pseq"));
				pVo.setName(rs.getString("name"));
				// pVo.setKind(rs.getString("kind"));
				pVo.setPrice2(rs.getInt("price2"));
				pVo.setImage(rs.getString("image"));
				
				System.out.println("pVo : "+pVo);
				
				productList.add(pVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return productList;
	} // bestProductList();
	
	// 상품번호로 해당 상품정보를 추출합니다.
	public ProductVO getProduct(String pseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product WHERE pseq = ?";
		
		ProductVO pVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pVo = new ProductVO();
				pVo.setPseq(rs.getInt("pseq"));
				pVo.setName(rs.getString("name"));
				pVo.setKind(rs.getString("kind"));
				pVo.setPrice1(rs.getInt("price1"));
				pVo.setPrice2(rs.getInt("price2"));
				pVo.setPrice3(rs.getInt("price3"));
				pVo.setContent(rs.getString("content"));
				pVo.setImage(rs.getString("image"));
				pVo.setUseyn(rs.getString("useyn"));
				pVo.setBestyn(rs.getString("bestyn"));
				pVo.setIndate(rs.getTimestamp("indate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return pVo;
	} // getProduct()
	
	// 상품종류별 상품 목록을 추출합니다.
	public ArrayList<ProductVO> kindProductList(String kind) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product WHERE kind = ?";
		
		ArrayList<ProductVO> kindProductList = new ArrayList<ProductVO>();
		ProductVO pVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pVo = new ProductVO();
				pVo.setPseq(rs.getInt("pseq"));
				pVo.setName(rs.getString("name"));
				pVo.setKind(rs.getString("kind"));
				pVo.setPrice1(rs.getInt("price1"));
				pVo.setPrice2(rs.getInt("price1"));
				pVo.setPrice3(rs.getInt("price3"));
				pVo.setContent(rs.getString("content"));
				pVo.setImage(rs.getString("image"));
				pVo.setUseyn(rs.getString("useyn"));
				pVo.setBestyn(rs.getString("bestyn"));
				pVo.setIndate(rs.getTimestamp("indate"));
				
				kindProductList.add(pVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return kindProductList;
	} // kindProductList()
}
