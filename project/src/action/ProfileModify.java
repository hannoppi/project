package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberVO;

public class ProfileModify implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		System.out.println("id : "+id);
		
		String password = request.getParameter("password");
		System.out.println("password : "+password);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = new MemberVO();
		
		mVo = mDao.inquiryMember(id, password);
		
		request.setAttribute("member", mVo);
		System.out.println("[ProfileModify] member : "+mVo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/front/html/member/modify.jsp");
		
		return forward;
	}
}
