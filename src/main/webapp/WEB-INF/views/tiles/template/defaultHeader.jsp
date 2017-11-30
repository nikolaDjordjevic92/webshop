<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

	<script>
		$(document).ready(function(){
			function markCurrentCategory() {
				var i,tablinks;
				 tablinks = document.getElementsByClassName("tablinks");
				    for (i = 0; i < tablinks.length; i++) {
				        tablinks[i].className = tablinks[i].className.replace(" active", "");
				    }
			
				var url=window.location.href;
				var id=0;
				if(url.includes("categories")){
				     id=url.split("/").pop();
				     if(id.includes("?")){
						id = id.substring(id.indexOf("?"));				    	 
				     }
				     var htmlSelector = '#category-'+id;
					 $(htmlSelector).addClass('active');		
				}
				if(url.includes("product")){
					id=${product.category.id}+0; 
					var htmlSelector = '#category-'+id;
				    $(htmlSelector).addClass('active');	
				}
			}
			
			markCurrentCategory();
		});
	
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope, $http) {
			$scope.on_stock_value=${product.quantity}+0;
			$scope.on_stock=${product.quantity}+0;
			$scope.getOrders = function(){	
			  $http.get("<c:url value='/order/1'/>")
			  .then(function(response) {
			      $scope.listOfOrders = response.data;
			  });
			}
			
			$scope.persistReview = function(){		
				$prodId = $('#productId').val();
				$rating = $('#star-rate').val();
				$content = $('#comment').val();
				
			    jQuery.ajax ({
				    url: "<c:url value='/reviews'/>",
				    headers: {
				    	'Content-Type' : 'application/json'
				    },
				    type: "POST",
				    data: JSON.stringify({
				    	product : {
				    		id : $prodId
				    	},
				    	rating : $rating,
				    	content : $content
				    }),
				    contentType: "application/json; charset=utf-8",
				    success: function(response){
				    	$('#ajax-response').html('<div class="alert alert-success alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>Successfully added review.</div>');
				    },
				    error:function(request, status, error) {
				    	console.log(status);
				    }
				});
			};
			
			$scope.addRowAsyncAsJSON = function(){		
				$prodId = $('#productId').val();
				$quantityBought = $('#quantity').val();
				
			    jQuery.ajax ({
				    url: "<c:url value='/order'/>",
				    headers: {
				    	'Content-Type' : 'application/json'
				    },
				    type: "POST",
				    data: JSON.stringify({
				    	id : $prodId,
				    	quantity : $quantityBought
				    }),
				    contentType: "application/json; charset=utf-8",
				    success: function(response){
				    	$('#ajax-response').html('<div class="alert alert-success alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>Successfully added product in cart.</div>');
				    },
				    error:function(request, status, error) {
				    	$('#ajax-response').html('<div class="alert alert-danger alert-dismissable fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>Something went wrong, try again...</div>');
				    }
				});
			};
		});
	</script>

	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Webstore</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a class="home" href="<c:url value='/'/>"><i class="fa fa-home" aria-hidden="true"></i>  Home</a></li>
	      <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
		        <c:forEach items="${categories}" var="item">
		          <li><a href="/Webstore/categories/${item.id}">${item.name}</a></li>
				</c:forEach>
	        </ul>
	      </li>
	      <li>
	      	<a href="<c:url value='/contactus' />"><i class="fa fa-phone" aria-hidden="true"></i>  Contact Us
	      	
	      	</a>
	      </li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li>
	      	<a class="drop-down" href="<c:url value='/myorders'/>">
	      		<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>     My orders
	      	</a>
	      </li>
	      <li class="dropdown">
	      	<a class="dropdown-toggle drop-down" href="#here" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>    Log in</a>
	      	<ul class="dropdown-menu login-dropdown">
	      		<li class="dropdown-username">
	      			<input type="text" class="form-control" id="username" placeholder="username">
	      		</li>
	      		<li>
	      			<input type="password" class="form-control" id="password" placeholder="password">
	      		</li>
	      		<li>
	      			<button type="button" class="btn btn-info" id="log-in">
	      				<p>Log in</p>
	      			</button>
	      		</li>
	      	</ul>
	      </li>
	      <li class="dropdown">
	      	<a class="dropdown-toggle drop-down" ng-click="getOrders()" href="#here" data-toggle="dropdown"><span class="glyphicon glyphicon-shopping-cart"></span>    Shopping cart</a>
	      	<ul class="dropdown-menu shopping-list">
	      		<li class="shopping-item" ng-repeat="order in listOfOrders">
	      			<div class="row">
		      			<div class="col-lg-9 .vertical-center">
			      			<p>{{order.product.name}} - {{order.product.price}}$, quantity:{{order.orderQuantity}}</p>
		      			</div>
		      			<div class="col-lg-3 .vertical-center">
			      			<img class="shopping-item-img" ng-src="/Webstore{{order.product.pictureUri}}">
		      			</div>
	      			</div>
	      		</li>
	      		<li class="btn-shopping-cart">
	      			<form action="<c:url value='/ordersubmit'/>" method="GET">
		      			<input type="submit" value="Buy" class="btn btn-info">
		      		</form>
	      		</li>
	      	</ul>
	      </li>
	    </ul>
	  </div>
	</nav>
