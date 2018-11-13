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
	ArrayList<User> list = (ArrayList)request.getAttribute("listMod");
	String err = request.getParameter("err");
	String msg = request.getParameter("msg");
	
%>
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Forms
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i> 
                                <%
	                                if("0".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Thêm Người Dùng Thất bại</span>");}
	                                if("check".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Tên Người Dùng Đã Tồn Tại</span>");}
                                %>                                                             
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form id="myForm" role="form" method="post">

                            <div class="form-group">
                                <label>Tên Người Dùng</label>
                                <input name="username"  class="form-control">
                            </div>
                            
                             <div class="form-group">
                                <label>Mật Khẩu</label>
                                <input type="password" name="password"  class="form-control">
                            </div>
                            
                             <div class="form-group">
                                <label>Tên Đầy Đủ</label>
                                <input name="fullname"  class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <label>Cấp Bậc</label>
                                <select name="mod" class="form-control">
                                <%
                            		for(User item : list){
                            	%>
                                    <option value="<%=item.getIdMod()%>" ><%=item.getNameMod() %></option>
                                <%} %>    
                                </select>
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
								fullname : {
									required : true,
								},
			
							},
							messages : {
								username : {
									required : "Vui lòng nhập tên người dùng !!!",
								},
								password : {
									required : "Vui lòng nhập mật khẩu !!!",
								},
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