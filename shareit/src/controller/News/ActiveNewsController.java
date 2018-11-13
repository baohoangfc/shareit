package controller.News;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.NewsDao;


public class ActiveNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NewsDao newsDao;   
    
    public ActiveNewsController() {
        super();
        newsDao = new NewsDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out =response.getWriter();
		int id= Integer.parseInt(request.getParameter("aid"));
		int status= Integer.parseInt(request.getParameter("astatus"));
		
		if(status == 0){
			if(newsDao.activeNews(id,1)>0){
				out.print("<a href='javascript:void(0)' title='' onclick='return activeTin("+id+", 1)'><img class='img-active' src='"+request.getContextPath() +"/templates/active.gif' alt='' /></a>");
			}
		} else {
			if(newsDao.activeNews(id,0)>0){
				out.print("<a href='javascript:void(0)' title='' onclick='return activeTin("+id+", 0)'><img class='img-active' src='"+request.getContextPath()+"/templates/deactive.gif' alt='' /></a>");
			}
		}
	}

}
