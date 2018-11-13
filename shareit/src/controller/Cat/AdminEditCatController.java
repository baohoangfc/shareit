package controller.Cat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.AuthUtil;
import model.bean.Category;
import model.dao.CategoryDao;

public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;   

    public AdminEditCatController() {
        super();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		request.setAttribute("listCat", categoryDao.getListCatEdit());
		
		
		String idText = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-cat");
			return;
		}
		
		
		
		
		//lấy dữ liệu cần sửa
		Category item = categoryDao.getItem(id);
		
		if(item != null){
			request.setAttribute("category", item);
			RequestDispatcher rd = request.getRequestDispatcher("/code/admin/editCat.jsp");
			rd.forward(request, response);
			return;
		} else if(item == null){
			response.sendRedirect(request.getContextPath()+"/admin-cat");
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
		
		String name = request.getParameter("tentin");
		
		String idText = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-cat");
			return;
		}
		
		String idDanhMucCha = request.getParameter("danhmuc");
		int idParent = 0;
		try {
			idParent = Integer.parseInt(idDanhMucCha);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-cat");
			return;
		}
		
		Category item = new Category(id , idParent ,name);
		

		if(categoryDao.checkItem(name) != null && categoryDao.checkItem(id) != id || id == idParent){
			response.sendRedirect(request.getContextPath()+"/admin-cat?err=check");
			return;
		} else {
			if(categoryDao.editItem(item) > 0){
				//thành công trả về trang hiển thị danh mục tin
				response.sendRedirect(request.getContextPath()+"/admin-cat?msg=2");
				return;
			} else{
				//thất bại trả về trang "thêm danh mục tin"
				RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addCat.jsp?err=2");
				rd.forward(request, response);
				return;
			}
		}
		
		
		
		
	}

}
