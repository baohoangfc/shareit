package controller.Public;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import model.bean.News;
import model.dao.CategoryDao;
import model.dao.NewsDao;


public class IndexDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;  
    private CategoryDao categoryDao;
   
    public IndexDetailController() {
        super();
        newsDao = new NewsDao();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int did = 0;
		try {
			did = Integer.parseInt(request.getParameter("did"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"?err=1");
			return;
		}
		
		News itemById = newsDao.getItemNewsById(did);
		request.setAttribute("itemById", itemById);
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		request.setAttribute("listNewsSide", newsDao.getListNewsSide());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/chitiet.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
