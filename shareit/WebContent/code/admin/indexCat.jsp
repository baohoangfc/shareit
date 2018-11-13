<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<%@include file="/templates/admin/inc/sidebar.jsp" %>
            <!-- /.navbar-collapse -->
        </nav>
<%
	ArrayList<Category> listCatPagination = (ArrayList)request.getAttribute("listCatPagination");
	ArrayList<Category> listCat = (ArrayList)request.getAttribute("listCat");
	String msg = request.getParameter("msg");
	String err = request.getParameter("err");
	User userInfo = (User)session.getAttribute("userLogin");
	
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
                                	
                                	if("check".equals(err)){
                           				out.print("<span style='color:red;font-size:18px'>Trùng Danh Mục Tin</span>");}
	                              	if("0".equals(msg)){
	                           			out.print("<span style='color:red;font-size:18px'>Thêm Danh Mục Tin Thành Công</span>");}
	                                if("1".equals(msg)){
	                           			out.print("<span style='color:red;font-size:18px'>Xóa Danh Mục Tin Thành Công</span>");}
	                                if("1".equals(err)){
	                           			out.print("<span style='color:red;font-size:18px'>Không Thể Xóa Danh Mục Tin</span>");}
	                                if("2".equals(msg)){
	                           			out.print("<span style='color:red;font-size:18px'>Sửa Danh Mục Tin Thành Công</span>");}
	                                if("no".equals(err)){
                       					out.print("<span style='color:red;font-size:18px'>Truy Cập Trái Phép</span>");}
                               	%>                              
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- /.row -->
				<%
					if("Admin".equals(userInfo.getNameMod())){
				%>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <a href="<%=request.getContextPath()%>/chuyen-muc/add.html">
                                <div class="panel-footer">
                                    <span class="pull-left">THÊM DANH MỤC</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <%} %>
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
											<th style="width:5%">Tên Danh Mục</th>
											<th style="width:11%; text-align: center;">Chức Năng</th>
											<th style="width:11%; text-align: center;">Danh Mục Cha</th>
										</tr>
									</thead>
									<tbody>
									<%
										
										if(listCat.size() > 0 && listCat != null){
											for(Category itemCat : listCatPagination){
									%>
										<tr>
											<td align="center"><%=itemCat.getId() %></td>
											<td>
												<a href=""><%=itemCat.getName() %></a>
											</td>

											<td align="center">
												<a href="<%=request.getContextPath()%>/chuyen-muc/edit-<%=itemCat.getId() %>.html">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/edit.jpg" width="16" height="16" alt="edit" /></a>|
												<a onclick="return confirm('Bạn có chắc chắn muốn xóa ? ')" href="<%=request.getContextPath()%>/chuyen-muc/del/<%=itemCat.getId() %>.html">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/file_delete.png" width="16" height="16" alt="delete" /></a>
											</td>
											<%
												for(Category itemCat2 : listCat){
													if(itemCat2.getId() == itemCat.getParent()){
														
											%>
											<td align="center"><%=itemCat2.getName() %></td>
											<%} }%>
										</tr>
									<%} }else{%>
										<tr>
											<td align="center">Không Có Dữ Liệu</td>
										</tr>
									<%} %>	
									</tbody>
								</table>
							</form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
				<div class="container">
				  <ul class="pagination">
				  <%
					int sumPage = (Integer)request.getAttribute("sumPage");
					int current_page = (Integer)request.getAttribute("current_page");
				  %>
				  <%
				  	if(current_page != 1){
				  %>
				  	<li><a href="<%=request.getContextPath()%>/admin-cat?page=<%=current_page-1%>">&laquo;</a></li>
				  <%} %>
				  <%	
					String active = "";
					if(sumPage > 1){
						for(int i = 1; i <= sumPage ; i++){
							if(current_page == i){
								active = "class='active'";
							} else {
								active = "";
							}
					%>
				    <li <%=active %>><a href="<%=request.getContextPath()%>/admin-cat?page=<%=i%>"><%=i %></a></li>
				    <%} }%>
				    <%
				  		if(current_page != sumPage){
				    %>
				  		<li><a href="<%=request.getContextPath()%>/admin-cat?page=<%=current_page+1%>">&raquo;</a></li>
				  	<%} %>
				  </ul>
				</div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>