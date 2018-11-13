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
public class AdminLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;   
    
    public AdminLogoutController() {
        super();
        userDao = new UserDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/admin/login");
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
