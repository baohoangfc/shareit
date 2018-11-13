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
	ArrayList<Category> listCat = (ArrayList)request.getAttribute("listCat");
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
	                                if("fail".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Sai Tên Người Dùng Hoặc Mật Khẩu</span>");}
                                %>                                                             
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form id="myForm" action="<%=request.getContextPath() %>/admin/login" role="form" method="post">

                            <div class="form-group">
                                <label>Tên Người Dùng</label>
                                <input name="username"  class="form-control">
                            </div>
                            
                             <div class="form-group">
                                <label>Mật Khẩu</label>
                                <input type="password" name="password"  class="form-control">
                            </div>
                                                      
                            <button type="submit" class="btn btn-default">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>

                        </form>

                    </div>
                </div>
                <!-- /.row -->
				<script type="text/javascript">
					$(document).ready(function() {
						$('#myForm').validate({
							ignore: [],
							debug: false,
							rules : {
								username : {
									required : true,
								},
								password : {
									required : true,
								},
							},
							messages : {
								username : {
									required : "Vui lòng nhập tài khoản !!!",
									
								},
								password : {
									required : "Vui lòng nhập mật khẩu !!!",
								},
							}
						});
					});
				</script>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>