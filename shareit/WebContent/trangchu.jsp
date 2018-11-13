<%@page import="library.Slug"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/templates/public/inc/header.jsp" %>
			
			<!-- BEGIN .content -->
			<section class="content">
<%
	ArrayList<News> listNewsBreaking = (ArrayList<News>)request.getAttribute("listNewsBreaking");
	ArrayList<News> listNews = (ArrayList<News>)request.getAttribute("listNews");
	ArrayList<News> listNewsSlide = (ArrayList<News>)request.getAttribute("listNewsSlide");
	ArrayList<News> listNewsSide = (ArrayList<News>)request.getAttribute("listNewsSide");
%>				
				<!-- BEGIN .wrapper -->
				<div class="wrapper">

						<!-- BEGIN .ot-breaking-news-body -->
					<div class="ot-breaking-news-body" data-breaking-timeout="4000" data-breaking-autostart="true">
						<div class="ot-breaking-news-controls">
							<button class="right" data-break-dir="right"><i class="fa fa-angle-right"></i></button>
							<button class="right" data-break-dir="left"><i class="fa fa-angle-left"></i></button>
							<strong><i class="fa fa-bar-chart"></i>Tin Ngẫu Nhiên</strong>
						</div>
						<div class="ot-breaking-news-content">
						
							<div class="ot-breaking-news-content-wrap">
							<%
							if(listNewsBreaking != null && listNewsBreaking.size() > 0){
								for(News item : listNewsBreaking){
									if(item.getIsSlide() == 1){
							%>
								<div class="item">
									<strong><a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a></strong>
								</div>
							<%}}} %>
							</div>
							
						</div>
					<!-- END .ot-breaking-news-body -->
					</div>

					<!-- BEGIN .top-slider-body -->
					<div class="top-slider-body" data-top-slider-timeout="6000" data-top-slider-autostart="true">
						<div class="top-slider-controls">
							<button class="left" data-top-slider-dir="left"><i class="fa fa-caret-left"></i> Previous</button>
							<button class="right" data-top-slider-dir="right">Next <i class="fa fa-caret-right"></i></button>
						</div>
						<div class="top-slider-content">

							<!-- BEGIN .top-slider-content-wrap -->
							<div class="top-slider-content-wrap active">

								<!-- BEGIN .item -->
								<%
									if(listNewsSlide != null && listNewsSlide.size() > 0){
										for(News item : listNewsSlide){
											if(item.getIsSlide() == 1){
								%>
								<div class="item">
									<div class="item-header">
										<a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html">
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<%if(!"".equals(item.getPicture())){ %>
											<img width="100px" src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
											<%}else{ %>
											<img  src="<%=request.getContextPath() %>/templates/no.gif" alt="" />
											<%} %>
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="#"><%=item.getCatName() %></a></strong>
										<h3><a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a></h3>
										<p><%=item.getPreview() %></p>
									</div>
								<!-- END .item -->
								</div>
								<%}}} %>
							<!-- END .top-slider-content-wrap -->
							</div>
							<!-- BEGIN .top-slider-content-wrap -->
							<div class="top-slider-content-wrap">

								<!-- BEGIN .item -->
								<%
									if(listNewsSide.size() > 0 && listNewsSide != null){
										for(News item : listNewsSide){
								%>
								<div class="item">
									<div class="item-header">
										<a href="post.html">
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img  src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html"><%=item.getCatName() %></a></strong>
										<h3><a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a></h3>
										<p><%=item.getPreview() %></p>
									</div>
								<!-- END .item -->
								</div>
								<%}} %>
							<!-- END .top-slider-content-wrap -->
							</div>

						</div>
					<!-- END .top-slider-body -->
					</div>

					<div class="content-block has-sidebar">

						<!-- BEGIN .content-block-single -->
						<div class="content-block-single">
							
							<!-- BEGIN .content-panel -->
							<div class="content-panel">
								<div class="content-panel-title">
									<a href="blog.html" class="right">Read all articles</a>
									<h2><a href="category.html" style="color: #eb6435;">Tin Mới</a></h2>
								</div>
								<div class="content-panel-body article-list">
									<%
										
										if(listNews != null && listNews.size() > 0){
											for(News item : listNews){
												if(item.getStatus() == 1){
									%>									
									<div class="item">
										<div class="item-header">
											<a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html">
												<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
												<%
													if(!"".equals(item.getPicture())){
												%>
												<img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
												<% } else { %>
												<img src="<%=request.getContextPath() %>/templates/no.gif" alt="" />
												<%} %>
											</a>
										</div>
										<div class="item-content">
											<h3><a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a></h3>
											<span class="item-meta">
												<a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><i class="fa fa-clock-o"></i><%=item.getDate() %></a>
											</span>
											<p><%=item.getPreview() %></p>
											<a href="<%=request.getContextPath() %>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html" class="read-more-button">Read full article<i class="fa fa-mail-forward"></i></a>
										</div>
									</div>
									<%}}}%>
								</div>
								<div class="content-panel-body pagination">
									
									<%
										Category itemCat = (Category)request.getAttribute("itemCat");
										int sumPage = (Integer)request.getAttribute("sumPage");
										int current_page = (Integer)request.getAttribute("current_page");
									%>
									<%
										if(current_page != 1 ){
									%>
									<a class="prev page-numbers" href="<%=request.getContextPath()%>?page=<%=current_page-1%>"><i class="fa fa-angle-left"></i>Previous</a>
									<%} %>
									<%	
										String active = "";
										if(sumPage > 1){
										for(int i = 1; i <= sumPage ; i++){
											if(current_page == i){
									%>
									<% if(current_page >= 1){%>
									<a  href="<%=request.getContextPath()%>?page=<%=i%>">
										<span class="page-numbers"><%=i %></span>
									</a>
									<%} %>
									<%			
											} else {
									%>
									<a class="page-numbers" href="<%=request.getContextPath()%>?page=<%=i %>">
										<span><%=i %></span>
									</a>
									<% 			
											}
									%>
									<%}} %>
									<%
										if(current_page != sumPage){
									%>
									<a class="next page-numbers" href="<%=request.getContextPath()%>?page=<%=current_page+1%>">Next<i class="fa fa-angle-right"></i></a>
									<%} %>
								</div>
							<!-- END .content-panel -->
							</div>
							
							
							<!-- BEGIN .content-panel -->
								
						<!-- END .content-block-single -->
						</div>

		<%@include file="/templates/public/inc/sidebar.jsp" %>	

					</div>
					

				<!-- END .wrapper -->
				</div>
				
			<!-- BEGIN .content -->
			</section>
			
<%@include file="/templates/public/inc/footer.jsp" %>	