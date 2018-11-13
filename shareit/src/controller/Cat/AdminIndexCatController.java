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

public class AdminIndexCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao;

    public AdminIndexCatController() {
        super();
        categoryDao = new CategoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		
		int sumCat = categoryDao.countCat();
		int sumPage = (int)Math.ceil((float)sumCat/Define.ROW_COUNT_ADMIN);
		int current_page = 1;
		
		request.setAttribute("sumPage", sumPage);
		
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));		
		}
		
		int offset = (current_page -1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("current_page", current_page);
		
		
		
		request.setAttribute("listCatPagination", categoryDao.getListCatPagination(offset));
		
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/indexCat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
