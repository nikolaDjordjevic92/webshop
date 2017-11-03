<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div id="product" class="col-lg-12">
	<div class="row">
		<div class="col-lg-2">
		</div>
		<div class="col-lg-8">
			<h1>${product.name}</h1>
			<div class="col-lg-6">
				<img src="/Webstore${product.pictureUri}" alt="${product.name}" width="500" height="500">
			</div>
			<div class="col-lg-6">
				<p>Price: ${product.price}</p>
			</div>				
		</div>
		<div class="col-lg-2">
		</div>
	</div>
</div>
