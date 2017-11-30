<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
		
	 <h1>My orders:</h1>
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
	      			<c:if test = "${item.orderStatus == 'IN_CART'}">
		      			<td class="danger shipping-status">In cart</td>
	      			</c:if>
	      			<c:if test = "${item.orderStatus == 'ORDERED'}">
		      			<td class="warning shipping-status">Ordered</td>
	      			</c:if>
	      			<c:if test = "${item.orderStatus == 'ON_THE_ROAD'}">
		      			<td class="info shipping-status">On the road</td>
	      			</c:if>
	      			<c:if test = "${item.orderStatus == 'SHIPPED'}">
		      			<td class="success shipping-status">Shipped</td>
	      			</c:if>
	      		</tr>
      		</c:forEach>
        </tbody>
     </table>
     
     <div class="col-lg-12 pagination-div">
     	<ul class="pagination pagination-lg">
     		<c:forEach begin="1" end="${maxPages}" step="1" var="url" varStatus="i">
			  <li class="page-item">
			  	<c:choose>
			  		<c:when test="${i.index==page}">
			  			<span>${i.index}</span>
			  		</c:when>
			  		<c:otherwise>
			  			<c:url value="/myorders" var="url">
			  				<c:param name="page" value="${i.index}"/>
			  			</c:url>
					  	<a class="page-link" href="<c:out value='${url}'/>"> ${i.index } </a> 
			  		</c:otherwise>
			  	</c:choose>
			  
			  </li>
     		</c:forEach>
		</ul>
     </div>
     
</div>
