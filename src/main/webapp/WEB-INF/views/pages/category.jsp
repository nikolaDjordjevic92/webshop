<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<style>
	  .details-product	{
	  text-align: center;
	  transition: all 0.5s;
	  cursor: pointer;
	}
	
	.details-product span {
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}

	.details-product span:after {
	  content: '\00bb';
	  opacity: 0;
	  top: 0;
	  right: 0px;
	  transition: 0.5s;
	}
	
	.details-product:hover span {
	  padding-right: 25px;
	}
	
	.details-product:hover span:after {
	  opacity: 1;
	  right: 0;
	}
</style>

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
							<img src="/Webstore${item.pictureUri}" class="image" width="250" height="200">
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
									<button type="button" class="btn btn-success details-product">
											<span>Details</span>
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
