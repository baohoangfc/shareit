package controller.User;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.AuthUtil;
import library.StringLibrary;
import model.bean.User;
import model.dao.UserDao;


public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;   
    public AdminAddUserController() {
        super();
        userDao = new UserDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		request.setAttribute("listMod", userDao.getListMod());
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addUser.jsp");
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
		String username = request.getParameter("username");
		String password = StringLibrary.md5(request.getParameter("password"));
		String fullname = request.getParameter("fullname");
		int mod = Integer.parseInt(request.getParameter("mod"));
		//lưu vào đối tượng
		User user = new User(0, username, password, fullname, mod, "");
		//kiểm tra trùng
		if(userDao.checkUser(username) != null){
			//đã tồn tại username
			response.sendRedirect(request.getContextPath()+"/admin-user/add?err=check");
			return;
		} else{
			//chưa tồn tại
			//kiểm tra thêm
			if(userDao.addUser(user) > 0){
				//thành công trả về trang hiển thị user
				response.sendRedirect(request.getContextPath()+"/admin-user?msg=0");
				return;
			} else{
				//thất bại trả về trang "thêm user"
				RequestDispatcher rd = request.getRequestDispatcher("/code/admin/addUser.jsp?err=0");
				rd.forward(request, response);
				return;
			}
		}
	}

}
