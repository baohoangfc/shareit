<%@page import="model.bean.User"%>
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
	
	String err = request.getParameter("err");
	String msg = request.getParameter("msg");
%>
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i> 
                                <%
	                                if("2".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Sửa Người Dùng Thất bại</span>");}
                                %>                                                             
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
					<%
						
						if(request.getAttribute("user") != null){
							User objUser = (User)request.getAttribute("user");
					%>
                        <form id="myForm" role="form" method="post" action="<%=request.getContextPath()%>/admin-user/edit?id=<%=objUser.getId()%>">

                            <div class="form-group">
                                <label>Tên Người Dùng : </label>
                                <span style="color:red;font-size: 30px"><%=objUser.getUsername() %></span>
                            </div>
                            
                             <div class="form-group">
                                <label>Mật Khẩu</label>
                                <input type="password" value="" name="password"  class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <label>Tên Đầy Đủ</label>
                                <input name="fullname" value="<%=objUser.getFullname() %>" class="form-control">
                            </div>
							
                                                      
                            <button type="submit" class="btn btn-default">Edit</button>
                            <button type="reset" class="btn btn-default">Reset</button>

                        </form>
					<%} %>
                    </div>
                </div>
                <!-- /.row -->
				<script type="text/javascript">
					$(document).ready(function() {
						$('#myForm').validate({
							ignore: [],
							debug: false,
							rules : {
								fullname : {
									required : true,
								},
			
							},
							messages : {
								fullname : {
									required : "Vui lòng nhập tên đầy đủ !!!",
								},
							},
						});
					});
				</script>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>