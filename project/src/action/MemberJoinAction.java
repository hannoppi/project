package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberVO;

public class MemberJoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String url = "";
		
		String name = request.getParameter("name");
		System.out.println("name : "+name);
		
		String id = request.getParameter("id");
		System.out.println("id : "+id);
		
		String password = request.getParameter("password");
		System.out.println("password : "+password);
		
		String birthday = request.getParameter("birthday1") +"년 "+ request.getParameter("birthday2") +"월 "+ request.getParameter("birthday3")+"일";
		System.out.println("birthday : "+birthday);
		
		String postcode = request.getParameter("postcode1") +"-"+request.getParameter("postcode2");
		System.out.println("postcode : "+postcode);
		
		String address = request.getParameter("address");
		System.out.println("address : "+address);
		
		String tel = request.getParameter("tel1") +"-"+ request.getParameter("tel2") +"-"+ request.getParameter("tel3");
		System.out.println("tel : "+tel);
		
		String phone = request.getParameter("phone1") +"-"+ request.getParameter("phone2") +"-"+ request.getParameter("phone3");
		System.out.println("phone : "+phone);
		
		String email = request.getParameter("email1") +"@"+ request.getParameter("email2");
		System.out.println("email : "+email);
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		MemberVO mVo = new MemberVO();
		mVo.setMember_name(name);
		mVo.setMember_id(id);
		mVo.setMember_password(password);
		mVo.setMember_birthday(birthday);
		mVo.setMember_postcode(postcode);
		mVo.setMember_address(address);
		mVo.setMember_tel(tel);
		mVo.setMember_phone(phone);
		mVo.setMember_email(email);
		
		// List<MemberVO> list = new ArrayList<MemberVO>();
		int result = mDao.insertMember(mVo);
		
		MemberVO member = null;
		
		HttpSession session = request.getSession();
		
		if(result == 1) {
			System.out.println("회원가입에 성공하였습니다.");
			
			member = mDao.inquiryMember(id, password);
			
			session.setAttribute("loginUser", member);
			System.out.println("loginUser : "+member);
			
			url = "/MemberJoinResult.me";
		} else {
			System.out.println("회원가입에 실패하였습니다.");
			
			return null;
		}
		
		// if(list != 1) {
			// System.out.println("회원가입에 실패하였습니다.");
		// }
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
