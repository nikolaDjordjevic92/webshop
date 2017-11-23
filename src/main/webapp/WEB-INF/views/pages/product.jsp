<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<div id="product" class="col-lg-12">
	<div class="row">
		<div class="col-lg-10">
			<div class="col-lg-12">
				<h1>${product.name}</h1>
			</div>
			<div class="col-lg-6 product-image">
				<img class="img-responsive" src="/Webstore${product.pictureUri}" alt="${product.name}" width="500" height="500">
			</div>
			<div class="col-lg-6">
				<div class="col-lg-12">
					<p class="price-product">Price: ${product.price}  $</p>
				</div>
				<div class="col-lg-12 stock-div">
					<p>On stock:  ${product.quantity}</p>
				</div>
				<div class="col-lg-12 order-product">
					<form role="form" ng-submit="addRowAsyncAsJSON()">
						<input type="hidden" value="${product.id }" ng-model="id" id="productId">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg-6">
											<p>Quantity:</p>
										</div>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="quantity">
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<input type="submit" value="Add to cart" class="btn btn-primary"/>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>				
		</div>
		<div class="col-lg-2">
		</div>
	</div>
</div>
