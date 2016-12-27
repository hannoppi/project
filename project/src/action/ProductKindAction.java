package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductVO;

public class ProductKindAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url= "";
		
		String kind = request.getParameter("kind").trim();
		System.out.println("kind : "+kind);
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVo = new ProductVO();
		
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		productList = pDao.kindProductList(kind);
		
		request.setAttribute("kindProductList", productList);
		request.setAttribute("kind", kind);
		
		url = "/front/html/product/kind.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
