<%@page import="model.dao.NewsDao"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
					<!-- BEGIN .ot-breaking-news-body -->
					<div class="ot-breaking-news-body" data-breaking-timeout="4000" data-breaking-autostart="true">
						<div class="ot-breaking-news-controls">
							<button class="right" data-break-dir="right"><i class="fa fa-angle-right"></i></button>
							<button class="right" data-break-dir="left"><i class="fa fa-angle-left"></i></button>
							<strong><i class="fa fa-bar-chart"></i>Breaking News</strong>
						</div>
						<%
							NewsDao newsDao = new NewsDao();
							ArrayList<News> list = newsDao.getListNews();
							if(list != null && list.size() > 0){
								for(News item : list){
									if(item.getIsSlide() == 1){
						%>
						<div class="ot-breaking-news-content">
							<div class="ot-breaking-news-content-wrap">
								<div class="item">
									<strong><a href="post.html"><%=item.getName() %></a></strong>
								</div>
							</div>
						</div>
						<%}}} %>
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
								<div class="item">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>10<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-1.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Nature is awesome</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

								<!-- BEGIN .item -->
								<div class="item" data-color-top-slider="#867eef">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>132<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-2.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Wee look at todays fashion</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

								<!-- BEGIN .item -->
								<div class="item" data-color-top-slider="#867eef">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>290<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-3.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Wee look at todays fashion</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

							<!-- END .top-slider-content-wrap -->
							</div>

							<!-- BEGIN .top-slider-content-wrap -->
							<div class="top-slider-content-wrap">

								<!-- BEGIN .item -->
								<div class="item">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>10<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-4.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Nature is awesome</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

								<!-- BEGIN .item -->
								<div class="item" data-color-top-slider="#867eef">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>132<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-5.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Wee look at todays fashion</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

								<!-- BEGIN .item -->
								<div class="item" data-color-top-slider="#867eef">
									<div class="item-header">
										<a href="post.html">
											<span class="comment-tag"><i class="fa fa-comment-o"></i>290<i></i></span>
											<span class="read-more-wrapper"><span class="read-more">Read full article<i></i></span></span>
											<img src="<%=request.getContextPath() %>/templates/public/images/photos/image-6.jpg" alt="" />
										</a>
									</div>
									<div class="item-content">
										<strong class="category-link"><a href="category.html">Wee look at todays fashion</a></strong>
										<h3><a href="post.html">Greece's reform plan backed by creditors</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, do eiusmod tempor incididunt ut labore et dolore magna esse cillum dolore...</p>
									</div>
								<!-- END .item -->
								</div>

							<!-- END .top-slider-content-wrap -->
							</div>

						</div>
					<!-- END .top-slider-body -->
					</div>