package controller.Public;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import model.dao.CategoryDao;
import model.dao.NewsDao;


public class IndexPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;
    private CategoryDao categoryDao;
   
    public IndexPublicController() {
        super();
        newsDao = new NewsDao();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sumNews = newsDao.countNews();
		int sumPage = (int)Math.ceil((float)sumNews/Define.ROW_COUNT_ADMIN);
		int current_page = 1;
		request.setAttribute("sumPage", sumPage);
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));		
		}
		
		int offset = (current_page -1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("current_page", current_page);
		
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		request.setAttribute("listNewsBreaking", newsDao.getListNews());
		request.setAttribute("listNewsSide", newsDao.getListNewsSide());
		request.setAttribute("listNewsSlide", newsDao.getListNewsSlide());
		request.setAttribute("listNews", newsDao.getListNewsPagination(offset));
		
		RequestDispatcher rd = request.getRequestDispatcher("/trangchu.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
