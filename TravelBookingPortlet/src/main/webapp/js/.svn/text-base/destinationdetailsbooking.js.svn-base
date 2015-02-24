 function getHotelInfo(hotel){
 // alert('asdfsfdsf'+hotel.value+ hotelURL);
  var hotelId = hotel.id;
  var varIndex = hotelId.substring(5,6);
   jQuery.ajax({url:hotelURL,
				data:{hotelId:hotel.value},
				handleAs: "json",
				success:function(result){
	      			//alert(result.hotel.imageUrl);
	      			var hoteImageURL = "hotelImageURL"+varIndex;
	      			var completeURL = hotelImageURI + result.hotel.imageUrl;
	      			
	      			//jQuery(hoteImageURL).attr("src",completeURL);
	      			document.getElementById(hoteImageURL).src=completeURL;
	      			
	    		}
			});
  }
 
 
 function getAccomodationInfo(accomodat){
	  // alert('asdfsfdsf'+hotel.value+ hotelURL);
	  var selectValues = showSelectedValues();
	    jQuery.ajax({url:accomodationURL,
	     data:{inclusions:selectValues},
	     handleAs: "json",
	     success:function(result){
	    	 var innerDis = "";		
	    	 for(var i = 0; i < result.hotelsInfos.length; i++){
	    		  
	    		 var hotelInfo = result.hotelsInfos[i];
	    		 var divDisplay = "<div class='hotel-details'><div class=''><img src='"+hotelImageURI+hotelInfo.hotelImage+"' border='0'/><span class='hname'>"+hotelInfo.hotelname+"</span><span class='rating-star'><a href='#' class='"+hotelInfo.rating+"'></a></span><input id='hotelChecked'  value='"+hotelInfo.hotelname+"' type='checkbox' name='hotelChecked' style='float: left; margin: 34px 30px;'/><span class='hotel-int-gallery'><img src='"+hotelImageURI+hotelInfo.hotelImage+"' border='0'/><img src='"+hotelImageURI+hotelInfo.hotelImage+"' border='0'/></span></div><div class='inclusions-details'><div class='fleft'>";
					var itemDisplay = "";
					for(var j= 0;j < hotelInfo.itemsSelected.length; j++){
						
						itemDisplay = "<label>" + itemDisplay + hotelInfo.itemsSelected[j] + "</label>";
					}
					
					divDisplay = divDisplay + itemDisplay + "</div><div class='fright'><label>Rates Per Night</label><span>Euro "+hotelInfo.rateperday+".00</span></div><div class='fleft cleft'><label>Exclusions</label><span>"+hotelInfo.itemExcluded+"</span></div></div></div>";
					innerDis = innerDis + divDisplay;
	    	 }

	    	 document.getElementById("step1SaveButton").href="#section=step-2";
	    	 jQuery("#accommdationsTab").html(innerDis);
	    	window.location.href="#section=step-2";
	           
	        }
	    });
	   }
 function showSelectedValues()
 {
   var selectedValues = jQuery("input[name=includedItem]:checked").map(function () {return this.value;}).get().join(",");
   return selectedValues;
 }
 
 
 
 
 