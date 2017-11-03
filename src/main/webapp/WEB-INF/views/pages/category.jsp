<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div id="products" class="col-lg-12">
	<div class="row">
		<c:forEach items="${products}" var="item">
			<div class="col-lg-4 product-row">
				<div class="col-lg-1">
				</div>
				<div class="col-lg-10  product-card">
					<div class="col-lg-12 product-card-name">
						<p>${item.name}</p><br>
					</div>
					<div class="col-lg-12">
							<img src="/Webstore${item.pictureUri}" alt="Cinque Terre" width="250" height="200">
					</div>
					<div class="col-lg-12 product-card-price">
						<div class="row">
							<div class="col-lg-6 price">
								<b>
									${item.price}$
								</b>
							</div>
							<div class="col-lg-6">
								<a href="/Webstore/product/${item.id}">
									<button type="button" class="btn btn-success">
											Details
									</button>
								</a>
							</div>
						</div>	
					</div>
				</div>
				<div class="col-lg-1">
				</div>
		    </div>
		</c:forEach>
	</div>
</div>
