<%@page import="model.bean.Category"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<%@include file="/templates/admin/inc/sidebar.jsp" %>
            <!-- /.navbar-collapse -->
        </nav>
<%
	ArrayList<News> listNews = (ArrayList)request.getAttribute("listNews");
		String err = request.getParameter("err");
		String msg = request.getParameter("msg");
%>
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>
                                <%
	                                if("0".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Thêm Tin Tức Thành Công</span>");}
	                                if("check".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Trùng Tên Tin Tức Cũ</span>");}                   
                                %>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="form-group">
	                 <label>Tìm Kiếm</label>
	                 <input name="search" class="form-control" placeholder="Enter text">
	                 <button type="submit" class="btn btn-default">Submit</button>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">XEM CHI TIẾT</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <a href="addNews.html">
                                <div class="panel-footer">
                                    <span class="pull-left">THÊM TIN TỨC</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Area Chart</h3>
                            </div>
							<form action="">
								<table class="table">
									<thead>
										<tr>
											<th style="width:5%; text-align: center;">ID</th>
											<th>Tên Bài Viết</th>
											<th style="width:20%">Danh mục</th>
											<th style="width:16%; text-align: center;">Hình ảnh</th>
											<th style="width:11%; text-align: center;">Chức Năng</th>
											<th style="width:11%; text-align: center;">Trạng Thái</th>
										</tr>
									</thead>
									<%
										if(listNews.size() > 0 && listNews != null){
											for(News itemNews : listNews){
									%>
									<tbody>
										<tr>
											<td align="center"><%=itemNews.getId() %></td>
											<td><a href=""><%=itemNews.getName() %></a></td>
											<td><%=itemNews.getCatName() %></td>
											<td align="center"><img width="100px" height="100px" src="<%=request.getContextPath() %>/files/<%=itemNews.getPicture() %>" class="hoa" /></td>
											<td align="center">
												<a href="">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/edit.jpg" width="16" height="16" alt="edit" /></a>|
												<a href="">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/file_delete.png" width="16" height="16" alt="delete" /></a>
											</td>
											<td align="center"><%=itemNews.getIsSlide() %></td>
										</tr>
										
									</tbody>
									<%}} %>
								</table>
							</form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="pagination dark">
					<a href="#" class="page dark gradient">Previous</a>
					<a href="#" class="page dark gradient">1</a>
					<a href="#" class="page dark gradient">2</a>
					<span class= "page dark active">3</span>
					<a href="#" class= "page dark gradient">4</a>
					<a href="#" class= "page dark gradient">5</a>
					<a href="#" class= "page dark gradient">Next</a>
				</div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>