var $g = jQuery.noConflict();
$g(document).ready(function(){

$g('.login').click(function(){ 
	//$g.closeDOMWindow();		
	openloginWindow();
	$g('.forget-password-box').hide();
	$g('.new-user-box').hide();
	$g('.login-section').show();
	$g('#alertscontent').hide();
	$g('.alert-bg').hide();
	showloginbox();
	return false; 
}); 
});

function openloginWindow(){
	$g.openDOMWindow({ 
	loader:1, 
	loaderImagePath:'images/newHome/loading.gif', 
	loaderHeight:16, 
	loaderWidth:17, 
	//width:680,
	//height:505,
	windowSourceID:'#popup',
	borderSize:0,
	overlayOpacity:40,
	overflow:'hidden'
	});
}



function showloginbox(){
	$g('#loginboxcontent').show();
	$g('#alertscontent').hide();
	$g('.alert-bg').hide();
}

var flightWidgetAjaxCall = false;
$g(document).ready(function () {
$g('.forget-password-box').hide();
$g('.foreign-exchange-details').hide();
//$g('.new-user-box').hide();
//$g('.hotels-details').hide();	
//$g('.flights-details').hide();	
//$g('.flights-round-trip-details').hide();	

	$g('.holidays-tab').click(function() {
		$g('.holidays-details').show();
		$g('.foreign-exchange-details').hide();
		$g('.hotels-details').hide();
		$g('.flights-details').hide();
		$g(this).removeClass("find-holidays").addClass("find-holidays-on");	
		$g(".foreign-exchange-tab").removeClass("find-forex-on").addClass("find-forex");
		$g(".hotels-tab").removeClass("find-hotels-on").addClass("find-hotels");
		$g(".flights-tab").removeClass("find-flights-on").addClass("find-flights");
	});
	
	$g('.foreign-exchange-tab').click(function() {
		$g('.foreign-exchange-details').css({"margin-left":"-7px"});
		$g('.holidays-details').hide();
		$g('.foreign-exchange-details').show();
		$g('.hotels-details').hide();
		$g('.flights-details').hide();
		$g(this).removeClass("find-forex").addClass("find-forex-on");
		$g(".holidays-tab").removeClass("find-holidays-on").addClass("find-holidays");
		$g(".hotels-tab").removeClass("find-hotels-on").addClass("find-hotels");
		$g(".flights-tab").removeClass("find-flights-on").addClass("find-flights");
	});	
	
	$g('.new-user').click(function() {
		$g('.new-user-box').show();
		$g('.forget-password-box').hide();
		$g('.login-section').hide();
		$g("#errorMessage").css("display","none");
	});
	
	$g('.back-to-login').click(function() {
		$g('.forget-password-box').hide();
		$g('.login-section').show();
	});
	
	$g('.forget-password').click(function() {
		$g('.new-user-box').hide();
		$g('.forget-password-box').show();
		$g('.login-section').hide();
		$g(".pwdField").css("display","block");
		$g("#fpMsg, #errorMessage").css("display","none");
	});	
	
});
function appendWidget(){
	var flightWidgetHtml = $g.ajax({url: "/tcportal/html/flights/FlightWidget.html?version=1.2", async: false});
	$g('.flights-details').hide();
	$g(".flights-details").html(flightWidgetHtml.responseText);
	
	
	var hotelWidgetHtml = $g.ajax({url: "/tcportal/html/hotel/HotelWidget.html?version=1.2", async: false});
	$g('.hotels-details').hide();	
	$g(".hotels-details").html(hotelWidgetHtml.responseText);
	
	hotelWidgetAjaxCall = true;
	flightWidgetAjaxCall = true;
	$g("#budget, #duration, #pkgSubType, #forexCurSelectBox").msDropDown();
}