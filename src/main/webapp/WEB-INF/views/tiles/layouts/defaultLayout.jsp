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
		
		<style>
			
			.bg {
			  position: absolute;
			  z-index: -1;
			  top: 0;
			  bottom: 0;
			  left: 0;
			  right: 0;
			  background: url("<c:url value='/City-Skyline-Silhouette.jpg'/>") center center;
			  opacity: .4;
			    width: 100%;
			    height: 100%;
			}
			
			P {
				margin:0px;
			}
			
			#menu {
				margin-top: 80px;
			}
		
			#menu UL LI{
				padding:10px 30px;
				background-color: #f4f4f2;
				
			}
			
			#site-content {
				margin:40px;
				min-height: 600px;
			}
			
			.price-product {
				font-size: 30px;
				font-weight: bold;
			}
			
			.product-information {
				text-align: right !important;
			}
			
			.stock-div {
				margin-top: 70px;
				padding: 35px;
				font-size: 30px;
				max-width: 280px;
				background-color: #00cc00;
				color: white;
				font-weight: bold;
			}
			
			.single-review {
				text-align: left;
				padding: 20px;
				font-size: 20px;
				min-height: 85px;
			}
			
			.single-review [checked=checked]{
				color: orange;
			}
			
			#review-content {
				margin-left: 15px;
			}
			
			#username {
				font-weight: bold;
			}
			
			DIV.reviews {
				font-size: 30px;
			}
			
			DIV.reviews A:hover {
				color: orange;
			}
			
			DIV.reviews A {
				color: white;
			}
			
			DIV.reviews A[checked="checked"] {
				color: orange;
			}
			
			
			
			.reviews-content .form-group {
				text-align: left;
			}
			
			.reviews-content .form-group LABEL {
				font-size: 20px;
			}
			
			LABEL[for=comment] {
				
			}
			
			.order-product {
				margin-top: 100px;
				font-size: 20px;
			}
			
			.product-image {
				text-align: center;
				padding: 15px;
			}
			
			.product-image IMG {
				border: 1px solid #ddd;
				border-radius: 4px;  
    			padding: 30px;
			}
			
			.product-image IMG:hover {
			    box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
			}			
			
			.navbar-right A{
				font-size: 17px;
				font-weight: bold;
			}
			
			.login-dropdown {
				padding: 15px;
				min-width: 250px;
			}
			
			.login-dropdown LI{
				margin: 10px;
				padding-bottom: 11px;
			}
			
			.login-dropdown LI BUTTON {
				font-weight: bold;
			}
			
			NAV LI A.drop-down:hover,
			A.home:hover{
				border-bottom: 3px solid white;
				padding-bottom: 11px;
			}
			
			.tablink {
				background-color: black;
	    		color: white;
				float: left;
			    border: none;
			    outline: none;
			    cursor: pointer;
			    padding: 14px 16px;
			    font-size: 17px;
			    width: 25%;
			}		
			
			.tablink:hover {
				background-color: #595959;
			}
			
			.tabcontent {
				color: white;
			    display: none;
			    padding: 25px;
			    text-align: center;
			    min-height: 400px;
			}
			
			#write-review H3 {
				margin-bottom: 30px;
			}
			
			#product-description,
			#reviews,
			#write-review {
				background-color:black;
			}
			
			.pagination-div {
				text-align: center;
			}
			
			TABLE,
			TABLE TH {
				text-align: center;
			}
			
			#footer {
				text-align: center;
				margin-top: 50px;
				color: white;
				font-weight: bold;
				font-size: 20px;
				width: 100%;
			}
			
			#footer DIV.col-lg-12{
				padding-top: 50px;
				margin-top: 50px;
				min-height: 200px;
				width: 100%;
			}
			
			#products {
				padding:20px;
				text-align: center;
				padding-left: 0px;
				padding-right: 0px;
			}
			.product-card {
				text-align: center;
				outline: 1px solid black;
				padding-left:0px;
				padding-right:0px;
			}
			
			.product-row {
				margin-top: 20px;
				margin-bottom: 20px;
			}
			
			.product-card:hover{
				box-shadow: 10px 10px 5px #888888;
				opacity:1.1;
				transition: all .3s ease;
			}
			
			.product-card-tiles {
				padding: 20px;
			}
			.product-card-name {
				font-size:20px;
				padding:10px;
			}
			
			.product-card-price DIV{
				background-color: #1b1b1c;
				padding-left:0px;
				padding-right:0px;
			}
			.product-card-price B{
				color:white;
				font-size: 30px;
			}
			.product-card-price BUTTON{
				width: 100%;
				font-size:27px;
				border-radius:0px;
			}
			DIV.price {
				padding: 5px;
			}
			
			.shopping-list {
				min-width: 400px;
				padding: 5px;
			}
			
			.shopping-list DIV {
				min-height: 50px;
				vertical-align: middle;
			}
			
			.shopping-list DIV P{
				margin:13px;
			}
			.shopping-item {
				margin: 5px;
				padding: 10px;
			}
			
			.shopping-item IMG{
				max-height: 50px;
			}
			
			.vertical-center {
			  min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
			  min-height: 100vh; /* These two lines are counted as one :-)       */
			
			  display: flex;
			  align-items: center;
			}
			
			.image {
			  opacity: 1;
			  transition: .5s ease;
			  backface-visibility: hidden;
			}
		    .product-card-price {
			  transition: .5s ease;
			  opacity: 0;
			}
			
			.product-card:hover .image {
			  opacity: 0.3;
			}
			
			.product-card:hover .product-card-price {
			  opacity: 1;
			}
			
		</style>
	</head>
  
	<body ng-app="myApp" ng-controller="myCtrl">
		
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
     	
     	<div class="col-lg-2">
	        <section id="sidemenu">
	            <tiles:insertAttribute name="menu" />
	        </section>
        </div>     
        
        <div class="col-lg-10">
	        <section id="site-content">
	            <tiles:insertAttribute name="body" />
	        </section>
        </div>
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
	</body>
</html>