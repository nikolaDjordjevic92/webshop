<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form name="submitForm" action="<c:url value='/login'/>" method="POST">
			<div class="col-lg-12">
				<input type="text" class="form-control" id="username" name="username" placeholder="username"/>
				<input type="password" class="form-control" id="password" name="password" placeholder="password"/>
				<input type="submit" value="log in"/>
			</div>
		</form>
	</div>
</body>
</html>