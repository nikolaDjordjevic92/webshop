<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</body>
</html>