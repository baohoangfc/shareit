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


public class IndexCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;
    private CategoryDao categoryDao;
   
    public IndexCatController() {
        super();
        newsDao = new NewsDao();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = 0;
		try {
			cid = Integer.parseInt(request.getParameter("cid"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/?err=0");
			return;
		}
		
		int sumNews = newsDao.countNewsById(cid);
		int sumPage = (int)Math.ceil((float)sumNews/Define.ROW_COUNT_ADMIN);
		int current_page = 1;
		request.setAttribute("sumPage", sumPage);
		// lấy trang hiện tại
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));
		}
		// tính offset 
		
		int offset = (current_page-1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("current_page", current_page);
		ArrayList<News> listNewsById = newsDao.getItemByIdPagination(cid,offset);
		request.setAttribute("listNewsById", listNewsById);
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		request.setAttribute("itemCat", categoryDao.getItem(cid));
		request.setAttribute("listNewsSide", newsDao.getListNewsSide());
		
		RequestDispatcher rd = request.getRequestDispatcher("/danhmuc.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
