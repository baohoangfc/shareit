<%@page import="library.Slug"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!-- BEGIN html -->
<html lang = "en">
	<!-- BEGIN head -->
	
<!-- Giao dien duoc chia se mien phi tai www.ptheme.net [Free HTML Download]. SKYPE[ptheme.net] - EMAIL[ptheme.net@gmail.com].-->
<head>
		<title>Sendigo | Homepage</title>
		<!-- Meta Tags -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="description" content="" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

		<!-- Favicon -->
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/public/images/favicon.png" type="image/x-icon" />

		<!-- Stylesheets -->
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/reset.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/weather-icons.min.css" />
		<link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Arvo:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/dat-menu.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/main-stylesheet.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/ot-lightbox.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/shortcodes.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/responsive.css" />
		<script src="<%=request.getContextPath() %>/templates/public/jscript/jquery-3.2.1.js"></script>
    	<script src="<%=request.getContextPath() %>/templates/public/jscript/jquery.validate.js"></script>
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<!--[if lte IE 8]>
		<link type="text/css" rel="stylesheet" href="css/ie-ancient.css" />
		<![endif]-->

		<style>
			/* Custom CSS colors and fonts */

			/*
				Main body font size, font, color
				default:
					font-size: 16px;
					font-family: 'Noto Sans', sans-serif;
					color: #5e5e5e;
			*/
			body {
				font-size: 16px;
				font-family: 'Noto Sans', sans-serif;
				color: #5e5e5e;
			}

			/*
				Custom font for titles
				default:
					font-family: 'Arvo', serif;
					color: #3f3f3f;
			*/
			h1, h2, h3, h4, h5, h6 {
				font-family: 'Arvo', serif;
				color: #3f3f3f;
			}
		</style>

		<!-- Demo Only -->
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/demo-settings.css" />

	<!-- END head -->
	</head>

	<!-- BEGIN body -->
	<!-- <body> -->
	<body class="ot-menu-will-follow">

		<!-- BEGIN .boxed -->
		<div class="boxed">
			
			<!-- BEGIN .header -->
			<header class="header">

				<!-- BEGIN .top-menu -->
				<div class="top-menu">
				
					<!-- BEGIN .wrapper -->
					<div class="wrapper">
					<!-- END .wrapper -->
					</div>

				<!-- END .top-menu -->
				</div>
				
				<!-- BEGIN .wrapper -->
				<div class="wrapper">

					<!-- BEGIN .header-main -->

					<nav class="main-menu">
						<a href="#dat-menu" class="dat-menu-button"><i class="fa fa-bars"></i>Show Menu</a>
						<div class="main-menu-placeholder">
							<div class="main-menu-wrapper">
								<div class="menu-search-thing">
									<form action="<%=request.getContextPath()%>/search" method="get">
										<input name="search" type="text" placeholder="Search something.." />
										<input type="submit" value="Search" />
									</form>
									<button><i class="fa fa-search"></i></button>
								</div>
								<ul class="top-main-menu load-responsive" rel="Main Menu">
								<%
									CategoryDao categoryDao = new CategoryDao();
									ArrayList<Category> list = categoryDao.getListCatIndex();
									ArrayList<Category> listCat = categoryDao.getListCatNoParent();
									if(list != null && list.size() > 0){
								%>
									<li><a href="<%=request.getContextPath()%>/">Homepage</a></li>
									<%
										for(Category item : list){
									%>
									<li><a href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(item.getName()) %>-<%=item.getId() %>.html"><%=item.getName() %></a>
										<ul class="sub-menu">
											<%
												for(Category item2 : listCat){
													if(item2.getParent() == item.getId()){
											%>
											<li><a href="<%=request.getContextPath()%>/danh-muc/<%=Slug.createSlug(item2.getName()) %>-<%=item2.getId() %>.html"><%=item2.getName() %></a></li>
											<%}} %>
										</ul>
									</li>
									<%} %>
									
								</ul>
								<%} %>
							</div>
						</div>
					</nav>
					
				<!-- END .wrapper -->
				</div>
				
			<!-- END .header -->
			</header>