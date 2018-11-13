package controller.User;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.AuthUtil;
import library.StringLibrary;
import model.bean.User;
import model.dao.UserDao;


public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;   
    public AdminEditUserController() {
        super();
        userDao = new UserDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		String idText = request.getParameter("id");
		int id = 0;
		
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-user");
			return;
		}
		
		User user = userDao.getItem(id);
		
		if(user != null){
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("/code/admin/editUser.jsp");
			rd.forward(request, response);
			return;
		} else if(user == null){
			response.sendRedirect(request.getContextPath()+"/admin-user/edit?err=2");
			return;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		
		String idText = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-user");
			return;
		}
		
		
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userLogin");
		
		if("Admin".equals(userInfo.getNameMod()) || id == userInfo.getId()){
			
			if("".equals(password)){
				//lấy lại mật khẩu cũ
				password = userDao.getItem(id).getPassword();
			} else {
				//lấy mật khẩu mới	
				password = StringLibrary.md5(request.getParameter("password"));
			}
			
			User objUser = new User(id, "", password, fullname, 0, "");
			
			
			if(userDao.editUser(objUser) > 0){
				response.sendRedirect(request.getContextPath()+"/admin-user?msg=2");
				return;
			} else {
				response.sendRedirect(request.getContextPath()+"/code/admin/editUser.jsp?err=2");
				return;
			}
			
		} else {
			response.sendRedirect(request.getContextPath()+"/admin-user");
			return;
		}
		
		
	
		
	}

}
