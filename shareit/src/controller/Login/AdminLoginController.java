package controller.Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.StringLibrary;
import model.bean.User;
import model.dao.UserDao;


//@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;   
    
    public AdminLoginController() {
        super();
        userDao = new UserDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		
		if(userLogin != null){
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=login");
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/login.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		
		if(userLogin != null){
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=login");
			return;
		}
		
		String username = request.getParameter("username");
		String password = StringLibrary.md5(request.getParameter("password"));
		//kiểm tra user tồn tại
		User user = userDao.existUser(username,password);
		
		if(user != null){
			session.setAttribute("userLogin", user);
			response.sendRedirect(request.getContextPath()+"/admin-news?msg=success");
			return;
		} else {
			response.sendRedirect(request.getContextPath()+"/code/admin/login.jsp?err=fail");
			return;
		}
		
	}

}
