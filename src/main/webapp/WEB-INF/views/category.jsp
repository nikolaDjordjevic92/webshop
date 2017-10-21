<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#products {
		padding:20px;
		text-align: center;
	}
	.product-card {
		margin:50px;
		text-align: center;
		outline: 1px solid black;
		padding-left:0px;
		padding-right:0px;
	}
	.product-card .col-lg-12 {
		padding-left:0px;
		padding-right:0px;
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
		background-color: silver;
		padding-left:0px;
		padding-right:0px;
	}
	.product-card-price B{
		color:green;
		font-size: 30px;
	}
	.product-card-price BUTTON{
		width: 100%;
		height: 100%;
		font-size:27px;
		border-radius:0px;
	}
	.product-card-price .col-lg-6{
		height: 100%;
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Webstore</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
	        <c:forEach items="${categories}" var="item">
	          <li><a href="/Webstore/categories/${item.id}">${item.name}</a></li>
			</c:forEach>
        </ul>
      </li>
    </ul>
  </div>
</nav>
<div id="products" class="col-lg-12">
	<div class="row">
		<c:forEach items="${products}" var="item">
			<div class="col-lg-2 product-card">
				<div class="col-lg-12 product-card-name">
					<p>${item.name}</p><br>
				</div>
				<div class="col-lg-12">
					<a href="/Webstore/product/${item.id}">
						<img src="/Webstore${item.pictureUri}" alt="Cinque Terre" width="250" height="200">
			   		 </a>
				</div>
				<div class="col-lg-12 product-card-price">
					<div class="row">
						<div class="col-lg-6">
							<b>
								${item.price }$
							</b>
						</p>
						</div>
						<div class="col-lg-6">
							<button type="button" class="btn btn-success">
								Details
							</button>
						</div>
					</div>	
				</div>
		    </div>
		</c:forEach>
	</div>
</div>

</body>
</html>