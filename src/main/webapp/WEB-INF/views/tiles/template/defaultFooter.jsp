<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="col-lg-12">
	<div class="col-lg-4">
		<img src="<c:url value='/facebooki.png'/>" onmouseover="this.src='<c:url value='/facebook.png'/>';" onmouseout="this.src='<c:url value='/facebooki.png'/>';"/>
	</div>	
	<div class="col-lg-4">
		<img src="<c:url value='/instagrami.png'/>" onmouseover="this.src='<c:url value='/instagram.png'/>';" onmouseout="this.src='<c:url value='/instagrami.png'/>';"/>
	</div>
	<div class="col-lg-4">
		<img src="<c:url value='/pinteresti.png'/>" onmouseover="this.src='<c:url value='/pinterest.png'/>';"  onmouseout="this.src='<c:url value='/pinteresti.png'/>';"/>
	</div>
</div>