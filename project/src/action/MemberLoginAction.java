package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberVO;

public class MemberLoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "";
		
		String id = request.getParameter("id");
		System.out.println("id : "+id);
		
		String password = request.getParameter("password");
		System.out.println("password : "+password);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = null;
		
		int result = mDao.memberLogin(id, password);
		
		if(result == 1) {
			System.out.println("�α��ο� �����Ͽ����ϴ�.");
			
			mVo = new MemberVO();
			mVo = mDao.inquiryMember(id, password);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mVo);
			System.out.println("loginUser : "+mVo);
			
			url = "/index.do";
			
		} else if(result == 0) {
			System.out.println("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			
			url = "/Login";
		} else {
			System.out.println("���̵� �������� �ʽ��ϴ�.");
			
			url = "/Login";
		}
		
		// ActionForward forward = new ActionForward();
		// forward.setRedirect(false);
		// forward.setPath("/index.do");
		
		response.sendRedirect(url);
		
		return null;
	}
}
