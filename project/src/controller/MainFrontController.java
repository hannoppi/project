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
import action.MainAction;

/**
 * Servlet implementation class MainFrontController
 */
@WebServlet("/MainFrontController")
public class MainFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainFrontController() {
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
		
		if(command.equals("/index.do")) {
			action = new MainAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// forward = new ActionForward();
			// forward.setRedirect(false);
			// forward.setPath("/front/html/main/main.jsp");
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
