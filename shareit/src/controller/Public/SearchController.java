package controller.Public;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.News;
import model.dao.CategoryDao;
import model.dao.NewsDao;

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;
    private CategoryDao categoryDao;
    
    public SearchController() {
        super();
        newsDao = new NewsDao();
        categoryDao = new CategoryDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		
		News item = new News(0, search, "", "", "", null, 0, "", 0, 0, 0);
		
		ArrayList<News> listSearch = newsDao.getListSeach(item);
		request.setAttribute("listSearch", listSearch);
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		request.setAttribute("listNewsSide", newsDao.getListNewsSide());
		
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
