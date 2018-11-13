<%@page import="library.Slug"%>
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
                                	if("success".equals(msg)){
                        				out.print("<span style='color:red;font-size:18px'>Bạn Đã Đăng Nhập Thành Công</span>");}
                                	if("login".equals(msg)){
                            			out.print("<span style='color:red;font-size:18px'>Bạn Đã Đăng Nhập</span>");}
	                                if("0".equals(msg)){
	                            		out.print("<span style='color:red;font-size:18px'>Thêm Tin Tức Thành Công</span>");}
                                	if("1".equals(msg)){
                            		out.print("<span style='color:red;font-size:18px'>Sửa Tin Tức Thành Công</span>");}
                                	if("2".equals(msg)){
                                		out.print("<span style='color:red;font-size:18px'>Xóa Tin Tức Thành Công</span>");}
                                	if("2".equals(err)){
                                		out.print("<span style='color:red;font-size:18px'>Không Thể Xóa Tin Tức</span>");}
                                %>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
            
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <a href="<%=request.getContextPath()%>/bai-viet/add.html">
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
											<th style="width:16%; text-align: center;">Danh mục</th>
											<th style="width:16%; text-align: center;">Hình ảnh</th>
											<th style="width:11%; text-align: center;">Chức Năng</th>
											<th style="width:11%; text-align: center;">Slide</th>
											<th style="width:11%; text-align: center;">Trạng Thái</th>
										</tr>
									</thead>
									<%
										if(listNews.size() > 0 && listNews != null){
											String imgActive ="";
											for(News itemNews : listNews){
												if(itemNews.getStatus()==0){
													imgActive="deactive.gif";
												}else{
													imgActive="active.gif";
												}
									%>
									<tbody>
										<tr>
											<td align="center"><%=itemNews.getId() %></td>
											<td><a href="<%=request.getContextPath()%>/chi-tiet/<%=Slug.createSlug(itemNews.getName()) %>-<%=itemNews.getId() %>.html"><%=itemNews.getName() %></a></td>
											<td align="center"><%=itemNews.getCatName() %></td>
											<%
												if("".equals(itemNews.getPicture())){
											%>
											<td align="center"><img width="150px" height="80px" src="<%=request.getContextPath() %>/templates/no.gif" /></td>
											<%}else { %>
											<td align="center"><img width="150px" height="80px" src="<%=request.getContextPath() %>/files/<%=itemNews.getPicture() %>"/></td>
											<%} %>
											<td align="center">
												<a href="<%=request.getContextPath()%>/bai-viet/edit-<%=itemNews.getId() %>.html">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/edit.jpg" width="16" height="16" alt="edit" /></a>|
												<a onclick="return confirm('Bạn có chắc chắn muốn xóa ? ')" href="<%=request.getContextPath()%>/bai-viet/del/<%=itemNews.getId()%>.html">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/file_delete.png" width="16" height="16" alt="delete" /></a>
											</td>
											<td align="center"><% if(itemNews.getIsSlide() == 0){out.print("No");}else{out.print("Yes");} %></td>
											<td align="center" id="tin-<%=itemNews.getId()%>"><a href="javascript:void(0)" title=""
												onclick="return activeTin(<%=itemNews.getId()%>, <%=itemNews.getStatus()%>)"><img
												class="img-active"
												src="<%=request.getContextPath()%>/templates/<%=imgActive%>"
												alt="" /></a>
											</td>
										</tr>
										
									</tbody>
									<%}} %>
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
				  	<li><a href="<%=request.getContextPath()%>/admin-news?page=<%=current_page-1%>">&laquo;</a></li>
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
				    <li <%=active %>><a href="<%=request.getContextPath()%>/admin-news?page=<%=i%>"><%=i %></a></li>
				    <%} }%>
				     <%
				  		if(current_page != sumPage){
				 	 %>
				  		<li><a href="<%=request.getContextPath()%>/admin-news?page=<%=current_page+1%>">&raquo;</a></li>
				  	<%} %>
				  </ul>
				</div>
                <!-- /.row -->
			<script>
				function activeTin(id, status){
					
					$.ajax({
						url: '<%=request.getContextPath()%>/active-tin' ,
						type: 'POST',
						cache: false, 
						data: {
							//Dữ liệu gửi đi
							aid : id,
							astatus: status
						},
						success: function(data){
							$("#tin-"+id).html(data);
				
						},
						error: function (){
							// Xử lý nếu có lỗi
							alert("Có lỗi trong quá trình xử lý");
						}
					});
				}
			</script>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>