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
	String msg = request.getParameter("msg");
	String err = request.getParameter("err");
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
	                           			out.print("<span style='color:red;font-size:18px'>Không Thể Thêm Tin Tức</span>");}
                                %>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Forms
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form id="myForm" role="form" action="<%=request.getContextPath() %>/admin-news/add" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label>Tên Tin</label>
                                <input name="tentin" class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
							<%
								ArrayList<Category> list = (ArrayList)request.getAttribute("list");
								if(list.size() > 0 && list != null){
							%>
							<div class="form-group">
                                <label>Danh Mục Tin</label>
                                <select name="danhmuc" class="form-control">
                                    <%
                                    	for(Category item : list){
                                    		if(item.getParent() == 0){
                                    %>
                                    	<option value="<%=item.getId()%>" ><%=item.getName() %></option>
                                    <%} %>
                                    <%
                                    	for(Category item2 : list){
                                    		if(item2.getParent() == item.getId()){
                                    %>
                                    	<option value="<%=item2.getId()%>" >&nbsp;&nbsp;+&nbsp;&nbsp;<%=item2.getName() %></option>
                                    <%} %>
                                    <%}} %>
                                </select>
                            </div>
                            <%} %>
							
                            <div class="form-group">
                                <label>Mô tả Tin</label>
                                <input  name="mota" class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Hình Ảnh</label>
                                <input name="hinhanh" type="file">
                            </div>

                            <div class="form-group">
                                <label>Chi Tiết Tin</label>
                                <textarea id="editor" class="ckeditor" name="chitiet" class="form-control" rows="3" placeholder="Enter text"></textarea>
                            </div>
                            
                            
                            <div  class="form-group">
	                            <label >Slide</label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline1" value="1" checked>Yes
	                            </label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline2" value="0">No
	                            </label>
                        	</div>

                            <button type="submit" class="btn btn-default">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>

                        </form>

                    </div>
                    <div class="col-lg-6">

                    </div>
                </div>
                <!-- /.row -->
				<script type="text/javascript">
					$(document).ready(function() {
						$('#myForm').validate({
							ignore: [],
							debug: false,
							rules : {
								chitiet : {
									required: true,
								},
								tentin : {
									required : true,
								},
								mota : {
									required : true,
								},
								hinhanh : {
									required : true,
								},
								
			
							},
							messages : {
								chitiet : {
									required : "Vui lòng nhập chi tiết tin !!!",
								},
								tentin : {
									required : "Vui lòng nhập tên tin !!!",
								},
								mota : {
									required : "Vui lòng nhập tên mô tả !!!",
								},
								hinhanh : {
									required : "Vui lòng chọn hình ảnh !!!",
								},
								
								
							},
						});
					});
				</script>
				<script type="text/javascript">
					var editor = CKEDITOR.replace( 'editor', {
				        uiColor: '#14B8C4',
				    });
					CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckfinder/')
				</script>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<%@include file="/templates/admin/inc/footer.jsp" %>