<!DOCTYPE html>
<html>
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
  
  <c:if test="${progressBar < 3}">
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
<portlet:actionURL var="saveDestinationDetailsURL">
	<portlet:param name="action" value="saveDestinationDetails"/>
</portlet:actionURL>

<portlet:actionURL var="showDestinationDetailsBookingURL1">
	<portlet:param name="action" value="showDestinationDetailsBooking"/>
	<portlet:param name="subDestination" value="${mainDestinationVO.subdestination1}"/>
</portlet:actionURL>
<portlet:actionURL var="showDestinationDetailsBookingURL2">
	<portlet:param name="action" value="showDestinationDetailsBooking"/>
	<portlet:param name="subDestination" value="${mainDestinationVO.subdestination2}"/>
	
<portlet:actionURL var="confirmDetailsURL">
	<portlet:param name="action" value="showCofirmDetails"/>
</portlet:actionURL>
</portlet:actionURL>
<div style="width:980px;padding-left:30px;">
<ul class="css-tabs">
  <li><a  href="${showMainDestinationURL}">Main Destination</a></li>
  <li><a href="${showPassengerDetailsURL}">Passenger Details</a></li>
  <li><a  href="${showDestinationsURL}">Destinations</a></li>
  <li><a class="current" href="${showDestinationDetailsURL}">Destination Details</a></li>
  <li><a href="${showDestinationDetailsBookingURL}">Destination Details Booking</a></li>
</ul>
</div>

<form:form class="form-horizontal" name="mainDestinationForm" action="${confirmDetailsURL}" commandName="flightInfoVO">
<div class="container"> <!-- container div will be wrapper in theme -->
   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
	
<div class="destination">
<h2>Destination Details</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr>
<td>
<div class="field-container">
<table cellspacing="0" cellpadding="10" width="100%" class="passdetails">	
<tr>
	<th>Destination</th>
	<th>Arrival Date</th>
	<th>Departure Date</th>
	<th>Nights</th>
	<th>Days</td>
</tr>
	<tr>
		<td valign="top"><label class="border"><a href="${showDestinationDetailsBookingURL1}">${mainDestinationVO.subdestination1}</a></label></td>
		<td valign="top"><input type="text" value="${selectedFirstFlightInfo.arrivaldate }" class="level"/></td>
		<td valign="top"><input type="text" value="${selectedFirstFlightInfo.departuredate }" class="level"/></td>
		<td valign="top"><input type="text" value="${mainDestinationVO.days }" class="level"/></td>
		<td valign="top"><input type="text" value="${mainDestinationVO.nights }" class="level"/></td>
		
	</tr>

<tr>
		<td valign="top"><label class="border"><a href="${showDestinationDetailsBookingURL2}">${mainDestinationVO.subdestination2}</a></label></td>
		<td valign="top"><input type="text" value="${selectedSecondFlightInfo.arrivaldate }" class="level"/></td>
		<td valign="top"><input type="text" value="${selectedSecondFlightInfo.departuredate }" class="level"/></td>
		<td valign="top"><input type="text" value="${mainDestinationVO.days1}" class="level"/></td>
		<td valign="top"><input type="text" value="${mainDestinationVO.nights1 }" class="level"/></td>
</tr>
</table>	
</div>

<div style="width: 99%;"><input type="submit" value="Book" class="btn"/></div>
</td>
</tr>
</table>
</div>
</div>
   </div> <!-- end main layout row2 -->
</div>
</form:form>
   <!-- end main container -->
</body>
</html>
