package controller.News;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import library.AuthUtil;
import library.StringLibrary;
import model.bean.Category;
import model.bean.News;
import model.bean.User;
import model.dao.CategoryDao;
import model.dao.NewsDao;

@MultipartConfig
public class AdminEditNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;
    private NewsDao newsDao;

    public AdminEditNewsController() {
        super();
        categoryDao = new CategoryDao();
        newsDao = new NewsDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		
		request.setAttribute("listCat", categoryDao.getListCatPublic()); // dùng cho select dmt
		
		String idText = request.getParameter("id");
		int idNews = 0;
		try {
			idNews = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
		News objNews = newsDao.getItem(idNews);
		
		if(objNews != null){
			request.setAttribute("objNews", objNews);
			RequestDispatcher rd = request.getRequestDispatcher("/code/admin/editNews.jsp");
			rd.forward(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");		
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		final String path = request.getServletContext().getRealPath("/files");
		System.out.println(path);
		File dirPath = new File(path);
		if (!dirPath.exists()) {
				dirPath.mkdir();
		}
		
		int idNews = 0;
		try {
			idNews = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userLogin");
		
		String name = request.getParameter("tentin");
		
		int catId = 0;
		try {
			catId = Integer.parseInt(request.getParameter("danhmuc"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin-news");
			return;
		}
		
		String preview = request.getParameter("mota");
		String detail = request.getParameter("chitiet");
		int slide = Integer.parseInt(request.getParameter("slide"));
		
		final Part part = request.getPart("hinhanh");
		String filename = StringLibrary.getFileName(part);
		String refilename ="";
		String filePath ="";
		
		if(!"".equals(filename)){
			
			if(!"".equals(newsDao.getItem(idNews).getPicture())){
			String urlFileDel = path + File.separator + newsDao.getItem(idNews).getPicture();
			File delFile = new File(urlFileDel);
			delFile.delete();
			}
			refilename= StringLibrary.renameFile(filename);
			// ghi file đã đổi tên database
			filePath = path + File.separator + refilename;
			//sửa thành công
			part.write(filePath);
		}else{
			refilename = newsDao.getItem(idNews).getPicture();
		}
		
		Timestamp date = new Timestamp(new Date().getTime());
		
		News item = new News(idNews, name, preview, detail, refilename, date, catId, "", slide, 0, userInfo.getId());
		
		if(newsDao.editNews(item) > 0){
			//sửa thành công
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=1");
			return;
		} else {
			//sửa thất bại
			RequestDispatcher rd = request.getRequestDispatcher("code/admin/editNews.jsp?err=0");
			rd.forward(request, response);
			return;
		}
		
		
	}

}
