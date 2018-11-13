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

public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;   

    public AdminAddCatController() {
        super();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		request.setAttribute("listCat", categoryDao.getListCatAdd());
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addCat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		//lấy dữ liệu tên danh mục từ form
		String name = request.getParameter("tentin");
		int parent = Integer.parseInt(request.getParameter("danhmuc")); //chưa check dữ liệu nhớ check vào
		//lưu vào đối tượng
		Category item = new Category(0, parent,name);
		//kiểm tra
				
		if(categoryDao.checkItem(name) != null){
			response.sendRedirect(request.getContextPath()+"/admin-cat/add?err=check");
			return;
		} else {
			if(categoryDao.addCat(item) > 0){
				//thành công trả về trang hiển thị danh mục tin
				response.sendRedirect(request.getContextPath()+"/admin-cat?msg=0");
				return;
			} else{
				//thất bại trả về trang "thêm danh mục tin"
				RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addCat.jsp?err=0");
				rd.forward(request, response);
				return;
			}
		}
		
	}

}
