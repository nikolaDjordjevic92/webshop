
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
					id=$("#category_id").val();
					if(id){
						var htmlSelector = '#category-'+id;
						$(htmlSelector).addClass('active');
					}
				    var check=$('#product_quantity').val();
				    if(check && check<1){
				    	$('.btn-add-to-cart').attr('disabled','');
				    }
				}
				
			}
			
			markCurrentCategory();
			$("#defaultOpen").click();
		});
	
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope, $http) {
			
			var url=window.location.href;
			
			$scope.total_price=0;
			$scope.getOrders = function(){	
			  $http.get($('#urlprefix').val()+'order/1')
			  .then(function(response) {
			      $scope.listOfOrders = response.data;
			  });
			}
			
			if(url.includes("ordersubmit")){
				$scope.getOrders();
			}
			
			$scope.on_stock_value=$('#product_quantity').val();
			$scope.on_stock=$scope.on_stock_value;
			
			$scope.persistReview = function(){		
				$prodId = $('#productId').val();
				$rating = $('#star-rate').val();
				$content = $('#comment').val();
				
			    jQuery.ajax ({
				    url: $('#urlprefix').val()+'reviews',
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
			
			$scope.orderSubmit = function() {
			jQuery.ajax ({
				url: $('#urlprefix').val()+'ordersubmit',
				type: "POST",
				dataType: 'json',
				headers: {
			    	'Content-Type' : 'application/json'
			    },
				data:JSON.stringify({
					id: $order.order.id,
					user : {
						id:1,
						firstName:$('#firstName').val();
						lastName:$('#lastName').val();
						city:$('#city').val();
						phoneNumber:$('#phoneNumber').val();
						homeAddress:$('#homeAddress').val();
						prefferdHourOfPickUp:$('#hour').val();
					}
				}),
				success:function(response){
					console.log('bravo');
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
				    url: $('#urlprefix').val()+'order',
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