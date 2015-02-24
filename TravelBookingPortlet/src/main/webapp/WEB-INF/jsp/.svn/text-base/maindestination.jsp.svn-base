<%@page session="false" contentType="text/html" pageEncoding="ISO-8859-1" import="java.util.*,javax.portlet.*,com.ibm.travelbookingportlet.*" %>
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
<link rel="stylesheet" href="<%=renderResponse.encodeURL(renderRequest.getContextPath())%>/css/jquery-ui-1.10.4.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thomascook</title>

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
 <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
 <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script src="js/bootstrap.min.js"></script>
 <script src="js/jquery.smartmenus.min.js"></script>
 <script src="js/jquery.smartmenus.bootstrap.min.js"></script>
 <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="js/DT_bootstrap.js"></script> 
 
 <script type="text/javascript" src="js/jquery-ui.js"></script>
  <script>
  $(document).ready(function() {
  
  
		$( "#departureDate" ).datepicker({
		showOn: 'button',
        buttonText: 'Show Date',
        buttonImageOnly: true,
        buttonImage: '<%=request.getContextPath()%>'+'/images/icon-calendar.png',
			onSelect: function(){
	            var seldate = $(departureDate).datepicker('getDate');
				seldate = seldate.toDateString();
				seldate = seldate.split(' ');
				var weekday=new Array();
					weekday['Mon']="(Monday)";
					weekday['Tue']="(Tuesday)";
					weekday['Wed']="(Wednesday)";
					weekday['Thu']="(Thursday)";
					weekday['Fri']="(Friday)";
					weekday['Sat']="(Saturday)";
					weekday['Sun']="(Sunday)";
				var depDayOfWeek = weekday[seldate[0]];
				$('#depDayOfWeek').html(depDayOfWeek);			
	        }
		});
		$( "#arrivalDate" ).datepicker({
		showOn: 'button',
        buttonText: 'Show Date',
        buttonImageOnly: true,
        buttonImage: '<%=request.getContextPath()%>'+'/images/icon-calendar.png',
			onSelect: function(){
	            var seldate = $(arrivalDate).datepicker('getDate');
				seldate = seldate.toDateString();
				seldate = seldate.split(' ');
				var weekday=new Array();
					weekday['Mon']="(Monday)";
					weekday['Tue']="(Tuesday)";
					weekday['Wed']="(Wednesday)";
					weekday['Thu']="(Thursday)";
					weekday['Fri']="(Friday)";
					weekday['Sat']="(Saturday)";
					weekday['Sun']="(Sunday)";
				var arrivalDayOfWeek = weekday[seldate[0]];
				$('#arrivalDayOfWeek').html(arrivalDayOfWeek);			
	        }
	    });
	});
</script>
 
 <portlet:actionURL var="getSubDestinationsURL">
	<portlet:param name="action" value="getSubDestinations"/>
</portlet:actionURL>
 
 
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){
$(document).ready(function() {
	 $("#arrivalDate").datepicker({
        showOn: 'button',
        buttonText: 'Show Date',
        //buttonImageOnly: true,
        //buttonImage: <%=request.getContextPath()%>+'/images/icon-calendar.png',
		onSelect: function(){
            var seldate = $(arrivalDate).datepicker('getDate');
			seldate = seldate.toDateString();
			seldate = seldate.split(' ');
			var weekday=new Array();
				weekday['Mon']="(Monday)";
				weekday['Tue']="(Tuesday)";
				weekday['Wed']="(Wednesday)";
				weekday['Thu']="(Thursday)";
				weekday['Fri']="(Friday)";
				weekday['Sat']="(Saturday)";
				weekday['Sun']="(Sunday)";
			var arrivalDayOfWeek = weekday[seldate[0]];
			$('#arrivalDayOfWeek').html(arrivalDayOfWeek);			
        }
    });
	$('#addRow').click(function(){
	var isDiv1Exist = $('#mainDestivationDiv').find('#destinationDiv1');
	var isDiv2Exist = $('#mainDestivationDiv').find('#destinationDiv2');
	
	
	if(isDiv1Exist.length === 0){
		$('#mainDestivationDiv').append('<div id=\"destinationDiv1\" class=\"field-container\"><div class=\"destination-filed\"><select class=\"\"><option>France</option><option>Germany</option></select></div><div class=\"destination-filed\"><div  style=\"float: left;\"><input type=\"text\" name=\"\" value=\"\" class=\"small\"/> <input type=\"text\" name=\"\" value=\"\" class=\"small\"/><a id=\"removeDestination1\" href=\"#\" class=\"remove-field\">Remove</a></div></div></div>');
		
		$('#removeDestination1').bind('click', function(){
		$('#destinationDiv1').remove();
	});
		}
		
		if(isDiv1Exist.length === 1 && isDiv2Exist.length === 0){
		$('#mainDestivationDiv').append('<div id=\"destinationDiv2\" class=\"field-container\"><div class=\"destination-filed\"><select class=\"\"><option>France</option><option>Germany</option></select></div><div class=\"destination-filed\"><div  style=\"float: left;\"><input type=\"text\" name=\"\" value=\"\" class=\"small\"/> <input type=\"text\" name=\"\" value=\"\" class=\"small\"/><a id=\"removeDestination2\" href=\"#\" class=\"remove-field\">Remove</a></div></div></div>');
		
		$('#removeDestination2').bind('click', function(){
		$('#destinationDiv2').remove();
	});
		}
		
	});
	$('#removeDestination1').click(function(){
		$("#destinationDiv1").remove();

	});
	$('#removeDestination2').click(function(){
		$('#destinationDiv2').remove();
	});

	 $('#mainDestDiv').change(function(event) {  
		    var $mainDest=$("select#mainDestination").val();
		       $.get('getSubDestinationsURL',{maindestination:$mainDest},function(responseJson) {   
		           var $select = $('#destinationDiv1, #destinationDiv2');                           
		           $select.find('option').remove(); 

		           $.each(responseJson.arrayName, function(index, name) {               
		               $('<option>').val(index).text(name).appendTo($select);      
		                });
		        });
		    });
});
});//]]>  

</script>

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
  </style>
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
<div style="width:980px;padding-left:30px;">
<ul class="css-tabs">
  <li><a class="current" href="${showMainDestinationURL}">Main Destination</a></li>
  <li><a href="${showPassengerDetailsURL}">Passenger Details</a></li>
  <li><a href="${showDestinationsURL}">Destinations</a></li>
  <li><a href="${showDestinationDetailsURL}">Destination Details</a></li>
  <li><a href="${showDestinationDetailsBookingURL}">Destination Details Booking</a></li>
</ul>
</div>

 <form:form class="form-horizontal" name="mainDestinationForm" action="${saveMainDestinationURL}" commandName="mainDestinationVO">
<div class="container"> <!-- container div will be wrapper in theme -->
     

   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td>
			<div class="form-fields" id="mainDestDiv">
			<span>Main Destination</span> 
			<form:select path="maindestination" class="" id="mainDestination">
				<form:option value="select">Select a Destination</form:option>
				<c:forEach var="mainDest" items="${mainDestinations}">
				   <form:option value="${mainDest.maindestination}">${mainDest.maindestination}</form:option>
				  </c:forEach>
			</form:select>
			</div>
			</td>
		</tr>
		<tr>
		<td>
		<div class="form-fields mright">
			<span>Single Destination</span> 
			
			<form:checkbox path="destination" value="Single"/>
			</div>
			<div class="form-fields">
			<span>Multiple Destination</span>
			<form:checkbox path="destination" value="Multiple" />
			</div>
		</td>
</tr>
<tr>
<td> 
<div class="destination">
<h2>Destinations</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td><div class="destination-filed"><span>Select Destination</span></div><div class="destination-filed"><span class="duration">Duration</span></div></td>
</tr>

<tr>
<td>
<div id="mainDestivationDiv">
<div id="destinationDiv1" class="field-container">
		<div class="destination-filed">
			<form:select path="subdestination1" class="">
				<form:option value="France">France</form:option>
				<form:option value="Germany">Germany</form:option>
			</form:select>
		</div>
		<div class="destination-filed">
			<div><span class="block-level">Night</span><span class="block-level">Day</span></div>
					<div style="float:left;clear: left;">
					<form:input path="days" value="${mainDestinationVO.nights}" class="small"/>
					<form:input path="nights" value="${mainDestinationVO.days}" class="small"/>
					<a id="removeDestination1" href="#" class="remove-field">Remove</a></div>
		</div>
</div>
<div id="destinationDiv2" class="field-container">
		<div class="destination-filed">
			<form:select path="subdestination2" class="">
				<form:option value="France">France</form:option>
				<form:option value="Germany">Germany</form:option>
			</form:select>
		</div>
		<div class="destination-filed">
			<div  style="float: left;">
			<form:input path="days1" value="${mainDestinationVO.nights1}" class="small"/>
			<form:input path="nights1" value="${mainDestinationVO.days1}" class="small"/>
			<a id="removeDestination2" href="#" class="remove-field">Remove</a></div>
		</div>
</div>
</div>
<div id="addRow" style="width: 72%;"><input type="button" value="Add" class="btn"/></div>
</td>
</tr>
</table>
</div>
<div class="destination">
<h2>Dates</h2>
	<div class="form-fields">
				<span>Departure Date</span> 
				<span>
				<form:input path="departureDate" id="departureDate" value="${mainDestinationVO.departureDate}"/><br/>
				<strong><span id="depDayOfWeek"style="float: right; margin-right:60px;"></span></strong></span>
	</div>
	<div class="form-fields">
				<span>Arrival Date</span>
				<span>	<form:input path="arrivalDate" id="arrivalDate" value="${mainDestinationVO.arrivalDate}"/><br/>
				<strong><span id="arrivalDayOfWeek"style="float: right; margin-right:60px;"></span></strong></span>
	</div>

</div>
<div class="destination">
<input type="submit" value="Passenger Details >>" class="tab-btn" />
</div>
</td>
</tr>
		
		</table>
		
		</div>
   </div> <!-- end main layout row2 -->

</div>
</form:form>   
   <!-- end main container -->



</body>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/maindestination.js"></script>
