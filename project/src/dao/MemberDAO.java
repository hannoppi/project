package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberVO;
import util.Manager;

public class MemberDAO {
	private MemberDAO() {
		
	}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	} // getInstance()
	
	// 로그인
	public int memberLogin(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT member_password FROM member WHERE member_id = ?";
		
		int result = -1;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(password.equals(rs.getString("member_password"))) {
					System.out.println("로그인에 성공하였습니다.");
					
					result = 1;
				} else {
					System.out.println("비밀번호가 일치하지 않습니다.");
					
					result = 0;
				}
			} else {
				System.out.println("아이디가 존재하지 않습니다.");
				
				result = -1;
			}
			
		} catch (Exception e) {
			
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return result;
	} // memberLogin()
	
	public int updateMember(MemberVO mVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE member SET member_password= ?, member_birthday= ?, member_postcode= ?, "
				+ "member_address= ?, member_tel= ?, member_phone= ?, member_email= ? WHERE member_id= ?";
		
		int result = -1;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getMember_password());
			pstmt.setString(2, mVo.getMember_birthday());
			pstmt.setString(3, mVo.getMember_postcode());
			pstmt.setString(4, mVo.getMember_address());
			pstmt.setString(5, mVo.getMember_tel());
			pstmt.setString(6, mVo.getMember_phone());
			pstmt.setString(7, mVo.getMember_email());
			pstmt.setString(8, mVo.getMember_id());
			pstmt.executeUpdate();
			
			result = 1;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt);
		}
		
		return result;
	}
	
	// 회원정보 조회
	public MemberVO inquiryMember(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE member_id= ?";
		
		MemberVO mVo = null;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(id.equals(rs.getString("member_id")) && password.equals(rs.getString("member_password"))) {
					mVo = new MemberVO();
					mVo.setMember_name(rs.getString("member_name"));
					mVo.setMember_id(rs.getString("member_id"));
					mVo.setMember_birthday(rs.getString("member_birthday"));
					mVo.setMember_postcode(rs.getString("member_postcode"));
					mVo.setMember_address(rs.getString("member_address"));
					mVo.setMember_tel(rs.getString("member_tel"));
					mVo.setMember_phone(rs.getString("member_phone"));
					mVo.setMember_email(rs.getString("member_email"));
					mVo.setMember_admin(rs.getInt("member_admin"));
					mVo.setMember_regdate(rs.getTimestamp("member_regdate"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt, rs);
		}
		
		return mVo;
	} // inquiryMember()
	
	// 회원가입
	public int insertMember(MemberVO mVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		int result = -1;
		
		try {
			conn = Manager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getMember_name());
			pstmt.setString(2, mVo.getMember_id());
			pstmt.setString(3, mVo.getMember_password());
			pstmt.setString(4, mVo.getMember_birthday());
			pstmt.setString(5, mVo.getMember_postcode());
			pstmt.setString(6, mVo.getMember_address());
			pstmt.setString(7, mVo.getMember_tel());
			pstmt.setString(8, mVo.getMember_phone());
			pstmt.setString(9, mVo.getMember_email());
			pstmt.setInt(10, mVo.getMember_admin());
			pstmt.setTimestamp(11, mVo.getMember_regdate());
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Manager.close(conn, pstmt);
		}
		
		return result;
	} // insertMember()
}
