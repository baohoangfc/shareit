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
	                                if("0".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Thêm Danh Mục Tin Thất bại</span>");}
	                                if("check".equals(err)){
	                            		out.print("<span style='color:red;font-size:18px'>Trùng Tên Danh Mục Tin</span>");}
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
                                <label>Tên Tin</label>
                                <input name="tentin"  class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
							
							<div class="form-group">
                                <label>Danh Mục Cha</label>
                                <select name="danhmuc" class="form-control">
                                <%
                                if(listCat.size() > 0 && listCat != null){
									for(Category itemCat : listCat){
                                %>    
                                    <option value="<%=itemCat.getId()%>"><%=itemCat.getName() %></option>
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
                            
                                                       
                            <button type="submit" class="btn btn-default">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>

                        </form>

                    </div>
                    <div class="col-lg-6">
                        <h1>Form Validation</h1>

                        <form role="form">
                        </form>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
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
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>