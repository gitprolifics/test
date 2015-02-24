<html>
<%@taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="portal" uri="/WEB-INF/tld/portal.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<portlet:defineObjects/>

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
   <c:if test="${progressBar < 2}">
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
<portlet:actionURL var="saveDestinationURL">
	<portlet:param name="action" value="saveDestination"/>
</portlet:actionURL>
	
<div style="width:980px;padding-left:30px;">
<ul class="css-tabs">
  <li><a  href="${showMainDestinationURL}">Main Destination</a></li>
  <li><a href="${showPassengerDetailsURL}">Passenger Details</a></li>
  <li><a class="current" href="${showDestinationsURL}">Destinations</a></li>
  <li><a href="${showDestinationDetailsURL}">Destination Details</a></li>
  <li><a href="${showDestinationDetailsBookingURL}">Destination Details Booking</a></li>
</ul>
</div>
<form:form class="form-horizontal" name="mainDestinationForm" action="${saveDestinationURL}" commandName="flightInfoVO">
<div class="container"> <!-- container div will be wrapper in theme -->
     

   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
<div class="destination">
<h2>Destinations</h2>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr> 
	<td>
		<div>
<div class="form-fields">
			<span>Boarding</span>
			<label class="border">Mumbai</label>
			</div>
<div class="form-fields">
			<span>Destination</span>
			<label class="border">${mainDestinationVO.subdestination1}</label>
</div>
	</td>
</tr>
<tr>
<td>
<div class="field-container">
<table cellspacing="0" cellpadding="10" width="100%" class="destinations">	
<tr>
	<th>Flight</th>
	<th>Departure Date</th>
	<th>Departure time</th>
	<th>Arrival Date</th>
	<th>Arrival time</th>
	<th>Fare in Rs.</th>
</tr>
	<c:forEach var="flightInfo" items="${flightsInfo1}">
		<tr>
		    <td><input type="text" value="${flightInfo.flightname }" class="level"/></td>
			<td><input type="text" value="${mainDestinationVO.departureDateSubDest1}" class="level"/><span></span></td>
			<td><input type="text" value="${flightInfo.departuretime}" class="level"/></td>
			<td><input type="text" value="${mainDestinationVO.arriavlDateSubDest1}" class="level"/><span></span></td>
			<td><input type="text" value="${flightInfo.arrivaltime}" class="level"/></td>
			<td><input type="text" value="${flightInfo.fare}" class="level"/><br><span>&nbsp;&nbsp;(no-Ref)</span></td>
			<td><form:radiobutton  path="destinationOne" value="${flightInfo.flightid}" class="level"/></td>
		</tr>
	</c:forEach>
</table>	
</div>
</td>
</tr>
</table>
</div>
<div>

<h3 class="sub-heading">Travel by</h3>
	<c:if test="${mainDestinationVO.train eq 'true'}">
	<div class="form-fields mright">
			<span>Euro Rail</span> 
			<form:radiobutton  path="localTravel" value="train" name="traveltype" class="traveltype"/>
	</div>
	</c:if>
	
	<c:if test="${mainDestinationVO.air eq 'true'}">
	<div class="form-fields mright">
			<span>Flight</span> 
			<form:radiobutton  path="localTravel"  value="air" name="traveltype" class="traveltype"/>
	</div>
	</c:if>
	
	<c:if test="${mainDestinationVO.bus eq 'true'}">
	<div class="form-fields mright">
			<span>Bus</span> 
			<form:radiobutton  path="localTravel"  value="bus" name="traveltype" class="traveltype"/>
	</div>
	</c:if>
	
	<c:if test="${mainDestinationVO.cruise eq 'true'}">
	<div class="form-fields mright">
			<span>Cruise</span> 
			<form:radiobutton  path="localTravel"  value="cruise" name="traveltype" class="traveltype"/>
	</div>
	</c:if>
</div>
<div class="destination">
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tr> 
	<td>
		<div>
<div class="form-fields">
			<span>Boarding</span>
			<label class="border">${mainDestinationVO.subdestination1}</label>
			</div>
<div class="form-fields">
			<span>Destination</span>
			<label class="border">${mainDestinationVO.subdestination2}</label>
</div>
	</td>
</tr>
<tr>
<td>
<div class="field-container">
<table cellspacing="0" cellpadding="10" width="100%" class="destinations">	
<tr>
	<th>Flight</th>
	<th>Departure Date</th>
	<th>Departure time</th>
	<th>Arrival Date</th>
	<th>Arrival time</td>
	<th>Fare in Rs.</th>
</tr>
<c:forEach var="flightInfo" items="${flightsInfo2}">
		<tr>
		    <td><input type="text" value="${flightInfo.flightname}" class="level"/></td>
			<td><input type="text" value="${mainDestinationVO.departureDateSubDest2}" class="level"/><span></span></td>
			<td><input type="text" value="${flightInfo.departuretime}" class="level"/></td>
			<td><input type="text" value="${mainDestinationVO.arriavlDateSubDest2}" class="level"/><span></span></td>
			<td><input type="text" value="${flightInfo.arrivaltime}" class="level"/></td>
			<td><input type="text" value="${flightInfo.fare}" class="level"/><br><span>&nbsp;&nbsp;(no-Ref)</span></td>
			<td><form:radiobutton  path="destinationTwo" value="${flightInfo.flightid}" class="level"/></td>
		</tr>
	</c:forEach>
<tr>
	<td colspan="4"><div style="width:99%; padding-top: 10px;"><input type="submit" class="btn" value="Continue >>"></div></td>
</tr>

</table>	
</div>
</td>
</tr>
</table>
</div>
</div>
   </div> <!-- end main layout row2 -->

</div>
</form:form>
   </div>
   </div>
   <!-- end main container -->
   
</body>


</html>
