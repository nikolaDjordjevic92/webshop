<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <title><tiles:getAsString name="title" /></title>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	    
	    <!--   <link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
	    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!--  icons -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- scripts and css -->
		<script src="<c:url value='/resources/scripts/javascript.js' />"></script>
		<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
		
	</head>
  	
	<body ng-app="myApp" ng-controller="myCtrl">
		<input id="urlprefix" type="hidden" value="<c:url value='/'/>"/>
		<input id="category_id" type="hidden" value="${product.category.id}"/>
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
     	<div class="row sidemenu-main-div-row">
     		<div class="col-lg-1 sidemenu-main-div">
		        <section id="sidemenu">
		            <tiles:insertAttribute name="menu" />
		        </section>
        	</div>     
        
	        <div class="col-lg-11">
		        <section id="site-content">
		            <tiles:insertAttribute name="body" />
		        </section>
	        </div>
   		</div>
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
	</body>
</html>