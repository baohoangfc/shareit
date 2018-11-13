<%@page import="model.bean.News"%>
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
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>
                                <%
	                              	if("0".equals(err)){
	                           			out.print("<span style='color:red;font-size:18px'>Không Thể Sửa Tin Tức</span>");}
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
					<%
						if(request.getAttribute("objNews") != null){
							News item = (News)request.getAttribute("objNews");
					%>
                        <form id="myForm" role="form" action="<%=request.getContextPath() %>/admin-news/edit?id=<%=item.getId() %>" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label>Tên Tin</label>
                                <input name="tentin" value="<%=item.getName() %>" class="form-control">
                            </div>
							<%
								String selected = "";
								ArrayList<Category> list = (ArrayList)request.getAttribute("listCat");
								if(list.size() > 0 && list != null){
							%>
							<div class="form-group">
                                <label>Danh Mục Tin</label>
                                <select name="danhmuc" class="form-control">
                                    <%
                                    	for(Category item1 : list){
                                    		if(item1.getParent() == 0){
                                    			if(item1.getId() == item.getCatId()){
                                        			selected = "selected = 'selected' ";
                                        		} else {
                                        			selected = "";
                                        		}
                                    %>
                                    	<option <%=selected %> value="<%=item1.getId()%>" ><%=item1.getName() %></option>
                                    <%} %>
                                    <%
                                    	for(Category item2 : list){
                                    		if(item2.getParent() == item1.getId()){
                                    			if(item2.getId() == item.getCatId()){
                                        			selected = "selected = 'selected' ";
                                        		} else {
                                        			selected = "";
                                        		}
                                    %>
                                    	<option <%=selected %> value="<%=item2.getId()%>" >&nbsp;&nbsp;+&nbsp;&nbsp;<%=item2.getName() %></option>
                                    <%} %>
                                    <%}} %>
                                </select>
                            </div>
                            <%} %>
							
                            <div class="form-group">
                                <label>Mô tả Tin</label>
                                <input  name="mota" value="<%=item.getPreview() %>" class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Hình Ảnh</label>
                                <input name="hinhanh"  type="file">
                                <%
									if(!"".equals(item.getPicture())){
								%>	
								<img style="width: 150px;height: 100px " src="<%=request.getContextPath() %>/files/<%=item.getPicture() %>" alt="<%=item.getPicture()%>"  />
								<%} %>
                            </div>

                            <div class="form-group">
                                <label>Chi Tiết Tin</label>
                                <textarea id="editor"  name="chitiet"  class="form-control ckeditor" rows="3" placeholder="Enter text"><%=item.getDetail() %></textarea>
                            </div>
                            
                            <%
                            	if(item.getIsSlide() != 0){
                            %>
                            <div  class="form-group">
	                            <label >Slide</label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline1" value="1" checked>Yes
	                            </label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline2" value="0">No
	                            </label>
                        	</div>
							<%} else { %>
								 <div  class="form-group">
	                            <label >Slide</label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline1" value="1" >Yes
	                            </label>
	                            <label class="radio-inline">
	                                <input type="radio" name="slide" id="optionsRadiosInline2" value="0" checked>No
	                            </label>
                        	</div>
							<%} %>
							
                            <button type="submit" class="btn btn-default">Submit</button>
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
								tentin : {
									required : true,
								},
								mota : {
									required : true,
								},
								chitiet : {
									required : true,
								},
			
							},
							messages : {
								tentin : {
									required : "Vui lòng nhập tên tin !!!",
								},
								mota : {
									required : "Vui lòng nhập tên mô tả !!!",
								},
								chitiet : {
									required : "Vui lòng nhập chi tiết tin !!!",
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