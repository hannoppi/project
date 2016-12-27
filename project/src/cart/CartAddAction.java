package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.CartDAO;
import dto.CartVO;
import dto.MemberVO;

public class CartAddAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/CartList.co";
		
		int pseq= Integer.parseInt(request.getParameter("pseq"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		System.out.println("[CartListAction.java] loginUser : "+loginUser);
		
		CartDAO cartDao = CartDAO.getInstance();
		CartVO cartVo = new CartVO();
		cartVo.setId(loginUser.getMember_id());
		
		cartVo.setPseq(pseq);
		System.out.println("[CartAddAction.java] pseq : "+pseq);
		
		cartVo.setQuantity(quantity);
		System.out.println("[CartAddAction.java] quantity : "+quantity);
		
		int result = cartDao.insertCart(cartVo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(url);
		
		return forward;
	}
}
