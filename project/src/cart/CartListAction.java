package cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.CartDAO;
import dto.CartVO;
import dto.MemberVO;

public class CartListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/front/html/cart/list.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		System.out.println("[CartListAction.java] loginUser : "+loginUser);
		
		CartDAO cartDao = CartDAO.getInstance();
		// CartVO cartVo = new CartVO();
		
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		
		cartList = cartDao.listCart(loginUser.getMember_id());
		System.out.println("[CartListAction.java] cartList : "+cartList);
		
		int totalPrice = 0;
		
		for(CartVO cartVo : cartList) {
			totalPrice += cartVo.getPrice2() * cartVo.getQuantity();
		}
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("totalPrice", totalPrice);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
		
		return forward;
	}
}
