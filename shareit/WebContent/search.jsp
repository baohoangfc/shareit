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
					ArrayList<News> listSearch = (ArrayList)request.getAttribute("listSearch");				
				%>			
							<!-- BEGIN .content-panel -->
							<div class="content-panel">
								<div class="content-panel-title">
									<a href="blog.html" class="right">View all articles</a>
									<h2>Articles from <span style="color: #8EC91D;">The urban news</span></h2>
								</div>
								<div class="content-panel-body article-list">
									<%
										if(listSearch != null && listSearch.size() > 0){
											for(News item : listSearch){
									%>
									<div class="item" data-color-top-slider="#8EC91D">
										<div class="item-header">
											<a href="<%=request.getContextPath()%>/chitiet?did=<%=item.getId()%>">
												<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
												<img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
											</a>
										</div>
										<div class="item-content">
											<h3><a href="<%=request.getContextPath()%>/chitiet?did=<%=item.getId()%>"><%=item.getName() %></a></h3>
											<span class="item-meta">
												<a href="<%=request.getContextPath()%>/chitiet?did=<%=item.getId()%>"><i class="fa fa-clock-o"></i><%=item.getDate() %></a>
											</span>
											<p><%=item.getPreview() %></p>
											<a href="<%=request.getContextPath()%>/chitiet?did=<%=item.getId()%>" class="read-more-button">Read full article<i class="fa fa-mail-forward"></i></a>
										</div>
									</div>
									<%}} %>
								</div>
								<div class="content-panel-body pagination">
									<a class="prev page-numbers" href="#"><i class="fa fa-angle-left"></i>Previous</a>
									<a class="page-numbers" href="#">1</a>
									<span class="page-numbers current">2</span>
									<a class="page-numbers" href="#">3</a>
									<a class="page-numbers" href="#">4</a>
									<a class="page-numbers" href="#">5</a>
									<a class="next page-numbers" href="#">Next<i class="fa fa-angle-right"></i></a>
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