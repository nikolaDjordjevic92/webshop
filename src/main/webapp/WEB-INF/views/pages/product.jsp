<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<script>
var helloAjaxApp = angular.module("myApp", []);

helloAjaxApp.controller("myCtrl", ['$scope', '$http', function($scope, $http) {
$scope.addRowAsyncAsJSON = function(){		
	$prodId = $('#productId').val();
	$quantityBought = $('#quantity').val();
	
	var dataObj = {
	    id : $prodId,
	    quantity : $quantityBought
	}
	
	var res = $http.post("<c:url value='/order'/>", dataObj);
	res.success(function(data, status, headers, config) {
		$scope.message = data;
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});		
	// Making the fields empty
	//
	$scope.productId='';
	$scope.quantity='';
};
}]);
</script>

<div id="product" class="col-lg-12" ng-app="myApp">
	<div class="row">
		<div class="col-lg-2">
		</div>
		<div class="col-lg-8" ng-controller="myCtrl">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-6">
						<h1>${product.name}</h1>
					</div>
					<div class="col-lg-6">
						On stock:<input type="text" class="form-control" id="stock" value="${product.quantity}">
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<img src="/Webstore${product.pictureUri}" alt="${product.name}" width="500" height="500">
			</div>
			<div class="col-lg-6">
				<p>Price: ${product.price}</p>
			</div>				
			<div class="col-lg-12">
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
		<div class="col-lg-2">
		</div>
	</div>
</div>
