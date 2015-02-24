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
<portlet:actionURL var="confirmDetailsURL">
	<portlet:param name="action" value="showCofirmDetails"/>
</portlet:actionURL>
<portlet:actionURL var="confirmationURL">
	<portlet:param name="action" value="showCofirmation"/>
</portlet:actionURL>

<head>

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

<form:form class="form-horizontal" name="destinationDetailsBookForm" action="${confirmationURL}" commandName="destinationDetailsBookingVO">
<div class="container"> <!-- container div will be wrapper in theme -->
     

   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td>
			<div class="form-fields">
			<span>Destination</span> <select disabled="disabled">
			<option>Europe</option>
			</select>
			</div>
			</td>
		</tr>
		<tr>
		
</tr>
<!-- *********************************** BEGIN For LOOP -->
<c:forEach items="${destinationDetailsBookingVOList}" var="bookingInfo">
<tr><td>

<div class="form-box">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td>
			<div class="form-fields">
			<span>Sub Destination</span> <select disabled="disabled">
			<option>${bookingInfo.subDestination}</option>
			</select>
			</div>
			<div style="border-bottom:1px solid #CFCFCF; overflow: hidden; margin-bottom: 10px;"><div class="form-fields mright">
			<span>Duration</span> 
			<label class="border" style=" margin-right: 10px;">${bookingInfo.intNights}</label>
			<span>Nights</span>
			</div>
			<div class="form-fields">
			<label class="border" style=" margin-right: 10px;">${bookingInfo.intDays}</label>
			<span>Days</span>
	</div>
</div>
			</td>
		</tr>
		
<tr>
<td> 
<div class="hotel-details">
<div style="font-size:14px;" class="">
<img border="0" src="<%=renderResponse.encodeURL(renderRequest.getContextPath())%>/images/${bookingInfo.hotelURL}">
<span class="hname">${bookingInfo.hotelChecked}</span>
<span class="rating-star"><a class="threestar" href="#"></a></span>
<span class="hotel-int-gallery">
<img border="0" src="<%=renderResponse.encodeURL(renderRequest.getContextPath())%>/images/${bookingInfo.hotelURL}">
</span>
</div>
<div class="inclusions-details" style="font-size:12px;">
<div class="fleft mright"><label>Inclusions</label><span>${bookingInfo.includedItem}</span></div>
<div class="fleft cleft"><label>Exclusions</label><span>Dinner</span></div>

</div>
</div>
</td>
</tr>
<tr>
<td>
<div style="font-size:14px;"><span>Itenary</span></div>
<c:forEach items="${bookingInfo.itenaryInfoList}" var="itenary" varStatus="ite">
<div class="departure-details"> 
<div style="font-size:14px;" class="">

<label>
	${itenary.day}
</label>


<label>
	${itenary.hotelName}
</label>
<label>${itenary.hotelInfo}</label>
<img src="<%=renderResponse.encodeURL(renderRequest.getContextPath())%>/images/${itenary.hotelImage}" border="0"/>


<span class="date-picker">${itenary.date}</span>

</div>

</div>
</c:forEach>

</td>
</tr>
</c:forEach>
<!--****************************************  END For LOOP -->		
		</table>
		
		</div>
   </div> <!-- end main layout row2 -->

</div>



<div class="container"> <!-- container div will be wrapper in theme -->
     

   <div class="row topMarginDbl content-holder"><!-- main layout row2 -->
		<div class="form-box">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td style="border-bottom: 1px solid #cfcfcf;">
			<div class="form-fields" >
			<span>Transportation</span> 
			<lable class="border">4 wheel Drive, 5 seater, AC</lable>
			</div>
			</td>
		</tr>
		<tr>
		<td>
<div style="border-bottom:0px solid #CFCFCF; overflow: hidden; margin: 10px 0;">
<div class="form-fields">
				<span>Arrival  Date</span> 
				<span>${destinationDetailsBookingVO.departureDateSubDest1}</span>
	</div>
	<div class="form-fields">
				<span>Departure Date</span>
				<span>${destinationDetailsBookingVO.arriavlDateSubDest1}</span>
	</div>
<div class="form-fields mright">
			<span># of Adults (> 12 yrs)</span> 
			<label class="border" style=" margin-right: 10px;">${destinationDetailsBookingVO.noOfAdults}</label>
			</div>
			<div class="form-fields">
				<span># Children (2 to 12 yrs)</span>
				<label class="border" style=" margin-right: 10px;">${destinationDetailsBookingVO.noOfChildren}</label>
			</div>
</div>
		</td>
</tr>

<tr>
<td> 
	<div class="field-container">
<div class="form-fields">
	<span>Hotel Cost (Euros)</span>		
	<label class="border" style=" margin-right: 10px;">${destinationDetailsBookingVO.hotelCost}</label>		
	</div>
</div>
<div class="field-container">
<div class="form-fields">
	<span>Local (Euros) Transportation</span>		
	<label class="border" style=" margin-right: 10px;">6000</label>		
	</div>
</div>
<div class="field-container">
<div class="form-fields">
	<span>Tax  (Euros) 10%</span>		
	<label class="border" style=" margin-right: 10px;">${destinationDetailsBookingVO.tax}</label>		
	</div>
</div>
<div class="field-container">
<div class="form-fields">
	<span>Total Cost (Euros)</span>		
	<label class="border" style=" margin-right: 10px;">${destinationDetailsBookingVO.totalCost}</label>		
	</div>
</div>
<div style="width:45%;"><input type="submit" class="btn" value="Save"></div>
</td>
</tr>
</table>
		
		</div>
   </div> <!-- end main layout row2 -->

</div>
</form:form>
   <!-- end main container -->