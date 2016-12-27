package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.CartDAO;

public class CartDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/CartList.co";
		
		String[] cseqArr = request.getParameterValues("cseq");
		
		for(String cseq:cseqArr) {
			System.out.println("cseq : "+cseq);
			
			CartDAO cartDAO = CartDAO.getInstance();
			cartDAO.deleteCart(Integer.parseInt(cseq));
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(url);
		
		return forward;
	}
}
