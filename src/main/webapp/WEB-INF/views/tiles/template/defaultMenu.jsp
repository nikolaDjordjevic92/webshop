<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="menu" class="col-lg-12">
	<ul class="list-group">
		<li class="list-group-item">
			<h2>Categories</h2>
		</li>
		<c:forEach items="${categories}" var="item">
          <li class="list-group-item"><a href="<c:url value='/categories/${item.id}'/>">${item.name}</a></li>
		</c:forEach>
	</ul>
</div>
