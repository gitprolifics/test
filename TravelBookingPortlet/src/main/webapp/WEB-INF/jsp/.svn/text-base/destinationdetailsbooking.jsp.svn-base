<!DOCTYPE html>
<html>
<%@page session="false" contentType="text/html" pageEncoding="ISO-8859-1" import="java.util.*,javax.portlet.*,com.ibm.travelbookingportlet.*" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="portal" uri="/WEB-INF/tld/portal.tld" %>  
<%@taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v6.1/portlet-client-model" prefix="portlet-client-model" %>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<portlet:defineObjects/>
<script type="text/javascript" src="<%=renderResponse.encodeURL(renderRequest.getContextPath() + "/js/destinationdetailsbooking.js")%>"></script>
<script type="text/javascript">
var hotelURL = '<portlet:resourceURL id="hotelInfo"/>';
var accomodationURL = '<portlet:resourceURL id="accomodation"/>';
var hotelImageURI = '<%=renderResponse.encodeURL(renderRequest.getContextPath())%>/images/';
</script>
 <c:set var="maindest"><portlet:namespace/></c:set>
<portlet-client-model:init>
      <portlet-client-model:require module="ibm.portal.xml.*"/>
      <portlet-client-model:require module="ibm.portal.portlet.*"/>   
</portlet-client-model:init> 

<portlet:actionURL var="getHotelInfoURL">
	<portlet:param name="action" value="getHotelInfo"/>
</portlet:actionURL>
<head>
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
  <c:if test="${progressBar < 4}">
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
  <script type='text/javascript'>
  $(window).load(function(){
  $(document).ready(function() {
	  //$(':input','.container').attr("disabled",true);  
		//$('.remove-field').removeAttr("href"); 
		//$('.content-holder').addClass('darkClass');

	  $('#step1SaveButton').click(function(){
	  	window.location.href = "#section=step-2";
	  });

	  $('.btn').on('click', function(){
	  	window.location.href = "#section=step-3";
	  });
	  $('#step3SaveButton').on('click', function(){
	  	window.location.href = "#section=step-4";
	  });
	
  });
  });
  function onSave1ButtonClick(){
	  
	  window.location.href = "#section=step-2";
  }
 function onSave2ButtonClick(){
	  
	  window.location.href = "#section=step-3";
  }
 function onSave3ButtonClick(){
	  
	  window.location.href = "#section=step-4";
 }
 
  function submitInclusionItemsAjaxCall(){
		$.ajax({
			type: "post",
			url: "http://localhost:8080/SpringExamples/employee/add.htm",
			cache: false,				
			data:{
				var rows = [];
			 	var table = $('#inclusionsTab').serializeArray();
				 $('#inclusionsTab tr td div').each(function(i, n){
				 	 var $row = $(n);
					 rows.push({
				        itemDesc: $(this).find('td:eq(0) input[type=text]').val(),
				        isChecked: $(this).find('td:eq(1) input[type=checkbox]').prop('checked'),
				    });
				});
				},
			success: function(response){
				$('#result').html("");
			},
			error: function(){						
				alert('Submiting inclusion items faild');
			}
		});
	}
	
  </script>
</head>
<body>

<portlet:actionURL var="saveMainDestinationURL" >
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
<portlet:actionURL var="confirmDetailsURL">
	<portlet:param name="action" value="showCofirmDetails"/>
</portlet:actionURL>
<div style="width:980px;padding-left:30px;">
<ul class="css-tabs">
  <li><a  href="${showMainDestinationURL}">Main Destination</a></li>
  <li><a href="${showPassengerDetailsURL}">Passenger Details</a></li>
  <li><a href="${showDestinationsURL}">Destinations</a></li>
  <li><a href="${showDestinationDetailsURL}">Destination Details</a></li>
  <li><a class="current" href="${showDestinationDetailsBookingURL}">Destination Details Booking</a></li>
</ul>
</div>

<form:form class="form-horizontal" name="destinationDetailsBookForm" action="${showDestinationDetailsURL}" commandName="destinationDetailsBookingVO">
<div class="container"> <!-- container div will be wrapper in theme -->
     <c:set  var="hotelURL" value="${getHotelInfoURL}"/>

   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td>
			<div class="form-fields">
			<span>Destination</span> <select name="subDestination" disabled="disabled">
			<c:if test="${mainDestinationVO.subdestination1 eq subDestination}">
				<option value="${mainDestinationVO.subdestination1}">${mainDestinationVO.subdestination1}</option>
			</c:if>
			<c:if test="${mainDestinationVO.subdestination2 eq subDestination}">
				<option value="${mainDestinationVO.subdestination2}">${mainDestinationVO.subdestination2}</option>
			</c:if>
			</select>
			</div>
			</td>
		</tr>
		<tr>
		<td>
		<div class="form-fields mright">
			<span>Duration</span> 
			<label class="border" style=" margin-right: 10px;">
			<c:if test="${mainDestinationVO.subdestination1 eq subDestination}">${mainDestinationVO.nights}
			</c:if>
			<c:if test="${mainDestinationVO.subdestination2 eq subDestination}">${mainDestinationVO.nights1}
			</c:if>
			</label>
			<span>Nights</span>
			</div>
			<div class="form-fields">
			<label class="border" style=" margin-right: 10px;">
			<c:if test="${mainDestinationVO.subdestination1 eq subDestination}">${mainDestinationVO.days}
			</c:if>
			<c:if test="${mainDestinationVO.subdestination2 eq subDestination}">${mainDestinationVO.days1}
			</c:if>
			</label>
			<span>Days</span>
	</div>
		</td>
</tr>
<tr>
<td>
<c:if test="${mainDestinationVO.subdestination1 eq subDestination}">
<div class="form-fields mright">
<span>Departure Date</span> 

			<label class="border">${mainDestinationVO.departureDateSubDest1}</label><br/><span style="float: right;"></span>
			</div>
			<div class="form-fields">
			<span>Arrival Date</span>
			<label class="border">${mainDestinationVO.arriavlDateSubDest1}</label><br/><span style="float: right;"></span>
			</div>
</c:if>
<c:if test="${mainDestinationVO.subdestination2 eq subDestination}">
<div class="form-fields mright">
<span>Departure Date</span> 

			<label class="border">${mainDestinationVO.departureDateSubDest2}</label><br/><span style="float: right;"></span>
			</div>
			<div class="form-fields">
			<span>Arrival Date</span>
			<label class="border">${mainDestinationVO.arriavlDateSubDest2}</label><br/><span style="float: right;"></span>
			</div>
</c:if>
			</td>
</tr>
<tr>
<td> 
<div class="destination">

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td>
<div style="background:#fff" id="articles">

<ol id="toc">
	
	<li><a class=" active" href="#step-1"><span>Inclusions/Exclusions</span></a></li>
	<li><a class=" inactive" href="#step-2"><span>Accommodation</span></a></li>
	<li><a class=" inactive" href="#step-3"><span>Itenary</span></a></li>
	<li><a class=" inactive" href="#step-4"><span>Pricing</span></a></li>
	
</ol>

<div class="tab-content">
<form name="inclusionForm" method="post">
	<div class="content active" id="step-1">
	<div class="destination">
	<h2>Inclusions & Exclusions</h2>
	<table id="inclusionsTab" cellspacing="10" cellpadding="0" border="0" width="100%">
	<tr>
	<td>&nbsp;</td>
	</tr>
	
	<tr>
	<td>
	<div class="field-container">
			<div class="destination-filed">
			<div><span class="block-level">Items</span></div>
			</div>
			<div class="destination-filed">
			<div><span class="block-level">Include</span></div>
			</div>
	</div>
	<c:forEach items="${inclusionItems}" varStatus="itemNo" var="incItem">
		<div class="field-container">
			<div class="destination-filed">
			<span id="itemDesc${itemNo.index}">${incItem.itemName}</span>
			</div>
			<div class="destination-filed">
				<div style="float: left;">
					<span class="block-level"><input id="incItem" type="checkbox" value="${incItem.itemName}" name="includedItem"></span>
				</div>
			</div>
		</div>
	</c:forEach>
	<div style="width: 99%;"><a id="step1SaveButton" class="btn" type="button" href="#" onclick="getAccomodationInfo();">Save</a></div>
	</td>
	</tr>
	</table>
	</div>
	</div>
</form>
<div class="content inactive" id="step-2">
<div class="destination">
<h2>Accommodations</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<c:if test="${destinationDetailsBookingVO.noOfChildrenAbove10Years gt 1}">
<tr><td><div style='text-align:center;font-size:16px;font-weight:bold;padding-top:5px;'>
( Will Require ${destinationDetailsBookingVO.noOfChildrenAbove10Years } rooms as there are ${destinationDetailsBookingVO.noOfChildrenAbove10Years} children above 10 years )
</div></td></tr>
</c:if>
<tr><td id="accommdationsTab">
		
	</td>
</tr>
<tr>
<td>
<div style="width: 99%;"><a id="step2SaveButton" class="btn" type="button" href="#section=step-3">Save</a></div>
</td>
</tr>
</table>
</div>
</div>
<div class="content inactive" id="step-3">
<div class="destination">
<h2>Itenary</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td>

<c:forEach items="${itenaryInfoList}" var="itenary" varStatus="ite">
<div class="departure-details">
<div class="">

<form:select disabled="disabled" id="day${ite.index}" path="day${ite.index}">
	<form:option label="${itenary.day}" value="${itenary.day}"></form:option>
</form:select>


<form:select id="hotel${ite.index}" path="hotel${ite.index}" onchange="getHotelInfo(this);">
	<form:option value="0" label="Select"/>
	<form:options items="${hotelList}" itemLabel="hotelname" itemValue="hotelid" /> 
</form:select>
<label id="hotelDescription${ite.index}" />
<img id="hotelImageURL${ite.index}" src="" border="0"/>


<span class="date-picker"><input type='text' name='depDate${ite.index}' id='depDate${ite.index}' label="${itenary.date}" value="${itenary.date}"/><span>

</div>

</div>
</c:forEach>

</td>
</tr>

<tr>
<td>
<div style="width: 99%;"><a id="step3SaveButton" class="btn" type="button" href="#section=step-4">Save</a></div>
</td>
</tr>
</table>
</div>
</div>
<div class="content inactive" id="step-4">
<div class="destination">
<h2>Pricing and Date Details</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td>&nbsp;</td>
</tr>
<tr>

<td>
<div class="form-fields">
				<span>Arrival  Date</span> 
				<span class="date-picker"><input type='text' id='arrivalDate' value="${mainDestinationVO.arrivalDate}" disabled="disabled"/></span>
	</div>
	<div class="form-fields">
				<span>Departure Date</span>
				<span class="date-picker"><input type='text' id='departureDate' value="${mainDestinationVO.departureDate}" disabled="disabled"/></span>
	</div>
</td>
</tr>
<tr>
<td>
<div class="field-container">
<div class="form-fields">
	<span># of Adults (> 12 yrs)</span>		
	<label style=" margin-right: 10px;" class="border">${destinationDetailsBookingVO.noOfAdults}</label>		
	</div>
</div>
<div class="field-container">
<div class="form-fields">
	<span># Children (2 to 12 yrs)</span>		
	<label style=" margin-right: 10px;" class="border">${destinationDetailsBookingVO.noOfChildren}</label>		
	</div>
</div>
<div class="field-container">
<div class="form-fields">
	<span># Infants ( < 2 yrs)</span>		
	<label style=" margin-right: 10px;" class="border">${destinationDetailsBookingVO.noOfInfants}</label>		
	</div>
	<input type="submit" value="Continue" class="btn fleft"/>
</div>
</td>
</tr>

<tr>
<td>
<div style="width:73%;"></div>
</td>
</tr>
</table>
</div>
</div>
</div>

</div>
</td>
</tr>
</table>
</div>
</td>
</tr>
		
		</table>
		
		</div>
   </div> <!-- end main layout row2 -->

</div>
</form:form>
   
   <!-- end main container -->
<script type="text/javascript" src="<%=renderResponse.encodeURL(renderRequest.getContextPath() + "/js/activatables.js")%>"></script>

</body>
</html>

