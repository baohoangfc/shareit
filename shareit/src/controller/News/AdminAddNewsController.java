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
public class AdminAddNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;
    private NewsDao newsDao;

    public AdminAddNewsController() {
        super();
        categoryDao = new CategoryDao();
        newsDao = new NewsDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		ArrayList<Category> list = categoryDao.getListCatPublic();
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addNews.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");		
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		// đường dẫn lưu file
		final String path = request.getServletContext().getRealPath("/files");
		System.out.println(path);
		File dirPath = new File(path);
		if (!dirPath.exists()) {
				dirPath.mkdir();
		}
		
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
		
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userLogin");
		
		//lấy ảnh từ form
		final Part part = request.getPart("hinhanh");
		//lấy tên file
		String filename = StringLibrary.getFileName(part);
		//reName file
		String refilename = StringLibrary.renameFile(filename);
		// ghi file đã đổi tên database
		String filePath = path + File.separator + refilename;
		
		Timestamp date = new Timestamp(new Date().getTime());
		
		News item = new News(0, name, preview, detail, refilename, date, catId, "", slide, 0, userInfo.getId());
		if(newsDao.addNews(item) > 0){
			//thêm thành công
			part.write(filePath);
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=0");
			return;
		} else {
			//thêm thất bại
			RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addNews.jsp?err=0");
			rd.forward(request, response);
			return;
		}
		
		
	}

}
