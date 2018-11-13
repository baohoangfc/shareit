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


public class AdminDelUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;   
    public AdminDelUserController() {
        super();
        userDao = new UserDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userLogin");
		
		String idText = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-user");
			return;
		}
		
		User objUser = userDao.getItem(id);
		
		if(!"Admin".equals(userInfo.getNameMod())){
			response.sendRedirect(request.getContextPath()+"/admin-user");
			return;
		} else {
			if("Admin".equals(objUser.getNameMod())){
				response.sendRedirect(request.getContextPath()+"/admin-user?err=check");
				return;
			} else {
				if(userDao.delUser(id) > 0){
					response.sendRedirect(request.getContextPath()+"/admin-user?msg=1");
					return;
				} else {
					response.sendRedirect(request.getContextPath()+"/admin-user?err=1");
					return;
				}
			}
		}
		
			
		
		
	}

}
