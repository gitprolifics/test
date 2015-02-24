<%@page session="false" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="portal" uri="/WEB-INF/tld/portal.tld" %>  
<%@taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v6.1/portlet-client-model" prefix="portlet-client-model" %>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<portlet:defineObjects/>
 <c:set var="maindest"><portlet:namespace/></c:set>
<portlet-client-model:init>
      <portlet-client-model:require module="ibm.portal.xml.*"/>
      <portlet-client-model:require module="ibm.portal.portlet.*"/>   
</portlet-client-model:init> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thomascook</title>


 
 
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
 <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
 <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script src="js/bootstrap.min.js"></script>


 <script type="text/javascript" src="js/jquery-ui.js"></script>
  
  <style type='text/css'>
    body
{
    font-size: 10pt;
}
ul.css-tabs li a {
    background: linear-gradient(to bottom, #E1FFFF 0%, #E1FFFF 33%, #E6F8FD 50%, #C8EEFB 51%, #B1D8F5 100%) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: 1px solid #BDE3F8;
    border-radius: 31px 0 17px 5px;
    cursor: pointer;
    display: block;
    float: left;
    padding: 11px 39px 8px;
}

ul.css-tabs a.current {
    background-color: #DDDDDD;
    border-bottom: 1px solid #DDDDDD;
    color: #000000;
    cursor: default;
}
 .darkClass
{
    background-color: white;
    filter:alpha(opacity=50); /* IE */
    opacity: 0.5; /* Safari, Opera */
    -moz-opacity:0.50; /* FireFox */
    ;
    background-repeat:no-repeat;
    background-position:center;
    
    top: 0px;
    left: 0px;
}

  </style>
  <c:if test="${progressBar < 1}">
 <script type='text/javascript'>
$(window).load(function(){
$(document).ready(function() {
  $(function () {
		$(':input','.container').attr("disabled",true);  
		$('.remove-field').removeAttr("href"); 
		$('.content-holder').addClass('darkClass');
	});
});
});
  </script>
  </c:if>
  
   <script>

  function enableVeg(){
	var divMeal = document.getElementById('meal-type');
	if (divMeal.style.display == "none") {
        divMeal.style.display = "block";
    }
    else {
        divMeal.style.display = "none";
    }
	
}
function disableVeg(){	
	var divMeal = document.getElementById('meal-type');	
    if (divMeal.style.display !== "none") {
        divMeal.style.display = "none";
		
    }
    else {
        divMeal.style.display = "block";
    }    
 }


  </script>
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
$(document).ready(function() {
	
    var i = 1;
	$("#addPassenger").click(function() {
	  $("<tr />")
	    .append($("<td />").append($("<input />", { type: "text", id:"prefix"+i }))	)
		 .append($("<td />").append($("<input />", { type: "text", id:"firstName"+i })))		 
		 .append($("<td />").append($("<input />", { type: "text", id:"middleName"+i })))		 
		 .append($("<td />").append($("<input />", { type: "text", id:"lastName"+i })))	 
		 .append($("<td />").append($("<input />", { type: "text", id:"dob"+i })))		 
		 .append($("<td />").append($("<input />", { type: "text", id:"age"+i })))
		 .append($("<td />").append("<a href='#' id='removeTr"+i+"'>Remove</a>"))
		 .appendTo("#passengersTab");
			 
		  $('#age'+i).on('blur', function() {			  
			  var ages = $('[id*="age"]');
			  var adults = 0;
			  var children = 0;
			  for(var i = 0; i<ages.length; i++){			    	
				var ageVal = parseInt(ages[i].value);
				if(ageVal> 17){
					adults = adults+1;				
				} 
				if(ageVal<= 17){
					children = children+1;				
				} 
			 }
			 $("#adultLbl").html(adults);
			 $("#childLbl").html(children);			
		 });
			 		 
		$("#passengersTab").on('click','#removeTr'+i,function(){
			$(this).parent().parent().remove();
		});
		
		jQuery(function() {
			jQuery('#dob'+i).datepicker({
			showOn: 'button',
        	buttonText: 'Show Date',
        	buttonImageOnly: true,
        	buttonImage: '<%=request.getContextPath()%>'+'/images/icon-calendar.png',
				changeYear: true,		  
				onSelect: function (date) {
				   var dob = new Date(date);
				   var today = new Date();
				   var dateDiff =  today.getFullYear() - dob.getFullYear(); 	
					
					
				   jQuery('#age'+(i-1)).val(dateDiff);	       
				}				
			});
		});
		
		i++;
	});
	
	 jQuery('#vegMealRadio').click(function(){
		 jQuery('#mealDiv').show();
	 });
	 jQuery('#nonVegMealRadio').click(function(){
		 jQuery('#mealDiv').hide();
	 });

	 jQuery(function() {
		 jQuery("#dob").datepicker({
		 showOn: 'button',
         buttonText: 'Show Date',
         buttonImageOnly: true,
         buttonImage: '<%=request.getContextPath()%>'+'/images/icon-calendar.png',
				changeYear: true,	
		        onSelect: function (date) {
		           var dob = new Date(date);
				   var today = new Date();
		           var dateDiff =  today.getFullYear() - dob.getFullYear() 
				   jQuery("#age").val(dateDiff);	       
		        }
				 
		    });
	  });		

	    jQuery("#depDate").datepicker({
	        showOn: 'button',
	        buttonText: 'Show Date',
	        buttonImageOnly: true,
	        buttonImage: 'images/icon-calendar.png'
	    });
	    jQuery("#ariDate").datepicker({
	        showOn: 'button',
	        buttonText: 'Show Date',
	        buttonImageOnly: true,
	        buttonImage: 'images/icon-calendar.png'
	    });
	
});

});//]]>  
function onClickBookFlights(){
	var rows = [];
 	var table = $('#passengersTab').serializeArray();
	 $('#passengersTab tr').each(function(i, n){
	 	 var $row = $(n);
		 rows.push({
	        prefix: $(this).find('td:eq(0) input[type=text]').val(),
	        firstName: $(this).find('td:eq(1) input[type=text]').val(),
	        middleName: $(this).find('td:eq(2) input[type=text]').val(),
	        lastName: $(this).find('td:eq(3) input[type=text]').val(),
			dob: $(this).find('td:eq(4) input[type=text]').val(),
			age: $(this).find('td:eq(5) input[type=text]').val()
	    });
	});

  $('#jsonString').val(JSON.stringify(rows));
  	document.forms["passengersDetailsForm"].submit();
	return true;
}


</script>

</head>

<body>



<portlet:actionURL var="saveMainDestinationURL">
	<portlet:param name="action" value="saveMainDestination"/>
</portlet:actionURL>
<portlet:actionURL var="showDestinationsURL">
	<portlet:param name="action" value="showDestinations"/>
</portlet:actionURL>
<portlet:actionURL var="showMainDestinationURL">
	<portlet:param name="action" value="showMainDestination"/>
</portlet:actionURL>
<portlet:actionURL var="showPassengerDetailsURL">
	<portlet:param name="action" value="showPassengerDetails"/>
</portlet:actionURL>
<portlet:actionURL var="showDestinationDetailsURL">
	<portlet:param name="action" value="showDestinationDetails"/>
</portlet:actionURL>
<portlet:actionURL var="showDestinationDetailsBookingURL">
	<portlet:param name="action" value="showDestinationDetailsBooking"/>
	<portlet:param name="subDestination" value=""/>
</portlet:actionURL>
<portlet:renderURL var="savePassengerDetailsURL">
	<portlet:param name="action" value="savePassengersDetails"/>
</portlet:renderURL>
<form:form class="form-horizontal" name="passengersDetailsForm" action="${savePassengerDetailsURL}" >
<div style="width:980px;padding-left:30px;">
<ul class="css-tabs">
  <li><a  href="${showMainDestinationURL}">Main Destination</a></li>
  <li><a class="current" href="${showPassengerDetailsURL}">Passenger Details</a></li>
  <li><a  href="${showDestinationsURL}">Destinations</a></li>
  <li><a  href="${showDestinationDetailsURL}">Destination Details</a></li>
  <li><a href="${showDestinationDetailsBookingURL}">Destination Details Booking</a></li>
</ul>
</div>


<div class="container"> <!-- container div will be wrapper in theme -->
     

   <div class="row topMarginDbl content-holder" style="width:102%"><!-- main layout row2 -->
		<div class="form-box">
	
<div class="destination">
<h2>Passenger Details</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td>
<div class="field-container">
<table id="passengersTab" cellspacing="0" cellpadding="10" width="100%" class="passdetails">	
<tr>
	<th>Prefix</th>
	<th>First Name</th>
	<th>Middle Name</th>
	<th>Last Name</th>
	<th>DOB</td>
	<th>Age</th>
</tr>

<tr>
 <td><input type="text" value="" name="" /></td>
 <td><input type="text" value="" name="" /></td>
 <td><input type="text" value="" name="" /></td>
 <td><input type="text" value="" name="" /></td>
 <td><input type="text" id="dob" value="" name="dob" /></td>
 <td></td>
 <td><input id="age" type="text" value="" name="" /></td>
</tr>
</table>	
</div>

<div style="width: 99%;"><input id="addPassenger" type="button" value="Add" class="btn"/></div>
</td>
</tr>
</table>
</div>
<div>
<div class="form-fields">
			<span>Adults</span>
			<label id="adultLbl"></label>
			</div>
<div class="form-fields">
			<span>Children</span>
			<label id="childLbl"></label>
</div>
<h3 class="sub-heading">Meal Preference</h3>
	<div class="form-fields mright">
			<span>Veg</span> 
			<input type="radio" value="" id="meal" name="meal" class="meal"  onclick="enableVeg();">
	</div>
	<div class="form-fields mright">
			<span>Non-Veg</span> 
			<input type="radio" value="" id="meal" name="meal" class="meal"  onclick="enableVeg();">
	</div>
<div class="meal-type" id="meal-type" style="display:none;">
<div class="form-fields mright">
			<span>Jain</span> 
			<input type="radio" value="" name="mealtype">
	</div>
	<div class="form-fields mright">
			<span>Regular</span> 
			<input type="radio" value="" name="mealtype">
	</div>
</div>
</div>
<div class="destination">
<input type="hidden" name="jsonString" id="jsonString" value="">
<input id="bookFlights" type="button" onclick="javascript:onClickBookFlights();" value="Book Flights" class="tab-btn"/>
</div>

		
		</div>
   </div> <!-- end main layout row2 -->

</div>
   
   <!-- end main container -->


</form:form>
</body>
</html>
