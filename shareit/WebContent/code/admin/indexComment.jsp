<%@page import="model.bean.Comment"%>
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
		ArrayList<Comment> listCmt = (ArrayList)request.getAttribute("listCmt");
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
                                	if("1".equals(msg)){
                        				out.print("<span style='color:red;font-size:18px'>Xóa Bình Luận Thành Công</span>");}
                                	if("1".equals(err)){
                    					out.print("<span style='color:red;font-size:18px'>Xóa Bình Luận Thất Bại</span>");}
                                %>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
              
                <!-- /.row -->

          
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
											<th style="width:16%; text-align: center;">Danh mục</th>
											<th style="width:16%; text-align: center;">Họ Tên</th>
											<th style="width:16%; text-align: center;">Email</th>
											<th style="width:11%; text-align: center;">Bình Luận</th>
											<th style="width:11%; text-align: center;">Chức Năng</th>
										</tr>
									</thead>
									<tbody>
									<%
										if(listCmt.size() > 0 && listCmt != null){
											for(Comment item : listCmt){
									%>
										<tr>
											<td align="center"><%=item.getIdNews() %></td>
											<td align="center"><a href="<%=request.getContextPath() %>/chitiet?did=<%=item.getIdNews()%>"><%=item.getNameNews() %></a></td>
											<td align="center"><%=item.getNameCat() %></td>
											<td align="center"><%=item.getFullname() %></td>
											<td align="center"><%=item.getEmail() %></td>
											<td align="center"><%=item.getCmt() %></td>
											<td align="center">
												<a onclick="return confirm('Bạn có chắc chắn muốn xóa ?')" href="<%=request.getContextPath() %>/binh-luan/del/<%=item.getId() %>.html">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/file_delete.png" width="16" height="16" alt="delete" /></a>
											</td>
										</tr>
									<%}}else { %>
										<tr>
											<td colspan="7" align="center">Không Có Dữ Liệu</td>
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
				  	<li><a href="<%=request.getContextPath()%>/admin-comment?page=<%=current_page-1%>">&laquo;</a></li>
				  <%} %>
				  <%	
					String active = "";
					if(sumPage >= 1 ){
						for(int i = 1; i <= sumPage ; i++){
							if(current_page == i){
								active = "class='active'";
							} else {
								active = "";
							}
					%>
				    <li <%=active %>><a href="<%=request.getContextPath()%>/admin-comment?page=<%=i%>"><%=i %></a></li>
				    <%} }%>
				     <%
				  		if(current_page != sumPage){
				 	 %>
				  		<li><a href="<%=request.getContextPath()%>/admin-comment?page=<%=current_page+1%>">&raquo;</a></li>
				  	<%} %>
				  </ul>
				</div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>