package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerOrderDAO;
import dto.CustomerOrderVO;

public class OrderView implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "";
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num : "+num);
		
		CustomerOrderDAO coDao = CustomerOrderDAO.getInstance();
		CustomerOrderVO coVo = new CustomerOrderVO();
		coVo = coDao.getBoardView(num);
		
		if(coVo == null) {
			System.out.println("�� �� ���� ������ �߻��Ͽ����ϴ�.");
		} else {
			System.out.println(num+"�� �Խù��� �����մϴ�.");
			request.setAttribute("board", coVo);
			System.out.println("board : "+coVo);
			
			url = "/front/html/board/customer/order/view.jsp";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
