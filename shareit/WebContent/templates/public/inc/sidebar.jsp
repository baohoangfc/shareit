<%@page import="library.Slug"%>
<%@page import="model.bean.Category"%>
<%@page import="model.dao.NewsDao"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
						<!-- BEGIN .sidebar -->
						<aside class="sidebar">

							<div class="widget">
								<h3>Danh Mục Tin</h3>
								<div class="widget-article-list">
					<%
						ArrayList<Category> li = (ArrayList)request.getAttribute("listCat");
							if(li.size() > 0 && li != null){
								for(Category itemG : li){
					%>
									
									<%
										if(itemG.getParent() == 0){
									%>
									<div class="item">
										<div class="item-content">
											<h4><a href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(itemG.getName()) %>-<%=itemG.getId() %>.html"><%=itemG.getName() %></a></h4>
										</div>
									</div>	
									<%} %>	
									<%
										for(Category iCategory : li){
											if(iCategory.getParent() == itemG.getId()){
									%>
									<div class="item">	
										<div class="item-content">
												<h4><a href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(iCategory.getName()) %>-<%=iCategory.getId() %>.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+&nbsp;&nbsp;<%=iCategory.getName() %></a></h4>
										</div>
									</div>	
									<%}} %>	
									
									
					<%}} %>



								</div>
							</div>



							<div class="widget">
								<h3>Tin Cũ Hơn</h3>
								<div class="widget-article-list">
					<%
						ArrayList<News> liNews = (ArrayList)request.getAttribute("listNewsSide");
							if(liNews.size() > 0 && liNews != null){
								for(News itemNews : liNews){
					%>
									<div class="item">
										<div class="item-header">
											<a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(itemNews.getName()) %>-<%=itemNews.getId() %>.html"><img width="1000px"  src="<%=request.getContextPath() %>/files/<%=itemNews.getPicture() %>" alt="" /></a>
										</div>
										<div class="item-content">
											<h4><a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(itemNews.getName()) %>-<%=itemNews.getId() %>.html"><%=itemNews.getName() %></a></h4>
											<span class="item-meta">
												<a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(itemNews.getName()) %>-<%=itemNews.getId() %>.html"><i class="fa fa-clock-o"></i><%=itemNews.getDate() %></a>
											</span>
										</div>
									</div>
					<%}} %>

								</div>
							</div>
						<!-- END .sidebar -->
						</aside>