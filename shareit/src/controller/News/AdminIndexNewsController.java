package controller.News;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import library.AuthUtil;
import model.bean.Category;
import model.dao.CategoryDao;
import model.dao.NewsDao;

public class AdminIndexNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;

    public AdminIndexNewsController() {
        super();
        newsDao = new NewsDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		int sumNews = newsDao.countNews();
		int sumPage = (int)Math.ceil((float)sumNews/Define.ROW_COUNT_ADMIN);
		int current_page = 1;
		request.setAttribute("sumPage", sumPage);
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));		
		}
		
		int offset = (current_page -1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("current_page", current_page);
		
		
		
		request.setAttribute("listNews", newsDao.getListNewsPagination(offset));
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/indexNews.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
