<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	 <table class="table table-striped table-hover table-responsive">
	    <thead>
	      <tr>
	        <th>Product name</th>
	        <th>Price</th>
	        <th>Quantity</th>
	        <th>Date ordered</th>
	        <th>Shipping status</th>
	      </tr>
	    </thead>
        <tbody>
      		<c:forEach items="${myorders}" var="item">
				<tr>
	      			<td>${item.product.name}</td>
	      			<td>${item.product.price} $</td>
	      			<td>${item.orderQuantity}</td>
	      			<td><fmt:formatDate pattern="dd.MM.yyyy, hh:mm" value = "${item.orderDate}" /></td>
	      			<td>/</td>
	      		</tr>
      		</c:forEach>
        </tbody>
     </table>
     
     <div class="col-lg-12 pagination-div">
     	<ul class="pagination pagination-lg">
		  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
     </div>
     
</div>
