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
		
		int page = 1; // 시작 페이지
		int limit = 5; // 화면에 노출할 게시물 개수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); // 현재 페이지를 설정
		}
		
		int listCount = coDao.getListCount(); // 전체 목록을 추출합니다.
		System.out.println("listCount : "+listCount);
		
		list = coDao.selectAllBoardList(page, limit);
		System.out.println("list : "+list);
		
		// 총 페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		
		// 페이징 개수와 마춘다.(현재 페이지에 보여줄 시작 페이지 개수(1, 11, 21))
		int startpage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;
		
		// 페이징 개수(현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30)) [5페이지]
		int endpage = startpage + 5 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		if(list == null) {
			System.out.println("목록 불러오기에 실패하였습니다.");
			
		} else {
			System.out.println("목록 불러오기에 성공하였습니다.");
			System.out.println("☆ listCount : "+listCount);
			System.out.println("☆ page : "+page);
			System.out.println("☆ maxpage : "+maxpage);
			System.out.println("☆ startpage : "+startpage);
			System.out.println("☆ endpage : "+endpage);
			
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
