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
	@SuppressWarnings("unchecked")
	ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
    Category category = (Category)request.getAttribute("category");
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
	                            		out.print("<span style='color:red;font-size:18px'>Không Thể Sửa Danh Mục Tin</span>");}
                                %>                                
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form id="myForm" role="form" action="<%=request.getContextPath() %>/admin-cat/edit?id=<%=category.getId() %>" method="post">

                            <div class="form-group">
                                <label>Tên Tin</label>
                                <input value="<%=category.getName()%>" name="tentin" class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
							
							<div class="form-group">
                                <label>Danh Mục Cha</label>
                                <select name="danhmuc" class="form-control">
                                <%
                                String selected = "";
                                if(listCat.size() > 0 && listCat != null){
									for(Category itemCat : listCat){
											if(itemCat.getId() == category.getParent()){
												selected = "selected = 'selected'";
											} else {
												selected = "";
											}
                                %>    
                                    <option <%=selected %> value="<%=itemCat.getId()%>"><%=itemCat.getName() %></option>

                                <%}}%> 
                                </select>
                            </div>
                            
                           <!-- 
                            <div class="form-group">
                                <label>Thứ Tự</label>
                                <input name="thutu" class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                            -->
                            
                                                       
                            <button type="submit" class="btn btn-default">Edit</button>
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
							tentin : {
								required : true,
							},
		
						},
						messages : {
							tentin : {
								required : "Vui lòng nhập tên !!!",
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