package controller.Cat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import library.AuthUtil;
import model.bean.Category;
import model.dao.CategoryDao;

public class AdminDelCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao;

    public AdminDelCatController() {
        super();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		String idText = request.getParameter("id");
		int id = 0;
		
		try {
			id = Integer.parseInt(idText);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin-cat");
			return;
		}
		
		Category item = new Category(id, 0,"");
		
		if(categoryDao.delItem(id) > 0){
			response.sendRedirect(request.getContextPath()+"/admin-cat?msg=1");
			return;
		} else{
			response.sendRedirect(request.getContextPath()+"/admin-cat?err=1");
			return;
		}
	}

}
