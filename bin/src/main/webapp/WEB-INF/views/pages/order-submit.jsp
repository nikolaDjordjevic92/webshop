<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<div class="container">
	<form action='<c:url value="/ordersubmit"/>' ng-submit="orderSubmit()" method="POST">
		<div class="form-group">
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>First name:</label>
							<input id="firstName" class="form-control"type="text" placeholder="first name" required>
						</div>
					</div>
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>City:</label>
							<input id="city" class="form-control"type="text" placeholder="city" required>
						</div>
					</div>
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>Home address:</label>
							<input id="homeAddress" class="form-control"type="text" placeholder="home address" required>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>Last name:</label>
							<input id="lastName" class="form-control"type="text" placeholder="last name" required>
						</div>
					</div>
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>Phone number:</label>
							<input id="phoneNumber" class="form-control"type="text" placeholder="phone number" required>
						</div>
					</div>
					<div class="col-lg-12 submit-order-fields">
						<div class="row">
							<label>Preferred hour of pickup:</label>
							<input id="hour" class="form-control"type="text" placeholder="hour" required>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 submit-order-table">
			<table class="table table-striped table-hover table-responsive table-bordered">
				<thead>
					<tr>
						<th>
							Name
						</th>
						<th>
							Quantity
						</th>
						<th>
							Price
						</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="order in listOfOrders">
						<td>
							{{order.product.name}}
						</td>
						<td>
							{{order.orderQuantity}}
						</td>
						<td>
							{{order.product.price}}$
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<b>total price:</b>
						</td>
						<td>
							{{total_price}}
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
						</td>
						<td id="td-btn-order" class="input-group">
							<input id="btn-order" type="submit" class="btn btn-primary" value="Order">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
