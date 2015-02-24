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
			jQuery("#dob"+i).datepicker({
			      changeMonth: true,
			      changeYear: true
			});
		});
		
		i++;
	});
	
	
    $("#depDate").datepicker({
        showOn: 'button',
        buttonText: 'Show Date',
        buttonImageOnly: true,
        buttonImage: 'images/icon-calendar.png'
    });
	 $("#ariDate").datepicker({
        showOn: 'button',
        buttonText: 'Show Date',
        buttonImageOnly: true,
        buttonImage: 'images/icon-calendar.png'
    });

	 jQuery('#vegMealRadio').click(function(){
		 jQuery('#mealDiv').show();
	 });
	 jQuery('#nonVegMealRadio').click(function(){
		 jQuery('#mealDiv').hide();
	 });

	 jQuery(function() {
			jQuery("#dob").datepicker();
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