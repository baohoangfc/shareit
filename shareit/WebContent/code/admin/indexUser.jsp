<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<%@include file="/templates/admin/inc/sidebar.jsp" %>
            <!-- /.navbar-collapse -->
        </nav>
<%
	ArrayList<User> listUser = (ArrayList)request.getAttribute("listUser");
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
                       					out.print("<span style='color:red;font-size:18px'>Không Thể Xóa Người Dùng Này</span>");}
	                              	if("0".equals(msg)){
	                           			out.print("<span style='color:red;font-size:18px'>Thêm Người Dùng Thành Công</span>");}
                                	if("1".equals(msg)){
                           				out.print("<span style='color:red;font-size:18px'>Xóa Người Dùng Thành Công</span>");}
                                	if("1".equals(err)){
                           				out.print("<span style='color:red;font-size:18px'>Xóa Người Dùng Thất Bại</span>");}
                                	if("2".equals(msg)){
                           				out.print("<span style='color:red;font-size:18px'>Sửa Người Dùng Thành Công</span>");}
                               	%>                              
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- /.row -->
				<%
					if("Mod".equals(userInfo.getNameMod()) || "Admin".equals(userInfo.getNameMod())){
				%>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <a href="<%=request.getContextPath()%>/nguoi-dung/add.html">
                                <div class="panel-footer">
                                    <span class="pull-left">THÊM NGƯỜI DÙNG</span>
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
											<th style="width:11%">Tên Người Dùng</th>
											<th style="width:11%; text-align: center;">Tên Đầy Đủ</th>
											<th style="width:11%; text-align: center;">Chức Năng</th>
											<th style="width:5%; text-align: center;">Cấp Bậc</th>
										</tr>
									</thead>
									<%
										
										if(listUser != null && listUser.size() > 0){
											for(User item : listUser){
									%>
									<tbody>
										<tr>
											<td align="center"><%=item.getId() %></td>
											<td>
												<a href=""><%=item.getUsername() %></a>
											</td>
											<td align="center"><%=item.getFullname() %></td>
											<%
												if("Admin".equals(userInfo.getNameMod())){
											%>
											<td align="center">
												<a href="<%=request.getContextPath()%>/nguoi-dung/edit-<%=item.getId() %>.html">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/edit.jpg" width="16" height="16" alt="edit" /></a>|
												<a href="<%=request.getContextPath()%>/nguoi-dung/del/<%=item.getId() %>.html">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/file_delete.png" width="16" height="16" alt="delete" /></a>
											</td>
											<%} else { %>
												<%
													if(userInfo.getId() == item.getId()){
												%>
												<td align="center">
													<a href="<%=request.getContextPath()%>/nguoi-dung/edit-<%=item.getId() %>.html">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/edit.jpg" width="16" height="16" alt="edit" /></a>
												</td>
												<%}else { %>
													<td align="center">
													</td>
												<%} %>
											<%} %>
											<td align="center"><%=item.getNameMod() %></td>
										</tr>
									<%}}else { %>
										<tr>
											<td colspan="5" align="center">Không có dữ liệu</td>
										</tr>
									<%} %>
									</tbody>
								</table>
							</form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>