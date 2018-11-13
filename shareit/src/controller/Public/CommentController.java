package controller.Public;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.Define;
import model.bean.Comment;
import model.bean.User;
import model.dao.CategoryDao;
import model.dao.CommentDao;
import model.dao.NewsDao;


public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentDao commentDao;
    private CategoryDao categoryDao;
    private NewsDao newsDao;
   
    public CommentController() {
        super();
        commentDao = new CommentDao();
        categoryDao = new CategoryDao();
        newsDao = new NewsDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		User userLogin = (User)session.getAttribute("userLogin");
		
		
		String afullname = request.getParameter("afullname");
		String acmt = request.getParameter("acmt");
		String aemail = request.getParameter("aemail");
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String date = sdf.format(new Date());
		int did = Integer.parseInt(request.getParameter("adid"));
		
		Comment objCmtNews = new Comment( 0, afullname, acmt, date, aemail, 0, did, "", "");
		//Comment objCmt= new Comment(id, fullname, cmt, date, email, userId, idParent, idNews);

		ArrayList<Comment> listCmt = commentDao.getCmtListByID(did);
		session.setAttribute("listCmt", listCmt);
		
		
		request.setAttribute("listNewsSide", newsDao.getListNewsSide());
		request.setAttribute("listCat", categoryDao.getListCatPublic());
		
		listCmt.add(objCmtNews);
		if(commentDao.addComment(objCmtNews) > 0){
			System.out.println("Thành công");
		} else {
			System.out.println("Có lỗi");
		}
		
		String html = "";
		for (Comment objCmt : commentDao.getCmtListByID(did)) {
			if(objCmt.getIdNews() == did){
					html += 	
										"<li class='comment'>"+
											"<div class='comment-block'>"+
												"<a href='#' class='image-avatar'>"+
													"<img src='<%=request.getContextPath() %>/templates/public/images/no-avatar-100x100.jpg' data-ot-retina='<%=request.getContextPath() %>/templates/public/images/no-avatar-200x200.jpg' alt='' title='' />"+
												"</a>"+
							"<div class='comment-text'>"+
									"<span class='time-stamp right'>"+objCmt.getDate()+"</span>"+
									"<strong class='user-nick'><a href='#'>"+objCmt.getFullname()+"</a></strong>"+
									"<div class='shortcode-content'>"+
										"<p>"+objCmt.getCmt()+"</p>"+
									"</div>"+
								"</div>"+
								"</div>"+
							"</li>";
			}
		}
		
		out.print("<ol id='comments'>"+html+"</ol>");
	}

}
