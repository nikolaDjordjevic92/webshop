<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  <div id="menu" class="col-lg-12">
	<ul class="list-group">
		<li class="list-group-item">
			<h2>Categories</h2>
		</li>
		
	</ul>
</div> -->
<div class="tab">
  <p class="h1">Categories:</p>
  <c:forEach items="${categories}" var="item">
      <button id="category-${item.id}" class="tablinks" onclick="window.location='<c:url value='/categories/${item.id}'/>'">
	      <i class="material-icons">${item.glyphicon}</i><p> ${item.name}</p>
      </button>
  </c:forEach>
</div>