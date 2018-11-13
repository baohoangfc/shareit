<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="apple-touch-icon" sizes="180x180" href="<%=request.getContextPath() %>/templates/admin/favicons/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="180x180" href="<%=request.getContextPath() %>/templates/admin/favicons/android-chrome-384x384.png">
	<link rel="icon" type="image/png" sizes="180x180" href="<%=request.getContextPath() %>/templates/admin/favicons/android-chrome-384x384.png">
	<link rel="manifest" href="/manifest.json">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="theme-color" content="#ffffff">

    <title>SB Admin</title>
    

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/templates/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/templates/admin/css/sb-admin-s.css" rel="stylesheet">
	
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/templates/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery -->
    <script src="<%=request.getContextPath() %>/templates/admin/js/jquery-3.2.1.js"></script>
    <script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ckfinder/ckfinder.js"></script>
	<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>
	<style type="text/css">
		.error{
			color: red;
			padding-top: 10px;
		}
		label{
			color: wheat;
		}
		#page-wrapper{
			background-color: #222222;
		}
		.pagination{
			background: #222222;
		}
	</style>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SB Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                <%
                	if(session.getAttribute("userLogin") != null){
                		User objUser = (User)session.getAttribute("userLogin");
                %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=objUser.getFullname() %> <b class="caret"></b></a>
                <%} %>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>