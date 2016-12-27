package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerOrderDAO;
import dto.CustomerOrderVO;

public class OrderWriteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String url = "";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String file = request.getParameter("file");
		
		CustomerOrderDAO coDao = CustomerOrderDAO.getInstance();
		CustomerOrderVO coVo = new CustomerOrderVO();
		coVo.setCustomerorder_id(id);
		coVo.setCustomerorder_name(name);
		coVo.setCustomerorder_subject(subject);
		coVo.setCustomerorder_content(content);
		coVo.setCustomerorder_file(file);
		
		coVo = coDao.insertBoard(coVo);
		System.out.println("coVo : "+coVo);
		
		if(coVo == null) {
			System.out.println("게시물 등록에 실패하였습니다.");
			
			url = "/OrderWrite.help";
			
			return null;
		} else {
			System.out.println("게시물 등록에 성공하였습니다.");
			
			request.setAttribute("board", coVo);
			
			// url = "/OrderView.help?num="+coVo.getCustomerorder_number();
			url = "/OrderViewCheck.help";
			System.out.println("[OrderWriteAction.java] url : " + url);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
