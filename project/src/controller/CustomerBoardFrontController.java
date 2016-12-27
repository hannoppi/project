package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.OrderListAction;
import action.OrderView;
import action.OrderWriteAction;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("/BoardFrontController")
public class CustomerBoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerBoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String requestURI = request.getRequestURI();
		System.out.println("[ActionController.java] requestURI : "+requestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("[ActionController.java] contextPath : "+contextPath);
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("[ActionController.java] command : "+command);
		
		Action action = null;
		ActionForward forward = null;
		RequestDispatcher dispatcher = null;
		
		if(command.equals("/OrderList.help")) {
			action = new OrderListAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else  if(command.equals("/OrderWrite.help")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/front/html/board/customer/order/write.jsp");
		} else  if(command.equals("/OrderWriteAction.help")) {
			action = new OrderWriteAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else  if(command.equals("/OrderViewCheck.help")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/front/html/board/customer/order/view.jsp");
		} else  if(command.equals("/OrderView.help")) {
			action = new OrderView();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("sendRedirect 방식");
				
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("dispatcher 방식");
				
				dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
