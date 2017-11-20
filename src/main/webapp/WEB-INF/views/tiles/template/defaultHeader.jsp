<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Webstore</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="<c:url value='/'/>">Home</a></li>
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
