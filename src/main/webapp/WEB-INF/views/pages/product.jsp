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
			<div class="col-lg-6 product-information">
				<div class="col-lg-6">
				</div>
				<div class="col-lg-6">
					<p class="price-product">Price: ${product.price}  $</p>
				</div>
				<div class="col-lg-6">
				</div>
				<div class="col-lg-6 stock-div">
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
	<div class="col-lg-10">
		<div id="product-description" class="tabcontent">
		  <h3>Description</h3>
		  <p id="description">${product.description}</p>
		</div>
		
		<div id="reviews" class="tabcontent">
		  <h3>Reviews</h3>
		  <c:forEach items="${reviews}" var="item">
		  	<div class="col-lg-12 single-review">
		  	  <div class="row">
		  	  	  <input type="hidden" id="reviewed-product" value=${item.rating}>
			  	  <p id="username">${item.user.username},  Rating: 
			  	  <c:forEach var = "i" begin = "1" end = "5">
			  	  	<c:choose>
			  	  	  <c:when test="${item.rating >= i}">
					  	  <span id="reviewed-star-${i}" class="fa fa-star" checked="checked"></span>
			  	  	  </c:when>
			  	  	  <c:otherwise>
			  	  	  	  <span id="reviewed-star-${i}" class="fa fa-star"></span>
			  	  	  </c:otherwise>
			  	  	</c:choose>
			  	  </c:forEach>
			  	  </p>
		  	  </div>
			  <p id="review-content">${item.content}</p>
		  	</div>
		  </c:forEach>
		</div>
		
		<div id="write-review" class="tabcontent">
	 	  <h3>Write review</h3>
		     <form role="form" ng-submit="persistReview()">
		 	  	<div class="col-lg-6 reviews-content">
				  <div class="row reviews">
					  <p id="review">Rate this product:</p>
					  <a id="star-1" href="" onclick="paintStars(id)" onmouseover="paintStarsHover(id)" onmouseout="paintStarsOut()" checked="checked"><span class="fa fa-star"></span></a>
					  <a id="star-2" href="" onclick="paintStars(id)" onmouseover="paintStarsHover(id)" onmouseout="paintStarsOut()"><span class="fa fa-star"></span></a>
					  <a id="star-3" href="" onclick="paintStars(id)" onmouseover="paintStarsHover(id)" onmouseout="paintStarsOut()"><span class="fa fa-star"></span></a>
					  <a id="star-4" href="" onclick="paintStars(id)" onmouseover="paintStarsHover(id)" onmouseout="paintStarsOut()"><span class="fa fa-star"></span></a>
					  <a id="star-5" href="" onclick="paintStars(id)" onmouseover="paintStarsHover(id)" onmouseout="paintStarsOut()"><span class="fa fa-star"></span></a>
					  <input type="hidden" id="star-rate" value="1">
				  </div>
		 	  	</div>
		 	  	<div class="col-lg-6 reviews-content">
		 	  	  <div class="form-group">
					  <label for="comment">Comment:</label>
					  <textarea class="form-control" rows="5" id="comment"></textarea>
				  </div> 
				  <input type="submit" class="btn btn-info" value="Rate it!">
		 	  	</div>
			 </form>
		</div>
		
		<button class="tablink" onclick="openCity('product-description', this, 'grey')" id="defaultOpen">Description</button>
		<button class="tablink" onclick="openCity('reviews', this, 'grey')">Reviews</button>
		<button class="tablink" onclick="openCity('write-review', this, 'grey')">Write review</button>
	</div>
	<div class="col-lg-2">
	</div>
</div>
<script>
	function openCity(cityName, elmnt, color) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	
	    tablinks = document.getElementsByClassName("tablink");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].style.backgroundColor = "";
	    }
	
	    document.getElementById(cityName).style.display = "block";
	
	    elmnt.style.backgroundColor = color;
	}
	
	// Get the element with id="defaultOpen" and click on it
    $("#defaultOpen").click();
	
	function paintStars(id){
		for (i = 1; i <= 5; i++) {
			string = '#star-'+i;
		    $(string).removeAttr('checked');
		} 
		var str = id.substring(5);
		var string="";
		for (i = 1; i <= str; i++) {
			string = '#star-'+i;
		    $(string).attr('checked','checked');
		}
		$('#star-rate').val(str);
	}
	
	function paintStarsHover(id){
		for (i = 1; i <= 5; i++) {
			string = '#star-'+i;
		    $(string).removeAttr('checked');
		} 
		var str = id.substring(5);
		var string="";
		for (i = 1; i <= str; i++) {
			string = '#star-'+i;
		    $(string).attr('checked','checked');
		}
	}
	
	function paintStarsOut(){
		for (i = 0; i <= 5; i++) {
			string = '#star-'+i;
		    $(string).removeAttr('checked');
		} 
		var string="";
		for (i = 1; i <= $('#star-rate').val(); i++) {
			string = '#star-'+i;
		    $(string).attr('checked','checked');
		}
	}
</script>
