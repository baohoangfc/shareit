package controller.News;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.AuthUtil;
import model.bean.Category;
import model.bean.News;
import model.dao.CategoryDao;
import model.dao.NewsDao;

public class AdminDelNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;
    private NewsDao newsDao;

    public AdminDelNewsController() {
        super();
        categoryDao = new CategoryDao();
        newsDao = new NewsDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		final String path = request.getServletContext().getRealPath("/files");
		
		String idNews = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idNews);
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
		News itemNews = newsDao.getItem(id);
		
		if(itemNews == null){
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
		
		News item = new News(id, "", "", "", "", null, 0, "", 0, 0, 0);
		
		String urlFileDel = path + File.separator + newsDao.getItem(id).getPicture();
		File delFile = new File(urlFileDel);
		
		if(newsDao.delItem(id) > 0){
			if(delFile.isFile() && delFile.exists()){
				delFile.delete();
			}
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=2");
			return;
		} else{
			response.sendRedirect(request.getContextPath()+"/admin-news?err=2");
			return;
		}
	}

}
