package controller.Comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.AuthUtil;
import model.bean.Category;
import model.bean.Comment;
import model.dao.CommentDao;

public class DelCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentDao commentDao;
    
    public DelCommentController() {
        super();
        commentDao = new CommentDao();
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
			response.sendRedirect(request.getContextPath()+"/admin-comment");
			return;
		}
		
		Comment item = new Comment(id, "", "", null, "", 0, 0, "", "");
		
		if(commentDao.delItem(item) > 0){
			response.sendRedirect(request.getContextPath()+"/admin-comment?msg=1");
			return;
		} else{
			response.sendRedirect(request.getContextPath()+"/admin-comment?err=1");
			return;
		}
	}

}
