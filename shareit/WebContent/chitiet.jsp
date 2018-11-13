<%@page import="model.bean.Comment"%>
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
								News item = (News)request.getAttribute("itemById");
								if(item != null){
							%>
							<!-- BEGIN .content-panel -->
							<div class="content-panel">
								<div class="content-panel-body article-header">
									<div class="article-header-image">
										<%
											if(!"".equals(item.getPicture())){
										%>
										<img src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="" />
										<%}else{ %>
										<img src="<%=request.getContextPath() %>/templates/no.gif" alt="" />
										<%} %>
									</div>
									<h2><%=item.getName() %></h2>
									<div class="article-meta">
										<a href="blog.html" class="meta-item"><%=item.getDate() %></a>
									</div>
								</div>
								<div class="content-panel-body shortcode-content">
									<p><%=item.getDetail() %></p>
								</div>
							<!-- END .content-panel -->
							</div>
							<%} %>

							
							<!-- BEGIN .content-panel -->
							<div class="content-panel">
								
							
								<div class="content-panel-body comment-list">
									
									<ol id="comments">
									<% 
										if(session.getAttribute("listCmt") != null){
										ArrayList<Comment> listCmt = (ArrayList)session.getAttribute("listCmt");
											for(Comment objCmt : listCmt){
												if(objCmt.getIdNews() == item.getId()){
									%>
										
										<li class="comment">
											<div class="comment-block">
												<a href="#" class="image-avatar">
													<img src="<%=request.getContextPath() %>/templates/public/images/no-avatar-100x100.jpg" data-ot-retina="<%=request.getContextPath() %>/templates/public/images/no-avatar-200x200.jpg" alt="" title="" />
												</a>
												<div class="comment-text">
													<span class="time-stamp right"><%=objCmt.getDate() %></span>
													<strong class="user-nick"><a href="#"><%=objCmt.getFullname() %></a></strong>
													<div class="shortcode-content">
														<p><%=objCmt.getCmt() %>.</p>
													</div>
												</div>
											</div>
										</li>
									
									<%}} }%>
									</ol>	
								</div>
							<!-- END .content-panel -->
							</div>
							
							<!-- BEGIN .content-panel -->
							<div class="content-panel" id="writecomment">
								<div class="content-panel-body">
									<div class="content-panel-title">
										<a href="#writecomment" class="right">Hãy để lại bình luận</a>
									</div>
									<div id="respond" class="comment-respond">

										<form action="javascript:void(0)" class="comment-form" method="post">
											<div class="contact-form-content">
												<p class="contact-form-user">
													<label class="label-input">
														<span>Nickname<i class="required">*</i></span>
														<input type="text" placeholder="Nickname" id="fullname" name="fullname" value="" />
													</label>
												</p>
												<p class="contact-form-email">
													<label class="label-input">
														<span>E-mail<i class="required">*</i></span>
														<input type="email" placeholder="E-mail" id="email" name="email" value="" />
													</label>
												</p>
												<p class="contact-form-comment">
													<label class="label-input">
														<span>Comment text<i class="required">*</i></span>
														<textarea id="cmt" name="cmt" placeholder="Comment text"></textarea>
													</label>
												</p>
												<p class="form-submit">
													<input onclick="return getComment()" name="submit" type="submit" id="submit" class="submit button" value="Post a Comment" />
												</p>
											</div>
										</form>

									</div>

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
			<script type="text/javascript">
				function getComment(){
					var did = <%=item.getId() %>;
					var fullname = $("#fullname").val();
					var cmt = $("#cmt").val();
					var email = $("#email").val();
					
					$.ajax({
						url: '<%=request.getContextPath() %>/comment',
						type: 'POST',
						cache: false, 
						data: {
							//Dữ liệu gửi đi
							adid : did,
							afullname:fullname,
							acmt:cmt,
							aemail : email,
						},
						success: function(data){
							$("#comments").html(data);
						},
						error: function (){
							// Xử lý nếu có lỗi
							alert("Có lỗi trong quá trình xử lý");
						}
					});
				}
			</script>
			
<%@include file="/templates/public/inc/footer.jsp" %>