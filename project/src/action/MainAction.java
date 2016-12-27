package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductVO;

public class MainAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/front/html/main/main.jsp";
		
		int kind = 0;
		
		ProductDAO pDao = ProductDAO.getInstance();
		
		ArrayList<ProductVO> newProductList = pDao.newProductList();
		ArrayList<ProductVO> bestProductList = pDao.bestProductList();
		
		ArrayList<ProductVO> outerList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> topList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> bottomList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> skirtList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> onepieceList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> bag_shoesList = new ArrayList<ProductVO>();
		ArrayList<ProductVO> accessoryList = new ArrayList<ProductVO>();
		
		outerList = pDao.kindProductList("1");
		topList = pDao.kindProductList("2");
		bottomList = pDao.kindProductList("3");
		skirtList = pDao.kindProductList("4");
		onepieceList = pDao.kindProductList("5");
		bag_shoesList = pDao.kindProductList("6");
		accessoryList = pDao.kindProductList("7");
		
		request.setAttribute("newProductList", newProductList);
		request.setAttribute("bestProductList", bestProductList);
		System.out.println("bestProductList : "+bestProductList);
		
		request.setAttribute("outerList", outerList);
		request.setAttribute("topList", topList);
		request.setAttribute("bottomList", bottomList);
		request.setAttribute("skirtList", skirtList);
		request.setAttribute("onepieceList", onepieceList);
		request.setAttribute("bag_shoesList", bag_shoesList);
		request.setAttribute("accessoryList", accessoryList);
		
		request.setAttribute("kind", kind);
		System.out.println("¡Ú¡Ú kind : "+kind);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(url);
				
		return forward;
	}
}
