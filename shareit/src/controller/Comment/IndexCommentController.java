package controller.Comment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Define;
import library.AuthUtil;
import model.dao.CommentDao;


//@WebServlet("/IndexCommentController")
public class IndexCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentDao commentDao;   
  
    public IndexCommentController() {
        super();
        commentDao = new CommentDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!AuthUtil.checkLogin(request, response)){
			return;
		}
		
		int sumComment = commentDao.countComment();
		int sumPage = (int)Math.ceil((float)sumComment/Define.ROW_COUNT_ADMIN);
		int current_page = 1;
		request.setAttribute("sumPage", sumPage);
		if(request.getParameter("page") != null){
			current_page = Integer.parseInt(request.getParameter("page"));		
		}
		
		int offset = (current_page -1)*Define.ROW_COUNT_ADMIN;
		request.setAttribute("current_page", current_page);
		
		request.setAttribute("listCmt", commentDao.getListCommetPagination(offset));
		
		RequestDispatcher rd = request.getRequestDispatcher("/code/admin/indexComment.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

}
