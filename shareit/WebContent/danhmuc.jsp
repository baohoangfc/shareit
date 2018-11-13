<%@page import="model.bean.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@include file="/templates/public/inc/header.jsp" %>
			
			<!-- BEGIN .content -->
			<section class="content">
				
				<!-- BEGIN .wrapper -->
				<div class="wrapper">


					<div class="content-block has-sidebar">

						<!-- BEGIN .content-block-single -->
						<div class="content-block-single">
				<%
					ArrayList<News> listNewsID = (ArrayList)request.getAttribute("listNewsById");				
				%>			
							<!-- BEGIN .content-panel -->
							<div class="content-panel">
								<div class="content-panel-title">
									<a href="blog.html" class="right">View all articles</a>
									<h2>Articles from <span style="color: #8EC91D;">The urban news</span></h2>
								</div>
								<div class="content-panel-body article-list">
									<%
										if(listNewsID != null && listNewsID.size() > 0){
											for(News item : listNewsID){
									%>
									<div class="item" data-color-top-slider="#8EC91D">
										<div class="item-header">
											<a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html">
												<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
												<img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
											</a>
										</div>
										<div class="item-content">
											<h3><a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a></h3>
											<span class="item-meta">
												<a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><i class="fa fa-clock-o"></i><%=item.getDate() %></a>
											</span>
											<p><%=item.getPreview() %></p>
											<a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html" class="read-more-button">Read full article<i class="fa fa-mail-forward"></i></a>
										</div>
									</div>
									<%}} %>
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
									<a class="prev page-numbers" href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(itemCat.getName()) %>-<%=itemCat.getId() %>/page-<%=current_page-1 %>.html"><i class="fa fa-angle-left"></i>Previous</a>
									<%} %>
									<%	
										String active = "";
										if(sumPage > 1){
										for(int i = 1; i <= sumPage ; i++){
											if(current_page == i){
									%>
									<% if(current_page >= 1){%>
									<a  href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(itemCat.getName()) %>-<%=itemCat.getId() %>/page-<%=i %>.html">
										<span class="page-numbers"><%=i %></span>
									</a>
									<%} %>
									<%			
											} else {
									%>
									<a class="page-numbers" href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(itemCat.getName()) %>-<%=itemCat.getId() %>/page-<%=i %>.html">
										<span><%=i %></span>
									</a>
									<% 			
											}
									%>
									<%}} %>
									<%
										if(current_page != sumPage){
									%>
									<a class="next page-numbers" href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(itemCat.getName()) %>-<%=itemCat.getId() %>/page-<%=current_page+1 %>.html">Next<i class="fa fa-angle-right"></i></a>
									<%} %>
								</div>
							<!-- END .content-panel -->
							</div>

						<!-- END .content-block-single -->
						</div>

		<%@include file="/templates/public/inc/sidebar.jsp" %>

					</div>
					

				<!-- END .wrapper -->
				</div>
				
			<!-- BEGIN .content -->
			</section>
			
<%@include file="/templates/public/inc/footer.jsp" %>	