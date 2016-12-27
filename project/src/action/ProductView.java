package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductVO;

public class ProductView implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "";
		
		String pseq = request.getParameter("pseq").trim();
		System.out.println("pseq : "+pseq);
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVo = new ProductVO();
		
		pVo = pDao.getProduct(pseq);
		System.out.println("[ProductView.java] pVo : "+pVo);
		
		if(pVo != null) {
			System.out.println("[ProductView.java] ��ǰ��ȣ�� �� �������� ȣ���ϴµ� �����Ͽ����ϴ�");
			
			request.setAttribute("product", pVo);
			
			url = "/front/html/product/view.jsp";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
