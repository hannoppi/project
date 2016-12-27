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
import cart.CartAddAction;
import cart.CartDeleteAction;
import cart.CartListAction;

/**
 * Servlet implementation class CartFrontController
 */
@WebServlet("/CartFrontController")
public class CartFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartFrontController() {
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
		
		if(command.equals("/CartList.co")) {
			action = new CartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CartAddAction.co")) {
			action = new CartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CartDeleteAction.co")) {
			action = new CartDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("sendRedirect ���");
				
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("dispatcher ���");
				
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
