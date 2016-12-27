package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerOrderDAO;
import dto.CustomerOrderVO;

public class OrderListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String url = "";
		
		CustomerOrderDAO coDao = CustomerOrderDAO.getInstance();
		List<CustomerOrderVO> list = new ArrayList<CustomerOrderVO>();
		
		int page = 1; // ���� ������
		int limit = 5; // ȭ�鿡 ������ �Խù� ����
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); // ���� �������� ����
		}
		
		int listCount = coDao.getListCount(); // ��ü ����� �����մϴ�.
		System.out.println("listCount : "+listCount);
		
		list = coDao.selectAllBoardList(page, limit);
		System.out.println("list : "+list);
		
		// �� ������ ��
		int maxpage = (int) ((double) listCount / limit + 0.95);
		
		// ����¡ ������ �����.(���� �������� ������ ���� ������ ����(1, 11, 21))
		int startpage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;
		
		// ����¡ ����(���� �������� ������ ������ ������ ��(10, 20, 30)) [5������]
		int endpage = startpage + 5 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		if(list == null) {
			System.out.println("��� �ҷ����⿡ �����Ͽ����ϴ�.");
			
		} else {
			System.out.println("��� �ҷ����⿡ �����Ͽ����ϴ�.");
			System.out.println("�� listCount : "+listCount);
			System.out.println("�� page : "+page);
			System.out.println("�� maxpage : "+maxpage);
			System.out.println("�� startpage : "+startpage);
			System.out.println("�� endpage : "+endpage);
			
			request.setAttribute("orderBoardList", list);
			request.setAttribute("listCount", listCount);
			request.setAttribute("page", page);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			
			url = "/front/html/board/customer/order/list.jsp";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
