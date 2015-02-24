var replaceSpecialCharacter = {'andgt;': '&','andamp;': '&', 'andquot;': '"', 'andlt;': '<', 'andgt;': '>', 'andapos;': '\'', 'andampos;': '\'' };
var json=""; 
var ar=new Array();
var accomtype=0;
var discount=0;
var pricing="";
var priceData="";
var accmData="";
var prodCode="";
var currencyList="";
var currencyRateList="";
var startDate;
var msg="";
var blockDate="";
var blockDateIndex = "";
var pkgDetails=setXml();
var gitdiscountFlag=false;
var tcBrkUpValue="";
var tcBrkUpPriceValue="";
var tourCostValue="";
var serviceTaxValue="";
var bookingAmtValue="";
var advPayableValue="";
var balPayableValue="";
var adultPriceValue="";
var childPriceValue="";
var infantPriceValue="";
var priceSlabValue="";
var valValue="";
var roomingValue="";
var roomTypeValue="";
var roomDetailsValue="";
var refnoValue="";
var adultValue=0;
var childValue=0;
var infantValue=0;
var noOfAdultValue=0;
var noOfChildrenValue=0;
var noOfInfantValue=0;
var accomtypeValue=0;
var productCodeValue="";
var currencyListValue="";
var curencyRateListValue="";
var pkgTypeglobal="";
var pkgSubTypeglobal="";
var fitFixed;
//var dataDis="";
var roomCountArray=new Array();
var pkgSubType=pkgDetails.getElementsByTagName("PKG_BOOKNG_SUBTYPE")[0].firstChild.nodeValue;
/*if(pkgSubType=='FIT Fixed' || pkgSubType=='FIT')
	pkgSubType='FIT';*/
if(pkgSubType=='FIT Fixed')
	fitFixed=true;
if(pkgSubType=='FIT Fixed' || pkgSubType=='GIT')
	pkgSubType='GIT';
var pkgtype=pkgDetails.getElementsByTagName("PKG_TYPE")[0].firstChild.nodeValue;
var pkgid=pkgDetails.getElementsByTagName("PACKAGE_ID")[0].firstChild.nodeValue;
var intlFit=false;
var advPayValue="";
var totalPriceValue="";
var balPayableValue="";
var browser_version = navigator.appVersion.match(/MSIE [\d.]+/);
var gitDiscountArray="";
var year1="";
//var taxDiscountValue=0;
var horzScrolled=0;
var counter = 1;
var glovalDivId="";

var isBookable = "";
//var setTotalTax="";
var ishighlightFlag = "";
var istotalPassengerCount = "";
var isinventryCount = "";

if(pkgtype=='1' && pkgSubType=='FIT')
{
	intlFit=true;
}
var dateStandard="",dateDeluxe="",datePremium="";
var noDatesFlag=false;

/*** FIT departure Dates ***/
if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0]!=null)
{
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0].firstChild!=null)
		{
			dateStandard=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0].firstChild.nodeValue;
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0].firstChild!=null)
		{
			dateDeluxe=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0].firstChild.nodeValue;
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0].firstChild!=null)
		{
			datePremium=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0].firstChild.nodeValue;
		}
	}
}

/*** FIT departure Dates Ends ***/

/*** GIT departure Dates ***/
/*** GIT departure Dates Ends ***/
function nodeValue(xmlTag){
	var content="";
	 if(xmlTag.firstChild.textContent && xmlTag.normalize) {
	  xmlTag.normalize(xmlTag.firstChild);
	  content=xmlTag.firstChild.textContent;
	  } else if(xmlTag.firstChild.nodeValue) {
	   content=xmlTag.firstChild.nodeValue;
	  } else {
	   content="";
	  }
	 return content;
	}
	function nodeValueForMaster(xmlTag){
		var content="";
		 if(xmlTag.firstChild.textContent && xmlTag.normalize) {
		  xmlTag.normalize(xmlTag.firstChild);
		  content=xmlTag.firstChild.textContent;
		  } else if(xmlTag.firstChild.nodeValue) {
		   content=xmlTag.firstChild.nodeValue;
		  } else {
		   content="";
		  }
		 content = content.replace("<ul>","").replace("</ul>","")
		 return content;
		}	
function setXml()
{
	var doc=getXML(document.getElementById('newVar').value);
	var pkgDetails=doc.documentElement;
	return pkgDetails;
}

function decodeSpecialCharacter(string)
{
	return string.replace(/(andamp;|andquot;|andlt;|andgt;|andapos;|andampos;)/g,
	function(str, item)
	{
		return replaceSpecialCharacter[item];
	});
}

function numbersonly(e){
		var unicode=e.charCode? e.charCode : e.keyCode
		if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
			if (unicode<48||unicode>57) //if not a number
			   return false; //disable key press
			}
	}
	
//	function to enable specific dates

function changehubdate(type,hub)
{
	accomtype=type;
	if(hub=='select')
	{
		alert("Please select starting city");
		$g(".pckgdate").datepicker("disable");
		return false;
	}
	if(type=='0')
	{
		//json = dateStandard;
		var last_sell_day_std=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("STANDARD");
		if(last_sell_day_std[0]!=null)
		{
			for(var i=0;i<last_sell_day_std.length;i++)
			{
				if(last_sell_day_std[i].getElementsByTagName("HUB")[0].firstChild.nodeValue==hub)
				{
					if(last_sell_day_std[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild!=null)
					{
						blockDate=last_sell_day_std[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild.nodeValue;
						json = last_sell_day_std[i].getElementsByTagName("DATES")[0].firstChild.nodeValue;
					}
				}
			}
		}
		else
			blockDate="";
	}
	else if(type=='1')
	{
		//json = dateDeluxe;
		var last_sell_day_del=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DELUXE");
		if(last_sell_day_del[0]!=null)
		{
			for(var i=0;i<last_sell_day_del.length;i++)
			{
				if(last_sell_day_del[i].getElementsByTagName("HUB")[0].firstChild.nodeValue==hub)
				{
					if(last_sell_day_del[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild!=null)
					{
						blockDate=last_sell_day_del[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild.nodeValue;
						json = last_sell_day_del[i].getElementsByTagName("DATES")[0].firstChild.nodeValue;
					}
				}
			}
		}
		else
			blockDate="";
	}
	else if(type=='2')
	{
		//json = datePremium;
		var last_sell_day_pre=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("PREMIUM");
		if(last_sell_day_pre[0]!=null)
		{
			for(var i=0;i<last_sell_day_pre.length;i++)
			{
				if(last_sell_day_pre[i].getElementsByTagName("HUB")[0].firstChild.nodeValue==hub)
				{
					if(last_sell_day_pre[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild!=null)
					{
						blockDate=last_sell_day_pre[i].getElementsByTagName("LAST_SELL_DAY")[0].firstChild.nodeValue;
						json = last_sell_day_pre[i].getElementsByTagName("DATES")[0].firstChild.nodeValue;
					}
				}
			}
		}
		else
			blockDate="";
	}
	if(json!=null && json!="")
	{
		ar=json.split(",");
		var def=new Array();
		def=ar[0].split("-");
		var year=def[0];
		var month=def[1];
		var day=def[2];
		startDate=new Date(year,month-1,day);
		$g('.pckgdate').datepicker("option","minDate", startDate );
		$g(".pckgdate").datepicker("refresh");
		$g(".pckgdate").datepicker("enable");
		$g(".pckgdate").datepicker("show");
	}
	else
	{
		json="";
		ar="";
		$g(".pckgdate").datepicker("disable");
		$g(".pckgdate").datepicker("hide");
	} 
}

//price without hubs
function changedate(type)
{
	$g("#departureCity").html("");
	if(type=='0')
	{
		json = dateStandard;
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_STANDARD")!=null)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_STANDARD")[0]!=null)
			{	
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_STANDARD")[0].firstChild!=null)
					blockDate=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_STANDARD")[0].firstChild.nodeValue;
				else
					blockDate="";
			}
			else
				blockDate="";
		}
		else
			blockDate="";
	}
	else if(type=='1')
	{
		json = dateDeluxe;
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_DELUXE")!=null)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_DELUXE")[0]!=null)
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_DELUXE")[0].firstChild!=null)
					blockDate=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_DELUXE")[0].firstChild.nodeValue;
				else
					blockDate="";
			}
			else
				blockDate="";
		}
		else
			blockDate="";
	}
	else if(type=='2')
	{
		json = datePremium;
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_PREMIUM")!=null)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_PREMIUM")[0]!=null)
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_PREMIUM")[0].firstChild!=null)
					blockDate=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("LASTSELL_PREMIUM")[0].firstChild.nodeValue;
				else
					blockDate="";
			}
			else
				blockDate="";
		}
		else
			blockDate="";
	}
	if(json!=null && json!="")
	{
		ar=json.split(",");
		var def=new Array();
		def=ar[0].split("-");
		var year=def[0];
		var month=def[1];
		var day=def[2];
		startDate=new Date(year,month-1,day);
		$g(document).ready(function(){
			$g('.pckgdate').datepicker("option","minDate", startDate );
			$g(".pckgdate").datepicker("refresh");
			$g(".pckgdate").datepicker("enable");
			$g(".pckgdate").datepicker("show");
		});
	}
	else
	{
		json="";
		ar="";
		$g(".pckgdate").datepicker("disable");
		$g(".pckgdate").datepicker("hide");
	}
}
//price without hubs


// Set FIT hubs start
function changeHub(accomType)
{
	ar="";
	$g(".pckgdate").datepicker("disable");
	$g(".pckgdate").datepicker("hide");
	var pricingString="";
	pricingString+='<label id="hubLabel" style="margin-right:60px">Departure City: &nbsp;</label>';
	pricingString+='<div class="statebg" id="hubList">';
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0]!=null)
	{
		if(accomType=='0')
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("STANDARD")[0]!=null)
			{
				var hubs=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("STANDARD");
				var hubNames = "";
				for(var i=0;i<hubs.length;i++)
				{
					if(hubs[i].getElementsByTagName("HUB")[0]!=null)
					{
						if(hubs[i].getElementsByTagName("HUB")[0].firstChild!=null)
						{
							hubNames+= hubs[i].getElementsByTagName("HUB")[0].firstChild.nodeValue;
							hubNames+= ",";
						}
					}
				}
				
				if(hubNames!=null)
				{
					pricingString+=createFitHub(hubNames,accomType);
				}
				pricingString+='</div><br/><br/><br/>';
			}
		}
		if(accomType=='1')
		{
			var hubs=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DELUXE");
			var hubNames = "";
			for(var i=0;i<hubs.length;i++)
			{
				//alert(hubs[i].getElementsByTagName("HUB")[0].firstChild.nodeValue)
				if(hubs[i].getElementsByTagName("HUB")[0]!=null)
				{
					if(hubs[i].getElementsByTagName("HUB")[0].firstChild!=null)
					{
						hubNames+= hubs[i].getElementsByTagName("HUB")[0].firstChild.nodeValue;
						hubNames+= ",";
					}
				}
			}
			
			if(hubNames!=null)
			{
				pricingString+=createFitHub(hubNames,accomType);
			}
			pricingString+='</div><br/><br/><br/>';
		}
		if(accomType=='2')
		{
			var hubs=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("PREMIUM");
			var hubNames = "";
			for(var i=0;i<hubs.length;i++)
			{
				if(hubs[i].getElementsByTagName("HUB")[0]!=null)
				{
					if(hubs[i].getElementsByTagName("HUB")[0].firstChild!=null)
					{
						hubNames+= hubs[i].getElementsByTagName("HUB")[0].firstChild.nodeValue;
						hubNames+= ",";
					}
				}
			}
			
			if(hubNames!=null)
			{
				pricingString+=createFitHub(hubNames,accomType);
			}
			pricingString+='</div><br/><br/><br/>';
		}
	}
	document.getElementById("departureCity").innerHTML=pricingString;
	$g(".pckDates").sSelect();
}

function createFitHub(hubs,accomType)
{
	var hubString="";
	var fithubs=new Array();
	hubs = hubs.substr(0,hubs.length-1);
	fithubs=hubs.split(",");
	
	hubString+='<select name="domesticfrom" class="customselectbox pckDates" id="hub" onchange="changehubdate('+accomType+',this.value)">';
	hubString+='<option value="select">Select</option>';
	
	for(var i=0;i<fithubs.length;i++)
	{
		hubString+='<option value='+fithubs[i]+'>';
		//var fithub=new Array();
	//	fithub=fithubs[i];
		hubString+= fithubs[i]+'</option>';
	}
	hubString+='</select>';
	return hubString;
}
// Set FIT hubs end
function changeGitDate(hubIndex)
{
	/*if(pkgtype=='1')
	{
		setTimeout(function() {
			$g(".legend").remove();
			var div = document.getElementById("ui-datepicker-div");
			div.innerHTML+='<div class="legend"> <span class="legendOnRequestText"> </span>&nbsp;On Request | <span class="legendBookableText"> </span>&nbsp;Available</div>';
		 }, 70);
	}*/
	noDatesFlag=false;
	if(hubIndex==0)
	{
		json = "";
		ar="";
	}
	else
	{
		var gitDates=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("GIT_DEPARTUREDATES")[0].firstChild;
		if(gitDates!=null)
		{
			gitDates=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("GIT_DEPARTUREDATES")[0];
			var datesLength=0;
			if(gitDates.getElementsByTagName("DATES")!=null)
			{
				json="";
				datesLength=gitDates.getElementsByTagName("DATES").length;
				for(var i=0;i<datesLength;i++)
				{
					if(gitDates.getElementsByTagName("DATES")[i].getElementsByTagName("DATE_COUNT")[0]!=null)
					{
						if(gitDates.getElementsByTagName("DATES")[i].getElementsByTagName("DATE_COUNT")[0].firstChild.nodeValue==hubIndex)
						{
							if(gitDates.getElementsByTagName("DATES")[i].getElementsByTagName("GITDATE")[0]!=null)
								json=gitDates.getElementsByTagName("DATES")[i].getElementsByTagName("GITDATE")[0].firstChild.nodeValue;
								blockDate = gitDates.getElementsByTagName("DATES")[i].getElementsByTagName("GIT_BLOCK_DATE")[0].firstChild.nodeValue;
						}
					}
				}
			}
			else
			{
				json="";
			}
		}
	}
	if(json!=null && json!="")
	{
		msg="";
		document.getElementById("noDateMsg").style.display='none';
		ar=json.split(",");
		var def=new Array();
		def=ar[0].split("-");
		var year=def[0];
		var month=def[1];
		var day=def[2];
		startDate=new Date(year,month-1,day);
		$g(".pckgdate").datepicker("refresh");
		if(fitFixed)
			$g(".pckgdate").datepicker("enable");
		$g('.pckgdate').datepicker("option","minDate", startDate );
		if(fitFixed)
			$g(".pckgdate").datepicker("show");
		getInventory();
	}
	else
	{
		ar="";
		msg="";
		$g(".pckgdate").datepicker("disable");
		$g(".pckgdate").datepicker("hide");
		
		/** Start for displaying message when departure dates are not available **/
		
		document.getElementById("noDateMsg").style.display='block';
		noDatesFlag=true;
		msg="We regret to inform you that currently we do not have confirmed departures for this package. We will be glad to help you with the availability of this or an alternate package.";
		msg+="<br>";
		msg+='<div class="needhelp" style="z-index:5;">';
		var pkgName="",bookingTypeEach="",pkgName_hub="";
		cityIndex=document.getElementById("hub").selectedIndex;
	    cityOption=document.getElementById("hub").options;
	    pkgName_hub= cityOption[cityIndex].text;
		if(pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
		{
			pkgName=pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
			pkgName=pkgName+" "+pkgName_hub;
		}
		if(pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild!=null)
		{
			bookingTypeEach=pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild.nodeValue;
		}
		$g(".saveAndContinueButton").hide();
		msg+='<a href="javascript:void(0);" class="SendQuery" onclick="SendQuery(\''+pkgtype+'\',\''+pkgid+'\',\''+pkgName+'\',\'2\',\''+pkgSubType+'\',\''+bookingTypeEach+'\');" style="">';
		msg+="<br/><button class=\"HomeSearch sendQuerybtn\"  type=\"button\"  title=\"Want us to call you ?\" ><font color='ffffff'>Want us to call you? </font> </button> " ;
		msg+='</a>';
		msg+='<div class="helpus_booking" style="display:none;" id="sendQuery">';
		msg+='</div> <br /> </div>';
		
		$g("#noDateMsg").html(msg);
		$g(".SendQuery").click(function(){
			if(!($g(".SendQuery").next(".helpus_booking").is(":visible"))){
				$g(".helpus_booking").slideUp();
				$g(".SendQuery").addClass('active').next(".helpus_booking").slideDown();
				$g(".SendQuery").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+37+"px"});
				$g('html, body').animate({
					scrollTop: $g(".SendQuery").next(".helpus_booking").offset().top -40
				}, 500);
			}
			$g(".close").click(function(){	
				 $g(".close").parents(".helpus_booking").slideUp()
				$g(".SendQuery").next(".helpus_booking").prev().removeClass('active');
				});	
		});
		
		/** End for displaying message when departure dates are not available **/
	}
}		

function setAccomType(type)
{
	accomtype=type;
	clearForm();
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0]!=null && type==0)
	{
		changedate(accomtype);
	}

	else if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0]!=null && type==1)
	{
		changedate(accomtype);
	}
	else if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0]!=null && type==2)
	{
		changedate(accomtype);
	}
	else
	{
		changeHub(accomtype);
	}
}

/** function for getting inventory for each departure date for GIT from LT start **/
var inventoryDates="";
function getInventory()
{
	
	var jsonDates = json.split(",");
	var dates="";
	for(var i=0;i<jsonDates.length-1;i++)
	{
		dates+="'";
		dates+=jsonDates[i];
		dates+="'";
		dates+=",";
	}
 	
 	var hub=document.getElementById("hub");
 	var noOfRooms = document.getElementById("noOfRooms").value;
 	var adultCount=0,childCount=0; 
 	for(var i=0;i<noOfRooms;i++)
	{
		var adult=document.getElementById("adult"+i).value;		
		var child=document.getElementById("child"+i).value;

		adultCount+=parseInt(adult);
		childCount+=parseInt(child);
	}
 	var totalPax = adultCount+childCount;
 	
 	if(hub!=null)
 		hub=hub.value;
 	else
 		hub="";
 	var url="/tcportal/px/tcportal/holidays/domHolidays/domHome.do?dates="+dates+"&hub="+hub+"&totalPax="+totalPax+"&pkgType="+pkgtype;
 	if (window.XMLHttpRequest)
	{
        http = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        http = new ActiveXObject("Microsoft.XMLHTTP");
    }  	
  	http.open("GET", url, true);
    http.onreadystatechange=getInventoryResponse;
 	http.send("");
}

function getInventoryResponse(){	
	if (http.readyState == 4) {
	    if (http.status == 200) {	
	    	
	    	var respText=http.responseText;
	    	inventoryDates = respText.split("<");
	    	$g(".pckgdate").datepicker("enable");
	    }
	}
}
/** function for getting inventory for each departure date for GIT from LT end **/

function getAccomType()
{
	//rearrangeFooter();
	priceData="";
	$g(".saveAndContinueButton").hide();
	$g("#calculateButton").show();
	var departDate=document.getElementById("departDate").value;
	var jsonDates = json.split(",");
	var blk = blockDate.split(",");
	var deptDate = departDate.split("-");
	for(var i=0;i<jsonDates.length-1;i++)
	{
		var jsonDate = jsonDates[i].split("-");
		if(new Date(deptDate[2],deptDate[1]-1,deptDate[0]).getTime() == new Date(jsonDate[0],jsonDate[1]-1,jsonDate[2]).getTime())
		{
			blockDateIndex=i;
		}
	}
 	if(departDate==null || departDate=="")
 	{
 		alert("Please select a departure date");
 	    return false;
    }
 	var hub;
 	var pkgId=document.getElementById("pkgId").value;
 	hub=document.getElementById("hub");
 	var noOfRooms = document.getElementById("noOfRooms").value;
 	var adultCount=0,childCount=0; 
 	for(var i=0;i<noOfRooms;i++)
	{
		var adult=document.getElementById("adult"+i).value;		
		var child=document.getElementById("child"+i).value;
		adultCount+=parseInt(adult);
		childCount+=parseInt(child);
	}
 	var totalPax = adultCount+childCount;
 	if(hub!=null)
 		hub=hub.value;
 	else
 		hub="";
 	
 	var url="/tcportal/px/tcportal/holidays/domHolidays/domHome.do?departDate="+departDate+"&hub="+hub+"&pkgId="+pkgId+"&pkgSubType="+pkgSubType+"&accom_type="+accomtype+"&totalPax="+totalPax;
 	var accomTypeHtml="";
	document.getElementById("acctype").style.display='none';
	document.getElementById("waitImg").style.display='block';
 	accomTypeHtml+="<img src=\"/tcportal/images/holiAbroad/images/loading.gif\"/>";
	document.getElementById("waitImg").innerHTML=accomTypeHtml;
 	getHttpResponse(url);
}

function getHttpResponse(url)
{
    if (window.XMLHttpRequest)
	{
        http = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        http = new ActiveXObject("Microsoft.XMLHTTP");
    }  	
  	http.open("GET", url, true);
    http.onreadystatechange=getResponse;
 	http.send("");
}

function getResponse(){	
	if (http.readyState == 4) {
	    if (http.status == 200) {	
	    	
	    	var respText=http.responseText;
	    	var accomData=new Array();
	    	accomData=respText.split("<");
	    	createAccomType(accomData[0]);
	    	accmData=accomData[0];
	    }
	}
}

function createAccomType(accmData)
{
	document.getElementById("waitImg").style.display='none';
	var accomType=new Array();
	var packageType=pkgSubType;
	if(accmData!='' && accmData!='}')
	{

		var srInr=0,drInr=0,trInr=0,qrInr=0,cwbInr=0,cnbInr=0,infInr=0,servTax=0,productCode,cnbslabInr=0,jcInr=0;
		var srOthr=0,drOthr=0,trOthr=0,qrOthr=0,cwbOthr=0,cnbOthr=0,infOthr=0,cur="",cur_rateOthr=0,cnbslabOthr=0,jcOthr=0;
		var data = new Array();
		var srTot=0,drTot=0,trTot=0,qrTot=0,cwbTot=0,cnbTot=0,infTot=0,tsTot=0,cnbslabTot=0,jcTot=0;
		var srBase="",drBase="",trBase="",qrBase="",cwbBase="",cnbBase="",infBase="",cnbslabBase="",tsBase="",jcBase="",inventry="",cur="",exchangeRates="",webRupee="";
		var accomTypeHtml="";
		var region=document.getElementById("region").value;
		currencyList="";
		currencyRateList="";
		accomType=accmData.split("|");
		var priceSlabChk="";
			for(var i=0;i<accomType.length;i++)
			{
				var price=new Array();
				price=accomType[i].split(",");
				if(i==0)
					priceSlabChk=price[11];
				
				if((price[11]==priceSlabChk && pkgSubType=='FIT') || pkgSubType=='GIT')
				{
					if(price[0]=='THB' || price[0]=='JPY')
					{
						srTot+=(parseInt(price[1])*parseFloat(price[9]))/100;
						drTot+=(parseInt(price[2])*parseFloat(price[9]))/100;
						trTot+=(parseInt(price[3])*parseFloat(price[9]))/100;
						qrTot+=(parseInt(price[4])*parseFloat(price[9]))/100;
						cwbTot+=(parseInt(price[5])*parseFloat(price[9]))/100;
						cnbTot+=(parseInt(price[6])*parseFloat(price[9]))/100;
						if(pkgSubType=='FIT')
							cnbslabTot+=(parseInt(price[15])*parseFloat(price[9]))/100;
						if(accomType.length==1)	
						{
							if(parseInt(price[7])==-1)
								infTot+=-1;
							else
								infTot+=(parseInt(price[7])*parseFloat(price[9]))/100;
						}
						else
						{
							if(parseInt(price[7])==-1)
								infTot+=-1;
							else
								infTot+=(parseInt(price[7])*parseFloat(price[9]))/100;
						}
						if(pkgSubType=='FIT')
							tsTot+=(parseInt(price[10])*parseFloat(price[9]))/100;
						if(pkgtype=='0' && pkgSubType=='GIT')
							jcTot+=(parseInt(price[12])*parseFloat(price[9]))/100;
					}
					else
					{
						srTot+=parseInt(price[1])*parseFloat(price[9]);
						drTot+=parseInt(price[2])*parseFloat(price[9]);
						trTot+=parseInt(price[3])*parseFloat(price[9]);
						qrTot+=parseInt(price[4])*parseFloat(price[9]);
						cwbTot+=parseInt(price[5])*parseFloat(price[9]);
						cnbTot+=parseInt(price[6])*parseFloat(price[9]);
						if(pkgSubType=='FIT')
							cnbslabTot+=parseInt(price[15])*parseFloat(price[9]);
						if(accomType.length==1)	
						{
							if(parseInt(price[7])==-1)
								infTot+=-1;
							else
								infTot+=parseInt(price[7])*parseFloat(price[9]);
						}
						else
						{
							if(parseInt(price[7])==-1)
								infTot+=-1;
							else
								infTot+=parseInt(price[7])*parseFloat(price[9]);
							
						}
						if(pkgSubType=='FIT')
							tsTot+=parseInt(price[10])*parseFloat(price[9]);
						if(pkgtype=='0' && pkgSubType=='GIT')
							jcTot+=parseInt(price[12])*parseFloat(price[9]);
					}
					
						if(price[0]=='INR')
						{
							webRupee="<span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span>";
							if(parseInt(price[1])>0)
								srBase+=webRupee+" "+parseInt(price[1])+" + ";
							if(parseInt(price[2])>0)
								drBase+=webRupee+" "+parseInt(price[2])+" + ";
							if(parseInt(price[3])>0)
								trBase+=webRupee+" "+parseInt(price[3])+" + ";
							if(parseInt(price[4])>0)
								qrBase+=webRupee+" "+parseInt(price[4])+" + ";
							if(parseInt(price[5])>0)
								cwbBase+=webRupee+" "+parseInt(price[5])+" + ";
							if(parseInt(price[6])>0)
								cnbBase+=webRupee+" "+parseInt(price[6])+" + ";
							if(pkgSubType=='FIT')
							{
								if(parseInt(price[15])>0)
									cnbslabBase+=webRupee+" "+parseInt(price[15])+" + ";
							}
							if(parseInt(price[7])==-1)
								infBase+="";
							else if(parseInt(price[7])==0)	
								infBase+="#";
							else
								infBase+=webRupee+" "+parseInt(price[7])+" + ";
							if(pkgSubType=='FIT')
							{
								if(parseInt(price[10])>0)
									tsBase+=webRupee+" "+parseInt(price[10])+" + ";
							}
							if(pkgtype=='0' && pkgSubType=='GIT')
							{
								if(parseInt(price[12])>0)
									jcBase+=webRupee+" "+parseInt(price[12])+" + ";
							}
						}
						else
						{
							webRupee=price[0];
							if(parseInt(price[1])>0)
								srBase+=parseInt(price[1])+" "+webRupee+" + ";
							if(parseInt(price[2])>0)
								drBase+=parseInt(price[2])+" "+webRupee+" + ";
							if(parseInt(price[3])>0)
								trBase+=parseInt(price[3])+" "+webRupee+" + ";
							if(parseInt(price[4])>0)
								qrBase+=parseInt(price[4])+" "+webRupee+" + ";
							if(parseInt(price[5])>0)
								cwbBase+=parseInt(price[5])+" "+webRupee+" + ";
							if(parseInt(price[6])>0)
								cnbBase+=parseInt(price[6])+" "+webRupee+" + ";
							if(pkgSubType=='FIT')
							{
								if(parseInt(price[15])>0)
									cnbslabBase+=parseInt(price[15])+" "+webRupee+" + ";
							}
							if(parseInt(price[7])==-1)
								infBase+="";
							else if(parseInt(price[7])==0)	
								infBase+="#";
							else
								infBase+=parseInt(price[7])+" "+webRupee+" + ";
							if(pkgSubType=='FIT')
							{
								if(parseInt(price[10])>0)
									tsBase+=parseInt(price[10])+" "+webRupee+" + ";
							}
							if(pkgtype=='0' && pkgSubType=='GIT')
							{
								if(parseInt(price[12])>0)
									jcBase+=parseInt(price[12])+" "+webRupee+" + ";
							}
						}
						
						if(packageType=='GIT')
						{
							productCode=price[11];
							inventry=price[10];
						}
					
					//if(accomType.length==1)	
					//{
						cur=price[0];
					//}
					servTax=parseFloat(price[8]);
					if(price[0]=='THB' || price[0]=='JPY')
					{
						exchangeRates+="100 "+price[0]+" = <span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+price[9];
					}
					else
					{
						exchangeRates+=price[0]+" 1 = <span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+price[9];
					}
					exchangeRates+=", ";
					
					currencyList+="<input type=\"hidden\" name=\"curencyList\" value='"+price[0]+"' />";
					currencyRateList+="<input type=\"hidden\" name=\"curencyRateList\" value='"+price[9]+"' />";
				}
				currencyListValue+=price[0];
				currencyListValue+=",";
				curencyRateListValue+=price[9];
				curencyRateListValue+=",";
				
			}
			exchangeRates=exchangeRates.substr(0,exchangeRates.length-2)
			
			srBase+="}";
			drBase+="}";
			trBase+="}";
			qrBase+="}";
			cwbBase+="}";
			cnbBase+="}";
			if(pkgSubType=='FIT')
				cnbslabBase+="}";
			infBase+="}";
			if(pkgSubType=='FIT')
				tsBase+="}";
			if(pkgtype=='0' && pkgSubType=='GIT')
				jcBase+="}";
			srBase=srBase.replace(" + }","");
			drBase=drBase.replace(" + }","");
			trBase=trBase.replace(" + }","");
			qrBase=qrBase.replace(" + }","");
			cwbBase=cwbBase.replace(" + }","");
			cnbBase=cnbBase.replace(" + }","");
			if(pkgSubType=='FIT')
				cnbslabBase=cnbslabBase.replace(" + }","");
			infBase=infBase.replace(" + }","");
			infBase=infBase.replace(" + #}", '-1').replace(/^(#)+/, '-1');
			if(pkgSubType=='FIT')
				tsBase=tsBase.replace(" + }","");
			if(pkgtype=='0' && pkgSubType=='GIT')
				jcBase=jcBase.replace(" + }","");
			
		accomTypeHtml+="<table width='100%' height='100%' border='0' cellspacing='0' cellpadding='0' class='roomtype_details'>";
		if(pkgtype=='0' && cur=='INR')
			accomTypeHtml+="<tr><th width='241'>Room Type</th><th width='320' class=\"last\">Total Price (<span style=\"font-size:1.1em;\" class=\"WebRupee\">Rs.</span>)</th></tr>";
		else	
			accomTypeHtml+="<tr><th width='241'>Room Type</th><th width='320'>Base Price</th><th width='320' class=\"last\">Total Price (<span style=\"font-size:1.1em;\" class=\"WebRupee\">Rs.</span>)</th></tr>";
	    
		if(pkgtype=='0' && cur=='INR')
	    {
			if(pkgSubType=='FIT')
		    {
			    if(parseInt(tsTot)>0)
			    	accomTypeHtml+="<tr><td>Twin Share</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(tsTot)+"</td></tr>";
		    }
		    if(parseInt(drTot)>0)
		    	accomTypeHtml+="<tr><td>Double Room</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(drTot)+"</td></tr>";
		    if(parseInt(trTot)>0)
		    	accomTypeHtml+="<tr><td>Triple Room</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(trTot)+"</td></tr>";
		    
		    if(pkgSubType=='FIT')
		    {
		    	if(parseInt(cnbslabTot)>0)
		    	{
		    		if(parseInt(cnbTot)>0)
				    	accomTypeHtml+="<tr><td>Child Without Bed (5-12 yrs)</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
			    	accomTypeHtml+="<tr><td>Child Without Bed (2-5 yrs)</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbslabTot)+"</td></tr>";
		    	}
		    	else
		    	{
		    		if(parseInt(cnbTot)>0)
				    	accomTypeHtml+="<tr><td>Child Without Bed</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
		    	}
		    }
		    
		    //if(region!='Africa' && region!='SAmerica' && region!='NAmerica' && region!='America' && region!='AfricaFit')
		    if(pkgSubType=='GIT')
		    {
		    	if(parseInt(jcTot)>0)
		    	{
		    		if(parseInt(jcTot)>0)
				    	accomTypeHtml+="<tr><td>Child Without Bed (2-5 yrs)</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(jcTot)+"</td></tr>";
			    	accomTypeHtml+="<tr><td>Child Without Bed (5-12 yrs)</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
		    	}
		    	else
		    	{
			    	if(parseInt(cnbTot)>0)
				    	accomTypeHtml+="<tr><td>Child Without Bed</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
		    	}
			    if(region!='Africa' && region!='SAmerica' && region!='NAmerica' && region!='America')
			    {	
			    	if(parseInt(cwbTot)>0)
			    		accomTypeHtml+="<tr><td>Child With Bed</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cwbTot)+"</td></tr>";
			    }
		    }
		    else
		    {
		    	if(parseInt(cwbTot)>0)
		    		accomTypeHtml+="<tr><td>Child With Bed</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cwbTot)+"</td></tr>";
		    }
		    	
		    if(parseInt(srTot)>0)
		    	accomTypeHtml+="<tr><td>Single Room </td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(srTot)+"</td></tr>";
		    if(pkgtype=='0')
		    {	
		    	if(parseInt(qrTot)>0)
		    		accomTypeHtml+="<tr><td>Quad Room</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(qrTot)+"</td></tr>";
		    }
		    if(parseInt(infTot)>-1)
		    	accomTypeHtml+="<tr><td>Infant</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(infTot)+"</td></tr>";
	   }
	    else
	    {
	    	if(pkgSubType=='FIT')
		    {
	    		if(parseInt(tsTot)>0)
		    	    accomTypeHtml+="<tr><td>Twin Share</td><td>"+tsBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(tsTot)+"</td></tr>";
		    }
	    	if(parseInt(drTot)>0)
	    	    accomTypeHtml+="<tr><td>Double Room</td><td>"+drBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(drTot)+"</td></tr>";
	    	
	    	if(parseInt(trTot)>0)
	    	    accomTypeHtml+="<tr><td>Triple Room</td><td>"+trBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(trTot)+"</td></tr>";
	    	
	    	if(pkgSubType=='FIT')
		    {
	    		if(parseInt(cnbslabTot)>0)
	    		{
	    			if(parseInt(cnbTot)>0)
			    	    accomTypeHtml+="<tr><td>Child Without Bed (5-12 yrs)</td><td>"+cnbBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
		    	    accomTypeHtml+="<tr><td>Child Without Bed (2-5 yrs)</td><td>"+cnbslabBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbslabTot)+"</td></tr>";
	    		}
	    		else
	    		{
	    			if(parseInt(cnbTot)>0)
			    	    accomTypeHtml+="<tr><td>Child Without Bed</td><td>"+cnbBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
	    		}
		    }
	    	if(pkgSubType=='GIT')
		    {
	    		if(parseInt(cnbTot)>0)
		    	    accomTypeHtml+="<tr><td>Child Without Bed</td><td>"+cnbBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cnbTot)+"</td></tr>";
		    	if(region!='Africa' && region!='SAmerica' && region!='NAmerica' && region!='America')
		    	{
			    	if(parseInt(cwbTot)>0)
			    	    accomTypeHtml+="<tr><td>Child With Bed</td><td>"+cwbBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cwbTot)+"</td></tr>";
			    }
		    }
	    	else
	    	{
	    		if(parseInt(cwbTot)>0)
		    	    accomTypeHtml+="<tr><td>Child With Bed</td><td>"+cwbBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(cwbTot)+"</td></tr>";
	    	}
	    	
	    	if(parseInt(srTot)>0)
	    	    accomTypeHtml+="<tr><td>Single Room </td><td>"+srBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(srTot)+"</td></tr>";
	    	
	    	if(pkgtype=='0')
		    {	
		    	if(parseInt(qrTot)>0)
		    	    accomTypeHtml+="<tr><td>Quad Room</td><td>"+qrBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(qrTot)+"</td></tr>";
		    }
	    	
	    	if(infBase!="}")
	    	{
	    		if(infBase=="-1" || infBase=="-1}")
	    			infBase = "<span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span>0";
	    		if(infBase=="")
	    			accomTypeHtml+="";
	    		else
	    		{
	    			infBase = infBase.replace(/^(-1)+/, "").replace("-1","").replace(" + ##}","");
	    			accomTypeHtml+="<tr><td>Infant</td><td>"+infBase+"</td><td class='right'><span style=\"font-size:1.1em;font-weight:normal!important;\" class=\"WebRupee\">Rs.</span> "+Math.round(infTot)+"</td></tr>";
	    		}
	    	}
	    }
	    accomTypeHtml+="</table>";
	    
	    if(pkgtype=='1')
	    {
	    	document.getElementById("exchangeRateMsg").style.display='block';
	    	document.getElementById("exchangeRateMsg").innerHTML="The rate of exchange used for calculating INR equivalent is subject to change based on your actual date of booking. The current rate used is "+exchangeRates;
	    }
	    document.getElementById("indicativePiceMsg").style.display='block';
	    document.getElementById("innerPrice").style.height='auto';
	    document.getElementById("acctype").style.display='block';
	    document.getElementById("roeMsg").style.display='block';
	    
	    document.getElementById("roomtype_mid").innerHTML=accomTypeHtml;
	    
	    if(tsTot>0)  
	    	drTot = tsTot;  //when Twin sharing is present then use Twin sharing price otherwise use double room price 
	    priceData=srTot+","+drTot+","+trTot+","+qrTot+","+cwbTot+","+cnbTot+","+infTot+","+servTax+","+inventry+","+tsTot+","+cnbslabTot+","+jcTot;
	    var price="";
		var totalPrice="";
		var discount="";
		var fitservicetax="";
		var advPayable="";
		var balPayable="";
		var packageType=pkgSubType;
		var accomType=new Array();
		
		if(packageType=='GIT')
		{
			prodCode=productCode;
		}
		document.getElementById("totalPrice").innerHTML=totalPrice;
		document.getElementById("discount").innerHTML=discount;
		document.getElementById("servicetax").innerHTML=fitservicetax;
		document.getElementById("total").innerHTML=totalPrice;
		document.getElementById("advPayable").innerHTML=advPayable;
		document.getElementById("balPayable").innerHTML=balPayable;
		
		getGitOffers();
	 }
	 else
	 {
	 	document.getElementById("acctype").style.display='none';
	 	document.getElementById("roeMsg").style.display='none';
	 }
    rearrangeFooter();
}


 var discountPrice=""; 
 var totalPrice=0;
 var balPayable=0;
 var hideFlag=0;
 var serTaxPayable=0;
function getDiscountPrice(data,id)
{
	$g(".disOffer").html("");
	document.getElementById("totalprice_right").style.display='none';
	document.getElementById("roomsNotAvail").innerHTML='';
    $g("#calculateButton").show();
    $g(".saveAndContinueButton").hide();
	var packageType=pkgSubType;
	var disSr="",disDr="",disTr="",disQr="",disCwb="",disCnb="",disInfant="",disCur="",exRate=0.0;
	var roomCountData=generateRooming(1);
	var discountArray=new Array();
	
	var str="";
	discountPrice=data;
	roomCountArray=roomCountData.split(",");
	if(packageType=='GIT')
	{
		gitdiscountFlag=true;
		//str=getGitDiscount(data);
		var disPrice = data.split(",");
		if(pkgtype=='0')
			str=disPrice[0]+" "+disPrice[1];
		else
			str=disPrice[0];//+" "+disPrice[1];
		
	}
	else
	{
		var srcount=roomCountArray[0];
		var drcount=roomCountArray[1];
		var trcount=roomCountArray[2];
		var qrcount=roomCountArray[3];
		var cnbcount=roomCountArray[4];
		var cwbcount=roomCountArray[5];
		var infantCount=roomCountArray[6];
		discountArray=data.split(",");
		disSr=discountArray[0];
		disDr=discountArray[1];
		disTr=discountArray[2];
		disQr=discountArray[3];
		disCwb=discountArray[4];
		disCnb=discountArray[5];
		disInfant=discountArray[6];
		disCur=discountArray[7];
		exRate=discountArray[8];
		var disSrAmt=0,disDrAmt=0,disTrAmt=0,disQrAmt=0,disCnbAmt=0,disCwbAmt=0,disInfAmt=0;
		if(disCur=='THB' || disCur=='JPY')
		{
			disSrAmt=srcount*1*(parseFloat(disSr)*(parseFloat(exRate)/100));
			disDrAmt=drcount*2*(parseFloat(disDr)*(parseFloat(exRate)/100));
			disTrAmt=trcount*3*(parseFloat(disTr)*(parseFloat(exRate)/100));
			disQrAmt=qrcount*4*(parseFloat(disQr)*(parseFloat(exRate)/100));
			disCnbAmt=cnbcount*1*(parseFloat(disCnb)*(parseFloat(exRate)/100));
			disCwbAmt=cwbcount*1*(parseFloat(disCwb)*(parseFloat(exRate)/100));
			disInfAmt=infantCount*1*(parseFloat(disInfant)*(parseFloat(exRate)/100));
		}
		else
		{
			disSrAmt=srcount*1*(parseFloat(disSr)*parseFloat(exRate));
			disDrAmt=drcount*2*(parseFloat(disDr)*parseFloat(exRate));
			disTrAmt=trcount*3*(parseFloat(disTr)*parseFloat(exRate));
			disQrAmt=qrcount*4*(parseFloat(disQr)*parseFloat(exRate));
			disCnbAmt=cnbcount*1*(parseFloat(disCnb)*parseFloat(exRate));
			disCwbAmt=cwbcount*1*(parseFloat(disCwb)*parseFloat(exRate));
			disInfAmt=infantCount*1*(parseFloat(disInfant)*parseFloat(exRate));
		}
		var discount=disSrAmt+disDrAmt+disTrAmt+disQrAmt+disCnbAmt+disCwbAmt+disInfAmt;
		str+=discount;
	}
	
	if(str.indexOf("+") !=-1)
		str=str.substr(0,str.length-2);
	
	var offerString="";
	offerString="Discount "+str;
	$g("#offerPrice"+id).html(offerString);
}


/*function getGitDiscount(data)
{
	var srDis=0,drDis=0,trDis=0,qrDis=0,cwbDis=0,cnbDis=0,infDis=0,jcDis=0;
	discountArray=data.split("#");
	var discal=0;
	var str="";
	var srcount=roomCountArray[0];
	var drcount=roomCountArray[1];
	var trcount=roomCountArray[2];
	var qrcount=roomCountArray[3];
	var cnbcount=roomCountArray[4];
	var cwbcount=roomCountArray[5];
	var infantCount=roomCountArray[6];
	var jcCount = roomCountArray[8];
	var disSr="",disDr="",disTr="",disQr="",disCwb="",disCnb="",disInfant="",disCur="",disJc="",exRate=0.0;
	for(var i=0;i<discountArray.length-1;i++)
	{
		var cur = discountArray[i].split("|");
			disSr=cur[1];
			disDr=cur[2];
			disTr=cur[3];
			disQr=cur[4];
			disCwb=cur[5];
			disCnb=cur[6];
			disInfant=cur[7];
			disCur=cur[0];
			exRate=cur[8];
			disJc=cur[9];
			
			var disSrAmt=0,disDrAmt=0,disTrAmt=0,disQrAmt=0,disCnbAmt=0,disCwbAmt=0,disInfAmt=0,disJcAmt=0;
			if(gitdiscountFlag)
			{
				if(disCur=='THB' || disCur=='JPY')
				{
					disSrAmt=srcount*1*(parseFloat(disSr));//(parseFloat(exRate)/100));
					disDrAmt=drcount*2*(parseFloat(disDr));//(parseFloat(exRate)/100));
					disTrAmt=trcount*3*(parseFloat(disTr));//(parseFloat(exRate)/100));
					disQrAmt=qrcount*4*(parseFloat(disQr));//(parseFloat(exRate)/100));
					disCnbAmt=cnbcount*1*(parseFloat(disCnb));//(parseFloat(exRate)/100));
					disCwbAmt=cwbcount*1*(parseFloat(disCwb));//(parseFloat(exRate)/100));
					disInfAmt=infantCount*1*(parseFloat(disInfant));//(parseFloat(exRate)/100));
					disJcAmt=jcCount*1*(parseFloat(disJc));
				}
				else
				{
					disSrAmt=srcount*1*(parseFloat(disSr));//parseFloat(exRate));
					disDrAmt=drcount*2*(parseFloat(disDr));//parseFloat(exRate));
					disTrAmt=trcount*3*(parseFloat(disTr));//parseFloat(exRate));
					disQrAmt=qrcount*4*(parseFloat(disQr));//parseFloat(exRate));
					disCnbAmt=cnbcount*1*(parseFloat(disCnb));//parseFloat(exRate));
					disCwbAmt=cwbcount*1*(parseFloat(disCwb));//parseFloat(exRate));
					disInfAmt=infantCount*1*(parseFloat(disInfant));//parseFloat(exRate));
					disJcAmt=jcCount*1*(parseFloat(disJc));
				}
				var discount=disSrAmt+disDrAmt+disTrAmt+disQrAmt+disCnbAmt+disCwbAmt+disInfAmt+disJcAmt;
				str+=discount+" "+disCur; 
				str+=" + ";
			}
			else
			{
				if(disCur=='THB' || disCur=='JPY')
				{
					disSrAmt=srcount*1*(parseFloat(disSr)*(parseFloat(exRate)/100));
					disDrAmt=drcount*2*(parseFloat(disDr)*(parseFloat(exRate)/100));
					disTrAmt=trcount*3*(parseFloat(disTr)*(parseFloat(exRate)/100));
					disQrAmt=qrcount*4*(parseFloat(disQr)*(parseFloat(exRate)/100));
					disCnbAmt=cnbcount*1*(parseFloat(disCnb)*(parseFloat(exRate)/100));
					disCwbAmt=cwbcount*1*(parseFloat(disCwb)*(parseFloat(exRate)/100));
					disInfAmt=infantCount*1*(parseFloat(disInfant)*(parseFloat(exRate)/100));
					disJcAmt=jcCount*1*(parseFloat(disJc)*(parseFloat(exRate)/100));
				}
				else
				{
					disSrAmt=srcount*1*(parseFloat(disSr)*parseFloat(exRate));
					disDrAmt=drcount*2*(parseFloat(disDr)*parseFloat(exRate));
					disTrAmt=trcount*3*(parseFloat(disTr)*parseFloat(exRate));
					disQrAmt=qrcount*4*(parseFloat(disQr)*parseFloat(exRate));
					disCnbAmt=cnbcount*1*(parseFloat(disCnb)*parseFloat(exRate));
					disCwbAmt=cwbcount*1*(parseFloat(disCwb)*parseFloat(exRate));
					disInfAmt=infantCount*1*(parseFloat(disInfant)*parseFloat(exRate));
					disJcAmt=jcCount*1*(parseFloat(disJc)*parseFloat(exRate));
				}
				var discnt=disSrAmt+disDrAmt+disTrAmt+disQrAmt+disCnbAmt+disCwbAmt+disInfAmt+disJcAmt;
				srDis+= disSrAmt;
				drDis+= disDrAmt;
				trDis+= disTrAmt;
				qrDis+= disQrAmt;
				cwbDis+= disCwbAmt;
				cnbDis+= disCnbAmt;
				infDis+= disInfAmt;
				jcDis+= disJcAmt;
				discal = discal + discnt;//parseFloat(exRate);
			}
	}
	
	if(gitdiscountFlag)
	{
		gitdiscountFlag = false;
		return str;
	}
	else
	{
		gitDiscountArray = srDis+","+drDis+","+trDis+","+qrDis+","+cwbDis+","+cnbDis+","+infDis+","+jcDis;
		return discal;
	}
	
}*/
function getGitDates()
{
	clearForm();
	var hubIndex=document.getElementById("hub").selectedIndex;
	var hubObj=document.getElementById("hub").options;
	if(hubIndex==0)
	{
		alert("Please select starting city");
		$g(".pckgdate").datepicker("disable");
		return false;
	}
	changeGitDate(hubIndex);
}
	
function showGitOffers(offerdata)
{
	var gitdiscount=new Array();
	gitdiscount=offerdata.split("@");
	var offerStr="";
	var offerDesc="";
	var offerName="";
	var desc = gitdiscount[1].split("|");
	//alert("in show offers=="+pkgtype)
	if(pkgtype=='0')
	{
		var offCode = gitdiscount[0].split(",")[5];
		offerStr+="<div class=\"inner_addtours inner_addtours_N\" id=\"offerTours\"> <input type=\"hidden\" name=\"discountCode\" id=\"discountCode\" value=\'"+offCode+"' /> <input name=\"pricingStRadio\" type=\"radio\" id=\"disPrice\" class=\"disPrice\"  />";
	}
	else
	{
		offerStr+="<div class=\"inner_addtours inner_addtours_N\" id=\"offerTours\"> <input type=\"hidden\" name=\"discountCode\" id=\"discountCode\" value=\'"+desc[1]+"' /> <input name=\"pricingStRadio\" type=\"radio\" id=\"disPrice\" class=\"disPrice\"  />";
	}
	offerStr+="<label onclick=\"getDiscountPrice('"+gitdiscount[0]+"','"+i+"');\" style=\"margin-top:0px;\" > </label> <p style=\"line-height:16px;padding-left:21px;\">"+desc[0]+"<b class=\"disOffer\" id=\"offerPrice"+i+"\" style=\"padding-left: 8px !important;cursor:default;\"> </b> </p> </div>";
	$g(".offout").html(offerStr);
	$g(".offout").css("display","block");
	$g("input[name=pricingStRadio]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	$g('input:radio').stylecheck();
}

function getGitOffers()
{
	hideFlag=1;
	var date=document.getElementById("departDate").value;
	if(date==null || date=="")
 	{
 	    return false;
    }
 	else if(priceData==null || priceData=="")
 	{
 		return false;
 	}
 	else if(pkgSubType=='FIT' || pkgSubType=='Addon')
 	{
 		return false;
 	}
	else
	{
		var hub=document.getElementById("hub").value;
		/*var noOfRooms = document.getElementById("noOfRooms").value;
	 	var adultCount=0,childCount=0; 
	 	for(var i=0;i<noOfRooms;i++)
		{
			var adult=document.getElementById("adult"+i).value;		
			var child=document.getElementById("child"+i).value;
			adultCount+=parseInt(adult);
			childCount+=parseInt(child);
		}*/
	 	//var totalPax = adultCount+childCount;
		var roomCountData=generateRooming(2);
		
		roomCountData = roomCountData.replace("#","@").replace("#","@").replace("#","@");
		//var url="/tcportal/px/tcportal/holidays/domHolidays/domHome.do?prodcode="+prodCode+"&hub="+hub+"&offers=gitoffers";
		var url="/tcportal/px/tcportal/holidays/domHolidays/domHome.do?prodcode="+prodCode+"&hub="+hub+"&offers=gitoffers&pkgType="+pkgtype+"&roomCountData="+roomCountData;
		if (window.XMLHttpRequest)
		{
	        http1 = new XMLHttpRequest();
	    }
	    else if (window.ActiveXObject)
	    {
	        http1 = new ActiveXObject("Microsoft.XMLHTTP");
	    }  	
	  	http1.open("POST", url, true);
	    http1.onreadystatechange=getGitOfferResponse;
	 	http1.send("");
	}	
	//if(!validateAllFields())
   // return false;
	
	
    }

function forSendLead()
{
	var emailIdValue=document.getElementById("emailID").value;
    document.getElementById('emailIDValue1').value=emailIdValue;
    var mobileNoValue=document.getElementById("mobileNoNew").value;
    var pkgid=document.getElementById("pkgId").value;
    var pdName=document.getElementById("addonPkgName").value;
    var pkgtype=document.getElementById("pkgtype").value;
    var pkgsubtype=document.getElementById("pkgsubtype").value;
    var hub=document.getElementById("hub").value;
    var index = document.getElementById("hub").selectedIndex;
    var hubValue = document.getElementById("hub").options[index].text;
	CommonDWR.dropOutForm(emailIdValue,mobileNoValue,pkgid,pdName,callbackDropOut);
	
}
function sendLeadResponse()
{
if (http1.readyState == 4) {
	    if (http1.status == 200) {	
	    
	}
  }
}


function callbackDropOut(data)
{
	var emailIdValue=document.getElementById("emailID").value;
    document.getElementById('emailIDValue1').value=emailIdValue;
    var mobileNoValue=document.getElementById("mobileNoNew").value;
    var pkgid=document.getElementById("pkgId").value;
    var pdName=document.getElementById("addonPkgName").value;
    var pkgtype=document.getElementById("pkgtype").value;
    var pkgsubtype=document.getElementById("pkgsubtype").value;
    var hub=document.getElementById("hub").value;
    var index = document.getElementById("hub").selectedIndex;
    var hubValue = document.getElementById("hub").options[index].text;
	  var url="/tcportal/px/tcportal/ins_new/insurancesavedetail.do?emailIdValue="+emailIdValue+"&mobileNoValue="+mobileNoValue+"&pkgid="+pkgid+"&pdName="+pdName+"&pkgtype="+pkgtype+"&pkgsubtype="+pkgsubtype+"&hubValue="+hubValue+"&ajax=true";
		if (window.XMLHttpRequest)
		{
	        http1 = new XMLHttpRequest();
	    }
	    else if (window.ActiveXObject)
	    {
	        http1 = new ActiveXObject("Microsoft.XMLHTTP");
	    }  	
	  	http1.open("GET", url, true);
	    http1.onreadystatechange=sendLeadResponse;
	 	http1.send("");
	return data;
}

function getGitOfferResponse(){	
	if (http1.readyState == 4) {
	    if (http1.status == 200) {	
	    	var respText=http1.responseText;
	    	var gitOfferData=new Array();
	    	gitOfferData=respText.split("<");
	    	document.getElementById("calculateTotPriceDiv").style.display='block';
	    	if(gitOfferData[0]=='')
	    	{		    	 
	    		document.getElementById("offerDiv").style.display='none';
	    		$g(".offout").css("display","none");
	    	}
	    	else
	    	{
	    	/* when offers are found in GIT*/
	    		
	    		document.getElementById("offerDiv").style.display='block';	
	    		$g(".offout").css("display","block");
	    		document.getElementById("calculateButton").style.display='';  
	    		//document.getElementById("notificationFooter").style.marginTop='0px'; 
	    		//alert(gitOfferData[0])
	    		showGitOffers(gitOfferData[0]);
	    	}
	    }
	}
}
	
	
function clearForm()
{
	discountPrice='';
	document.getElementById("noDateMsg").style.display='none';
	document.getElementById("acctype").style.display='none';
	document.getElementById("roeMsg").style.display='none';
	document.getElementById("indicativePiceMsg").style.display='none';
	document.getElementById("exchangeRateMsg").style.display='none';
	document.getElementById("innerPrice").style.height='';
	document.getElementById("noOfRooms").selectedIndex=0;
	$g(".room_selectbg ul.newList a").removeClass('hiLite');			
	$g(".room_selectbg ul.newList li").eq(0).find('a').addClass('hiLite')
	$g(".room_selectbg .newListSelected .selectedTxt").html("1");
	num_rooms(2);
	$g("#calculateTotPriceDiv").css("display","block");
	if(pkgSubType=='GIT')
	{
		$g(".bookonlineWrap").css("display","block");
		$g("#offerDiv").css("display","none");
		$g(".offout").css("display","none");
		//document.getElementById("calculateButton").style.display="none";
	}
	document.getElementById("departDate").value="";
	document.getElementById("totalPrice").innerHTML="";
	document.getElementById("discount").innerHTML="";
	document.getElementById("servicetax").innerHTML="";
	document.getElementById("total").innerHTML="";
	document.getElementById("advPayable").innerHTML="";
	document.getElementById("balPayable").innerHTML="";
	document.getElementById("roomsNotAvail").innerHTML="";
	document.getElementById("addonPriceMsg").innerHTML="";
	if(document.getElementById("mailResponse")!=null)
		document.getElementById("mailResponse").innerHTML="";
	$g("input[name=addon]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	$g("input[name=pricingStRadio]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	$g(".disOffer").html("");
	$g('input:checkbox').stylecheck();
	$g('input:radio').stylecheck();
	document.getElementById("totalprice_right").style.display='none';
}

function validateHub()
{
	if(pkgSubType=='GIT')
 	{
 		hub=document.getElementById("hub").value;
 		if(hub=='select')
 		{
 			alert("Please select the starting city");
 			return false;
 		}
 	}
}

function clearPrice()
{
	
	$g("#calculateButton").show();
	$g(".saveAndContinueButton").hide();
	discountPrice='';
	if(pkgSubType=='GIT' && !fitFixed)
	{
		document.getElementById("noDateMsg").style.display='none';
		document.getElementById("acctype").style.display='none';
		document.getElementById("roeMsg").style.display='none';
		document.getElementById("indicativePiceMsg").style.display='none';
		document.getElementById("exchangeRateMsg").style.display='none';
		document.getElementById("innerPrice").style.height='';
		document.getElementById("departDate").value="";
	}
	document.getElementById("totalPrice").innerHTML="";
	document.getElementById("discount").innerHTML="";
	document.getElementById("servicetax").innerHTML="";
	document.getElementById("total").innerHTML="";
	document.getElementById("advPayable").innerHTML="";
	document.getElementById("balPayable").innerHTML="";
	if(pkgSubType=='GIT')
	{
		$g(".bookonlineWrap").css("display","block");
		$g("#offerDiv").css("display","none");
		$g(".offout").css("display","none");
		//document.getElementById("calculateButton").style.display="none";
	}
	document.getElementById("roomsNotAvail").innerHTML="";
	document.getElementById("addonPriceMsg").innerHTML="";
	if(document.getElementById("mailResponse")!=null)
		document.getElementById("mailResponse").innerHTML="";
	
	/*  added by fawaad */
		$g("#calculateTotPriceDiv").css("display","block");
	$g("input[name=addon]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	$g("input[name=pricingStRadio]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	$g(".disOffer").html("");
	$g('input:checkbox').stylecheck();
	$g('input:radio').stylecheck();
	document.getElementById("totalprice_right").style.display='none';
}

function childBoxSlide(i,type)
{
	$g(".childdet"+i+" a").next('.childDetailsContainer').slideUp();
	if(type=='adult')
	{
		document.getElementById("child"+i).selectedIndex=0;
		$g("#childSelect"+i+" .newListSelected .selectedTxt").html("0");
	}
}

function setTab(tabValue)
{
	setTabContents(tabValue);
	if(tabValue=='')
	{
		holidayChangeTab(4);
		openFly();
	}
	else if(tabValue=='1')
	{
		holidayChangeTab(tabValue);
		$g("#li_maintab_1").addClass("first");
	}
	else 
	{
		holidayChangeTab(tabValue);
		if(tabValue=='4')
			openFly();
	}
}
function setTabContents(tabId)
{
	if(tabId=='1')
	{
		inclusionTab();
	}
	else if(tabId=='2')
	{
		accomodationTab();
	}
	else if(tabId=='3')
	{
		itineraryTab();
	}
	else if(tabId=='4')
	{
		pricingTab(0);
	}
	else if(tabId=='5')
	{
		destinationTab();
	}
	else if(tabId=='6')
	{
		photosTab();
	}
	else if(tabId=='8')
	{
		videoTab();
	}
}
/*added for _utmz cookies */
/*function addGAToFormFields() {
	var cv = getGACampaignCodes();
	document.getElementById("utmcsr").value=cv[0];
	document.getElementById('utmccn').value=cv[1];
	document.getElementById('utmcmd').value=cv[2];
	document.getElementById('utmctr').value=cv[3];
	document.getElementById('utmcct').value=cv[4];
	document.getElementById('utmgclid').value=cv[5];
}*/

/*End of sudhanashu *

/*
 * Send query on package details page
 */
function SendQuery(pkgType,pkgId,pkgName,formType,pkgSubType,holidayChoice)
{
	var utmcv = getGACampaignCodes();
	/*var utmcsr=document.getElementById("utmcsr").value;
	var utmccn=document.getElementById('utmccn').value;
	var utmcmd=document.getElementById('utmcmd').value;
	var utmctr=document.getElementById('utmctr').value;
	var utmcct=document.getElementById('utmcct').value;
	var utmgclid=document.getElementById('utmgclid').value;*/
	 var NUHstring='';
	 var cityIndex='';
	 var cityOption='';
	 if(pkgSubType!='FIT' && formType!=1){
	  cityIndex=document.getElementById("hub").selectedIndex;
	  cityOption=document.getElementById("hub").options; 
	 }
	 NUHstring+="<input type='hidden' id='formType' value='"+formType+"' />";
	 if(formType==2)	 
	 	NUHstring+=" <div class=\"helptop helptopFliped\"> </div>"
	 else
	 	 NUHstring+=" <div class=\"helptop\"> </div>"
	 	 
	 if(pkgSubType=='GIT' || holidayChoice=='1')	 
		 NUHstring+="<div class=\"helpmid\">" +"<h3>" +"Need help with the package?"+ "</h3>";
	 else
		 NUHstring+="<div class=\"helpmid\">" +"<h3>" +"Need help with the package or want to customize it as per your need?"+ "</h3>";
     NUHstring+="<div class=\"close\"><img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/close.gif\" alt=\"Close\" /> </div>" 
     if(formType=='1')
     {
    	 if(holidayChoice=='1')
    	 
    		 NUHstring+="<div class=\"package_name\">" +"Package Name : "+"<span>" +pkgName+"</span> <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/aeroplane-small.gif\" alt=\"\" /><input type=\"hidden\" id=\"pkgName\" name=\"pkgName\" value='"+pkgName+"' /> </div>";
    	 else
    		 NUHstring+="<div class=\"package_name\">" +"Package Name : "+"<span>" +pkgName+"</span> <input type=\"hidden\" id=\"pkgName\" value='"+pkgName +"' /> </div>";
	     NUHstring+="<div  class=\"inner_booking\">  <div class=\"inner_topcurve\"> </div>  <div class=\"inner_mid\">   <h4>" +"Have us call you" +"</h4>";
	     NUHstring+="<fieldset>"+"<label>"+"Name<span style=\"color:red !important;\">*</span> :"+"</label>"+"<div class=\"textbg\"> <input type=\"text\" id=\"cName\"/>"+" </div>"+"  <label class=\"bk_address\">"+"City of Residence :"+"</label>"+"<div class=\"textbg\"> <input  type=\"text\" id=\"city\"/>"+"</div>"+"</fieldset>";
	     NUHstring+="<fieldset>  <label>"+"Mobile No.<span style=\"color:red !important;\">*</span> :"+"</label> <div class=\"textbg\"> <input type=\"text\" id=\"mobileNo\" maxlength=\"10\" autocomplete='off'/> </div> <label class=\"bk_address\">"+"Email Address<span style=\"color:red !important;\">*</span> :"+"</label>  <div class=\"textbg\">  <input type=\"text\" id=\"email\" autocomplete='off'/> </div> </fieldset>";
	     NUHstring+=" <h4 style=\"margin-top:30px;\">"+"Enter your query"+"</h4>";
	     if(pkgSubType=='FIT' && holidayChoice=='0')
	    	NUHstring+="<fieldset> <label style=\"width:70px;\">"+"I want to<span style=\"color:red !important;\">*</span> :"+"</label>  <select name=\"\" class=\"newselect\" id=\"query\"> <option value=\"Change no. of days\">"+"Change no. of days"+"</option>  "+"<option value=\"Change itinerary\">"+"Change itinerary"+"</option>"+ "<option value=\"Change hotels\">"+"Change hotels"+"</option><option value=\"other\">Other</option> </select>  </fieldset> ";
	     NUHstring+="<fieldset> <label>"+"Comments :"+"</label>  <div class=\"commentbg\"> <textarea  cols=\"\" rows=\"\" id=\"comments\"> </textarea> </div>  </fieldset> ";       
	     NUHstring+="<fieldset class=\"querySubmit\"> <a href=\"javascript:void(0)\" onclick=\"helpMail('"+pkgType+"','"+pkgId+"','package','"+pkgSubType+"','"+holidayChoice+"','&"+utmcv+"');\">  <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/submit.gif\" alt=\"Submit\" style=\"margin-left:35px\" /> </a> <span id=\"waitMsg\" style=\"display:none;color:red\">Please wait.. </span> </fieldset>";
     }
     else
     {
    	 if(holidayChoice=='1')
    		 NUHstring+="<div class=\"package_name\">" +"Package Name : "+"<span>" +pkgName+"</span> <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/aeroplane-small.gif\" alt=\"\" /> <input type=\"hidden\" id=\"pdpkgName\" value='"+pkgName +"' /> </div>";
    	 else
    		 NUHstring+="<div class=\"package_name\">" +"Package Name : "+"<span>" +pkgName+"</span> <input type=\"hidden\" id=\"pdpkgName\" value='"+pkgName +"' /> </div>";
	     NUHstring+="<div  class=\"inner_booking\">  <div class=\"inner_topcurve\"> </div>  <div class=\"inner_mid\">   <h4>" +"Have us call you" +"</h4>";
	     NUHstring+="<fieldset>"+"<label class=\"bk_address\">"+"Name<span style=\"color:red !important;\">*</span> :"+"</label>"+" <div class=\"textbg\"> <input type=\"text\" id=\"pdName\"/>"+" </div><!--"+"  <label class=\"bk_address\">"+"City of Residence :"+"</label>"+" <div class=\"textbg\"> <input  type=\"text\" id=\"pdcity\" />"+" </div>"+" --></fieldset>";
	     NUHstring+="<fieldset>  <label class=\"bk_address\">"+"Mobile No.<span style=\"color:red !important;\">*</span> :"+"</label> <div class=\"textbg\"> <input type=\"text\" id=\"pdmobile\" maxlength=\"10\" autocomplete='off'/> </div><!--<fieldset> <label class=\"bk_address\">"+"Email Address<span style=\"color:red !important;\">*</span> :"+"</label>  <div class=\"textbg\">  <input type=\"text\" id=\"pdemail\" autocomplete='off'/> </div> </fieldset>--></fieldset>";
	     NUHstring+="<fieldset> <label class=\"bk_address\">"+"Email Address<span style=\"color:red !important;\">*</span> :"+"</label>  <div class=\"textbg\">  <input type=\"text\" id=\"pdemail\" autocomplete='off'/> </div> </fieldset>";
	     
	     <!--NUHstring+=" <h4 style=\"margin-top:30px;\">"+"Enter your query"+"</h4>";-->
	    // if(pkgSubType=='FIT' && holidayChoice=='0')
	    	// NUHstring+="<fieldset> <label style=\"width:70px;\" class=\"bk_address\">"+"I want to<span style=\"color:red !important;\">*</span> :"+"</label>  <select name=\"\" class=\"newselect\" id=\"pdquery\"> <option value=\"Change no. of days\">"+"Change no. of days"+"</option>  "+"<option value=\"Change itinerary\">"+"Change itinerary"+"</option>"+ "<option value=\"Change hotels\">"+"Change hotels"+"</option><option value=\"other\">Other</option> </select>  </fieldset> ";
	     <!--NUHstring+="<fieldset> <label>"+"Comments :"+"</label> <div class=\"commentbg\"> <textarea  cols=\"\" rows=\"\" id=\"pdcomments\"> </textarea> </div>  </fieldset> ";  -->       
	     NUHstring+="<fieldset class=\"querySubmit\"> <a href=\"javascript:void(0)\" onclick=\"helpMail('"+pkgType+"','"+pkgId+"','packageDetail','"+pkgSubType+"','"+holidayChoice+"','&"+utmcv+"');\">  <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/submit.gif\" alt=\"Submit\" style=\"margin-left:35px\" /> </a> <span id=\"waitMsg\" style=\"display:none;color:red\">Please wait.. </span> </fieldset>";
     }
     NUHstring+="</div>"
     NUHstring+= "<div class=\"inner_btmcurve\"> </div>" ;
     NUHstring+="</div>";              
     NUHstring+="<p class=\"call\">"+"Call :"+" <span>" +"1800 2099 100"+"</span></p>";         
     //NUHstring+="<p class=\"call\">"+"Email :"+" <span> <a href=\"mailto:sales@thomascook.in\">"+"sales@thomascook.in"+"</a> </span> </p>";
     NUHstring+="</div>";
     NUHstring+="<div class=\"helpbtm\"> </div>" ;
     if(formType=='1')
    	 document.getElementById('helpusbooking').innerHTML=NUHstring;
     else if(formType=='3')
    	 document.getElementById('helpus_query').innerHTML=NUHstring;
     else if(formType=='4'){
         if( document.getElementById('sendQuery')!=undefined && document.getElementById('sendQuery')!=null)
         document.getElementById('sendQuery').innerHTML="";
   	  	 document.getElementById('sendQuery1').innerHTML=NUHstring;
   	  	 }
   	 else{
   	 if( document.getElementById('sendQuery1')!=undefined && document.getElementById('sendQuery1')!=null)
   	     document.getElementById('sendQuery1').innerHTML="";
   	     document.getElementById('sendQuery').innerHTML=NUHstring;
   	     }
}

/* end here */


var currentPhotoGalImg;
var imgCounter=1;

function photoGal_new(){
	var thumbParam=".photoGalThumb";
	var largeParam=".photoGalLarge";
	var contentParam=".photoGalCont";
	
	if($g('.photoGalThumb').length)
	{
		thumbParam=thumbParam;
		largeParam=largeParam;
		contentParam=contentParam;
	}
	else if($g('.photoGalThumb_new').length)
	{
		thumbParam=thumbParam+"_new";
		largeParam=largeParam+"_new";
		contentParam=contentParam+"_new";
	}

	var imgLarge1 = $g(thumbParam+' li').find('img').eq(0).attr('src');
	var imgLarge2 = imgLarge1.replace("thumb","large");
	$g(largeParam+' img').attr('src',imgLarge2);
	var imgText = $g(thumbParam+' li').eq(0).find('a').attr('rel');
	$g(contentParam+' p').html(imgText);
	//
	$g(thumbParam+' li a').click(function(){
		var thisIndex=$g(this).parent("li").index();
		
		imgCounter=thisIndex+1;
		$g(".lyteboxGallery").find(thumbParam+' li').each(function(){
			$g(this).find('a').removeClass('sel');
		});
		$g(".tab-4-content").find(thumbParam+' li').each(function(){
			$g(this).find('a').removeClass('sel');
		});
		$g(".tab-4-content").find(thumbParam+' li').eq(thisIndex).find('a').addClass('sel');
		
		$g(".photoGalleryInTabs").find(thumbParam+' li').each(function(){
			$g(this).find('a').removeClass('sel');
		});
		$g(".photoGalleryInTabs").find(thumbParam+' li').eq(thisIndex).find('a').addClass('sel');
		
		$g(".lyteboxGallery").find(thumbParam+' li').eq(thisIndex).find('a').addClass('sel');
		if(imgCounter>1 && imgCounter<$g(this).parent("li").parent("ul").children("li").length)
		{
			$g(contentParam+' .next').show();
			$g(contentParam+' .prev').show();
		}
		else if(imgCounter==$g(this).parent("li").parent("ul").children("li").length)
		{
			$g(contentParam+' .next').hide();
			$g(contentParam+' .prev').show();
		}
		else if(imgCounter==1)
		{
			$g(contentParam+' .next').show();
			$g(contentParam+' .prev').hide();
		}
		
		imgLarge1 = $g(thumbParam+' li a.sel').find('img').attr('src');
		imgLarge2 = imgLarge1.replace("thumb","large");
		$g(largeParam+' img').attr('src',imgLarge2); 
		imgText = $g(this).attr('rel');
		$g(contentParam+' p').html(imgText);
	});
}

function photoGalNextPrev_new(param){
	
	var thumbParam=".photoGalThumb";
	var largeParam=".photoGalLarge";
	var contentParam=".photoGalCont";
	
	if($g('.photoGalThumb').length)
	{
		thumbParam=thumbParam;
		largeParam=largeParam;
		contentParam=contentParam;
	}
	else if($g('.photoGalThumb_new').length)
	{
		thumbParam=thumbParam+"_new";
		largeParam=largeParam+"_new";
		contentParam=contentParam+"_new";
	}
	if(param=="next")
	{
		if(imgCounter<=$g(thumbParam+' li').length)
		{
			imgCounter+=1;
			$g(thumbParam+' li').find('a.sel').removeClass('sel').parent().next().children().addClass('sel');
			var imgLarge1 = $g(thumbParam+' li a.sel').find('img').attr('src');
			var imgLarge2 = imgLarge1.replace("thumb","large");
			$g(largeParam+' img').attr('src',imgLarge2);
			
			var imgText = $g(thumbParam+' li').find('.sel').attr('rel');
			$g(contentParam+' p').html(imgText);
			if(imgCounter==$g(".lyteboxGallery").find(thumbParam+' li').length || imgCounter==$g(".tab-4-content").find(thumbParam+' li').length || imgCounter==$g(".photoGalleryInTabs").find(thumbParam+' li').length)
			{
				$g(contentParam+' .next').hide();
				$g(contentParam+' .prev').show();
			}
			else if(imgCounter>1)
			{
				$g(contentParam+' .next').show();
				$g(contentParam+' .prev').show();				
			}			
		}
	}
	else if(param=="prev")
	{
		if(imgCounter>1)
		{
			imgCounter-=1;
			$g(thumbParam+' li').find('a.sel').removeClass('sel').parent().prev().children().addClass('sel');
			imgLarge1 = $g(thumbParam+' li a.sel').find('img').attr('src');
			imgLarge2 = imgLarge1.replace("thumb","large");
			$g(largeParam+' img').attr('src',imgLarge2);
			
			var imgText = $g(thumbParam+' li').find('.sel').attr('rel');
			$g(contentParam+' p').html(imgText);
			
			if(imgCounter==1)
			{
				$g(contentParam+' .next').show();
				$g(contentParam+' .prev').hide();
			}
			else
			{
				$g(contentParam+' .next').show();
				$g(contentParam+' .prev').show();
			}
		}
	}
}

/*  simpleTabOpen function */	
function simpleTabOpen(obj,mainParent,Attr){
	obj = $g(obj);
	if($g(obj).parents(".tabsContentContainer").prev(".tabsContainer").parent().parent().hasClass("sportCont"))
	{
		$g(obj).parent().parent().parent().find(".tabCont").hide();
	}
	else
	{
		obj.closest(mainParent).find(".tabCont").hide();
	}
	$g("." + obj.attr(Attr) + " " ).show();
	$g('html, body').animate({
				scrollTop: obj.offset().top - 60
			}, 500);
}
function mycarousel_initCallback(carousel)//This function is only used for Auto-Scrolling... It is not needed when auto-scrolling is switched off... 
{

//Disable autoscrolling if the user clicks the prev or next button.
carousel.buttonNext.bind('click', function() {
	carousel.startAuto(0);
});

carousel.buttonPrev.bind('click', function() {
	carousel.startAuto(0);
});

//Pause autoscrolling if the user moves with the cursor over the clip.
carousel.clip.hover(function() {
	carousel.stopAuto();
}, function() {
	carousel.startAuto();
});
};


$g(document).ready(function(){
	
/*
 * Calculate Package Price starts
 */
	$g(".holidayBookOnline").click(function(){
			holidayChangeTab(4);
			pricingTab(4);
			$g("html,body").animate({
				scrollTop:$g(this).offset().top
			},500);								
		});
/*
 * ends
 */

$g(".helpbtn, #newThemeList p").click(function(){
	if(!($g(this).next(".helpus_booking").is(":visible"))){
		$g(".helpus_booking").slideUp();
		$g(this).addClass('active').next(".helpus_booking").slideDown();
		$g(this).addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+25+"px"});
		$g('html, body').animate({
			scrollTop: $g(this).next(".helpus_booking").offset().top -40
		}, 500);
	}
	$g(".close").click(function(){								
		$g(this).parents(".helpus_booking").slideUp()
		$g(this).parents(".helpus_booking").prev().removeClass('active');
	});
	
	var elemHeight = $g(this).parent().parent().height()-(200);

	if($g('iframe', window.parent.document).length)
	{
		var iframeHeight = $g('iframe', window.parent.document).height();
		$g('iframe', window.parent.document).height(iframeHeight-elemHeight);
	}
});
	
/** package details need help for send queries **/
$g(".holidaySendQuery").click(function(){
		
		if(!($g(".holidaySendQuery").next(".helpus_booking").is(":visible"))){
			$g(".helpus_booking").slideUp();
			$g(".holidaySendQuery").addClass('active').next(".helpus_booking").slideDown();
			$g(".holidaySendQuery").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+25+"px"});
			$g('html, body').animate({
				scrollTop: $g(".holidaySendQuery").next(".helpus_booking").offset().top -40
			}, 500);
		}
		$g(".close").click(function(){	
			 $g(".close").parents(".helpus_booking").slideUp()
			$g(".holidaySendQuery").next(".helpus_booking").prev().removeClass('active');
			});	
	});
	
	$g(".pck_dates").click(function(){
	$g(this).toggleClass('active').parent().next(".pck_datepicker").toggle()
	$g('html, body').animate({
				scrollTop: $g(this).parent().next(".pck_datepicker").offset().top -40
			}, 500);
	});
	
	//Accommodation Type
	$g(".accType a").click(function(){
		$g(".child_details_popup").not($g(this).next()).slideUp();
		$g(this).next().slideDown(); 
		$g(".totalprice_popup").slideUp();
  }); 
	
/** CHILDREN DETAIL POPUP STARTS **/

  $g(".child_details a ").live('click', function () {
	  $g('.child_details').css("position","relative");
		$g('.childDetailsContainer').not($g(this).next('.childDetailsContainer')).slideUp();
		$g(this).next('.childDetailsContainer').slideDown();
 	});
  	
	 
/** CHILDREN DETAIL POPUP ENDS **/
     
	
  $g(".number_rooms_off p").click(function(){ 
		$g(this).toggleClass('selected');
		$g(".add_on_tours_off p, .faq_tours p, .booking_rooms p, .ticket_rooms p").removeClass('selected');
		$g(this).parent().siblings('.Outer_roomsdetails_off').slideToggle(); 
		$g(".ticket_roomsdetails, .faq_roomsdetails, .outer_addtours_off, .booking_roomsdetails").slideUp();
	});
	
	$g(".add_on_tours_off p").click(function(){ 
		$g(this).toggleClass('selected');
		$g(".number_rooms_off p, .faq_tours p, .booking_rooms p, .ticket_rooms p").removeClass('selected');
		$g(this).parent().siblings('.outer_addtours_off').slideToggle();
		$g(".ticket_roomsdetails, .Outer_roomsdetails_off, .faq_roomsdetails, .booking_roomsdetails").slideUp();
	}); 
	
		
	$g(".off p").click(function(){
		$g(this).toggleClass('selected');
		
		if(!$g(this).parent().next(".offout").is(":animated")){
		
		if($g(this).parent().next(".offout").css("display")=='none')
		{
			
			if($g('iframe', window.parent.document).length)
			{
			$g(this).parent().next(".offout").css("display","block");
			var elemHeight = $g(this).parent().next(".offout").height();
			$g(this).parent().next(".offout").css("display","block");
			var iframeHeight = $g('iframe', window.parent.document).height();
			$g('iframe', window.parent.document).height(iframeHeight+elemHeight);
			}
			$g(this).parent().siblings('.offout').slideToggle();
		}		 
		else
		{

			var elemHeight = $g(this).parent().next(".offout").height();
			$g(this).parent().siblings('.offout').slideToggle();
			if($g('iframe', window.parent.document).length)
			{
				
			var iframeHeight = $g('iframe', window.parent.document).height();
			$g('iframe', window.parent.document).height(iframeHeight-elemHeight);
			}
		}
		}
		 
	});
	
/*****************************Common JS For All Pages START **************************/
	$g("#tab4.addmid li").click(function()
	{		
		var index = $g(this).index();		
		$g("#cont4 .addcon").eq(index).fadeIn().siblings("#cont4 .addcon").hide();
		$g(this).addClass("active").siblings().removeClass("active");		
	}).eq(0).click();
	
	
	$g(".confhead2").click(function(){
	$g(this).next().slideToggle().siblings(".confbook").slideUp();//this is for sliding
	$g(this).toggleClass("active");
	$g(this).siblings(".confhead2").removeClass("active"); //this is for slidding arrow
	});

/*****************************Common JS For All Pages END ***************************/

	$g(".close_new").click(function(){								
		// $g(this).parents(".helpus_booking").slideUp()
		$g('#iLyteboxWrapper, #iLytebox, .buy_popup, .branch, .currency, .we_will_call_you, .Schedule, .terms_rail, .need_help, .holidayLight, .hotelsLight, .flightLight, .rail_reg').hide();
		$g(this).parents(".helpus_booking").prev().removeClass('active');
	});  
	
	$g(".cont_btn").click(function(){								
		// $g(this).parents(".helpus_booking").slideUp()
		$g('#iLyteboxWrapper, .rail_reg').hide();
	}); 
	
	
});   /*End of Document Ready*/


function num_rooms(selectStyle)
{
	clearPrice();		
	var noOfRooms=document.getElementById("noOfRooms").value;	
	document.getElementById("roomsNotAvail").innerHTML="";
	var str="";
	var region=document.getElementById("region").value;
	var index=noOfRooms;
	for(var i=0;i<noOfRooms;i++)
	{
		str+="<div class='inner_roomdetails inner_roomdetails_N'> <div class='room1_details'> <strong>Room <span class='rNo'>"+(i+1)+"</span> </strong> </div> <br/><br/>  <div class='adult'><span>Adults (12 + yrs)</span><span>Children (2 - 12 yrs)</span><span>Infants (<2 yrs)</span></div>";
		/*else
			str+="<div class='inner_roomdetails inner_roomdetails_N'> <div class='room1_details'> <strong>Room <span class='rNo'>"+(i+1)+"</span> </strong> </div>  <br/><br/> <div class='adult'><span>Adults (12 + yrs)</span><span>Children (2 - 12 yrs)</span><span>Infants (<2 yrs)</span></div>";*/
		if(pkgtype=='0')
			str+="<div class='room_selectbg'> <select name='numberofadults' class='customselectbox' id='adult"+i+"' onchange='clearPrice();childBoxSlide("+i+",\"adult\");' style='visibility:hidden;'> <option value='1'>1</option> <option value='2' selected='selected'>2</option> <option value='3'>3</option> </select> </div>";
		else
			str+="<div class='room_selectbg'> <select name='numberofadults' class='customselectbox' id='adult"+i+"' onchange='clearPrice();childBoxSlide("+i+",\"adult\");' style='visibility:hidden;'> <option value='1'>1</option> <option value='2' selected='selected'>2</option> <option value='3'>3</option> <option value='4'>4</option> </select> </div>";
		
		str+="<div class='children'></div> <div class='room_selectbg' id='childSelect"+i+"'> <select name='numberofchilds' class='customselectbox num_child' id='child"+i+"' onchange='generateChild("+i+")'  style='visibility:hidden;'> <option value='0'>0</option> <option value='1'>1</option> <option value='2'>2</option> </select> </div>";
		str+="<div class='child_details childdet"+i+"' style='z-index:"+index+";display:none;' id='childmain"+i+"'> <a id='detChildrenText"+i+"' href='javascript:void(0);'>Children details</a>";
		str+="<div class='child_details_popup child_details_popup_N childDetailsContainer'>";
		str+="<div class='child_details_popuptop'> </div>";
		str+="<div class='child_details_popupmid'> <a href='javascript:void(0);' class='close'> <img src='/tcportal/images/holiAbroad/images/rndclose_btn_small.gif' alt='Close' width='21' height='20' /> </a>";
		if(pkgSubType=='GIT')
	    {
			if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
				str+="";
			else
				str+="We recommend extra bed for child above <br/>5 years of age <br/>";
	    }
		else
			str+="We recommend extra bed for child above <br/>5 years of age <br/>";
		if(pkgtype=='0' && pkgSubType=='FIT')
			str+="<div class='child_bed_required' id='childstr"+i+"1' style='padding-top:5px'> <div class='child'>Child 1</div> <div class='room_selectbg'> <select name='age' class='customselectbox' id='age"+i+"1' onchange='showBed(this.value,\""+i+"1\");clearPrice();' style='visibility:hidden;'> <option value='Age'>Age</option> <option value='2yrs'>2yrs</option> <option value='3yrs'>3yrs</option> <option value='4yrs'>4yrs</option> <option value='5yrs'>5yrs</option> <option value='6yrs'>6yrs</option> <option value='7yrs'>7yrs</option> <option value='8yrs'>8yrs</option> <option value='9yrs'>9yrs</option> <option value='10yrs'>10yrs</option> <option value='11yrs'>11yrs</option> <option value='12yrs'>12yrs</option> </select> </div>";
		else
			str+="<div class='child_bed_required' id='childstr"+i+"1' style='padding-top:5px'> <div class='child'>Child 1</div> <div class='room_selectbg'> <select name='age' class='customselectbox' id='age"+i+"1' onchange='clearPrice();' style='visibility:hidden;'> <option value='Age'>Age</option> <option value='2yrs'>2yrs</option> <option value='3yrs'>3yrs</option> <option value='4yrs'>4yrs</option> <option value='5yrs'>5yrs</option> <option value='6yrs'>6yrs</option> <option value='7yrs'>7yrs</option> <option value='8yrs'>8yrs</option> <option value='9yrs'>9yrs</option> <option value='10yrs'>10yrs</option> <option value='11yrs'>11yrs</option> <option value='12yrs'>12yrs</option> </select> </div>";
		//To hide bed option for africa and america
		if(pkgSubType=='GIT')
	    {
			if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
				str+="<input name='bedoption' type='checkbox' value='' id='bedOption"+i+"1' /> <label id='bedText"+i+"1' onclick='clearPrice();' style='display:none'>Bed required</label> </div> <div class='clear'> </div>";
			else
				str+="<input name='bedoption' type='checkbox' value='' id='bedOption"+i+"1' /> <label id='bedText"+i+"1' onclick='clearPrice();'>Bed required</label> </div> <div class='clear'> </div>";
	    }
		else
		{
			if(pkgtype=='0')
				str+="<span id='bed"+i+"1' style='font-weight:bold;font-size:1.2em;display:none;margin-top: 5px;padding-left: 130px !important;'> </span> <input name='bedoption' type='checkbox' value='' id='bedOption"+i+"1' /> <label id='bedText"+i+"1' onclick='clearPrice();' style='display:none;'>Bed required</label> </div> <div class='clear'> </div>";
			else
				str+="<span id='bed"+i+"1' style='font-weight:bold;font-size:1.2em;display:none;margin-top: 5px;padding-left: 130px !important;'> </span> <input name='bedoption' type='checkbox' value='' id='bedOption"+i+"1' /> <label id='bedText"+i+"1' onclick='clearPrice();'>Bed required</label> </div> <div class='clear'> </div>";
		}
		if(pkgtype=='0' && pkgSubType=='FIT')
			str+="<div class='child_bed_required' id='childstr"+i+"2' style='padding-top:5px'> <div class='child'>Child 2</div> <div class='room_selectbg'> <select name='age' class='customselectbox' id='age"+i+"2' onchange='showBed(this.value,\""+i+"2\");clearPrice();' style='visibility:hidden;'> <option value='Age'>Age</option> <option value='2yrs'>2yrs</option> <option value='3yrs'>3yrs</option> <option value='4yrs'>4yrs</option> <option value='5yrs'>5yrs</option> <option value='6yrs'>6yrs</option> <option value='7yrs'>7yrs</option> <option value='8yrs'>8yrs</option> <option value='9yrs'>9yrs</option> <option value='10yrs'>10yrs</option> <option value='11yrs'>11yrs</option> <option value='12yrs'>12yrs</option> </select> </div>";
		else
			str+="<div class='child_bed_required' id='childstr"+i+"2' style='padding-top:5px'> <div class='child'>Child 2</div> <div class='room_selectbg'> <select name='age' class='customselectbox' id='age"+i+"2' onchange='clearPrice();' style='visibility:hidden;'> <option value='Age'>Age</option> <option value='2yrs'>2yrs</option> <option value='3yrs'>3yrs</option> <option value='4yrs'>4yrs</option> <option value='5yrs'>5yrs</option> <option value='6yrs'>6yrs</option> <option value='7yrs'>7yrs</option> <option value='8yrs'>8yrs</option> <option value='9yrs'>9yrs</option> <option value='10yrs'>10yrs</option> <option value='11yrs'>11yrs</option> <option value='12yrs'>12yrs</option> </select> </div>";
		//To hide bed option for africa and america
		if(pkgSubType=='GIT')
	    {
			if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
				str+="<input name='bedoption' type='checkbox' value='' id='bedOption"+i+"2' /> <label id='bedText"+i+"2' onclick='clearPrice();' style='display:none'>Bed required</label> </div>";
			else
				str+="<input name='bedoption' type='checkbox' value='' id='bedOption"+i+"2' /> <label id='bedText"+i+"2' onclick='clearPrice();'>Bed required</label> </div>";
	    }
		else
		{
			if(pkgtype=='0')
				str+="<span id='bed"+i+"2' style='font-weight:bold;font-size:1.2em;display:none;margin-top: 5px;padding-left: 130px !important;'> </span> <input name='bedoption' type='checkbox' value='' id='bedOption"+i+"2' /> <label id='bedText"+i+"2' onclick='clearPrice();' style='display:none;'>Bed required</label> </div>";
			else
				str+="<span id='bed"+i+"2' style='font-weight:bold;font-size:1.2em;display:none;margin-top: 5px;padding-left: 130px !important;'> </span> <input name='bedoption' type='checkbox' value='' id='bedOption"+i+"2' /> <label id='bedText"+i+"2' onclick='clearPrice();'>Bed required</label> </div>";
		}
		str+="</div> <div class='child_details_popupbtm'> </div> </div> </div>";
		str+="<div class='infants'></div> <div class='room_selectbg'> <select name='numberofinfants' class='customselectbox' id='infant"+i+"' onchange='clearPrice();childBoxSlide("+i+",\"infant\");' style='visibility:hidden;'> <option value='0'>0</option> <option value='1'>1</option> <option value='2'>2</option> </select> </div> </div>";
		index--;
	}
	$g("#rooms").html(str);
	
	
	if(selectStyle==2)
	{
		$g(".Outer_roomsdetails .inner_roomdetails .customselectbox").sSelect();
	}
	$g('input:checkbox').stylecheck();
}


function generateChild(i)
{
	$g('.child_details').css("position","relative");
	$g('.childDetailsContainer').not($g(".childdet"+i+" a").next('.childDetailsContainer')).slideUp();
	$g(".childdet"+i+" a").next('.childDetailsContainer').slideDown();
	clearPrice();
	var chld=document.getElementById("child"+i).value;
	var adult=document.getElementById("adult"+i).value;
	if(parseInt(chld)==0)
	{
		document.getElementById("childmain"+i).style.display='none';
	}
	else if(parseInt(chld)>0)
	{
		document.getElementById("childmain"+i).style.display='block';
		$g("#detChildrenText"+i).hide();
		if(parseInt(chld)==1)	
		{
			document.getElementById("childstr"+i+"2").style.display='none';
			if(pkgtype=='1' && pkgSubType=='FIT')
			{
				if(parseInt(adult)==3)
				{
					document.getElementById("bedText"+i+"1").style.display='none';
					document.getElementById("bed"+i+"1").innerHTML='No Bed';
					document.getElementById("bed"+i+"1").style.display='block';
				}
				else
				{
					document.getElementById("bedText"+i+"1").style.display='block';
					document.getElementById("bed"+i+"1").innerHTML='';
					document.getElementById("bed"+i+"1").style.display='none';
				}
				document.getElementById("bedText"+i+"2").style.display='block';
				document.getElementById("bed"+i+"2").innerHTML='';
				document.getElementById("bed"+i+"2").style.display='none';
			}
		}
		else
		{
			if(pkgtype=='1' && pkgSubType=='FIT')
			{
				if(parseInt(adult)==2)
				{
					document.getElementById("bedText"+i+"2").style.display='none';
					document.getElementById("bed"+i+"2").innerHTML='No Bed';
					document.getElementById("bed"+i+"2").style.display='block';
				}
				else
				{
					document.getElementById("bedText"+i+"2").style.display='block';
					document.getElementById("bed"+i+"2").innerHTML='';
					document.getElementById("bed"+i+"2").style.display='none';
				}
				document.getElementById("bedText"+i+"1").style.display='block';
				document.getElementById("bed"+i+"1").innerHTML='';
				document.getElementById("bed"+i+"1").style.display='none';
			}
			document.getElementById("childstr"+i+"2").style.display='block';
		}
	}
}
function scrollDown()
{
	$g("html,body").animate({
			scrollTop: $g("#calculateButton").offset().top
		},1000);
}

function validatePricingAndDeparture(){
	//$g("#calculateButton").hide();
	if(!validateAllFields())
	    return false;
	var departDate=document.getElementById("departDate").value;
		if(departDate==null || departDate=="")
	 	{
	 	    alert("Please select a departure date");
	 	    return false;
	    }
	 	else{
	 		//call();
	 		scrollDown();
	 	}
}

function call()
{
	$g("#calculateButton").hide();
	
	
	pricing='';
	var bookingAmt="";
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("BOOKING_AMT")[0].firstChild!=null)
	{
		bookingAmt=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("BOOKING_AMT")[0].firstChild.nodeValue;
	}
	var childAdvPrice="",adultPayablePer="",childPayablePer="";
	if(pkgDetails.getElementsByTagName("CHILD_PRICE")[0].firstChild!=null)
	{
		childAdvPrice=pkgDetails.getElementsByTagName("CHILD_PRICE")[0].firstChild.nodeValue;
	}
	if(pkgDetails.getElementsByTagName("ADULT_PAYABLE_PER")[0].firstChild!=null)
	{
		adultPayablePer=pkgDetails.getElementsByTagName("ADULT_PAYABLE_PER")[0].firstChild.nodeValue;
	}
	if(pkgDetails.getElementsByTagName("CHILD_PAYABLE_PER")[0].firstChild!=null)
	{
		childPayablePer=pkgDetails.getElementsByTagName("CHILD_PAYABLE_PER")[0].firstChild.nodeValue;
	}
	var cnb_slab=0,jc=0;
	var accomType=new Array();
	accomType=priceData.split(",");
	
	var sr=accomType[0];
	var dr=accomType[1];
	var tr=accomType[2];
	var qr=accomType[3];
	var cwb=accomType[4];
	var cnb=accomType[5];
	var infantPrice=accomType[6];
	
	if(pkgSubType=='FIT')
		cnb_slab = accomType[10];
	
	if(pkgtype=='0' && pkgSubType=='GIT')
		jc = accomType[11];
	
	var fitservicetax=accomType[7];
	var inventryCount=0;
	var noOfAdults=0;
	var noOfChildren=0;
	var roomsPricingMsg="The rooming option you selected is unavailable. We are showing you the price of ";
	var pricingMsgData="";
	var exRate=0.0;
	var price=0;
	var advPayable=0;
	var balPayable=0;
	var discountArray=new Array();
	var disSr=0,disDr=0,disTr=0,disQr=0,disCwb=0,disCnb=0,disInfant=0,disCur=0;
	var rooming="";
	var packageType=pkgSubType;
	var region=document.getElementById("region").value;
	var discountPriceValue=0;
	//setTotalTax=fitservicetax;
	if(packageType=='GIT')
	{
		inventryCount=parseInt(accomType[8]);
		if(discountPrice!='')
		{
			discountArray=discountPrice.split("|");
			//discountPriceValue = getGitDiscount(discountPrice);
			discountPriceValue = discountPrice;
		}
	}	
	else
	{
		if(discountPrice!='')
		{
			discountArray=discountPrice.split(",");
			disSr=discountArray[0];
			disDr=discountArray[1];
			disTr=discountArray[2];
			disQr=discountArray[3];
			disCwb=discountArray[4];
			disCnb=discountArray[5];
			disInfant=discountArray[6];
			disCur=discountArray[7];
			exRate=discountArray[8];
		}
	}
		var noOfRooms=document.getElementById("noOfRooms").value;	
		if(priceData!='')
		{
			if(discountPrice=='')
			{		
				disSr=0;
				disDr=0;
				disTr=0;
				disQr=0;
				disCwb=0;
				disCnb=0;
				disCwb=0
				disInfant=0;
				disJc=0;
				disCur='';
			}
			var srcount=0,drcount=0,trcount=0,qrcount=0,cwbcount=0,cnbcount=0,adultCount=0,infantCount=0,childCount=0,tscount=0,domChildCount=0,cnbslabcount=0,jcCount=0; 
			var totalPax = 0;
			for(var i=0;i<noOfRooms;i++)
			{
				var adult=document.getElementById("adult"+i).value;		
				var child=document.getElementById("child"+i).value;
				var infant=parseInt(document.getElementById("infant"+i).value);
				adultCount+=parseInt(adult);
				childCount+=parseInt(child);
				infantCount+=infant;
				if(pkgtype=='0')
				{
					totalPax = adultCount + domChildCount;
				}
				else
				{
					totalPax = adultCount+childCount+infantCount;
				}
			}
			
			for(var i=0;i<noOfRooms;i++)
			{
				var adult=document.getElementById("adult"+i).value;		
				var child=document.getElementById("child"+i).value;
				var infant=parseInt(document.getElementById("infant"+i).value);
				//adultCount+=parseInt(adult);
				//childCount+=parseInt(child);
				
				
				bed1=document.getElementById("bedOption"+i+"1").checked;
	   			bed2=document.getElementById("bedOption"+i+"2").checked;
				var age1=document.getElementById("age"+i+"1").value;			
				var age2=document.getElementById("age"+i+"2").value;
				var cnb1Flag =false,cnb2Flag=false;
				if(child=='1')
				{
					if(age1=='Age')
					{
						alert("Please select age for Room "+(i+1)+" child 1");
						return false;
					}
					/** count child only if >5 for domestic start **/
					
					//if(pkgtype=='0')
					//{
						if(!(parseInt(age1.charAt(0))>=2 && parseInt(age1.charAt(0))<=4))
						{
							domChildCount=domChildCount+1;
						}
						else
						{
							cnb1Flag=true;
						}
					//}
					/** count child only if >5 for domestic end **/
				}
				else if(child=='2')
				{
					if(age1=='Age')
					{
						alert("Please select age for Room "+(i+1)+" child 1");
						return false;
					}
					else if(age2=='Age')
					{
						alert("Please select age for Room "+(i+1)+" child 2");
						return false;
					}
					/** count child only if >5 for domestic start **/
					
					//if(pkgtype=='0')
					//{
						if(!(parseInt(age1.charAt(0))>=2 && parseInt(age1.charAt(0))<=4))
						{
							domChildCount=domChildCount+1;
						}
						else
						{
							cnb1Flag=true;
						}
							
						if(!(parseInt(age2.charAt(0))>=2 && parseInt(age2.charAt(0))<=4))
						{
							domChildCount=domChildCount+1;
						}
						else
							cnb2Flag=true;
					//}
					/** count child only if >5 for domestic end **/
				}
				
				
				if(parseInt(infant)>parseInt(adult))
				{
					alert("The selected rooming option is not available for room "+(i+1));
					return false;
				}
				if(adult=='1')
				{
					if(child=='1')
					{
						drcount=drcount+1;
						if(pkgtype=='0')
						{
							pricingMsgData+="a Twin share room for Room "+(i+1)+", ";
						}
					}	
					else if(child=='2')
					{
					    if(bed1==true && bed2==true)	
						{
							if(pkgtype=='0')
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								pricingMsgData+="a Twin share room + Child with bed for Room "+(i+1)+", ";
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 1 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
								}
							}
						}	
						else if(bed1==false && bed2==false)
						{
							if(pkgtype=='0')
							{
								drcount=drcount+1;
								if(packageType=='FIT')
								{
									if(cnb2Flag)
										cnbslabcount=cnbslabcount+1;
									else	
										cnbcount=cnbcount+1;
								}
								else //for domestic GIT Junior child 2-5 yrs
								{
									if(cnb2Flag)
										jcCount=jcCount+1;
									else	
										cnbcount=cnbcount+1;
								}
								pricingMsgData+="a Twin share room + 1 Child without bed for Room "+(i+1)+", ";
							}
							else
							{
								drcount=drcount+1;
								if(cnb2Flag && packageType=='FIT') // for fit child 2-5 yrs
									cnbslabcount=cnbslabcount+1;
								else	
									cnbcount=cnbcount+1;
							}
						}
						else if(bed1==true && bed2==false)
						{
							drcount=drcount+1;
							if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
							{
								if(cnb2Flag)
									jcCount=jcCount+1;
								else	
									cnbcount=cnbcount+1;
							}
							else
							{
								if(cnb2Flag && packageType=='FIT') // for fit child 2-5 yrs
									cnbslabcount=cnbslabcount+1;
								else	
									cnbcount=cnbcount+1;
							}
						}	
						else if(bed1==false && bed2==true)
						{
							drcount=drcount+1;
							if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
							{
								if(cnb2Flag)
									jcCount=jcCount+1;
								else	
									cnbcount=cnbcount+1;
							}
							else
							{
								if(cnb2Flag && packageType=='FIT') // for fit child 2-5 yrs
									cnbslabcount=cnbslabcount+1;
								else	
									cnbcount=cnbcount+1;
							}
						}						
					}	
					else
					{
						srcount=srcount+1;
					}
					//infantCount+=infant;
					
				}
				else if(adult=='2')
				{
					if(child=='1')
					{
						if(bed1==true)
						{
							if(pkgtype=='0')
							{	
								drcount=drcount+1;
								cwbcount=cwbcount+1;
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 1 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
								}
							}
						}
						else
						{
							drcount=drcount+1;
							
							if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
							{
								if(cnb1Flag)
								{
									jcCount=jcCount+1;
								}
								else
									cnbcount=cnbcount+1;
							}
							else
							{
								if(cnb1Flag && packageType=='FIT') //for fit child 2-5 yrs
								{
									cnbslabcount=cnbslabcount+1;
								}
								else
									cnbcount=cnbcount+1;
							}
						}
						
					}
					else if(child=='2')
					{
						if(bed1==true && bed2==true)
						{	
							if(pkgtype=='0')
							{
								/*trcount=trcount+1;
								cnbcount=cnbcount+1;
								pricingMsgData+="a Triple share room + 1 Child without bed for Room "+(i+1)+", ";*/
								alert("The selected rooming option is not available for room "+(i+1));
								return false;
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 2 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
										cnbcount=cnbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
									if(cnb2Flag)
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
							}
						}
						else if(bed1==false && bed2==false)
						{
							if(pkgtype=='0')
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
								{
									if(cnb2Flag)
										jcCount=jcCount+1;
									else
										cnbcount=cnbcount+1;
								}
								else
								{
									if(cnb2Flag) // for fit child 2-5 yrs
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
								pricingMsgData+="a Twin share Room + 1 Child with bed + Child without bed for Room "+(i+1)+", ";
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 2 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
										cnbcount=cnbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
									if(cnb2Flag)
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
							}
						}
						else if(bed1==true && bed2==false)
						{
							if(pkgtype=='0')
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								
								if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
								{
									if(cnb2Flag)
										jcCount=jcCount+1;
									else
										cnbcount=cnbcount+1;
								}
								else
								{
									if(cnb2Flag) // for fit child 2-5 yrs
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
								//pricingMsgData+="a Twin share room + 1 Child with bed + Child without bed for Room "+(i+1)+", ";
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 2 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
										cnbcount=cnbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
									if(cnb2Flag)
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
							}
						}	
						else if(bed1==false && bed2==true)
						{
							if(pkgtype=='0')
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
								{
									if(cnb1Flag)
										jcCount=jcCount+1;
									else
										cnbcount=cnbcount+1;
								}
								else
								{
									if(cnb1Flag) // for fit child 2-5 yrs
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
								//pricingMsgData+="a Twin share room + 1 Child with bed + Child without bed for Room "+(i+1)+", ";
							}
							else
							{
								if(packageType=='GIT')
								{
									if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
									{
										drcount=drcount+1;
										cnbcount=cnbcount+1;
										cnbcount=cnbcount+1;
										pricingMsgData+="a Double Room and 2 CNB (child without bed) for Room "+(i+1)+", ";
									}
									else
									{
										drcount=drcount+1;
										cwbcount=cwbcount+1;
										cnbcount=cnbcount+1;
									}
								}
								else
								{
									drcount=drcount+1;
									cwbcount=cwbcount+1;
									if(cnb1Flag)
										cnbslabcount=cnbslabcount+1;
									else
										cnbcount=cnbcount+1;
								}
							}
						}
					}
					else
					{
						drcount=drcount+1;
					}
					//infantCount+=infant;
				}   
				else if(adult=='3')
				{
					if(child=='1')
					{
						if(bed1==true)
						{
							if(pkgtype=='0')
							{
								/*trcount=trcount+1;
								cnbcount=cnbcount+1;
								pricingMsgData+="a Triple share room + 1 Child without bed for Room "+(i+1)+", ";*/
								alert("The selected rooming option is not available for room "+(i+1));
								return false;
							}
							else
							{
								trcount=trcount+1;
								if(cnb1Flag && packageType=='FIT')
									cnbslabcount=cnbslabcount+1;
								else
									cnbcount=cnbcount+1;
								pricingMsgData+="a Triple Room and 1 CNB (child without bed) for Room "+(i+1)+", ";
							}
						}
						else
						{
							trcount=trcount+1;
							if(pkgtype=='0' && packageType=='GIT')
							{
								if(cnb1Flag)
									jcCount=jcCount+1;
								else
									cnbcount=cnbcount+1;
							}
							else
							{
								if(cnb1Flag && packageType=='FIT')
									cnbslabcount=cnbslabcount+1;
								else
									cnbcount=cnbcount+1;
							}
						}
					}
					else
					{
						trcount=trcount+1;
					}
				//	infantCount+=infant;
				}
				else if(adult=='4')
				{
					/*if(pkgtype=='0')
					{
						qrcount=qrcount+1;
					}
					else*/
					if(pkgtype=='1')
					{
						drcount=drcount+2;
						pricingMsgData+="two Double Rooms for Room "+(i+1)+", ";
					}
				//	infantCount+=infant;
				}
				var passengerCount=parseInt(adult)+parseInt(child)+parseInt(infant);
				
				if(passengerCount>4)
				{
					alert("Only 4 people are allowed per room. Kindly select again");
					return false;
				}
				var data = accmData.split("|");
				/*var totalPax = 0;
				if(pkgtype=='0')
				{
					totalPax = adultCount + domChildCount;
				}
				else
				{
					totalPax = adultCount+childCount+infantCount;
				}*/
				for(var j=0;j<data.length;j++)
				{
					var price=new Array();
					price=data[j].split(",");
					if(pkgSubType=='FIT' && parseInt(price[11])>0 && totalPax>=price[11] && totalPax<=price[12])
					{
						if(parseInt(price[10])>0)
							price[2] = price[10]; //when Twin sharing is present then use Twin sharing price otherwise use double room price
						sr=parseInt(price[1]);
						dr=parseInt(price[2]);
						tr=parseInt(price[3]);
						qr=parseInt(price[4]);
						cwb=parseInt(price[5]);
						cnb=parseInt(price[6]);
						infantPrice=parseInt(price[7]);
						cnb_slab=parseInt(price[15]);
					}
					else if(pkgSubType=='FIT' && (price[13]>0 && totalPax>price[11] && price[11]==price[13]) || (price[16]>0 && totalPax<price[11] && price[11]==price[16]))
					{
						if(parseInt(price[10])>0)
							price[2] = price[10]; //when Twin sharing is present then use Twin sharing price otherwise use double room price
						sr=parseInt(price[1]);
						dr=parseInt(price[2]);
						tr=parseInt(price[3]);
						qr=parseInt(price[4]);
						cwb=parseInt(price[5]);
						cnb=parseInt(price[6]);
						infantPrice=parseInt(price[7]);
						cnb_slab=parseInt(price[15]);
					}
					else if((pkgSubType=='FIT' && parseInt(price[11])==0 && parseInt(price[12])==0) || pkgSubType=='GIT')//without slabwise FIT and All GIT
					{
						sr=accomType[0];
						dr=accomType[1];
						tr=accomType[2];
						qr=accomType[3];
						cwb=accomType[4];
						cnb=accomType[5];
						infantPrice=accomType[6];
						if(pkgtype=='0' && pkgSubType=='GIT')
						{
							jc=accomType[11];
						}
					}
				}
				
				if(srcount>0)
				{
					if(parseInt(sr)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(drcount>0)
				{
					if(parseInt(dr)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(trcount>0)
				{
					if(parseInt(tr)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(qrcount>0)
				{
					if(parseInt(qr)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(cnbcount>0)
				{
					if(parseInt(cnb)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(cwbcount>0)
				{
					if(parseInt(cwb)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(cnbslabcount>0)
				{
					if(parseInt(cnb_slab)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(infant>0)
				{
					if(parseInt(infantPrice)<0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				if(jcCount>0)
				{
					if(parseInt(jc)==0)
					{
						alert("The selected rooming option is not available for Room "+(i+1));
						return false;
					}
				}
				noOfAdults+=parseInt(adult);
				noOfChildren+=parseInt(child);
			}
			
			/** to block live booking from specified no of days before departure date starts **/
			var highlightFlag = false;
			var pricingString="";
			var departureDate= $g("#departDate").val();
		    var def=new Array();
		    def=departureDate.split("-");
		    var year=def[2];
		    var month=def[1];
		    var day=def[0];
		    var date=new Date(year,month-1,day);
		    var blk = blockDate.split(",");
		    var sDate =new Date(
		    	 date.getFullYear(), 
			     date.getMonth(), 
			     date.getDate() - parseInt(blk[blockDateIndex]),
			     date.getHours(),
			     date.getMinutes(),
			     date.getSeconds(),
			     date.getMilliseconds())
		    
		    if(sDate < new Date()) 
		    {
			   highlightFlag = true;
		    }
		    /** to block live booking from specified no of days before departure date ends **/
		    var totalPassengerCount=adultCount + childCount;
		    ishighlightFlag = highlightFlag;
		    istotalPassengerCount = totalPassengerCount;
		    isinventryCount = inventryCount;
		    
		    if(packageType=='GIT')
			{
				if(highlightFlag || totalPassengerCount>inventryCount)
				{
					$g("#continue").html("");
					if(highlightFlag)
						document.getElementById("roomsNotAvail").innerHTML='Please send us your query by clicking on the "Want us to call you" button below so that we may be able to help you confirm the booking on the departure date chosen by you.';
					else
						document.getElementById("roomsNotAvail").innerHTML="Please select a different rooming option since this option is currently unavailable with us";
					
					pricingString+='<div class="needhelp" style="z-index:5;float:right;text-align:right;">';
					var pkgName="",bookingTypeEach="";
					if(pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
					{
						pkgName=pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
					}
					if(pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild!=null)
					{
						bookingTypeEach=pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild.nodeValue;
					}
					$g(".saveAndContinueButton").hide();
					pricingString+='<a href="javascript:void(0);" class="SendQuery" onclick="SendQuery(\''+pkgtype+'\',\''+pkgid+'\',\''+pkgName+'\',\'4\',\''+pkgSubType+'\',\''+bookingTypeEach+'\');">';
					pricingString+="<br/><button class=\"HomeSearch sendQuerybtn\"  type=\"button\"  title=\"Want us to call you ?\" ><font color='ffffff'>Want us to call you? </font> </button> " ;
					pricingString+='</a>';
					pricingString+='<div class="helpus_booking" style="display:none;right:390px;text-align:left;" id="sendQuery1">';
					pricingString+='</div> <br /> </div>';
					$g("#continue").html(pricingString);
					$g(".SendQuery").click(function(){
						$g(".footerWrapper").css("z-index","-1");
						if(!($g(".SendQuery").next(".helpus_booking").is(":visible"))){
							
							$g(".helpus_booking").slideUp();
							$g(".SendQuery").addClass('active').next(".helpus_booking").slideDown();
							$g(".SendQuery").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+37+"px"});
							$g('html, body').animate({
								scrollTop: $g(".SendQuery").next(".helpus_booking").offset().top -40
							}, 500);
						}
						$g(".close").click(function(){	
							$g(".footerWrapper").css("z-index","0");
							 $g(".close").parents(".helpus_booking").slideUp()
							$g(".SendQuery").next(".helpus_booking").prev().removeClass('active');
							});	
					});
					$g("#continue").show();
					$g(".saveAndContinueButton").hide();
				}
				else
				{
					if(pricingMsgData!="")
					{
						pricingMsgData+=":";
						var pricingMsg=pricingMsgData.replace(", :","");
						document.getElementById("roomsNotAvail").innerHTML=roomsPricingMsg+pricingMsg;
					}
					$g("#continue").html("");
					//pricingString+='<a href="javascript:void(0);" style="display:none" class="price_cont" onclick="submitForm();">';
					//pricingString+='<img src="/tcportal/images/holiAbroad/images/contBtn.gif" alt="Continue" title="Continue" width="85" height="30" />';
					//pricingString+='</a>';
					//$g("#continue").html(pricingString);
					if(isBookable=='0'){
    					$g(".saveAndContinueButton").show(); 
    	            }
    	            else{
			 	          $g(".saveAndContinueButton").hide(); 
    	            }				
				}
			}
			else if(packageType=='FIT')
			{
				if(highlightFlag)
				{
					
					$g("#continue").html("");
					if(highlightFlag)
						document.getElementById("roomsNotAvail").innerHTML='Please send us your query by clicking on the "Want us to call you" button below so that we may be able to help you confirm the booking on the departure date chosen by you.';
					else
						document.getElementById("roomsNotAvail").innerHTML="Please select a different rooming option since this option is currently unavailable with us";
					
					pricingString+='<div class="needhelp" style="z-index:5;float:right;text-align:right;">';
					var pkgName="",bookingTypeEach="";
					if(pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
					{
						pkgName=pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
					}
					if(pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild!=null)
					{
						bookingTypeEach=pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild.nodeValue;
					}
					$g(".saveAndContinueButton").hide();
					pricingString+='<a href="javascript:void(0);" class="SendQuery" onclick="SendQuery(\''+pkgtype+'\',\''+pkgid+'\',\''+pkgName+'\',\'4\',\''+pkgSubType+'\',\''+bookingTypeEach+'\');">';
					pricingString+="<br/><button class=\"HomeSearch sendQuerybtn\"  type=\"button\"  title=\"Want us to call you ?\" ><font color='ffffff'>Want us to call you? </font> </button> " ;
					pricingString+='</a>';
					pricingString+='<div class="helpus_booking" style="display:none;right:390px;text-align:left;" id="sendQuery1">';
					pricingString+='</div> <br /> </div>';
					$g("#continue").html(pricingString);
					$g(".SendQuery").click(function(){
						$g(".footerWrapper").css("z-index","-1");
						if(!($g(".SendQuery").next(".helpus_booking").is(":visible"))){
							
							$g(".helpus_booking").slideUp();
							$g(".SendQuery").addClass('active').next(".helpus_booking").slideDown();
							$g(".SendQuery").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+37+"px"});
							$g('html, body').animate({
								scrollTop: $g(".SendQuery").next(".helpus_booking").offset().top -40
							}, 500);
						}
						$g(".close").click(function(){	
							$g(".footerWrapper").css("z-index","0");
							 $g(".close").parents(".helpus_booking").slideUp()
							$g(".SendQuery").next(".helpus_booking").prev().removeClass('active');
							});	
					});
					
					$g("#continue").show();
					$g(".saveAndContinueButton").hide();
				}
				else
				{
					if(pricingMsgData!="")
					{
						pricingMsgData+=":";
						var pricingMsg=pricingMsgData.replace(", :","");
						document.getElementById("roomsNotAvail").innerHTML=roomsPricingMsg+pricingMsg;
					}
					$g("#continue").html("");
					//pricingString+='<a href="javascript:void(0);" class="price_cont" onclick="submitForm();">';
					//pricingString+='<img src="/tcportal/images/holiAbroad/images/contBtn.gif" alt="Continue" title="Continue" width="85" height="30" />';
					//pricingString+='</a>';
					//$g("#continue").html(pricingString);
					if(isBookable=='0'){
						$g(".saveAndContinueButton").show(); 
    	            }
    	           	else{
			 	         $g(".saveAndContinueButton").hide(); 
    	           	}

				}
			}
			else
			{
				if(pricingMsgData!="")
				{
					pricingMsgData+=":";
					var pricingMsg=pricingMsgData.replace(", :","");
					document.getElementById("roomsNotAvail").innerHTML=roomsPricingMsg+pricingMsg;
				}
			}
		
			
			/**
			 * for price calculation
			 */
			
			
			/**
			 * for discount calculation
			 */
			var disSrAmt=0,disDrAmt=0,disTrAmt=0,disQrAmt=0,disCnbAmt=0,disCwbAmt=0,disInfAmt=0,disJcAmt=0;
			var adultAmt=0,childAmt=0,infantAmt=0;
			if(packageType=='GIT' && discountPriceValue!='')
			{
				var disPriceData =discountPriceValue.split(",");
				if(pkgtype=='1')
				{
					discount=disPriceData[4];
				}
				else
				{
					discount=disPriceData[0];
				}
				adultAmt = disPriceData[1];
				childAmt = disPriceData[2];
				infantAmt = disPriceData[3];
				/*discArray = gitDiscountArray.split(",");
				disSrAmt= discArray[0];
				disDrAmt= discArray[1];
				disTrAmt= discArray[2];
				disQrAmt= discArray[3];
				disCnbAmt= discArray[4];
				disCwbAmt= discArray[5];
				disInfAmt= discArray[6];
				disJcAmt= discArray[7];*/
			}
			else
			{
				if(discountPrice!='')
				{
					if(disCur=='THB' || disCur=='JPY')
					{	
						disSrAmt=srcount*1*(parseFloat(disSr)*(parseFloat(exRate)/100));
						disDrAmt=drcount*2*(parseFloat(disDr)*(parseFloat(exRate)/100));
						disTrAmt=trcount*3*(parseFloat(disTr)*(parseFloat(exRate)/100));
						disQrAmt=qrcount*4*(parseFloat(disQr)*(parseFloat(exRate)/100));
						disCnbAmt=cnbcount*1*(parseFloat(disCnb)*(parseFloat(exRate)/100));
						disCwbAmt=cwbcount*1*(parseFloat(disCwb)*(parseFloat(exRate)/100));
						disInfAmt=infantCount*1*(parseFloat(disInfant)*(parseFloat(exRate)/100));
						disJcAmt=jcCount*1*(parseFloat(disJc)*(parseFloat(exRate)/100));
					}
					else
					{
						disSrAmt=srcount*1*(parseFloat(disSr)*parseFloat(exRate));
						disDrAmt=drcount*2*(parseFloat(disDr)*parseFloat(exRate));
						disTrAmt=trcount*3*(parseFloat(disTr)*parseFloat(exRate));
						disQrAmt=qrcount*4*(parseFloat(disQr)*parseFloat(exRate));
						disCnbAmt=cnbcount*1*(parseFloat(disCnb)*parseFloat(exRate));
						disCwbAmt=cwbcount*1*(parseFloat(disCwb)*parseFloat(exRate));
						disInfAmt=infantCount*1*(parseFloat(disInfant)*parseFloat(exRate))
						disJcAmt=jcCount*1*(parseFloat(disJc)*parseFloat(exRate))
					}
				}
				discount=disSrAmt+disDrAmt+disTrAmt+disQrAmt+disCnbAmt+disCwbAmt+disInfAmt+disJcAmt;
			}
			/**
			 * For tour cost components 
			 */
			/*var totalPax = 0;
			if(pkgtype=='0')
			{
				totalPax = adultCount + domChildCount;
			}
			else
			{
				totalPax = adultCount+childCount+infantCount;
			}*/
			var priceString="";
			var data=new Array();
			var inrPrice="";
			dataDis=accmData;
			data=accmData.split("|");
			var ts=0;
			var priceSlabFlag=false;
			var sr=0,dr=0,tr=0,qr=0,cwb=0,cnb=0,infantPrice=0,cnb_slab=0,priceSlab="",jc=0;
			tcBrkUpValue="";
			tcBrkUpPriceValue="";
			for(var j=0;j<data.length;j++)
			{
				var price=new Array();
				var brkUpPrice="",srBrkUpAmt="",drBrkUpAmt="",trBrkUpAmt="",qrBrkUpAmt="",cnbBrkUpAmt="",cwbBrkUpAmt="",infBrkUpAmt="",cnbSlabBrkUpAmt=0;
				var currencyRateAmt=1;
				price=data[j].split(",");
			 
					if(pkgSubType=='FIT' && parseInt(price[11])>0 && totalPax>=price[11] && totalPax<=price[12])
					{
							// Tour cost component breakup start
							if(parseInt(price[10])>0)
								price[2] = price[10]; //when Twin sharing is present then use Twin sharing price otherwise use double room price
							srBrkUpAmt=srcount*1*price[1];
							drBrkUpAmt=drcount*2*price[2];
							trBrkUpAmt=trcount*3*price[3];
							qrBrkUpAmt=qrcount*4*price[4];
							cwbBrkUpAmt=cwbcount*1*price[5];
							cnbBrkUpAmt=cnbcount*1*price[6];
							infBrkUpAmt=infantCount*price[7];
							cnbSlabBrkUpAmt=cnbslabcount*price[15];
							brkUpPrice=srBrkUpAmt+drBrkUpAmt+trBrkUpAmt+qrBrkUpAmt+cnbBrkUpAmt+cwbBrkUpAmt+infBrkUpAmt+cnbSlabBrkUpAmt;
							if(price[0]!='INR')
							{
								if(price[0]=='THB' || price[0]=='JPY')
								{
									priceString+="<tr><td width='550' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ 100 "+price[0]+" = <span style=\"font-size:1.1em;font-weight:normal!important;color:#222222 !important;\" class=\"WebRupee\">Rs.</span> "+Math.round((price[9])*10000)/10000+" ) :</td>";
									pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ 100 "+price[0]+" = <span class=\"WebRupee\">Rs.</span> "+Math.round((price[9])*10000)/10000+" ) :' />";
								}
								else
								{
									priceString+="<tr><td width='320' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :</td>";
									pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :' />";
								}
								priceString+="<td width='192' class='rt' style='text-align: right;font-size: 1em;padding: 2px 0;'>"+brkUpPrice+"</td></tr>";
								pricing+="<input type='hidden' name='tcBrkUpPrice' value='"+brkUpPrice+"' />";
							}
							
							if(price[0]=='INR')
							{
								inrPrice=brkUpPrice;
							}
	                       //Tour cost component breakup end
							
						   //Fit slabwise rates start	
							if(price[0]=='THB' || price[0]=='JPY')
							{
								currencyRateAmt=100;
							}
							sr+=(parseInt(price[1])*parseFloat(price[9]))/currencyRateAmt;
							dr+=(parseInt(price[2])*parseFloat(price[9]))/currencyRateAmt;
							tr+=(parseInt(price[3])*parseFloat(price[9]))/currencyRateAmt;
							qr+=(parseInt(price[4])*parseFloat(price[9]))/currencyRateAmt;
							cwb+=(parseInt(price[5])*parseFloat(price[9]))/currencyRateAmt;
							cnb+=(parseInt(price[6])*parseFloat(price[9]))/currencyRateAmt;
							cnb_slab+=(parseInt(price[15])*parseFloat(price[9]))/currencyRateAmt;
							if(accomType.length==1)	
							{
								if(parseInt(price[7])==-1)
									infantPrice+=-1;
								else
									infantPrice+=(parseInt(price[7])*parseFloat(price[9]))/currencyRateAmt;
							}
							else
							{
								if(parseInt(price[7])==-1)
									infantPrice+=-1;
								else
									infantPrice+=(parseInt(price[7])*parseFloat(price[9]))/currencyRateAmt;
							}
							if(pkgSubType=='FIT')
								ts+=(parseInt(price[10])*parseFloat(price[9]))/currencyRateAmt;
							
							if(ts>0)  
						    	dr = ts;
							
							priceSlab=price[11]+"-"+price[12];
	                     //	Fit slabwise rates end	
						priceSlabFlag=true;
				}
				else if(pkgSubType=='FIT' && (price[13]>0 && totalPax>price[11] && price[11]==price[13]) || (price[16]>0 && totalPax<price[11] && price[11]==price[16]))
				{
					// Tour cost component breakup start
						if(parseInt(price[10])>0)
							price[2] = price[10]; //when Twin sharing is present then use Twin sharing price otherwise use double room price
						srBrkUpAmt=srcount*1*price[1];
						drBrkUpAmt=drcount*2*price[2];
						trBrkUpAmt=trcount*3*price[3];
						qrBrkUpAmt=qrcount*4*price[4];
						cwbBrkUpAmt=cwbcount*1*price[5];
						cnbBrkUpAmt=cnbcount*1*price[6];
						infBrkUpAmt=infantCount*price[7];
						cnbSlabBrkUpAmt=cnbslabcount*price[15];
						brkUpPrice=srBrkUpAmt+drBrkUpAmt+trBrkUpAmt+qrBrkUpAmt+cnbBrkUpAmt+cwbBrkUpAmt+infBrkUpAmt+cnbSlabBrkUpAmt;
						if(price[0]!='INR')
						{
							if(price[0]=='THB' || price[0]=='JPY')
							{
								priceString+="<tr><td width='550' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ 100 "+price[0]+" = <span style=\"font-size:1.1em;font-weight:normal!important;color:#222222 !important;\" class=\"WebRupee\">Rs.</span> "+Math.round((price[9])*10000)/10000+" ) :</td>";
								pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ 100 <span class=\"WebRupee\">Rs.</span> "+price[0]+" = "+Math.round((price[9])*10000)/10000+" ) :' />";
							}
							else
							{
								priceString+="<tr><td width='320' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :</td>";
								pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :' />";
							}
							priceString+="<td width='192' class='rt' style='text-align: right;font-size: 1em;padding: 2px 0;'>"+brkUpPrice+"</td></tr>";
							pricing+="<input type='hidden' name='tcBrkUpPrice' value='"+brkUpPrice+"' />";
						}
						
						if(price[0]=='INR')
						{
							inrPrice=brkUpPrice;
						}
                       //Tour cost component breakup end
						
					   //Fit slabwise rates start	
						if(price[0]=='THB' || price[0]=='JPY')
						{
							currencyRateAmt=100;
						}
						sr+=(parseInt(price[1])*parseFloat(price[9]))/currencyRateAmt;
						dr+=(parseInt(price[2])*parseFloat(price[9]))/currencyRateAmt;
						tr+=(parseInt(price[3])*parseFloat(price[9]))/currencyRateAmt;
						qr+=(parseInt(price[4])*parseFloat(price[9]))/currencyRateAmt;
						cwb+=(parseInt(price[5])*parseFloat(price[9]))/currencyRateAmt;
						cnb+=(parseInt(price[6])*parseFloat(price[9]))/currencyRateAmt;
						cnb_slab+=(parseInt(price[15])*parseFloat(price[9]))/currencyRateAmt;
						if(accomType.length==1)	
						{
							if(parseInt(price[7])==-1)
								infantPrice+=-1;
							else
								infantPrice+=(parseInt(price[7])*parseFloat(price[9]))/currencyRateAmt;
						}
						else
						{
							if(parseInt(price[7])==-1)
								infantPrice+=-1;
							else
								infantPrice+=(parseInt(price[7])*parseFloat(price[9]))/currencyRateAmt;
						}
						if(pkgSubType=='FIT')
							ts+=(parseInt(price[10])*parseFloat(price[9]))/currencyRateAmt;
						
						if(ts>0)  
					    	dr = ts;
						
						priceSlab=price[11]+"-"+price[12];
                     //	Fit slabwise rates end	
						
					priceSlabFlag=true;
				}
				else if((pkgSubType=='FIT' && parseInt(price[11])==0 && parseInt(price[12])==0) || pkgSubType=='GIT')//without slabwise FIT and All GIT
				{
					if(pkgSubType=='FIT')
					{
						if(parseInt(price[10])>0)
							price[2] = price[10]; //when Twin sharing is present then use Twin sharing price otherwise use double room price
					}
					srBrkUpAmt=srcount*1*price[1];
					drBrkUpAmt=drcount*2*price[2];
					trBrkUpAmt=trcount*3*price[3];
					qrBrkUpAmt=qrcount*4*price[4];
					cwbBrkUpAmt=cwbcount*1*price[5];
					cnbBrkUpAmt=cnbcount*1*price[6];
					infBrkUpAmt=infantCount*price[7];
					
					if(pkgSubType=='FIT')
						cnbSlabBrkUpAmt=cnbslabcount*price[15];
					brkUpPrice=srBrkUpAmt+drBrkUpAmt+trBrkUpAmt+qrBrkUpAmt+cnbBrkUpAmt+cwbBrkUpAmt+infBrkUpAmt+cnbSlabBrkUpAmt;
					
					sr=accomType[0];
					dr=accomType[1];
					tr=accomType[2];
					qr=accomType[3];
					cwb=accomType[4];
					cnb=accomType[5];
					infantPrice=accomType[6];
					
					if(pkgSubType=='FIT')
						cnb_slab = accomType[10];
					
					if(pkgtype=='0' && pkgSubType=='GIT')
						jc = accomType[11];
					
					if(price[0]!='INR')
					{
						if(price[0]=='THB' || price[0]=='JPY')
						{
							priceString+="<tr><td width='550' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ 100 "+price[0]+" = <span style=\"font-size:1.1em;font-weight:normal!important;color:#222222 !important;\" class=\"WebRupee\">Rs.</span> "+Math.round((price[9])*10000)/10000+" ) :</td>";
							pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ 100 "+price[0]+" = <span class=\"WebRupee\">Rs.</span> "+Math.round((price[9])*10000)/10000+" ) :' />";
						}
						else
						{
							priceString+="<tr><td width='320' style='font-size: 1em;padding: 2px 0;'>"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :</td>";
							pricing+="<input type='hidden' name='tcBrkUp' value='"+price[0]+" tour component (calculated @ INR "+price[9]+" ) :' />";
						}
						priceString+="<td width='192' class='rt' style='text-align: right;font-size: 1em;padding: 2px 0;'>"+brkUpPrice+"</td></tr>";
						pricing+="<input type='hidden' name='tcBrkUpPrice' value='"+brkUpPrice+"' />";
					}
					
					if(price[0]=='INR')
					{
						inrPrice=brkUpPrice;
					}
					priceSlabFlag=false;
				}
					tcBrkUpValue+=price[0];
					tcBrkUpValue+=",";
					tcBrkUpPriceValue+=brkUpPrice;
					tcBrkUpPriceValue+=",";
			}
			if(inrPrice!=null && inrPrice!="")
			{
				priceString+="<tr><td width='245' style='font-size: 1em;padding: 2px 0;'>INR tour component :</td>";
				priceString+="<td width='192' class='rt' style='text-align: right;font-size: 1em;padding: 2px 0;'>"+inrPrice+"</td></tr>";
				pricing+="<input type='hidden' name='tcBrkUp' value='INR tour component' />";
				pricing+="<input type='hidden' name='tcBrkUpPrice' value='"+inrPrice+"' />";
			}
			
			/**
			 * for price calculation
			 */
			
			var srAmt=srcount*1*parseFloat(sr);
			var drAmt=drcount*2*parseFloat(dr);
			var trAmt=trcount*3*parseFloat(tr);
			var qrAmt=qrcount*4*parseFloat(qr);
			var cnbAmt=cnbcount*1*parseFloat(cnb);
			var cwbAmt=cwbcount*1*parseFloat(cwb);
			var cnbSlabAmt=cnbslabcount*1*parseFloat(cnb_slab); // for fit child 2-5 yrs
			var infAmt=infantCount*parseFloat(infantPrice);
			var jcAmt=jcCount*1*parseFloat(jc); // for domestic GIT junior child 5-12 yrs
			price=srAmt+drAmt+trAmt+qrAmt+cnbAmt+cwbAmt+infAmt+cnbSlabAmt+jcAmt;
			
			document.getElementById("acctype").style.display='block';
		}
		else
		{
			document.getElementById("acctype").style.display='none';
		}
		//taxDiscountValue=price;
		serTaxPayable=(parseFloat(price)-parseFloat(discount))*(parseFloat(fitservicetax)/100);
		totalPrice=(parseFloat(price)-parseFloat(discount))+Math.round(serTaxPayable);
		var adultPrice=srAmt+drAmt+trAmt+qrAmt;
		var childPrice=cnbAmt+cwbAmt+cnbSlabAmt;
		var infantPrice=infAmt;
		var adultDiscount = 0;
		var childDiscount = 0;
		var infantDiscount = 0;
		if(discount>0)
		{
			/*adultDiscount = parseFloat(disSrAmt)+parseFloat(disDrAmt)+parseFloat(disTrAmt)+parseFloat(disQrAmt);
			childDiscount = parseFloat(disCnbAmt)+parseFloat(disCwbAmt);
			infantDiscount = parseFloat(disInfAmt);*/
			adultDiscount = adultAmt;
			childDiscount = childAmt;
			infantDiscount = infantAmt;
		}
		adultPrice=adultPrice-adultDiscount;
		childPrice=childPrice-childDiscount;
		infantPrice=infantPrice-infantDiscount;
		adultPrice+=adultPrice*(parseFloat(fitservicetax)/100);
		childPrice+=childPrice*(parseFloat(fitservicetax)/100);
		infantPrice+=infantPrice*(parseFloat(fitservicetax)/100);
		if(parseFloat(adultPayablePer)>0)
			bookingAmt=totalPrice*(parseFloat(adultPayablePer)/100);
		
		if(parseFloat(childPayablePer)>0)
			childAdvPrice=totalPrice*(parseFloat(childPayablePer)/100);
		
		var advPay=(bookingAmt*noOfAdults)+(childAdvPrice*noOfChildren);
		balPayable=Math.round(totalPrice)-Math.round(advPay);
		if(pkgtype=='1')
			$g("#priceBreakUp").html(priceString);
		document.getElementById("totalPrice").innerHTML="<span class=\"WebRupee\">Rs. </span> "+Math.round(totalPrice)+"/-";
		if(pkgtype=='0')
		document.getElementById("tourcost").innerHTML=price;
		document.getElementById("discount").innerHTML=Math.round(discount);
		document.getElementById("servicetax").innerHTML=Math.round(serTaxPayable);
		document.getElementById("total").innerHTML="<strong>"+Math.round(totalPrice)+"</strong>";
		totalPriceValue=totalPrice;
		if(advPay>0)
		{
		   advPayValue=advPay;
		   
		   balPayableValue=balPayable;
		   if(paymentTypeValue=='full'){
		   document.getElementById("showCheck").style.display='block';
		   document.getElementById("showCheck").innerHTML='<input  name="masterCheckBox" type="checkbox" value="" style="margin-left:11px;padding:px 0 0 25px;" id="masterCheckBox" onclick="changePrice();" /><label   style="margin-top:0px;font-size:1.5em; padding:10px 0 0 25px; cursor:pointer;">I want to pay full package amount of Rs.'+totalPriceValue+' '+'up front</label>';
		   //document.getElementById("showCheck").innerHTML='<input  style="background:transparent url(../../images/holiAbroad/images/holiday/checkbox-bg.png) no-repeat left top;  height:15px;" name="masterCheckBox" type="checkbox" value=""  id="masterCheckBox" onclick="changePrice();" /><label   style="margin-top:0px;font-size:1.5em; padding:10px 0 0 25px; cursor:pointer;">I want to pay full package amount up front</label>';
		   }else if(paymentTypeValue=='userDefine'){
		   document.getElementById("showUserDefine").style.display='block';
		   //document.getElementById("showUserDefine").innerHTML='<p class="floatleft" id="advText" style="font-size:1.3em;">Pay Amount:</p><input type="text" name="amountText" style="width:50px !importan;color:#3158A3" id="amountText" onblur="checkPaybleAmount()"/>';
		   document.getElementById("advPayable").innerHTML='<span style=\"font-size:12px;\" class=\"WebRupee\">Rs. </span><input type="text" class=\"selectedTxt\" size ="10" name="amountText" style="width:124px !importan" onblur="checkPaybleAmount()" id="amountText" value="'+Math.round(advPay)+'"/>'+'/-';
		   
		   }
		   document.getElementById("advDiv").style.display='block';
		   document.getElementById("advText").innerHTML="Advance payable (Including GST)";
		   if(paymentTypeValue!='userDefine'){
		   document.getElementById("advPayable").innerHTML="<span style=\"font-size:12px;\" class=\"WebRupee\">Rs. </span> "+Math.round(advPay)+"/-";
		   }
		  
		   document.getElementById("balPayable").innerHTML="<strong>Balance payable  <span class=\"WebRupee\" style=\"color:#222222 !important;\">Rs. </span> "+Math.round(balPayable)+"/- </strong>"; 
		   
		}
		else
		{
			document.getElementById("advDiv").style.display='none';
		}
		document.getElementById("totalprice_right").style.display='block';
		pricing+="<input type='hidden' name='totalPrice' value='"+Math.round(totalPrice)+"' />";
		pricing+="<input type='hidden' name='tourCost' value='"+price+"' />";
		pricing+="<input type='hidden' name='discount' value='"+Math.round(discount)+"' />";
		pricing+="<input type='hidden' name='serviceTax' value='"+Math.round(serTaxPayable)+"' />";
		//pricing+="<input type='hidden' id='newServiceTax' name='newServiceTax'   />";
		//pricing+="<input type='hidden' id='newBookingAmt' name='newBookingAmt'   />";
		//pricing+="<input type='hidden' id='newBalPayable' name='newBalPayable'   />";
		if(advPay>0)
			pricing+="<input type='hidden' name='bookingAmt'   value='"+Math.round(advPay)+"' />";
		else
			pricing+="<input type='hidden' name='bookingAmt' value='"+Math.round(totalPrice)+"' />";
		pricing+="<input type='hidden' name='advPayable' value='"+Math.round(advPay)+"' />";
		pricing+="<input type='hidden' name='balPayable'  value='"+Math.round(balPayable)+"' />";
		pricing+="<input type='hidden' name='adultPrice' value='"+Math.round(adultPrice)+"' />";
		pricing+="<input type='hidden' name='childPrice' value='"+Math.round(childPrice)+"' />";
		pricing+="<input type='hidden' name='infantPrice' value='"+Math.round(infantPrice)+"' />";
		
		if(!priceSlabFlag)
		{
			pricing+="<input type='hidden' name='val' value='"+priceData+"' />";
		}
		else
		{
			var priceDataVal = sr+","+dr+","+tr+","+qr+","+cwb+","+cnb+","+infantPrice+","+fitservicetax+","+inventryCount+","+ts+","+cnb_slab+","+jc;
			pricing+="<input type='hidden' name='val' value='"+priceDataVal+"' />";
		}
		pricing+="<input type='hidden' name='priceSlab' value='"+priceSlab+"' />";
		pricing+="<input type='hidden' name='prodcode' value='"+prodCode+"' />";
		pricing+=currencyList;
		pricing+=currencyRateList;
		generateRooming(0);
		productCodeValue=prodCode;
		if(packageType=='GIT')
			$g(".bookonlineWrap").css("display","none");
		//totalPriceValue=Math.round(totalPrice);
		tourCostValue=price;
		serviceTaxValue=Math.round(serTaxPayable);
		if(advPay>0)
		bookingAmtValue=Math.round(advPay);
		else
		bookingAmtValue=Math.round(totalPrice);	
		advPayableValue=Math.round(advPay);
		balPayableValue=Math.round(balPayable);
		adultPriceValue=Math.round(adultPrice);
		childPriceValue=Math.round(childPrice);
		infantPriceValue=Math.round(infantPrice);
		priceSlabValue=priceSlab;
		if(!priceSlabFlag)
			valValue=priceData;
		else
		   valValue=priceDataVal;
		
		/*if(isBookable=='0'){

			if(!ishighlightFlag && !(istotalPassengerCount>=isinventryCount) && pkgSubType=='GIT'){
				$g(".saveAndContinueButton").show();
			}else if(!ishighlightFlag && pkgSubType=='FIT'){
				$g("#continue").hide();
				$g(".saveAndContinueButton").show();
			}
			
			else
			{
				if(istotalPassengerCount>=isinventryCount && !ishighlightFlag){
			        $g(".saveAndContinueButton").show();    
			    }else{
			    	$g(".saveAndContinueButton").hide();
				}
			}
		}else{
			$g(".saveAndContinueButton").hide();
		}*/
}

function setAddonMsg(index)
{
	setTimeout(function() {
	var adnChkBoxName=document.getElementsByName("addon");
	var adnChkBox=document.getElementById("addon"+index);
	if(adnChkBox!=null)
	{
		for(var adn=0;adn<adnChkBoxName.length;adn++)
		{
			var adnChkBox=document.getElementById("addon"+adn);
			if(adnChkBox.checked)
			{
				addonFlag=true;
				document.getElementById("addonPriceMsg").innerHTML="Pricing does not include Add-on package price."+"<input type='hidden' name='addonMsgPre' value='1' />";
				return false;
			}
			else
			{
				document.getElementById("addonPriceMsg").innerHTML="";
			}
		}
	 }
	}, 0);
}

function generateRooming(id){
var srcount=0;
var drcount=0;
var tscount=0;
var trcount=0;
var qrcount=0;
var cwbcount=0;
var cnbcount=0;
var adultCount=0;
var infantCount=0;
var jcCount=0;
var rooming = "";
var noOfAdults=0;
var noOfChildren=0;
var noOfInfants=0;
var region=document.getElementById("region").value;
var noOfRooms=document.getElementById("noOfRooms").value;
var packageType=pkgSubType;
var roomType="";
var roomContent = "";
var paxContent = "";
var paxCount = 0;
var jc=0;
roomingValue="";
    rooming+="<input type='hidden' name='accom_type' value='"+accomtype+"' />";
    accomtypeValue=accomtype;
    
    var accomType=new Array();
	accomType=priceData.split(",");
	
	if(pkgtype=='0' && pkgSubType=='GIT')
		jc = accomType[11];   

	for(var i=0;i<noOfRooms;i++)
	{
		var adult=document.getElementById("adult"+i).value;		
		var child=document.getElementById("child"+i).value;
		var infant=parseInt(document.getElementById("infant"+i).value);
		adultCount+=parseInt(adult);
		paxCount = parseInt(adult)+parseInt(child);
		bed1=document.getElementById("bedOption"+i+"1").checked;
   		bed2=document.getElementById("bedOption"+i+"2").checked;
   		var age1=document.getElementById("age"+i+"1").value;			
		var age2=document.getElementById("age"+i+"2").value;
		var cnb1Flag =false,cnb2Flag=false;
		if(child=='1')
		{
			/** set flag only if <=4 for domestic start **/
			
			if((parseInt(age1.charAt(0))>=2 && parseInt(age1.charAt(0))<=4))
			{
					cnb1Flag=true;
			}
			/** set flag only if <=4 for domestic end **/
		}
		else if(child=='2')
		{
			/** set flag only if <=4 for domestic start **/
			
			if((parseInt(age1.charAt(0))>=2 && parseInt(age1.charAt(0))<=4))
			{
				cnb1Flag=true;
			}
					
			if((parseInt(age2.charAt(0))>=2 && parseInt(age2.charAt(0))<=4))
			{
				cnb2Flag=true;
			}
			/** set flag only if <=4 for domestic end **/
		}
   		
   		if(adult=='1')
		{
			if(child=='1')
			{
				drcount=drcount+1;
				roomType="DR";
			}	
			else if(child=='2')
			{
			 					
				if(bed1==true && bed2==true)	
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						cwbcount=cwbcount+1;
						roomType="DR + CWB";
						//roomType="TR";
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								roomType="DR + CWB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							roomType="DR + CWB";
						}
					}
				}	
				else if(bed1==false && bed2==false)
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						if(packageType=='FIT')
						{
							cnbcount=cnbcount+1;
							roomType="DR + CNB";
						}
						else //for domestic GIT Junior child 2-5 yrs
						{
							/*if(parseFloat(jc)==0)
							{
								cnbcount=cnbcount+1;
								roomType="DR + CNB";
							}
							else*/
							//{
								if(cnb2Flag)
								{
									jcCount=jcCount+1;
									roomType="DR + CNB 2-5";
								}
								else
								{
									cnbcount=cnbcount+1;
									roomType="DR + CNB 5-12";
								}
							//}
						}
					}
					else
					{
						drcount=drcount+1;
						cnbcount=cnbcount+1;
						roomType="DR + CNB";
					}
					
				}
				else if(bed1==true && bed2==false)
				{
					drcount=drcount+1;
					if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
					{
						/*if(parseFloat(jc)==0)
						{
							cnbcount=cnbcount+1;
							roomType="DR + CNB";
						}
						else*/
						//{
							if(cnb2Flag)
							{
								jcCount=jcCount+1;
								roomType="DR + CNB 2-5";
							}
							else
							{
								cnbcount=cnbcount+1;
								roomType="DR + CNB 5-12";
							}
						//}
					}
					else
					{
						cnbcount=cnbcount+1;
						roomType="DR + CNB";
					}
				}	
				else if(bed1==false && bed2==true)
				{
					drcount=drcount+1;
					if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
					{
						/*if(parseFloat(jc)==0)
						{
							cnbcount=cnbcount+1;
							roomType="DR + CNB";
						}
						else*/
						//{
							if(cnb2Flag)
							{
								jcCount=jcCount+1;
								roomType="DR + CNB 2-5";
							}
							else
							{
								cnbcount=cnbcount+1;
								roomType="DR + CNB 5-12";
							}
						//}
					}
					else
					{
						cnbcount=cnbcount+1;
						roomType="DR + CNB";
					}
				}						
			}	
			else
			{
				srcount=srcount+1;
				roomType="SR";
			}
			infantCount+=infant;
			
		}
		else if(adult=='2')
		{
			if(child=='1')
			{
				if(bed1==true)
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						cwbcount=cwbcount+1;
						roomType="DR + CWB";
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								roomType="DR + CWB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							roomType="DR + CWB";
						}
					}
				}
				else
				{
					drcount=drcount+1;
					if(pkgtype=='0' && packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
					{
						/*if(parseFloat(jc)==0)
						{
							cnbcount=cnbcount+1;
							roomType="DR + CNB";
						}
						else*/
						//{
							if(cnb1Flag)
							{
								jcCount=jcCount+1;
								roomType="DR + CNB 2-5";
							}
							else
							{
								cnbcount=cnbcount+1;
								roomType="DR + CNB 5-12";
							}
						//}
					}
					else
					{
						cnbcount=cnbcount+1;
						roomType="DR + CNB";
					}
				}
			}
			else if(child=='2')
			{
				if(bed1==true && bed2==true)
				{	
					if(pkgtype=='0')
					{
						/*trcount=trcount+1;
						cnbcount=cnbcount+1;
						roomType="TR + CNB";*/
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
				}
				else if(bed1==false && bed2==false)
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						cwbcount=cwbcount+1;
						if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
						{
							/*if(parseFloat(jc)==0)
							{
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
							else*/
							//{
								if(cnb2Flag)
								{
									jcCount=jcCount+1;
									roomType="DR + CWB + CNB 2-5";
								}
								else
								{
									cnbcount=cnbcount+1;
									roomType="DR + CWB + CNB 5-12";
								}
							//}
						}
						else
						{
							//cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
				}
				else if(bed1==true && bed2==false)
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						cwbcount=cwbcount+1;
						if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
						{
							/*if(parseFloat(jc)==0)
							{
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
							else*/
							//{
								if(cnb2Flag)
								{
									jcCount=jcCount+1;
									roomType="DR + CWB + CNB 2-5";
								}
								else
								{
									cnbcount=cnbcount+1;
									roomType="DR + CWB + CNB 5-12";
								}
							//}
						}
						else
						{
							//cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
				}	
				else if(bed1==false && bed2==true)
				{
					if(pkgtype=='0')
					{
						drcount=drcount+1;
						cwbcount=cwbcount+1;
						if(packageType=='GIT') //for domestic GIT Junior child 2-5 yrs
						{
							/*if(parseFloat(jc)==0)
							{
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
							else*/
							//{
								if(cnb1Flag)
								{
									jcCount=jcCount+1;
									roomType="DR + CWB + CNB 2-5";
								}
								else
								{
									cnbcount=cnbcount+1;
									roomType="DR + CWB + CNB 5-12";
								}
							//}
						}
					}
					else
					{
						if(packageType=='GIT')
						{
							if(region=='Africa' || region=='SAmerica' || region=='NAmerica' || region=='America')
							{
								drcount=drcount+1;
								cnbcount=cnbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CNB + CNB";
							}
							else
							{
								drcount=drcount+1;
								cwbcount=cwbcount+1;
								cnbcount=cnbcount+1;
								roomType="DR + CWB + CNB";
							}
						}
						else
						{
							drcount=drcount+1;
							cwbcount=cwbcount+1;
							cnbcount=cnbcount+1;
							roomType="DR + CWB + CNB";
						}
					}
				}
			}
			else
			{
				/** For Twin sharing Display on pre-confirmation page **/
				var accomType = priceData.split(",");
				if(parseInt(accomType[9])>0)
					tscount=tscount+1;
				/** For Twin sharing Display on pre-confirmation page **/
				drcount=drcount+1;
				roomType="DR";
			}
			infantCount+=infant;
		}   
		else if(adult=='3')
		{
			if(child=='1')
			{
				if(bed1==true)
				{
					if(pkgtype=='0')
					{
						/*trcount=trcount+1;
						cnbcount=cnbcount+1;
						roomType="TR + CNB";*/
					}
					else
					{
						trcount=trcount+1;
						cnbcount=cnbcount+1;
						roomType="TR + CNB";
					}
				}
				else
				{
					trcount=trcount+1;
					if(pkgtype=='0' && packageType=='GIT')
					{
						/*if(parseFloat(jc)==0)
						{
							cnbcount=cnbcount+1;
							roomType="TR + CNB";
						}
						else*/
						//{
							if(cnb1Flag)
							{
								jcCount=jcCount+1;
								roomType="TR + CNB 2-5";
							}
							else
							{
								cnbcount=cnbcount+1;
								roomType="TR + CNB 5-12";
							}
						//}
					}
					else
					{
						cnbcount=cnbcount+1;
						roomType="TR + CNB";
					}
				}
			}
			else
			{
				trcount=trcount+1;
				roomType="TR";
			}
			infantCount+=infant;
		}
		else if(adult=='4')
		{
			if(parseInt(child)>0)
			{
				return false;
			}
			else
			{
				
				/*if(pkgtype=='0')
				{
					qrcount=qrcount+1;
					roomType="QR";
				}
				else*/
				if(pkgtype=='1')
				{
					drcount=drcount+2;
					roomType="DR + DR";
				}
			}
			infantCount+=infant;
		}
   		
   		if(id==0 || id==2)
   		{
			noOfAdults+=parseInt(adult);
			noOfChildren+=parseInt(child);
			noOfInfants+=parseInt(infantCount);
			/** show 2 rooms when 4 adults are selected in single room for US/Africa/Aus/NZ/Europe/Asia Start**/
			if(drcount==2)
			{
				for(var j=0;j<drcount;j++)
				{
					
					rooming+="<input type='hidden' name='rooming' value='"+srcount+",1,"+trcount+","+qrcount+","+cnbcount+","+cwbcount+","+infantCount+","+tscount+","+jcCount+"' />";
					rooming+="<input type='hidden' name='adults' value='"+drcount+"' />";
					rooming+="<input type='hidden' name='childs' value='"+child+"' />";
					rooming+="<input type='hidden' name='infants' value='"+infantCount+"' />";
					rooming+="<input type='hidden' name='roomDetails' value='"+drcount+","+child+","+infant+"' />";
					roomingValue+=srcount+",1,"+trcount+","+qrcount+","+cnbcount+","+cwbcount+","+infantCount+","+tscount+","+jcCount;
					roomingValue+="#";
					roomDetailsValue=drcount+","+child+","+infant;
					adultValue=drcount;
					childValue=child;
					infantValue=infantCount;
				}
			}
			/** show 2 rooms when 4 adults are selected in single room for US/Africa/Aus/NZ/Europe/Asia End**/
			else
			{
				rooming+="<input type='hidden' name='rooming' value='"+srcount+","+drcount+","+trcount+","+qrcount+","+cnbcount+","+cwbcount+","+infantCount+","+tscount+","+jcCount+"' />";
				rooming+="<input type='hidden' name='adults' value='"+adult+"' />";
				rooming+="<input type='hidden' name='childs' value='"+child+"' />";
				rooming+="<input type='hidden' name='infants' value='"+infantCount+"' />";
				rooming+="<input type='hidden' name='roomDetails' value='"+adult+","+child+","+infant+"' />";
				roomingValue+=srcount+","+drcount+","+trcount+","+qrcount+","+cnbcount+","+cwbcount+","+infantCount+","+tscount+","+jcCount;
				roomingValue+="#";
				roomDetailsValue=adult+","+child+","+infant;
				adultValue=adult;
				childValue=child;
				infantValue=infantCount;
			}
			
			srcount=0;drcount=0;trcount=0;qrcount=0;cnbcount=0;cwbcount=0;infantCount=0;tscount=0;jcCount=0;
			rooming+="<input type='hidden' name='roomType' value='"+roomType+"' />";
   		}
   		/*roomContent+=roomType;
   		roomContent+="$";
   		paxContent+=paxCount;
   		paxContent+="$";*/
	}
	if(id==2) //domestic git discount slabwise
	{
		return roomingValue;//.replace("#","$").replace("#","$");
	}
	if(id==0)
	{
		rooming+="<input type='hidden' name='noOfAdults' value='"+noOfAdults+"' />";
		rooming+="<input type='hidden' name='noOfChildren' value='"+noOfChildren+"' />";
		rooming+="<input type='hidden' name='noOfInfants' value='"+noOfInfants+"' />";
		pricing+=rooming;
		
		noOfAdultValue=noOfAdults;
		noOfChildrenValue=noOfChildren;
		noOfInfantValue=noOfInfants;
	}
	else
	{
		return srcount+","+drcount+","+trcount+","+qrcount+","+cnbcount+","+cwbcount+","+infantCount+","+tscount+","+jcCount+","+roomContent+","+paxContent;
	}
}

function callMap(hotelCode)
{
    iLyteBox_call("map", hotelCode); 
	return false;
}
var globalOpenTab;
function iLyteBox_call(openTab, hotelCode)
{
	if(hotelCode != "")
	{
		globalOpenTab = openTab;
		HotelCityList.getDomesticHotelDetails(hotelCode, ajax_resp_dom_hotel_details);
	}
}

function initialize_dommap(lat, lng, hotelName, address1, address2) 
{
	   try{
 	    var myLatlng = new google.maps.LatLng(lat,lng);
        var map = new GMap2(document.getElementById("map_domcanvas"));
        map.setCenter(new GLatLng(lat, lng), 13);
        var point = new GLatLng(lat ,lng);
		map.addOverlay(new GMarker(point));
        map.setUIToDefault();
        var marker = new GMarker(point);
 		map.addOverlay(marker);
		GEvent.addListener(	marker, "click", function() { marker.openInfoWindowHtml('<h3>'+hotelName+'</h3>'+address1+', '+address2);});
		}catch(e){}
}

function getXML(respText)
{
	if (window.ActiveXObject)
	{
		var doc=new ActiveXObject("Microsoft.XMLDOM");
 		doc.async="false";
 		doc.loadXML(respText);
 	}
 	else
 	{
 		  var parser=new DOMParser();
 		  var doc=parser.parseFromString(respText, "text/xml");
   	}
   	return doc;
}

function ajax_resp_dom_hotel_details (data)
{
	var hotelLength=0, facilityLength=0, roomLength=0, reviewsLength=0, attractionLength=0;
	var xmlDoc = getXML(data);
	try
	{
		var xList = xmlDoc.getElementsByTagName("HOTEL_AJAX");
		if(xList != null && xList != undefined)
		{
			hotelLength = xList.length;
		}
	}catch(e){
		hotelLength = 0;
	}
	try
	{
		var facilityList = xmlDoc.getElementsByTagName("FACILITY");
		if(facilityList != null && facilityList != undefined)
		{
			facilityLength = facilityList.length;
		}
	}catch(e){
		facilityLength = 0;
	}
	
	try
	{
		var roomList = xmlDoc.getElementsByTagName("ROOM");
		if(roomList != null && roomList != undefined)
		{
			roomLength = roomList.length;
		}
	}catch(e){
		roomLength = 0;
	}
	
	try
	{
		var reviewsList = xmlDoc.getElementsByTagName("REVIEWS");
		if(reviewsList != null && reviewsList != undefined)
		{
			reviewsLength = reviewsList.length;
		}
	}catch(e){
		reviewsLength = 0;
	}
	
	try
	{
		var attractionList = xmlDoc.getElementsByTagName("ATTRACTION");
		if(attractionList != null && attractionList != undefined)
		{
			attractionLength = attractionList.length;
		}
	}catch(e){
		attractionLength = 0;
	}
	
	var str=""; 
	var address1 = "";
	var address2 = "";
	var hotelDesc = "";
	var hotellat = "";
	var hotellng = "";
	for(var i=0; i<hotelLength; i++)
	{
		var hotelCode = xList[0].getElementsByTagName("HOTEL_CODE")[0].childNodes[0].nodeValue;
		var hotelName = xList[0].getElementsByTagName("HOTEL_NAME")[0].childNodes[0].nodeValue;
		var hotelStar = xList[0].getElementsByTagName("HOTEL_RATING")[0].childNodes[0].nodeValue;
		var isTCRecommend = xList[0].getElementsByTagName("TC_RECOMMENDS")[0].childNodes[0].nodeValue;
		if(xList[0].getElementsByTagName("HOTEL_ADDRESS1")[0].childNodes[0]!=undefined)
		{
			address1 = xList[0].getElementsByTagName("HOTEL_ADDRESS1")[0].childNodes[0].nodeValue;
		}
		if(xList[0].getElementsByTagName("HOTEL_ADDRESS2")[0].childNodes[0]!=undefined)
		{
			address2 = xList[0].getElementsByTagName("HOTEL_ADDRESS2")[0].childNodes[0].nodeValue;
		}
		if(xList[0].getElementsByTagName("HOTEL_DESCRIPTION")[0].childNodes[0]!=undefined)
		{
			hotelDesc = xList[0].getElementsByTagName("HOTEL_DESCRIPTION")[0].childNodes[0].nodeValue;
		}
		
		if(xList[0].getElementsByTagName("LATITUDE")[0].childNodes[0]!=undefined)
		{
			hotellat = xList[0].getElementsByTagName("LATITUDE")[0].childNodes[0].nodeValue;
		}
		
		if(xList[0].getElementsByTagName("LONGITUDE")[0].childNodes[0]!=undefined)
		{
			hotellng = xList[0].getElementsByTagName("LONGITUDE")[0].childNodes[0].nodeValue;
		}
		
		str+="<div id='iLyteboxWrapper'> </div>";
		str+="<div id='iLytebox' class='iLyteboxSml'>";
			str+='<span class="floatright"> <a id="iLyteboxClose" href="javascript:;"> </a> </span>';
				str+='<h5 class="heading">'+hotelName+'</h5>';	
				if(hotelStar == "1"){
					str+='<img src="/tcportal/images/hotel/1star.gif" style="padding-top:4px;" />';
				}else if(hotelStar == "2"){
					str+='<img src="/tcportal/images/hotel/2star.gif" style="padding-top:4px;" />';
				}else if(hotelStar == "3"){
					str+='<img src="/tcportal/images/hotel/3star.gif" style="padding-top:4px;" />';
				}else if(hotelStar == "4"){
					str+='<img src="/tcportal/images/hotel/4star.gif" style="padding-top:4px;" />';
				}else if(hotelStar == "5"){
					str+='<img src="/tcportal/images/hotel/5star.gif" style="padding-top:4px;" />';
				}else{
					str+='';
				}
				str+='<span class="clear"> </span>';
				str+='<h6></h6><div class="desc"> </div>';
			
			str+="<div class='tab-content-wrapper pattern_sml' >";
				str+="<div class='tabsContainer'>";
					str+="<ul class='tabs'>";
						str+="<li id='details' class='tab-1'>";
							str+="<a href='javascript:;' title='Details'><span>Details</span></a>";
						str+="</li>";
						str+="<li id='facilities' class='tab-2'>";
							str+="<a href='javascript:;' title='Facilities'><span>Facilities</span></a>";
						str+="</li>";
						str+="<li id='guest' class='tab-3'>";
							str+="<a href='javascript:;' title='Guest Reviews'><span>Guest Reviews</span></a>";
						str+="</li>";
				        str+="<li id='map' class='tab-4'>";
				        str+="<a href='javascript:;' onclick='callMap("+hotelCode+")' title='Map'><span>Map</span></a>";
				       	str+="</li>";
				        
				    str+="</ul>";
				str+="</div>";
				
				
				str+="<div class='tabsContentContainer'>";
					str+="<div class='tab-1-content'>";
						str+="<div class='srcoll scroll-pane-sml'>";
							str+="<p>"+hotelDesc+"</p>";
						str+="</div>";
					str+="</div>";
		      	
					str+="<div class='tab-2-content'>";
						str+="<div class='srcoll scroll-pane-sml'>";
						if(facilityLength>0)
						{
							for(var f=0; f<facilityLength; f++)
							{
								var facilityType = facilityList[f].getElementsByTagName("TYPE")[0].childNodes[0].nodeValue;
								var description = facilityList[f].getElementsByTagName("DESCRIPTION")[0].childNodes[0].nodeValue;
								str+="<p>"+facilityType+"  --  "+description+"</p>";
								str+="<div class='line' style='padding-bottom:0px;'>    </div>";
							}
						}
						else
						{
							str+="<p>Facility details are not available.</p>";
						}
						str+="</div>";
					str+="</div>";
					str+="<div class='tab-3-content'>";
						str+="<div class='srcoll scroll-pane-sml'>";
						if(reviewsLength>0)
						{
							for(var r=0; r<reviewsLength; r++)
							{
								var comments = reviewsList[r].getElementsByTagName("COMMENTS")[0].childNodes[0].nodeValue;
								var rating = reviewsList[r].getElementsByTagName("RATING")[0].childNodes[0].nodeValue;
								str+="<p>"+comments;
								str+="</p>";
								str+="<div class='lyteboxRating'>";
									str+="<span>Rating : </span>";
									if(rating == "1"){
										str+='<img src="/tcportal/images/hotel/1star.gif" style="padding-top:4px;" />';
									}else if(rating == "2"){
										str+='<img src="/tcportal/images/hotel/2star.gif" style="padding-top:4px;" />';
									}else if(rating == "3"){
										str+='<img src="/tcportal/images/hotel/3star.gif" style="padding-top:4px;" />';
									}else if(rating == "4"){
										str+='<img src="/tcportal/images/hotel/4star.gif" style="padding-top:4px;" />';
									}else if(rating == "5"){
										str+='<img src="/tcportal/images/hotel/5star.gif" style="padding-top:4px;" />';
									}else{
										str+='';
									}
								str+="</div>";
								str+="<div class='line' style='padding-bottom:0px;'>    </div>";
							}
						}
						else
						{
							str+="<p>Guest comments are not available.</p>";
						}
						str+="</div>";
					str+="</div>";
				if(hotellat!="" || hotellng!="" )
		        {   
					str+="<div class='tab-4-content'>";
					str+="<div id='map_domcanvas' class='srcoll scroll-pane-sml'>";
					str+="</div>";
					str+="</div>";
		        }
				str+="</div>";
			str+="</div>";
		str+="</div>";
	}
	document.getElementById("displayAccomDetails").innerHTML = str;
	
	/**display iLytebox details*/
	$g(document).ready(function(){ 
		winWidth = $g(window).width();
		winHeight = $g(window).height();
		winBodyHeight = $g(document).height()-(-85);
		
		if( jQuery('.photoGalThumb li').length ){
		photoGal();
		}
		jQuery('.next').click(function(){
			photoGalNextPrev(1);
		});
		jQuery('.prev').click(function(){	
			photoGalNextPrev(-1);
		});

		iLyteboxTop = (winHeight-450)/2;
		iLyteboxLeft = (winWidth-750)/2;
		$g('#iLyteboxWrapper, #iLytebox').hide();
		$g('#iLyteboxClose').click(function(){
			$g('#iLyteboxWrapper, #iLytebox').hide();
		});
		
		if($g('.srcoll').length)
		{
			$g('.srcoll').jScrollPane();
		}
		
	});
	
	
	iLyteBox(globalOpenTab);
	if(hotellat!="" || hotellng!="" )
	{  
	   initialize_dommap(hotellat, hotellng, hotelName, address1, address2);
	}
	
}

function goToAddon(index)
{
	holidayChangeTab(7);
	addonToursTab();
	$g("#cont2 .addcon").eq(index).fadeIn().siblings("#cont2 .addcon").hide();
	$g("#tab2.addmid li").eq(index).addClass("active").siblings().removeClass("active");
}

function jumpToVideo(itinIndex,videoId)
{	
	
	var addonFlag=pkgDetails.getElementsByTagName("PACKAGE_ADDON")[0];
	if(addonFlag==null){
		$g("#maintab7").html("");
		holidayChangeTab(7);
	}
	else{
		$g("#maintab8").html("");
		holidayChangeTab(8);
	}
	videoTab();
	play(videoId);
	$g("html,body").animate({
		scrollTop:$g(".vidout").eq(0).offset().top
	},1000);
	$g("#cont1 .vidcon").eq(itinIndex).fadeIn().siblings("#cont1 .vidcon").hide();
	var addonFlag=pkgDetails.getElementsByTagName("PACKAGE_ADDON")[0];
	if(addonFlag==null)
	{
		$g("#tab7.addmid li").eq(itinIndex).addClass("active").siblings().removeClass("active");		
		$g("#tab7.addmid li").eq(itinIndex).addClass("active").siblings("#tab7.addmid li").removeClass("active")
	}
	else
	{
		$g("#tab8.addmid li").eq(itinIndex).addClass("active").siblings().removeClass("active");		
		$g("#tab8.addmid li").eq(itinIndex).addClass("active").siblings("#tab8.addmid li").removeClass("active")
	}
	
		
}

//function to play youtube videos
function play(videoID) {
	var playVideo = document.getElementById("player");
    playVideo.src="http://www.youtube.com/embed/"+videoID+"?enablejsapi=1&amp;autoplay=1"
    
}

function openFly()
{
	$g(".saveAndContinueButton").hide();
	setTimeout(function(){	
		$g(".statebg .newListSelected").css("position","relative");
		$g(".statebg .newListSelected .SSContainerDivWrapper").css("display","block");
		$g(".statebg .newListSelected .SSContainerDivWrapper").css("visibility","visible");
	}, 200);
}

/**** holidays page optimization starts ****/

/**** Inclusions Tab starts ****/
function inclusionTab()
{
	$g("#maintab1").html("");
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var inclusionString="";
	var pkgType="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION").length;
		if(pkgSubType=='FIT')
		{
			inclusionString+="<div class='pkgType pattern_02' id='pkgType1'>";
			inclusionString+="<fieldset class='holidaytype'>";
			inclusionString+="<span class='floatleft' > Package Type: </span>";
			for(var i=0;i<pkgLen;i++)
			{
				var inclusionTag=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[i];
				pkgType=inclusionTag.getElementsByTagName("PACKAGE_TYPE")[0].firstChild.nodeValue;
				if(pkgType=='Standard')
				{
					inclusionString+="<input type='radio' name='pkgTypeTab' id='standardTab'  class='all' value='standard' />";
					inclusionString+="<label for='standardTab' id='stdLbl' onclick=\"inclusionDetails('stdLbl','Standard')\" >Standard</label>";
				}
				if(pkgType=='Delux')
				{
					inclusionString+="<input type='radio' name='pkgTypeTab' id='deluxeTab' value='deluxe' />";
					inclusionString+="<label for='deluxeTab' id='dlxLbl' onclick=\"inclusionDetails('dlxLbl','Delux')\" >Deluxe</label>";
				}	
				if(pkgType=='Premium')
				{
					inclusionString+="<input type='radio' name='pkgTypeTab'  id='premiumTab' value='premium' />";
					inclusionString+="<label for='premiumTab' id='premiumLbl' onclick=\"inclusionDetails('premiumLbl','Premium')\" >Premium</label>";
				}
			}
			inclusionString+="</fieldset>";
			inclusionString+="<span class='clear' > </span>";
			inclusionString+="</div>";
			inclusionString+="<div class='inclusionDetails'> </div>"
		}
		else
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
				inclusionString+=inclusionSubDetails('stdLbl',pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]);
			
		}
		
	$g("#maintab1").html(inclusionString);
	$g('input:radio').stylecheck();
	$g("#li_maintab_1").click(function(){
		$g(this).addClass("first");
	});
	if(pkgSubType=='GIT')
	{
		$g("#li_maintab_1").click(function(){
			$g(this).addClass("first");
		});
		$g(".headLink").click(function(){
			$g(this).next().slideToggle().siblings(".cont").slideUp();//this is for sliding
			$g(this).toggleClass("active");
			$g(this).siblings(".headLink").removeClass("active"); //this is for slidding arrow
			$g('html, body').animate({
				scrollTop: $g(this).offset().top
			}, 1000);
		});
	}
	if(pkgSubType=='FIT' || pkgSubType=='Addon')
	{
		if(document.getElementById("standardTab")!=null)
		{
			document.getElementById("standardTab").checked=true;
			$g("#stdLbl").removeClass('label-unchecked').addClass('label-checked');
		}
		else
		{
			if(document.getElementById("deluxeTab")!=null)
			{
				document.getElementById("deluxeTab").checked=true;
				$g("#dlxLbl").removeClass('label-unchecked').addClass('label-checked');
			}
			else
			{
				if(document.getElementById("premiumTab")!=null)
				{
					document.getElementById("premiumTab").checked=true;
					$g("#premiumLbl").removeClass('label-unchecked').addClass('label-checked');
				}
			}
		}
		if(document.getElementById("standardTab")!=null && document.getElementById("standardTab").checked==true)
		{
			inclusionDetails('stdLbl','Standard')
		}
		if(document.getElementById("deluxeTab")!=null && document.getElementById("deluxeTab").checked==true)
		{
			inclusionDetails('dlxLbl','Delux')
		}
		if(document.getElementById("premiumTab")!=null && document.getElementById("premiumTab").checked==true)
		{
			inclusionDetails('premiumLbl','Premium')
		}
	}
	
}

function inclusionDetails(className,pkg)
{
	var inclusionString="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION").length;
	for(var i=0;i<pkgLen;i++)
	{
		var inclusionTag=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[i];
		if(inclusionTag!=null)
		{
			pkgType=inclusionTag.getElementsByTagName("PACKAGE_TYPE")[0].firstChild.nodeValue;
			if(pkgType==pkg)
			{
				inclusionString+=inclusionSubDetails(className,inclusionTag);
			}
		}
	}
	$g(".inclusionDetails").html(inclusionString);
	
	$g(".headLink").click(function(){
		$g(this).next().slideToggle().siblings(".cont").slideUp();//this is for sliding
		$g(this).toggleClass("active");
		$g(this).siblings(".headLink").removeClass("active"); //this is for slidding arrow
		$g('html, body').animate({
			scrollTop: $g(this).offset().top
		}, 1000);
	});	
}

function inclusionSubDetails(className,inclusionTag)
{
	var inclusionString="";
	var pkgInclude=inclusionTag.getElementsByTagName("PACKAGE_INCLUDE")[0].firstChild;
	var country=inclusionTag.getElementsByTagName("COUNTRY");
	var pkgMeal=inclusionTag.getElementsByTagName("PACKAGE_MEAL");
	var pkgAccom=inclusionTag.getElementsByTagName("PACKAGE_ACCOM")[0].firstChild;
	var pkgAirfare=inclusionTag.getElementsByTagName("PACKAGE_AIRFARE")[0].firstChild;
	var pkgVisa=inclusionTag.getElementsByTagName("PACKAGE_VISA")[0].firstChild;
	var pkgInsurance=inclusionTag.getElementsByTagName("PACKAGE_INSURANCE")[0].firstChild;
	var pkgNotes=inclusionTag.getElementsByTagName("PACKAGE_NOTES")[0].firstChild;
	var pkgExclude=inclusionTag.getElementsByTagName("PACKAGE_EXCLUDE")[0].firstChild;
	var pkgNote=inclusionTag.getElementsByTagName("PACKAGE_THINGS_NOTE")[0].firstChild;
	inclusionString+="<div class='mainPkgDescBlock "+className+" tabCont' >";
	inclusionString+="<p class='headLink active' > <span>What your package includes</span> </p>";
	inclusionString+="<div class='cont' style='display:block;color: #666666; font-size: 1.1em;' >";
	if(pkgInclude!=null)
	{
		inclusionString+="<ul class='descList' style='padding-left: 14px;'>";
		inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_INCLUDE")[0]);
		inclusionString+="</ul>";
	}
		if(country[0]!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Sight Seeing</span>";
			inclusionString+="<span style='display:block;padding: 0 12px 20px;'>";
			
			for(var i=0;i<country.length;i++)
			{
				if(country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild!=null)
				{
					if(i==0)
						inclusionString+="<span class='countryheading' style='padding: 7px 0 0;'>"+country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild.nodeValue+"</span>";
					else
						inclusionString+="<span class='countryheading'>"+country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild.nodeValue+"</span>";
				}
				var city = country[i].getElementsByTagName("CITY");
				for(var j=0;j<city.length;j++)
				{
					if(city[j].getElementsByTagName("SIGHTSEEING_CITY")[0].firstChild!=null)
						inclusionString+="<li class='cityheading'>"+city[j].getElementsByTagName("SIGHTSEEING_CITY")[0].firstChild.nodeValue+"</li>";
					var name=city[j].getElementsByTagName("DATA");
					for(var k=0;k<name.length;k++)
					{
						if(name[k].getElementsByTagName("SIGHTSEEING_NAME")[0].firstChild!=null)
						{
							inclusionString+="<span class='sightName'>"+name[k].getElementsByTagName("SIGHTSEEING_NAME")[0].firstChild.nodeValue+"</span>";
							if(name[k].getElementsByTagName("SIGHTSEEING_TEXT")[0].firstChild!=null)
								inclusionString+="<span class='sightDesc'>"+nodeValue(name[k].getElementsByTagName("SIGHTSEEING_TEXT")[0])+"</span>";
						}
					}
				}
			}
			inclusionString+="</span>";
		}
		if(pkgAccom!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Accommodation</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_ACCOM")[0]);
			inclusionString+="</ul>";
		}
		if(pkgMeal[0]!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Meal</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			for(var i=0;i<pkgMeal.length;i++)
			{
				inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_MEAL")[i]);
			}
			inclusionString+="</ul>";
		}
		if(pkgAirfare!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Air Fare</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_AIRFARE")[0]);
			inclusionString+="</ul>";
		}
		if(pkgVisa!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Visa</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_VISA")[0]);
			inclusionString+="</ul>";
		}
		if(pkgInsurance!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Insurance</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_INSURANCE")[0]);
			inclusionString+="</ul>";
		}
		if(pkgNotes!=null)
		{
			inclusionString+="<span class='inclusionHeading'>Notes</span>";
			inclusionString+="<ul class='descList' style='padding: 18px 20px 20px 14px;'>";
			inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_NOTES")[0]);
			inclusionString+="</ul>";
		}
	
	inclusionString+="<span class='clear' > </span> </div>";
	//inclusionString+="<p class='divider' > </p>";
	inclusionString+="<p class='headLink'> <span>What your package doesn't include</span> </p>";
	inclusionString+="<div class='cont' style='display:none;color: #666666; font-size: 1.1em;'>";
	if(pkgExclude!=null)
	{
		inclusionString+="<ul class='descList' style='padding-left: 14px;'>";
		inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_EXCLUDE")[0]);
		inclusionString+="</ul>";
		
	}
	inclusionString+="</div>";
	//inclusionString+="<p class='divider'> </p>";
	inclusionString+="<p class='headLink'> <span>Things to note</span> </p>";
	inclusionString+="<div class='cont' style='display:none;color: #666666; font-size: 1.1em;'>";
	if(pkgNote!=null)
	{
		inclusionString+="<ul class='descList pt7' style='padding-left: 14px;'>";
		inclusionString+=nodeValue(inclusionTag.getElementsByTagName("PACKAGE_THINGS_NOTE")[0]);
		inclusionString+="</ul>";
	}
	
	inclusionString+="</div>";
	inclusionString+="<span class='clear' > </span> </div>";
	return inclusionString;
}
/**** Inclusions Tab ends ****/
/**** Accomodations Tab starts ****/
var loadFlag=false;
function accomodationTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var accomString="";
	if(!loadFlag)
	{
		var accomElementOne = document.createElement("script");
		accomElementOne.type = 'text/javascript';
		accomElementOne.src ='/tcportal/js/holiAbroad/js/jScrollPane2.js';
		document.getElementsByTagName('body')[0].appendChild(accomElementOne);
		
		var accomElementTwo = document.createElement("script");
		accomElementTwo.type = 'text/javascript';
		accomElementTwo.src ='/tcportal/js/holiAbroad/js/jquery.mousewheel.js';
		document.getElementsByTagName('body')[0].appendChild(accomElementTwo);
		
		var accomElementThree = document.createElement("script");
		accomElementThree.type = 'text/javascript';
		accomElementThree.src ='/tcportal/dwr/interface/HotelCityList.js';
		document.getElementsByTagName('body')[0].appendChild(accomElementThree);

		document.oldWrite = document.write; 
        document.write = function(text)
        {                                 
            var parser = new DOMParser();
            var element = parser.parseFromString(text, "text/xml");           
            var child = element.firstChild;                
            var element = document.createElement("script");
            element.src = child.getAttribute('src');
            element.type= "text/javascript";            
            document.getElementsByTagName("head")[0].appendChild(element);                          
            document.write = document.oldWrite;
        };     
		var mapElement = document.createElement("script");
		mapElement.type = 'text/javascript';
		var googlKey=pkgDetails.getElementsByTagName("GOOGLE_MAP_KEY")[0].firstChild.nodeValue;
		mapElement.src ='http://maps.google.com/maps?file=api&v=2&key='+googlKey;
		document.getElementsByTagName('head')[0].appendChild(mapElement);
		
		loadFlag=true;
	}
	
	if(pkgSubType=='FIT')
	{
		accomString+='<div class="pkgType" id="pkgType2">';
		accomString+='<fieldset class="holidaytype">';
		accomString+='<span class="floatleft" > Package Type: </span>';
		if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0]!=null)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("STD_COUNT")[0]!=null)
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("STD_COUNT")[0].firstChild.nodeValue=='1')
				{
					accomString+='<input type="radio" name="pkgType" id="standard" class="all" />';
					accomString+='<label for="standard" id="stdLbl_2"  onclick="getAccomodationDetails(\'stdLbl_2\',0)" class="label-checked" >Standard</label>';
				}
			}
			if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("DEL_COUNT")[0]!=null)
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("DEL_COUNT")[0].firstChild.nodeValue=='1')
				{
					accomString+='<input type="radio" name="pkgType" id="deluxe"  />';
					accomString+='<label for="deluxe" id="dlxLbl_2" onclick="getAccomodationDetails(\'dlxLbl_2\',1)"  >Deluxe</label>';
				}
			}
			if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("PRE_COUNT")[0]!=null)
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("PRE_COUNT")[0].firstChild.nodeValue=='1')
				{
					accomString+='<input type="radio" name="pkgType"  id="premium" />';
					accomString+='<label for="premium"  id="premiumLbl_2" onclick="getAccomodationDetails(\'premiumLbl_2\',2)" >Premium</label>';
				}
			}
		}
		
		accomString+='</fieldset>';
		accomString+='<span class="clear"> </span> </div>';
	}
	if(pkgSubType=='GIT')
	{
		var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS").length;
		accomString+='<p class="titleSummery" >Summary</p>';
		accomString+='<div class="summeryTable">';
		accomString+='<table width="100%" border="0" cellspacing="0" cellpadding="0">';
		accomString+='<thead ><tr><th width="300" class="pl10">Hotel Envisaged</th>';
		accomString+='<th width="170">Destination</th>';
		accomString+='<th width="130">Nights</th><th> </th> </tr></thead> <tbody>';
		for(var i=0;i<pkgLen;i++)
		{
			var accomTag=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i];
			if(accomTag!=null)
				accomString+=accomodationSummary(accomTag);
		}
		accomString+='</tbody></table></div>';
		
		 
		for(var i=0;i<pkgLen;i++)
		{
			var accomTag=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i];
			if(accomTag!=null)
			{
				if(pkgtype=='0') // to hide hotel details of international git
				{
					accomString+=accomodationSubDetails(accomTag);
				}
			}
		}
	}
	else
	{
		accomString+='<div class="details">';
		accomString+='</div>';
	}
	
	$g("#maintab2").html(accomString);
	$g('input:radio').stylecheck();
	
	/*---------- summeryTable tab effect ------*/
	if(pkgtype=='1' && pkgSubType=='GIT')
	{
		// do nothing
	}
	else
	{
		$g(".summeryTable tr").click(function(){
		$g('html, body').animate({
		scrollTop: $g("." + $g(this).attr("class") + "_detail").offset().top - 10
		}, 500);
		});
	}
	
	if(pkgSubType=='FIT' || pkgSubType=='Addon')
	{
		if(document.getElementById("standard")!=null)
		{
			document.getElementById("standard").checked=true;
			$g("#stdLbl_2").removeClass('label-unchecked').addClass('label-checked');
		}
		else
		{
			if(document.getElementById("deluxe")!=null)
			{
				document.getElementById("deluxe").checked=true;
				$g("#dlxLbl_2").removeClass('label-unchecked').addClass('label-checked');
			}
			else
			{
				if(document.getElementById("premium")!=null)
				{
					document.getElementById("premium").checked=true;
					$g("#premiumLbl_2").removeClass('label-unchecked').addClass('label-checked');
				}
			}
		}
		if(document.getElementById("standard")!=null && document.getElementById("standard").checked==true)
		{
			getAccomodationDetails('stdLbl_2',0)
		}
		if(document.getElementById("deluxe")!=null && document.getElementById("deluxe").checked==true)
		{
			getAccomodationDetails('dlxLbl_2',1)
		}
		if(document.getElementById("premium")!=null && document.getElementById("premium").checked==true)
		{
			getAccomodationDetails('premiumLbl_2',2)
		}
	}
	
}

function getAccomodationDetails(className,accomType)
{
	var accomString="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS").length;
	accomString+='<div class="'+className+' tabCont">';
	accomString+='<p class="titleSummery" >Summary</p>';
	accomString+='<div class="summeryTable">';
	accomString+='<table width="100%" border="0" cellspacing="0" cellpadding="0">';
	accomString+='<thead ><tr><th width="300" class="pl10">Hotel Envisaged</th>';
	accomString+='<th width="170">Destination</th>';
	accomString+='<th width="130">Nights</th><th> </th> </tr></thead> <tbody>';
	for(var i=0;i<pkgLen;i++)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i]!=null)
		{
			var accomTag=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i];
			if(accomTag.getElementsByTagName("ACCOM_TYPE")[0].firstChild.nodeValue==accomType)
			{
				accomString+=accomodationSummary(accomTag);
			}
		}
	}
	accomString+='</tbody></table></div>';
	if(pkgtype=='1' && pkgSubType=='GIT')
	{
		accomString+='';
	}
	else
	{
		for(var i=0;i<pkgLen;i++)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i]!=null)
			{
				var accomTag=pkgDetails.getElementsByTagName("PACKAGE_ACCOMODATION")[0].getElementsByTagName("HOTEL_DETAILS")[i];
				if(accomTag.getElementsByTagName("ACCOM_TYPE")[0].firstChild.nodeValue==accomType)
				{
					accomString+=accomodationSubDetails(accomTag);
				}
			}
		}
	}
	accomString+='<span class="clear" > </span>';
	accomString+='</div>';
	$g(".details").html(accomString)
	if(pkgtype=='1' && pkgSubType=='GIT')
	{
		// do nothing
	}
	else
	{
		$g(".summeryTable tr").click(function(){
		$g('html, body').animate({
		scrollTop: $g("." + $g(this).attr("class") + "_detail").offset().top - 10
		}, 500);
		});
	}
}

function accomodationSummary(accomTag)
{
	var accomString="";
	if(pkgtype=='1' && pkgSubType=='GIT')
	{
		accomString+='<tr class="'+accomTag.getElementsByTagName("HOTEL_CLASS")[0].firstChild.nodeValue+'" style="cursor:auto;" >';
	}
	else
	{
		accomString+='<tr class="'+accomTag.getElementsByTagName("HOTEL_CLASS")[0].firstChild.nodeValue+'"  >';
	}
	accomString+='<td class="pl10"> <p>'+accomTag.getElementsByTagName("HOTEL_NAME")[0].firstChild.nodeValue+'  / <b>Similar</b> </p>';
	if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild!=null)
	{
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue=='1')
			accomString+='<img src="/tcportal/images/hotel/1star.gif" class="rating" alt="" />';
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue=='2')
			accomString+='<img src="/tcportal/images/hotel/2star.gif" class="rating" alt="" />';
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue=='3')
			accomString+='<img src="/tcportal/images/hotel/3star.gif" class="rating" alt="" />';
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue=='4')
			accomString+='<img src="/tcportal/images/hotel/4star.gif" class="rating" alt="" />';
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue=='5')
			accomString+='<img src="/tcportal/images/hotel/5star.gif" class="rating" alt="" />';
	}
	accomString+='</td>';
	accomString+='<td>'+accomTag.getElementsByTagName("LOCATION")[0].firstChild.nodeValue+'</td>';
	accomString+='<td>';
	if(accomTag.getElementsByTagName("NO_OF_NIGHTS")[0].firstChild.nodeValue=='0')
		accomString+='N/A';
	else if(accomTag.getElementsByTagName("NO_OF_NIGHTS")[0].firstChild.nodeValue=='1')
		accomString+=accomTag.getElementsByTagName("NO_OF_NIGHTS")[0].firstChild.nodeValue+' night';
	else
		accomString+=accomTag.getElementsByTagName("NO_OF_NIGHTS")[0].firstChild.nodeValue+' nights';
	accomString+='</td>';
	accomString+='<td> </td>';
	accomString+='</tr>';
	return accomString;
}
function accomodationSubDetails(accomTag)
{
	var accomString="";
	var hotelId="";
	var hotelName="";
	var hotelRating="";
	var location="";
	var hotelDesc="";
	var imagePath="";
	if(accomTag.getElementsByTagName("HOTEL_ID")[0]!=null)
	{
		if(accomTag.getElementsByTagName("HOTEL_ID")[0].firstChild!=null)
		{
			hotelId=accomTag.getElementsByTagName("HOTEL_ID")[0].firstChild.nodeValue;
		}
	}
	if(accomTag.getElementsByTagName("HOTEL_NAME")[0]!=null)
	{
		if(accomTag.getElementsByTagName("HOTEL_NAME")[0].firstChild!=null)
		{
			hotelName=accomTag.getElementsByTagName("HOTEL_NAME")[0].firstChild.nodeValue;
		}
	}
	if(accomTag.getElementsByTagName("HOTEL_RATING")[0]!=null)
	{
		if(accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild!=null)
		{
			hotelRating=accomTag.getElementsByTagName("HOTEL_RATING")[0].firstChild.nodeValue;
		}
	}
	if(accomTag.getElementsByTagName("LOCATION")[0]!=null)
	{
		if(accomTag.getElementsByTagName("LOCATION")[0].firstChild!=null)
		{	
			location=accomTag.getElementsByTagName("LOCATION")[0].firstChild.nodeValue;
		}
	}
	if(accomTag.getElementsByTagName("HOTEL_DESCRIPTION")[0]!=null)
	{
		if(accomTag.getElementsByTagName("HOTEL_DESCRIPTION")[0].firstChild!=null)
		{
			hotelDesc=accomTag.getElementsByTagName("HOTEL_DESCRIPTION")[0].firstChild.nodeValue;
		}
	}
	if(accomTag.getElementsByTagName("IMAGE_PATH")[0]!=null)
	{
		if(accomTag.getElementsByTagName("IMAGE_PATH")[0].firstChild!=null)
		{
			imagePath=accomTag.getElementsByTagName("IMAGE_PATH")[0].firstChild.nodeValue;
		}
	}
	
	accomString+='<div class="'+accomTag.getElementsByTagName("HOTEL_DETAIL_CLASS")[0].firstChild.nodeValue+'">';
	accomString+='<div class="detailLt floatleft" >';
	accomString+='<h5 class="title floatleft" > <img src="/tcportal/images/holiAbroad/images/hotel/right-thumb-img.gif" alt="" /> <span>'+hotelName+'</span>';
	if(hotelRating=='1')
		accomString+='<img src="/tcportal/images/hotel/1star.gif" style="padding-top:4px;" alt="" />';
	if(hotelRating=='2')
		accomString+='<img src="/tcportal/images/hotel/2star.gif" style="padding-top:4px;" alt="" />';
	if(hotelRating=='3')
		accomString+='<img src="/tcportal/images/hotel/3star.gif" style="padding-top:4px;" alt="" />';
	if(hotelRating=='4')
		accomString+='<img src="/tcportal/images/hotel/4star.gif" style="padding-top:4px;" alt="" />';
	if(hotelRating=='5')
		accomString+='<img src="/tcportal/images/hotel/5star.gif" style="padding-top:4px;" alt="" />';
	accomString+='</h5>';
	//accomString+='<p class="guestRate floatright" > <img src="/tcportal/images/holiAbroad/images/hotel/ico_02.gif" alt="" /> <span>Guest Rating: 4.5/5 </span> </p>';
	accomString+='<span class="clear" > </span>';
	accomString+='<h6 class="subTitle" >Destination : '+location+' </h6>';
	accomString+='<p class="desc" >'+hotelDesc+'</p>';
	accomString+='<div class="facilityList" >';
	accomString+='<h6>Facilities</h6>';
	accomString+='<ul>';
	accomString+='<li> <img src="/tcportal'+accomTag.getElementsByTagName("HEALTH_CLUB")[0].firstChild.nodeValue+'" alt="Gym" title="Gym" /> </li>';
	accomString+='<li> <img src="/tcportal'+accomTag.getElementsByTagName("BAR_LOUNGE")[0].firstChild.nodeValue+'" alt="Bar" title="Bar" /> </li>';
	accomString+='<li> <img src="/tcportal'+accomTag.getElementsByTagName("RESTAURANT")[0].firstChild.nodeValue+'" alt="Restaurant" title="Restaurant" /> </li>';
	accomString+='<li> <img src="/tcportal'+accomTag.getElementsByTagName("SWIMMING")[0].firstChild.nodeValue+'" alt="Swimming" title="Swimming" /> </li>';
	accomString+='<li> <img src="/tcportal'+accomTag.getElementsByTagName("INTERNET")[0].firstChild.nodeValue+'" alt="Internet" title="Internet" /> </li>';
	accomString+='</ul>';
	accomString+='<span class="clear" > </span> </div>';
	if(pkgtype=='0')
	{
		accomString+='<ul class="facilityTxtList">';
		accomString+='<li class="dtl"> <a href="#" onclick="iLyteBox_call(\'details\', '+hotelId+'); return false">Details</a> </li>';
		accomString+='<li class="facility"> <a href="#" onclick="iLyteBox_call(\'facilities\', '+hotelId+'); return false">Facilities</a> </li>';
		accomString+='<li class="guest"> <a href="javascript:;" onclick="iLyteBox_call(\'guest\','+hotelId+'); return false">Guest Reviews</a> </li>';
		accomString+='<li class="map"> <a href="#" onclick="iLyteBox_call(\'map\', '+hotelId+'); return false">Map</a> </li>';
		accomString+='</ul>';
	}
	accomString+='</div>';
	if(imagePath!="")
	{
		accomString+='<div class="pkgSlider_banner floatright" >';
		accomString+='<div class="" >';
		accomString+='<div class="items_01">';
		accomString+='<div class="item_01"> <img src="'+imagePath+'" alt="" title="" width="273" height="215" /> </div>';
		accomString+='</div>';
		accomString+='</div>';
		accomString+='</div>';
	}
	accomString+='<span class="clear" > </span>';
	accomString+='</div>';
	return accomString;

}
/**** Accomodations Tab ends ****/
/**** Itinerary Tab starts ****/
function itineraryTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var itineraryString="";
	var itineraryTag="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_ITINERARY").length;
	itineraryString+='<div class="addonout">';
	itineraryString+='<div class="addonout_left">';
	itineraryString+='<div class="addlink">';
	itineraryString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon1.jpg" width="204" height="9" alt="" /> </span>';
	itineraryString+='<div id="tab3" class="addmid">';
	itineraryString+='<ul>';
	for(var i=0;i<pkgLen;i++)
	{
		itineraryTag=pkgDetails.getElementsByTagName("PACKAGE_ITINERARY")[i];
		if(itineraryTag!=null)
			itineraryString+='<li> <a href="javascript:;">'+itineraryTag.getElementsByTagName("ITINERARY")[0].firstChild.nodeValue+'</a> </li>';
	}
	itineraryString+='</ul>';
	itineraryString+='</div>';
	itineraryString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon2.jpg" width="204" height="9" alt="" /> </span> </div>';
	itineraryString+='</div>';
	itineraryString+='<div id="cont1" class="addonout_right">';
	for(var i=0;i<pkgLen;i++)
	{
		itineraryTag=pkgDetails.getElementsByTagName("PACKAGE_ITINERARY")[i];
		if(itineraryTag!=null)
		{
			itineraryString+='<div class="addcon">';
			itineraryString+='<div class="addcon_left texrig ">';
			itineraryString+='<h1>'+itineraryTag.getElementsByTagName("ITINERARY")[0].firstChild.nodeValue;
			if(itineraryTag.getElementsByTagName("ITINERARY_INDEX")[0]!=null && itineraryTag.getElementsByTagName("JUMP_VIDEO_ID")[0]!=null)
			{
				if(""!=itineraryTag.getElementsByTagName("ITINERARY_INDEX")[0].firstChild.nodeValue)
				{
					itineraryString+='<span style="font-size:0.9em;font-weight:normal;"> (<a href="javascript:;" onclick="jumpToVideo(\''+itineraryTag.getElementsByTagName("ITINERARY_INDEX")[0].firstChild.nodeValue+'\',\''+itineraryTag.getElementsByTagName("JUMP_VIDEO_ID")[0].firstChild.nodeValue+'\');">Video available</a>) </span>';
				}
			}
			itineraryString+='</h1>';
			itineraryString+='<p>'+itineraryTag.getElementsByTagName("ITINERARY_DETAILS")[0].firstChild.nodeValue+'</p>';
			itineraryString+='</div>';
			itineraryString+='<div class="addcon_right imgleft"> <img src="/tcportal'+itineraryTag.getElementsByTagName("ITINERARY_IMAGE")[0].firstChild.nodeValue+'" width="194" height="148" title="" alt="" /> </div>';
			itineraryString+='</div>';
		}
	}
	itineraryString+='</div>';
	itineraryString+='</div>';
	$g("#maintab3").html(itineraryString);
	
	/*** Scrolling for Itineary  Tab starts here ***/

	$g("#tab3.addmid li").click(function(){
		var currElemIndex=$g(this).index();
		$g("html,body").animate({
			scrollTop:$g(".addonout_right").children(".addcon").eq(currElemIndex).offset().top
		},1000);
		
	});
	
	/*** Scrolling for Itineary  Tab ends here ***/
	$g("#tab3.addmid li").click(function()
	{		
		$g(this).addClass("active").siblings("#tab3.addmid li").removeClass("active")
	}).eq(0).click(); 
}
/**** Itinerary Tab ends ****/
/**** Destination Tab starts ****/
function destinationTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var destinationString="";
	var destinationTag="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_DESTINATION").length;
	destinationString+='<div class="addonout">';
	destinationString+='<div class="addonout_left">';
	destinationString+='<div class="addlink">';
	destinationString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon1.jpg" width="204" height="9" alt="" /> </span>';
	destinationString+='<div id="tab1" class="addmid">';
	destinationString+='<ul>';
	for(var i=0;i<pkgLen;i++)
	{
		destinationTag=pkgDetails.getElementsByTagName("PACKAGE_DESTINATION")[i];
		if(destinationTag!=null)
			destinationString+='<li class=""> <a href="javascript:;">'+destinationTag.getElementsByTagName("DESTINATION")[0].firstChild.nodeValue+'</a> </li>';
	}
	destinationString+='</ul></div>';
	destinationString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon2.jpg" width="204" height="9" alt="" /> </span> </div>';
	destinationString+='</div>';
	destinationString+='<div id="cont3" class="addonout_right">';
	for(var i=0;i<pkgLen;i++)
	{
		destinationTag=pkgDetails.getElementsByTagName("PACKAGE_DESTINATION")[i];
		if(destinationTag!=null)
		{
			destinationString+='<div class="addcon">';
			destinationString+='<div class="addcon_left texrig">';
			destinationString+='<h1>'+destinationTag.getElementsByTagName("DESTINATION")[0].firstChild.nodeValue+'</h1>';
			destinationString+='<p>'+destinationTag.getElementsByTagName("DESTINATION_DETAILS")[0].firstChild.nodeValue+'</p>';
			destinationString+='</div>';
			destinationString+='<div class="addcon_right imgleft"> <img src="/tcportal'+destinationTag.getElementsByTagName("DESTINATION_IMAGE")[0].firstChild.nodeValue+'" width="194" height="148" title="" alt="" /> </div>';
			destinationString+='</div>';
		}
	}
	destinationString+='</div> </div>';
	$g("#maintab5").html(destinationString);
	$g("#tab1.addmid li").click(function()
	{
		var index = $g(this).index();
		$g("#cont3 .addcon").eq(index).fadeIn().siblings("#cont3 .addcon").hide();
		$g(this).addClass("active").siblings().removeClass("active");
	}).eq(0).click();
}
/**** Destination Tab ends ****/
/**** Photos Tab starts ****/
var photoloadFlag=false;

function photosTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	if(!photoloadFlag)	
	{
		var photoElementOne = document.createElement("script");
		photoElementOne.type = 'text/javascript';
		photoElementOne.src ='/tcportal/js/holiAbroad/js/jScrollPane2.js';
		document.getElementsByTagName('body')[0].appendChild(photoElementOne);
		
		var photoElementTwo = document.createElement("script");
		photoElementTwo.type = 'text/javascript';
		photoElementTwo.src ='/tcportal/js/holiAbroad/js/jquery.mousewheel.js';
		document.getElementsByTagName('body')[0].appendChild(photoElementTwo);
		photoloadFlag=true;
	}
	
	var photoString="";
	var photoTag="";
	var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_PHOTOS").length; 
	
	if("true"==pkgDetails.getElementsByTagName("AVAILABILITY")[0].firstChild.nodeValue)
	{
		
		photoString+='<div class="topWhite"> </div>';
		photoString+='<div class="midWhite">';
		photoString+='<div class="photoGalWrapper_new">';
		photoString+='<div class="overlayPhotoGal_new" title="Holidays"> </div>';
		photoString+='<div class="photoGalLarge_new"> <img src="" alt="BigImage" title="BigImage" height="271px" width="497px" /> </div>';
		photoString+='<div class="photoGalCont_new">';
		photoString+='<p style="float:left;width:408px;height:auto;word-wrap:break-word;"> </p>';
		//photoString+='<div class="clear"> </div>';
		photoString+='<span style="display:block;margin-top:17px;"> <a href="javascript:;" class="next" title="Next"> </a>';
		photoString+='<a href="javascript:;" class="prev" style="display:none;" title="Previous"> </a> </span>';                    
		photoString+='</div>';
		photoString+='</div>';
		photoString+='<div class="srcoll scroll-pane w350_new">';
		photoString+='<div class="photoGalThumb_new">';
		photoString+='<ul>';
		for(var i=0;i<pkgLen;i++)
		{
			photoTag=pkgDetails.getElementsByTagName("PACKAGE_PHOTOS")[i];
			if(photoTag!=null)
			{
				var photoDesc="",sNo="",photoUrl="";
				if(photoTag.getElementsByTagName("PHOTO_DESCRIPTION")[0].firstChild!=null)
				{
					photoDesc=photoTag.getElementsByTagName("PHOTO_DESCRIPTION")[0].firstChild.nodeValue;
				}
				if(photoTag.getElementsByTagName("SNO")[0].firstChild!=null)
				{
					sNo=photoTag.getElementsByTagName("SNO")[0].firstChild.nodeValue;
				}
				if(photoTag.getElementsByTagName("PHOTO_URL")[0].firstChild!=null)
				{
					photoUrl=photoTag.getElementsByTagName("PHOTO_URL")[0].firstChild.nodeValue;
				}
				if(photoUrl!="")
				{
					photoString+='<li> <a href="javascript:;"  class="" id="photo'+sNo+'"> <span title=""> </span> <img src="/tcportal'+photoUrl+'" alt="" title="" width="156px" height="105px;" /> </a>'; 
					photoString+='</li>';
				}
			}
		}
		photoString+='</ul>';
		photoString+='</div> </div> <div class="clear"> </div> </div> <div class="bottomWhite"> </div>';
	}
	$g("#maintab6").html(photoString);
	for(var i=0;i<pkgLen;i++)
	{
		photoTag=pkgDetails.getElementsByTagName("PACKAGE_PHOTOS")[i];
		if(photoTag!=null)
		{
			var photoDesc="",sNo="";
			if(photoTag.getElementsByTagName("PHOTO_DESCRIPTION")[0].firstChild!=null)
			{
				photoDesc=photoTag.getElementsByTagName("PHOTO_DESCRIPTION")[0].firstChild.nodeValue;
			}
			if(photoTag.getElementsByTagName("SNO")[0].firstChild!=null)
			{
				sNo=photoTag.getElementsByTagName("SNO")[0].firstChild.nodeValue;
			}
			$g('.photoGalThumb_new a#photo'+sNo).attr('rel', photoDesc)
		}
	}
	var photoClassId="";
	if(pkgDetails.getElementsByTagName("PACKAGE_PHOTOS")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_PHOTOS")[0].getElementsByTagName("SNO")[0].firstChild!=null)
		{
			photoClassId = document.getElementById("photo"+pkgDetails.getElementsByTagName("PACKAGE_PHOTOS")[0].getElementsByTagName("SNO")[0].firstChild.nodeValue);
		}
	}
	if(photoClassId!=null)
	{
		photoClassId.className="sel";
	}
	if( $g('.photoGalWrapper').length ){
		photoGal_new();
	}
	if( $g('.photoGalWrapper_new').length ){
		photoGal_new();
	}
	$g('.next').click(function(){
		photoGalNextPrev_new('next');
	});
	$g('.prev').click(function(){
		photoGalNextPrev_new('prev');
	});
	if($g('.srcoll').length)
	{
		setTimeout(function(){
		$g('.srcoll').jScrollPane();
		},10);
	}
}
/**** Photos Tab ends ****/
/**** Addon Tours Tab starts ****/
function addonToursTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var addonString="";
	var addonTag="";
	var pkgLen=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON").length; 
	
	addonString+='<div class="addonout">';
	addonString+='<div class="addonout_left">';
	addonString+='<div class="addlink">';
	addonString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon1.jpg" width="204" height="9" alt="" /> </span>';
	addonString+='<div id="tab2" class="addmid">';
	addonString+='<ul>';
	for(var i=0;i<pkgLen;i++)
	{
		addonTag=pkgDetails.getElementsByTagName("PACKAGE_ADDON")[i];
		var pkgName="";
		if(addonTag!=null)
		{
			if(addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
			{
				pkgName=addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
			}
		}
		addonString+='<li class=""> <a href="javascript:;">'+pkgName+'</a> </li>';
	}
	addonString+='</ul>	</div>';
	addonString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon2.jpg" width="204" height="9" alt="" /> </span> </div>';
	addonString+='</div>';
	addonString+='<div id="cont2" class="addonout_right">';
	for(var i=0;i<pkgLen;i++)
	{
		addonTag=pkgDetails.getElementsByTagName("PACKAGE_ADDON")[i];
		var pkgName="",pkgDesc="",pkgId="",pkgImagePath="";
		if(addonTag!=null)
		{
			if(addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
			{
				pkgName=addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
			}
			if(addonTag.getElementsByTagName("PACKAGE_DISC")[0].firstChild!=null)
			{
				pkgDesc=addonTag.getElementsByTagName("PACKAGE_DISC")[0].firstChild.nodeValue;
			}
			if(addonTag.getElementsByTagName("PACKAGE_ID")[0].firstChild!=null)
			{
				pkgId=addonTag.getElementsByTagName("PACKAGE_ID")[0].firstChild.nodeValue;
			}
			if(addonTag.getElementsByTagName("PACKAGE_IMAGE_PATH")[0].firstChild!=null)
			{
				pkgImagePath=addonTag.getElementsByTagName("PACKAGE_IMAGE_PATH")[0].firstChild.nodeValue;
			}
		}
			addonString+='<div class="addcon">';
			addonString+='<div class="addcon_left texrig">';
			addonString+='<h1>'+pkgName+'</h1>';
			addonString+='<p>'+pkgDesc+'</p>';
			if(pkgtype=='0')
			{
				addonString+='<p> <a target="_blank" href="/tcportal/Pkg/'+pkgId+'"> View Package Details </a> </p>';
			}
			else if(pkgtype=='1')
			{
				addonString+='<p> <a target="_blank" href="/tcportal/Pkg/'+pkgId+'"> View Package Details </a> </p>';
			}
			addonString+='</div>';
			addonString+='<div class="addcon_right imgleft"> <img src="/tcportal'+pkgImagePath+'" width="194" height="148" title="" alt="" /> </div>';
			addonString+='</div>';
	}
	addonString+='</div> </div>';
	$g("#maintab7").html(addonString);
	$g("#tab2.addmid li").click(function()
	{
		var index = $g(this).index();		
		$g("#cont2 .addcon").eq(index).fadeIn().siblings("#cont2 .addcon").hide();
		$g(this).addClass("active").siblings().removeClass("active");		
	}).eq(0).click();
}
/**** Addon Tours Tab ends ****/
/**** Video Tab starts ****/
function videoTab()
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var videoString="";
	var videoTag="";
	var pkgLen=pkgDetails.getElementsByTagName("VIDEO")[0].getElementsByTagName("PACKAGE_VIDEO").length;
	var addonFlag=pkgDetails.getElementsByTagName("PACKAGE_ADDON")[0];
	videoString+='<div class="addonout">';
	videoString+='<div class="addonout_left">';
	videoString+='<div class="addlink">';
	videoString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon1.jpg" width="204" height="9" alt="" /> </span>';
	if(addonFlag==null)
		videoString+='<div id="tab7" class="addmid">';
	else
		videoString+='<div id="tab8" class="addmid">';
	videoString+='<ul>';
	for(var i=0;i<pkgLen;i++)
	{
		videoTag=pkgDetails.getElementsByTagName("PACKAGE_VIDEO")[i];
		var videoId="",videoName="";
		if(videoTag!=null)
		{
			if(videoTag.getElementsByTagName("VIDEO_ID")[0].firstChild!=null)
			{
				videoId=videoTag.getElementsByTagName("VIDEO_ID")[0].firstChild.nodeValue;
			}
			if(videoTag.getElementsByTagName("VIDEO_NAME")[0].firstChild!=null)
			{
				videoName=videoTag.getElementsByTagName("VIDEO_NAME")[0].firstChild.nodeValue;
			}
		}
		videoString+='<li class=""> <a href="javascript:;" onclick="play(\''+videoId+'\');">'+videoName+'</a> </li>';
	}
	videoString+='</ul>	</div>';
	videoString+='<span> <img src="/tcportal/images/holiAbroad/images/addcon2.jpg" width="204" height="9" alt="" /> </span> </div>';
	videoString+='</div>';
	videoString+='<div id="cont1" class="addonout_right vidout">';
	videoString+='<div class="addcon vidcon">';
	videoString+='<div class="addcon_right imgleft vid">';
	var vidName="";
	if(pkgDetails.getElementsByTagName("VIDEO")[0].getElementsByTagName("PACKAGE_VIDEO")[0].getElementsByTagName("VIDEO_ID")[0].firstChild!=null)
	{
		vidName=pkgDetails.getElementsByTagName("VIDEO")[0].getElementsByTagName("PACKAGE_VIDEO")[0].getElementsByTagName("VIDEO_ID")[0].firstChild.nodeValue;
	}
	videoString+='<iframe id="player" type="text/html" width="560" height="325" src="http://www.youtube.com/embed/'+vidName+'?enablejsapi=1" frameborder="0">';
	videoString+='</iframe>'; 
	videoString+='</div> </div> </div> </div>';
	if(addonFlag==null)
	{
		$g("#maintab7").html(videoString);
		$g("#tab7.addmid li").click(function()
		{		
			var index = $g(this).index();		
			$g("#cont1 .vidcon").eq(index).fadeIn().siblings("#cont1 .vidcon").hide();
			$g(this).addClass("active").siblings().removeClass("active");		
			$g(this).addClass("active").siblings("#tab7.addmid li").removeClass("active")
		}).eq(0).click();
	}
	else
	{
		$g("#maintab8").html(videoString);
		$g("#tab8.addmid li").click(function()
		{		
			var index = $g(this).index();		
			$g("#cont1 .vidcon").eq(index).fadeIn().siblings("#cont1 .vidcon").hide();
			$g(this).addClass("active").siblings().removeClass("active");		
			$g(this).addClass("active").siblings("#tab8.addmid li").removeClass("active")
		}).eq(0).click(); 
	}
	
}
/**** Video Tab ends ****/

function pricingTab(id)
{
	$g("#maintab6").html("");
	$g("#maintab8").html("");
	var pricingString="";
	$g(".saveAndContinueButton").hide();
	if(pkgSubType=='FIT')
	{
		pricingString+='<div class="pkgType" id="pkgType4">';
		pricingString+='<fieldset class="holidaytype">';
		pricingString+='<span class="floatleft" > Package Type: </span>';
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0]!=null)
		{
			var stdDates=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("STANDARD");
			if(stdDates[0]!=null)
			{
				if(stdDates[0].getElementsByTagName("HUB")!=null)
				{
					if(stdDates[0].getElementsByTagName("DATES")[0]!=null)
					{
						if(stdDates[0].getElementsByTagName("DATES")[0].firstChild!=null)
						{
							pricingString+='<input type="radio" name="pkgType_NEW1" id="pricestandard"  class="all" />';
							pricingString+='<label for="pricestandard" id="pricestdLbl1"  onclick="setAccomType(\'0\');">Standard</label>';
						}
					}
				}
			}
			else
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0]!=null)
				{
					if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD")[0].firstChild!=null)
					{
						pricingString+='<input type="radio" name="pkgType_NEW1" id="pricestandard"  class="all" />';
						pricingString+='<label for="pricestandard" id="pricestdLbl1"  onclick="setAccomType(\'0\');">Standard</label>';
					}
				}
			}
			var delDates=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DELUXE");
			if(delDates[0]!=null)
			{
				if(delDates[0].getElementsByTagName("HUB")!=null)
				{
					if(delDates[0].getElementsByTagName("DATES")[0]!=null)
					{
						if(delDates[0].getElementsByTagName("DATES")[0].firstChild!=null)
						{
							pricingString+='<input type="radio" name="pkgType_NEW1" id="pricedeluxe"  class="all" />';
							pricingString+='<label for="pricedeluxe" id="pricedlxLbl2" onclick="setAccomType(\'1\');" class="del" name="all1" >Deluxe</label>';
						}
					}
				}
			}
			else
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0]!=null)
				{
					if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE")[0].firstChild!=null)
					{
						pricingString+='<input type="radio" name="pkgType_NEW1" id="pricedeluxe"  class="all" />';
						pricingString+='<label for="pricedeluxe" id="pricedlxLbl2" onclick="setAccomType(\'1\');" class="del" name="all1" >Deluxe</label>';
					}
				}
			}
			var preDates=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("PREMIUM");
			if(preDates[0]!=null)
			{
				if(preDates[0].getElementsByTagName("HUB")!=null)
				{
					if(preDates[0].getElementsByTagName("DATES")[0]!=null)
					{
						if(preDates[0].getElementsByTagName("DATES")[0].firstChild!=null)
						{
							pricingString+='<input type="radio" name="pkgType_NEW1"  id="pricepremium" class="all" />';
							pricingString+='<label for="pricepremium"  id="pricepremiumLbl" onclick="setAccomType(\'2\');"  >Premium</label>';
						}
					}
				}
			}
			else
			{
				if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0]!=null)
				{
					if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM")[0].firstChild!=null)
					{
						pricingString+='<input type="radio" name="pkgType_NEW1"  id="pricepremium" class="all" />';
						pricingString+='<label for="pricepremium"  id="pricepremiumLbl" onclick="setAccomType(\'2\');"  >Premium</label>';
					}
				}
			}
		}
		pricingString+='</fieldset>	<span class="clear" > </span> </div>';
	}
	pricingString+='<div class="pricestdLbl bookOnlineContent">';
	pricingString+='<div class="innerprice innerprice_N" id="innerPrice">';
	pricingString+="<span class='priceHeader'>Calculate your package price here</span>";
	pricingString+='<span id="waitImg"> </span>';
	if(pkgSubType=='GIT')
	{
		pricingString+='<label id="hubLabel" style="margin-right:60px">Departure City: &nbsp;</label>';
		pricingString+='<div class="statebg" id="hubList">';
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("GITHUBS")[0]!=null)
		{
			if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("GITHUBS")[0].getElementsByTagName("GITHUB")[0]!=null)
			{
				var hubs=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("GITHUBS")[0].getElementsByTagName("GITHUB")[0].firstChild;
				if(hubs!=null)
				{
					var githubs=new Array();
					githubs=hubs.nodeValue.split(",");
					pricingString+='<select name="domesticfrom" class="customselectbox pckDates" id="hub" onchange="getGitDates()">';
					pricingString+='<option value="select">Select</option>';
					
					for(var i=0;i<githubs.length;i++)
					{
						pricingString+='<option value='+githubs[i]+'>';
						var github=new Array();
						github=githubs[i].split("$");
						pricingString+= github[1]+'</option>';
					}
					pricingString+='</select>';
				}
				pricingString+='</div><br/><br/><br/>';
			}
		}else{
			$g("#maintab4").html("<span style='font:bold 12px arial'>Departure City Not Available</span>");
			return false;
		}
	}
	else
	{
		pricingString+="<div id='departureCity'> </div>";
	}
	if(pkgSubType=='FIT' || fitFixed) // departure date to be shown before rooms for FIT
	{
		pricingString+='<label style="margin-right:60px">Departure Date: </label>';
		pricingString+='<div class="inputbg"> <input type="text" onfocus="this.blur()" name="pckgdate" class="ui-datepicker-trigger pckgdate" id="departDate" onchange="getAccomType();" readonly="true" style="width:124px !important;" /> </div>'; 
	} 
	if(pkgSubType=='FIT')
	{
		pricingString+='<div class="number_rooms number_rooms_N"> <p>Number of Rooms: </p>';
	}
	else
	{
		if(fitFixed){
			pricingString+='<br /> <br />';
		}
		pricingString+='<div class="number_rooms number_rooms_N" style="width:110px !important;"> <p>Number of Rooms: </p>';
	}
	pricingString+='<div class="newSelect">';
	pricingString+='<div class="room_selectbg">';
	pricingString+='<select name="numberofrooms" class="customselectbox num_rooms" onchange="num_rooms(2);" id="noOfRooms" style="visibility:hidden;">';
	pricingString+='<option value="1">1</option>';
	pricingString+='<option value="2">2</option>';
	pricingString+='<option value="3">3</option>';
	pricingString+='<option value="4">4</option>';
	pricingString+='</select> </div> </div> </div>';
	if(pkgSubType=='GIT')
		pricingString+='<div class="Outer_roomsdetails" id="rooms" style="display:block;position:static;margin-bottom:15px;">';
	else
		pricingString+='<div class="Outer_roomsdetails" id="rooms" style="display:block;position:static;">';
	pricingString+='</div>';
	
	if(pkgSubType=='GIT' && !fitFixed) // departure date to be shown after rooms for GIT
	{
		pricingString+='<label style="margin-right:60px">Departure Date: </label>';
		pricingString+='<div class="inputbg"> <input type="text" onfocus="this.blur()" name="pckgdate" class="ui-datepicker-trigger pckgdate" id="departDate" onchange="getAccomType();" readonly="true" style="width:124px !important;" /> </div>'; 
	}
	
	if(pkgDetails.getElementsByTagName("ADDON")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON")[0]!=null)
		{
			
			var addonPkgLen=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON").length;
			var addonPkgName=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON")[0].getElementsByTagName("PACKAGE_NAME")[0].firstChild;

			if(addonPkgName!=null && addonPkgName.nodeValue!="")
			{
				if(pkgSubType=='GIT')
					pricingString+='<div class="add_on_tours add_on_tours_N" style="clear:both;float:left;margin-top:30px;"><p>Add-on Tours  </p> </div>';
				else
					pricingString+='<div class="add_on_tours add_on_tours_N"><p>Add-on Tours  </p> </div>';
				pricingString+='<div class="outer_addtours" style="width: 894px;">';
				pricingString+='<table border="0" style="margin-bottom:10px !important;">';
			    for(var i=0;i<addonPkgLen;i++)
				{
					var addonTag=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON")[i];
					var pkgName="",addonIndex="",addonStartPrice="",packageId="";
					if(addonTag!=null)
					{
						if(addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
						{
							pkgName=addonTag.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
						}
						if(addonTag.getElementsByTagName("PACKAGE_ID")[0].firstChild!=null)
						{
							packageId=addonTag.getElementsByTagName("PACKAGE_ID")[0].firstChild.nodeValue;
						}
						if(addonTag.getElementsByTagName("ADDON_INDEX")[0].firstChild!=null)
						{
							addonIndex=addonTag.getElementsByTagName("ADDON_INDEX")[0].firstChild.nodeValue;
						}
						if(addonTag.getElementsByTagName("START_PRICE")[0].firstChild!=null)
						{
							addonStartPrice=addonTag.getElementsByTagName("START_PRICE")[0].firstChild.nodeValue;
						}
					}
					pricingString+='<tr><td><input type="hidden" id="addonPkgName" name="addonPkgName" value="'+pkgName+'" /></td></tr>';
					//pricingString+='<input type="hidden" name="addonPkgName" value="'+pkgName+'" />';
					//pricingString+='<div class="inner_addtours inner_addtours_N" style="z-index:0;">';
					pricingString+='<tr><td colspan=\"\">';

					pricingString+='<div class="inner_addtours inner_addtours_N" style="z-index:0;padding:2px; width:auto !important;"><input name="addon" id="addon'+addonIndex+'" type="checkbox" value="'+pkgName+','+packageId+'"  /> <label style="margin-top:0px;" onclick="setAddonMsg(\''+addonIndex+'\');"> </label> <a onclick="goToAddon(\''+addonIndex+'\');" href="javascript:void(0);"> '+pkgName+' </a> </div>';

					pricingString+='</td></tr>';
					
					pricingString+='<tr><td>';
					pricingString+='<a onclick="goToAddon(\''+addonIndex+'\');" href="javascript:void(0);"> <img src="/tcportal/images/holiAbroad/images/holiday/i-btm.png" width="23" height="22"  alt="ibtm" /> </a>';
					//pricingString+='</td><td>';
					pricingString+='<div class="outer_amount" style="margin: -20px 0px 10px 30px"> <span>=</span> <span style="font-weight:bold;">Starting from </span> <span class="WebRupee">Rs.</span> '+addonStartPrice+' </div>';
					pricingString+='</td></tr>';
				}
				pricingString+='</div></table>';
			    pricingString+='</div>';
			}
		}
		
		else{ 					// when no addons
						
	    	//document.getElementById("main_tabcontent").style.paddingBottom = "100px";
		}
	}
	
	pricingString+="<div id='noDateMsg' style='z-index: 1;display:none;width:460px;left: 431px; position: absolute; top: 90px;color: #3158A3; font-size: 1.1em; font-family: Arial,Helvetica,sans-serif;'> </div>";
	if(pkgSubType=='FIT' || pkgSubType=='Addon')
	{
		pricingString+='<div class="accType" id="acctype" style="display:none;margin-top: -5px; top:92px;"> <h3>Pricing - Per person price</h3>';
	}
	else if(pkgSubType=='GIT')
	{	
		pricingString+='<div class="accType" id="acctype" style="display:none;"> <h3>Pricing - Per person price</h3>';
	}
	
	pricingString+='<div class="roomtype_popup">';
	pricingString+='<div class="roomtype_mid" id="roomtype_mid">';
	pricingString+='</div> </div>';
	pricingString+='<div id="roeMsg">';
	pricingString+='<span id="indicativePiceMsg" class="indicativePiceMsg">The prices above are for indicative purpose only and may change depending on availability on date of travel. </span>';								
	pricingString+='<span style="font-weight:normal;font-size=1.1em;font-size: 1.1em;" id="exchangeRateMsg"> </span>';
	pricingString+='</div> </div>';
	pricingString+='</div>'; //end of accType

    if(pkgSubType=='GIT')
	{
    	
	    pricingString+='<div class="clear"> </div> <br /> <table>';
    pricingString+='<tr>';
    pricingString+='<td>';
    pricingString+='<label style="font-weight:bold;font-size:1.2em;margin-left: 8px;margin-right:30px;">Email Id: </label>';
    pricingString+='</td>';
    pricingString+='<td>';
    pricingString+='<input name="emailID" type="text"   class="blackcontent" id="emailID" onkeyup="forEditLength();" size="25" maxlength="100" autocomplete="off" style="height: 24px; border: 1px solid #DEDEDE; border-radius: 7px;">';
   
    pricingString+='</td>';
       pricingString+='<td> <table> <tr id="validateEmai"> </tr> </table> </td>';
    pricingString+='</tr> <tr> <td> &nbsp; </td> </tr>';
    pricingString+='<tr>';
    pricingString+='<td>';
    pricingString+='<label style="font-weight:bold;font-size: 1.2em;margin-left: 8px;margin-right:30px;">Mobile Number: </label>';
    pricingString+='</td>';
    pricingString+='<td>';
    pricingString+='<input name="mobileNoNew" maxlength="10" type="text"  class="blackcontent" id="mobileNoNew" value="" onkeyup="setFieldLength();" size="25" autocomplete="off" style="height: 24px; border: 1px solid #DEDEDE; border-radius: 7px;">';
    pricingString+='</td>';
      pricingString+='<td> <table> <tr id="validateMobol"> </tr> </table> </td>';
    pricingString+='</tr>';
    pricingString+='</table><br/><br/>';
		/* 1st Continue button, show only for git*/
		/*pricingString+='<div class="bookonlineWrap">';
		pricingString+='<a title="Continue" href="javascript:void(0);" class="bookOnlineLink viewDetailsbtn" onclick="getGitOffers();" style="margin-top:10px">Continue </a>';
		pricingString+='</div>';*/
				
		pricingString+='<div class="roomsContent" id="calculateTotPriceDiv" style="display:none; margin-top:15px">';
		pricingString+='<div class="offer" id="offerDiv" style="display:none;"> <p>Offers</p> </div>';
		pricingString+='<div class="clear"> </div>';
		//pricingString+='<div class="offout" style="display:none;z-index:0;">'; 				/*    comment added to open offers on click of continue */
		pricingString+='<div class="offout">';
		pricingString+='<div class="clear"> </div>';
		pricingString+='</div>';
		//pricingString+='<a class="saveAndContinueButton" href="#" onclick="saveForm();"> <img alt="save" src="/tcportal/images/ins_new/images/btn_save_quote.png" width="97" height="39"> </a>';
       // pricingString+='<a class="saveAndContinueButton" href="#" onclick="submitForm();"> <img alt="continue" src="/tcportal/images/ins_new/images/btn_continue.png" width="97" height="39"> </a>';
	}
	else if(pkgSubType=='FIT')
	{
	    pricingString+='<div class="clear"> </div> <br /> <table>';
    pricingString+='<tr>';
    pricingString+='<td>';
    pricingString+='<label style="font-weight:bold;font-size:1.2em;margin-left: 8px;margin-right:30px;">Email Id: </label>';
    pricingString+='</td>';
    pricingString+='<td>';
    pricingString+='<input name="emailID" type="text"   class="blackcontent" id="emailID" onkeyup="forEditLength();" size="25" maxlength="100" autocomplete="off" style="height: 24px; border: 1px solid #DEDEDE; border-radius: 7px;">';
   
    pricingString+='</td>';
       pricingString+='<td> <table> <tr id="validateEmai"> </tr> </table> </td>';
    pricingString+='</tr> <tr> <td> &nbsp; </td> </tr>';
    pricingString+='<tr>';
    pricingString+='<td>';
    pricingString+='<label style="font-weight:bold;font-size: 1.2em;margin-left: 8px;margin-right:30px;">Mobile Number: </label>';
    pricingString+='</td>';
    pricingString+='<td>';
    pricingString+='<input name="mobileNoNew" maxlength="10" type="text"  class="blackcontent" id="mobileNoNew" onkeyup="setFieldLength();" value="" size="25" autocomplete="off" style="height: 24px; border: 1px solid #DEDEDE; border-radius: 7px;">';
    pricingString+='</td>';
      pricingString+='<td> <table> <tr id="validateMobol"> </tr> </table> </td>';
    pricingString+='</tr>';
    pricingString+='</table><br/><br/>';

		if(pkgDetails.getElementsByTagName("OFFERS")[0]!=null)
		{
			if(pkgDetails.getElementsByTagName("DISCOUNT_OFFERS")[0]!=null)
			{
				pricingString+='<div class="roomsContent" id="calculateTotPriceDiv" style="margin-top:15px">';
				var pkgLen=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("OFFERS")[0].getElementsByTagName("DISCOUNT_OFFERS").length;
				var offerName=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("OFFERS")[0].getElementsByTagName("DISCOUNT_OFFERS")[0].getElementsByTagName("OFFER")[0].firstChild;
				if(offerName!=null && offerName.nodeValue!="")
				{
					pricingString+='<div class="offer"> <p>Offers</p> </div>';
					pricingString+='<div class="clear"> </div>';
					//pricingString+='<div class="offout" style="display:none;z-index:0;" id="offout">';    /*    comment added to open offers on click of continue */
					pricingString+='<div class="offout" style="z-index:0; margin-bottom:5px;">';
					for(var i=0;i<pkgLen;i++)
					{
						var offerTag=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("OFFERS")[0].getElementsByTagName("DISCOUNT_OFFERS")[i];
						if(offerTag!=null)
						{
							pricingString+='<input type="hidden" name="offerCode" value="'+offerTag.getElementsByTagName("DISCOUNT")[0].firstChild.nodeValue+'" />';
							pricingString+='<input type="hidden" id="discountCode" name="discountCode" value="'+offerTag.getElementsByTagName("OFFER_CODE")[0].firstChild.nodeValue+'" />';
							pricingString+='<div class="inner_addtours inner_addtours_N" id="offerTours">';
							pricingString+='<input name="pricingStRadio" type="radio" value="" id="disPrice" class="disPrice" />';
							pricingString+='<label onclick="getDiscountPrice(\''+offerTag.getElementsByTagName("DISCOUNT")[0].firstChild.nodeValue+'\',\''+offerTag.getElementsByTagName("DISCOUNT_ID")[0].firstChild.nodeValue+'\');" style="margin-top:0px;"> </label> <p style="line-height: 16px;padding-left: 21px;">'+offerTag.getElementsByTagName("OFFER")[0].firstChild.nodeValue+'<b class="disOffer" id="offerPrice'+offerTag.getElementsByTagName("DISCOUNT_ID")[0].firstChild.nodeValue+'" style="padding-left: 8px !important;cursor:default;"> </b> </p> ';
							pricingString+='</div>';
						}
					}
					pricingString+='<div class="clear"> </div>';
					pricingString+='</div>';
				}
			}else{     /*
			            * 	When no offers are present in FIT
			            */
			}
		}	
	}
	
	/* continue button tab*/
	
	pricingString+='<div id="calculateTab">';
	var bookingAmt="";
	if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("BOOKING_AMT")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("BOOKING_AMT")[0].firstChild!=null)
		{
			bookingAmt=pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("BOOKING_AMT")[0].firstChild.nodeValue;
		}
	}
    /* continue button*/
	
	if(pkgSubType=='GIT')
	pricingString+="<a id='calculateButton' style='cursor:pointer;' class='price_cont viewDetailsbtn' onclick=\"saveForm('saveDetail');\">";
	else
	pricingString+="<a id='calculateButton' style='cursor:pointer;' class='price_cont viewDetailsbtn' onclick=\"validatePricingAndDeparture();saveForm('saveDetail');\">";
	
	//pricingString+='<br/><img src="/tcportal/images/holiAbroad/images/calculate.png" alt="Calculate" title="Calculate" />';
	pricingString+='Calculate</a> <br />';
	/*if(pkgSubType=='FIT')
		{
		//pricingString+='<br/> <br /></br><br/> <br /></br>';
		pricingString+='<div>';
		//pricingString+='<a  class="saveAndContinueButton" href="#" onclick="saveForm();"> <img alt="save" src="/tcportal/images/ins_new/images/btn_save_quote.png" width="97" height="39"> </a>';
        pricingString+='<a  class="saveAndContinueButton" href="#" onclick="submitForm();"> <img alt="continue" src="/tcportal/images/ins_new/images/btn_continue.png" width="97" height="39"> </a>';
        pricingString+='</div>';
		}
	else
	{
		//pricingString+='<br/> <br /></br><br/> <br /></br>';
		pricingString+='<div>';
		//pricingString+='<a class="saveAndContinueButton" href="#" onclick="saveForm();"> <img alt="save" src="/tcportal/images/ins_new/images/btn_save_quote.png" width="97" height="39"> </a>';
	    pricingString+='<a class="saveAndContinueButton" href="#" onclick="submitForm();"> <img alt="continue" src="/tcportal/images/ins_new/images/btn_continue.png" width="97" height="39"> </a>';
	    pricingString+='</div>';
	}*/
	pricingString+='<span id="roomsNotAvail" class="inner_addtours_N" style="color:#3158A3;font-weight:bold;width: 350px !important;border-bottom:0px;float:left;top:16px;font-size:1.1em;position:relative;padding-top:10px;padding-left:10px;padding-bottom:10px;"> </span>'; 
	//pricingString+='<br /> <br /> <br />';
	//pricingString+='<span id="roomsPricingMsg" class="inner_addtours inner_addtours_N" style="color:#3158A3;font-weight:bold;width: 350px !important;border-bottom:0px;"> </span>';
	
	
	pricingString+='</div>';
	
	/* end */

	pricingString+='<div class="main_totalprice main_totalprice_N" id="notificationFooter">';
	
	pricingString+='<div class="totalprice_left" style="width:520px;">';
	pricingString+='<ul class="NEW_N" style="width:520px !important;">';
	pricingString+='<li> <a href="javascript:void(0);" class="price_includes">Total price includes</a>';
	pricingString+='<div class="totalprice_popup">';
	pricingString+='<div class="totalprice_top"> </div>';
	pricingString+='<div class="totalprice_mid">';
	pricingString+='<a href="javascript:void(0);" class="close" > <img src="/tcportal/images/holiAbroad/images/rndclose_btn_small.gif" alt="Close" width="21" height="20" /> </a>';


	
	//pricingString+='<p> <strong>Total price includes:</strong> </p>';

	pricingString+='<p class="priceHeading" style="font-size: 1.2em !important; margin-left: -5px;"> <strong>Total price includes:</strong> </p>';

	pricingString+='<ul>';
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_INCLUDE")[0].firstChild!=null)
		{	
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_INCLUDE")[0]);
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("SIGHTSEEING_COUNTRY")[0]!=null)
		{
			var country = pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("COUNTRY");
			
			pricingString+="<b class='priceHeading' style='display:block'>Sight Seeing</b>";
			for(var i=0;i<country.length;i++)
			{
				if(country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild!=null)
				{
					if(i==0)
						pricingString+="<span class='countryheading' style='padding: 7px 0 0;'>"+country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild.nodeValue+"</span>";
					else
						pricingString+="<span class='countryheading'>"+country[i].getElementsByTagName("SIGHTSEEING_COUNTRY")[0].firstChild.nodeValue+"</span>";
				}
				var city = country[i].getElementsByTagName("CITY");
				for(var j=0;j<city.length;j++)
				{
					if(city[j].getElementsByTagName("SIGHTSEEING_CITY")[0].firstChild!=null)
						pricingString+="<li class='cityheading' style='padding:5px 0 0 13px !important;'>"+city[j].getElementsByTagName("SIGHTSEEING_CITY")[0].firstChild.nodeValue+"</li>";
					var name=city[j].getElementsByTagName("DATA");
					for(var k=0;k<name.length;k++)
					{
						if(name[k].getElementsByTagName("SIGHTSEEING_NAME")[0].firstChild!=null)
						{
							pricingString+="<span class='sightName' style='padding:6px 13px 0 !important;'>"+name[k].getElementsByTagName("SIGHTSEEING_NAME")[0].firstChild.nodeValue+"</span>";
							if(name[k].getElementsByTagName("SIGHTSEEING_TEXT")[0].firstChild!=null)
								pricingString+="<span class='sightDesc'>"+nodeValue(name[k].getElementsByTagName("SIGHTSEEING_TEXT")[0])+"</span>";
						}
					}
				}
			}
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_ACCOM")[0].firstChild!=null)
		{	
			pricingString+="<b class='priceHeading' style='display:block'>Accommodation</b>";
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_ACCOM")[0]);
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_MEAL")[0]!=null)
		{
			var pkgMeal = pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_MEAL");
			pricingString+="<b class='priceHeading' style='display:block'>Meal</b>";
			//pricingString+="<ul>";
			for(var i=0;i<pkgMeal.length;i++)
			{
				pricingString+=nodeValueForMaster(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_MEAL")[i]);
			}
			//pricingString+="</ul>";
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_AIRFARE")[0].firstChild!=null)
		{	
			pricingString+="<b class='priceHeading' style='display:block'>Air Fare</b>";
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_AIRFARE")[0]);
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_VISA")[0].firstChild!=null)
		{
			pricingString+="<b class='priceHeading' style='display:block'>Visa</b>";
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_VISA")[0]);
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_INSURANCE")[0].firstChild!=null)
		{	
			pricingString+="<b class='priceHeading' style='display:block'>Insurance</b>";
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_INSURANCE")[0]);
		}
	}
	if(pkgDetails.getElementsByTagName("PACKAGE_NOTES")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_NOTES")[0].firstChild!=null)
		{	
			pricingString+="<b class='priceHeading' style='display:block'>Notes</b>";
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_NOTES")[0]);
		}
	}
	pricingString+='</ul> </div> <div class="totalprice_btm"> </div> </div>';
	pricingString+='<span style="vertical-align: middle;"> &nbsp;<img src="/tcportal/images/holiAbroad/images/holiday/total-price-divider.gif" /></span>';
	pricingString+='</li>';
	pricingString+='<li style="padding-left:0px;"> <a href="javascript:void(0);" class="price_includes" >Total price doesn\'t include</a>';
	pricingString+='<div class="totalprice_popup">';
	pricingString+='<div class="totalprice_top"> </div>';
	pricingString+='<div class="totalprice_mid">';
	pricingString+='<a href="javascript:void(0);" class="close"> <img src="/tcportal/images/holiAbroad/images/rndclose_btn_small.gif" alt="Close" width="21" height="20" /> </a>';
	pricingString+='<p class="priceHeading" style="font-size: 1.2em !important; margin-left: -5px;"> <strong>Total price doesn\'t include:</strong> </p>';
	pricingString+='<ul font-size: 1.1em;>';
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_EXCLUDE")[0].firstChild!=null)
		{	
			//pricingString+=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_EXCLUDE")[0].firstChild.nodeValue;
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_EXCLUDE")[0]);
		}
	}
	pricingString+='</ul> </div> <div class="totalprice_btm"> </div> </div>';
	pricingString+='<span style="vertical-align: middle;"> &nbsp;<img src="/tcportal/images/holiAbroad/images/holiday/total-price-divider.gif" /></span>';
	pricingString+='</li>';
	pricingString+='<li style="padding-left:0px;"> <a href="javascript:void(0);" class="price_includes" >Payment &amp; cancellation Terms</a>';
	pricingString+='<div class="totalprice_popup">';
	pricingString+='<div class="totalprice_top"> </div>';
	pricingString+='<div class="totalprice_mid">';
	pricingString+='<a href="javascript:void(0);" class="close" > <img src="/tcportal/images/holiAbroad/images/rndclose_btn_small.gif" alt="Close" width="21" height="20" /> </a>';
	pricingString+='<p class="priceHeading" style="font-size: 1.2em !important; margin-left: -5px;"> <strong>Payment &amp; cancellation Terms: </strong> </p>';
	pricingString+='<ul font-size: 1.1em;>';
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PAYMENT_AND_CANCELLATION")[0].firstChild!=null)
		{	
			//pricingString+=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PAYMENT_AND_CANCELLATION")[0].firstChild.nodeValue;
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PAYMENT_AND_CANCELLATION")[0]);
		}
	}
	pricingString+='</ul> </div> <div class="totalprice_btm"> </div> </div>';
	pricingString+='<span style="vertical-align: middle;"> &nbsp;<img src="/tcportal/images/holiAbroad/images/holiday/total-price-divider.gif" /></span>';
	pricingString+='</li>';
	pricingString+='<li class="last" style="padding-left:0px;"> <a href="javascript:void(0);" class="price_includes" >Things to note</a>';
	pricingString+='<div class="totalprice_popup">';
	pricingString+='<div class="totalprice_top"> </div>';
	pricingString+='<div class="totalprice_mid">';
	pricingString+='<a href="javascript:void(0);" class="close" > <img src="/tcportal/images/holiAbroad/images/rndclose_btn_small.gif" alt="Close" width="21" height="20" /> </a>';
	pricingString+='<p class="priceHeading" style="font-size: 1.2em !important; margin-left: -5px;"> <strong>Things to note:</strong> </p> ';
	pricingString+='<ul style="font-size: 1.1em;">';
	if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_THINGS_NOTE")[0].firstChild!=null)
		{	
			//pricingString+=pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_THINGS_NOTE")[0].firstChild.nodeValue;
			pricingString+=nodeValue(pkgDetails.getElementsByTagName("PACKAGE_INCLUSION")[0].getElementsByTagName("PACKAGE_THINGS_NOTE")[0]);
		}
	}
	pricingString+='</ul> </div> <div class="totalprice_btm"> </div> </div> </li> </ul> </div> </div>';
	
	/* calculate tab starts*/
	
	pricingString+='<div class="main_totalprice main_totalprice_N" style="position:static;">';
	pricingString+='<div class="clear"> </div>';
	
	pricingString+='<div class="totalprice_right totalprice_right_N" id="totalprice_right" style="display:none;">';
	pricingString+='<div class="including_gst">';
	if(pkgtype=='1')
	{
		pricingString+='<p class="floatleft" style="font-size:1.3em;">Total Tour Cost in INR (includes INR and forex components) :</p> <p class="floatright" id="totalPrice" style="font-size:1.3em;width:80px;text-align:right;"></p>';
		pricingString+='<div class="clear"> </div>';
		pricingString+='<div class="fareprice" >Fare Price Break-up (<span class="WebRupee">Rs</span>)</div>';
		pricingString+='<div class="fareprice_details" style="display:none;">';
		pricingString+='<table width="437px" border="0" cellspacing="0" cellpadding="0" class="tbldata">';
		pricingString+='<tr> <td colspan="2">';
		pricingString+='<table id="priceBreakUp" style="margin: 10px -2px 0;">';
		pricingString+='</table> </td> </tr> <tr>';
		//pricingString+='<td width="300" id="sDiscount">Less: Discount (in equivalent INR) :</td>';
		//if(isCallCentereGroup=='yes'){
		//pricingString+='<td width="192" class="rt" id="discount"></td><td width="100"></td><td width="245"><a href="#" onclick="showDiscountHld();" id="discountLink" name="discountLink"><font color="red">Add Special Discount</font></a></td> ';
		//}else{
		//pricingString+='<td width="192" class="rt" id="discount"></td>';
		//}
		pricingString+='<td width="245">Less: Discount (in equivalent INR) :</td>';
		pricingString+='<td width="192" class="rt" id="discount"></td>';
		pricingString+='</tr> <tr>';
		pricingString+='<td>Service Tax &amp; Charges (in INR) :</td>';
		pricingString+='<td class="rt" id="servicetax"></td> </tr> <tr>';
		pricingString+='<td> <strong>Total payable in INR :</strong> </td>';
		pricingString+='<td class="rt" id="total"></td>';
		pricingString+='</tr> </table> </div>';
	}
	else if(pkgtype=='0')
	{
		pricingString+='<p class="floatleft">Total price (Including GST)</p> <p class="floatright" id="totalPrice"></p>';
		pricingString+='<div class="clear"> </div>';
		pricingString+='<div class="fareprice" >Fare Price Break-up (<span class="WebRupee">Rs</span>)</div>';
		pricingString+='<div class="fareprice_details" style="display:none;">';
		pricingString+='<table width="437px" border="0" cellspacing="0" cellpadding="0" class="tbldata"  >';
		pricingString+='<tr> <td width="245">Total tour cost</td> <td width="192" class="rt" id="tourcost"></td> </tr>';
		pricingString+='<tr> <td width="245">Less : Discount</td> <td width="192" class="rt" id="discount"></td> </tr>';
		pricingString+='<tr> <td>Service Tax &amp; Charges</td>	<td class="rt" id="servicetax"></td> </tr>';
		pricingString+='<tr> <td> <strong>Total</strong> </td> <td class="rt" id="total"></td> </tr>';
		pricingString+='</table> </div>	';
	}
	pricingString+='</div>';
	pricingString+='<div class="including_gst" id="advDiv">';
	pricingString+='<p  class="floatleft" id="advText" style="font-size:1.3em;"> </p> <p  class="floatright" id="advPayable" style="font-size:1.3em;"></p>';
	pricingString+='<div class="clear"> </div> </div>';
	pricingString+='<div class="including_gst" id="showUserDefine" style="display:none"> </div>';
	pricingString+='<div  id="showCheck" class="fareprice_details" style="display:none"> </div>';
	
	pricingString+='<p class="balance_pay" id="balPayable"> </p>';
	var onlineBooking=pkgDetails.getElementsByTagName("ONLINE_BOOKING")[0].firstChild;
	isBookable = onlineBooking.nodeValue;
	if(onlineBooking!=null && onlineBooking.nodeValue=='0')
	{
		if(pkgSubType=='FIT')
		{
		//pricingString+='<br/> <br /></br><br/> <br /></br>';
		pricingString+='<div>';
		//pricingString+='<a  class="saveAndContinueButton" href="#" onclick="saveForm();"> <img alt="save" src="/tcportal/images/ins_new/images/btn_save_quote.png" width="97" height="39"> </a>';
        pricingString+='<a  class="saveAndContinueButton" href="#" onclick="submitForm();"> <img alt="continue" src="/tcportal/images/ins_new/images/btn_continue.png" width="97" height="39" style="float:right"> </a>';
        pricingString+='</div>';
		}
		else
		{
			//pricingString+='<br/> <br /></br><br/> <br /></br>';
			pricingString+='<div>';
			//pricingString+='<a class="saveAndContinueButton" href="#" onclick="saveForm();"> <img alt="save" src="/tcportal/images/ins_new/images/btn_save_quote.png" width="97" height="39"> </a>';
		    pricingString+='<a class="saveAndContinueButton" href="#" onclick="submitForm();"> <img alt="continue" src="/tcportal/images/ins_new/images/btn_continue.png" width="97" height="39" style="float:right"> </a>';
		    pricingString+='</div>';
		}
		pricingString+='<span id="continue" style="float:right;">';
		pricingString+='<a href="javascript:void(0);" class="price_cont" onclick="submitForm();">';
		pricingString+='<img src="/tcportal/images/holiAbroad/images/contBtn.gif" alt="Continue" title="Continue" width="85" height="30" style="display:block;" />';
		pricingString+='</a>';
		pricingString+='</span>';
	}
	else if(onlineBooking!=null && onlineBooking.nodeValue=='1')
	{
		
		pricingString+='<div class="needhelp" style="z-index:5;float:right;text-align:right;">';
		var pkgName="",bookingTypeEach="";
		if(pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild!=null)
		{
			pkgName=pkgDetails.getElementsByTagName("PACKAGE_NAME")[0].firstChild.nodeValue;
		}
		if(pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild!=null)
		{
			bookingTypeEach=pkgDetails.getElementsByTagName("BOKNG_TYPE_EACH")[0].firstChild.nodeValue;
		}
		$g(".saveAndContinueButton").hide();
		pricingString+='<a href="javascript:void(0);" class="SendQuery" onclick="SendQuery(\''+pkgtype+'\',\''+pkgid+'\',\''+pkgName+'\',\'4\',\''+pkgSubType+'\',\''+bookingTypeEach+'\');">';
		pricingString+="<br/><button class=\"HomeSearch sendQuerybtn\"  type=\"button\"  title=\"Want us to call you ?\" ><font color='ffffff'>Want us to call you? </font> </button> " ;
		pricingString+='</a>';
		pricingString+='<div class="helpus_booking" style="display:none;right:390px;text-align:left;" id="sendQuery1">';
		pricingString+='</div> <br /> </div>';
	}
	pricingString+='<div class="clear"> </div>';
	pricingString+='<p style="position:static !important;color:#3158A3;font-weight:bold;width: 400px !important;border-bottom:0px;" class="inner_addtours inner_addtours_N" id="addonPriceMsg"> </p>';
	pricingString+='</div> </div> </div>';
	pricingString+='</div>';
	document.getElementById("maintab4").innerHTML=pricingString;
	//rearrangeFooter(); /*added by fawaad */
	num_rooms(1);
	$g(".customselectbox").sSelect();
	
	/** Set datepicker **/
	
	
	if(pkgSubType=='GIT' && !fitFixed)
	{
		$g(".pckgdate").datepicker({
			
			buttonImageOnly: true,
			buttonImage: '/tcportal/images/orange_calender.gif',
			showOn: 'both',
			numberOfMonths: 1,
			dateFormat: 'dd-mm-yy',
			showOtherMonths: true,
			beforeShow:function(date,inst){
			
			if(!noDatesFlag)
			{
				if(pkgSubType=='FIT' || fitFixed)
					clearForm();
				else
					clearPrice();
			}
			
			$g("#ui-datepicker-div").css("width","173px");
			$g(".ui-widget-content").css("background","none");
			$g(".ui-widget-content").css("background-color","#FFFFFF");
			$g("#ui-datepicker-div").html("");
			horzScrolled=0;
			counter = 1;
			glovalDivId="";			
			//$g("#ui-datepicker-div").css("top","205%");
			setTimeout(function() {
				/*if(browser_version=='MSIE 7.0')
					$g("#ui-datepicker-div").css("top","721px");
				else*/
				$g("#ui-datepicker-div").css("margin-top","-27px");
				//$g("#ui-datepicker-div").css("cursor","none");
				//alert("inventryCount=="+inventoryDates[0])
				year1="";
				var temp="",tempMonth="";
				for(var i=0;i<ar.length-1;i++)
			    {
					var array1 = ar[i].split("-");
					
					if(array1[0]!=temp)
					{
						temp=array1[0];
						
						if(array1[1]!=tempMonth)
						{
							tempMonth=array1[1];
							if(i==0)
							{
								year1+=array1[0]+"-"+array1[1]+"-"+array1[2]+",";
							}
							else
							{
								year1+="|"+array1[0]+"-"+array1[1]+"-"+array1[2]+",";
							}
						}
						else
						{
							year1+=array1[2]+",";
						}
					}
					else
					{
						if(array1[1]!=tempMonth)
						{
							tempMonth=array1[1];
							if(i==0)
							{
								year1+=array1[0]+"-"+array1[1]+"-"+array1[2]+",";
							}
							else
							{
								year1+="|"+array1[0]+"-"+array1[1]+"-"+array1[2]+",";
							}
						}
						else
						{
							year1+=array1[2]+",";
						}
					}
					
			    }		    
				var invDates = inventoryDates[0].split("|");
				var onReqCountDate=0;
				var availableCountDate=0;
				var allCountDate=0;
				var yearArray = year1.split("|");
				var tempDateCount=0;
				//var tempDate=0;
				var globalChldCount=0;
				var globalAdtCount=0;
				var noOfRooms=parseInt(document.getElementById("noOfRooms").value);
				for(var n=0;n<noOfRooms;n++)
				{
					
					var adult=document.getElementById("adult"+n).value;		
					var child=document.getElementById("child"+n).value;
					globalChldCount+=parseInt(child);
					globalAdtCount+=parseInt(adult);
				}
				var totalPaxCount=(globalAdtCount+globalChldCount);
				var invDateLoopCount=0;
				for(var i=0;i<yearArray.length;i++)
				{
					var monthArray = yearArray[i].split("-")
					var dateArray = monthArray[2].substr(0,monthArray[2].length-1).split(",");
					if(dateArray.length>tempDateCount)
						tempDateCount=dateArray.length;
					var tempDate="";
					for(var k=0;k<dateArray.length;k++)
					{
						var date =new Date(monthArray[0],monthArray[1]-1,dateArray[k]);
						if(dateArray[k]!=tempDate)
						{
							var dateDataArray = invDates[invDateLoopCount].split(",");
							var tdLength = tempDateCount - dateArray.length;
							tempDate=dateArray[k];
							var blk = blockDate.split(",");
							var sDate =new Date(
							        date.getFullYear(), 
							        date.getMonth(), 
							        date.getDate() - parseInt(blk[k]),
							        date.getHours(),
							        date.getMinutes(),
							        date.getSeconds(),
							        date.getMilliseconds())
						}
						var month = yearArray[i].split("-")[1];
						if(sDate < new Date() || parseInt(dateDataArray[0])<totalPaxCount)
						{
							onReqCountDate++;
						}
						if(sDate > new Date() && parseInt(dateDataArray[0])>=totalPaxCount)
						{
							availableCountDate++;
						}
						invDateLoopCount++;
					}
				}
				allCountDate=onReqCountDate+availableCountDate;
				var dateString="";
				dateString+="<div class='mainCal'>"; 
				dateString+="<div class='calTopBorder'></div>";
				dateString+="<div class='calLeftBorder'></div>";
				dateString+="<div class='calHeader'>";
				dateString+="<span style='background-color: rgb(255, 255, 255); margin-left: -33px; padding-left: 56px; width: 612px; z-index: -1 ! important; height: 68px; float: left;'>";
				
				if(availableCountDate>0)
				{

					if(onReqCountDate>0)
						dateString+="<span class='calAvailable calHeaderInactive' onclick='showAvailable();'>";
					else
						dateString+="<span class='calAvailable calHeaderActive' onclick='showAvailable();'>";

					if(browser_version=='MSIE 7.0')
						dateString+="<div><span class='legendAvailable'>&nbsp;</span>";
					else
						dateString+="<div style='width:100px;'><span class='legendAvailable'>&nbsp;</span>";
					dateString+="<span class='legendBottom'>&nbsp;</span>";

					if(onReqCountDate>0)
						dateString+="</div><p class='legendText'>Available</p></span>";
					else
						dateString+="</div><p class='legendText activeText'>Available</p></span>";

					dateString+="<span class='calHeaderSpace'>&nbsp;</span>";
				}
				if(onReqCountDate>0)
				{

					if(availableCountDate>0)
						dateString+="<span class='calOnRequest calHeaderInactive' onclick='showOnRequest();'>";
					else
						dateString+="<span class='calOnRequest calHeaderActive' onclick='showOnRequest();'>";

					if(browser_version=='MSIE 7.0')
						dateString+="<div><span class='legendOnRequest'>&nbsp;</span>"; 
					else
						dateString+="<div style='width:100px;'><span class='legendOnRequest'>&nbsp;</span>"; 
					dateString+="<span class='legendBottom'>&nbsp;</span>";

					if(availableCountDate>0)
						dateString+="</div><p class='legendText'>On Request</p></span>";
					else
						dateString+="</div><p class='legendText activeText'>On Request</p></span>";

					dateString+="<span class='calHeaderSpace'>&nbsp;</span>";
				}	
				if(allCountDate>0 && availableCountDate>0 && onReqCountDate>0)
				{
					dateString+="<span class='calAll calHeaderActive' onclick='showAll();'>";
					if(browser_version=='MSIE 7.0')
						dateString+="<div><span class='legendShowAllLeft'>&nbsp;</span><span class='legendShowAllRight'>&nbsp;</span>";
					else
						dateString+="<div style='width:100px;'><span class='legendShowAllLeft'>&nbsp;</span><span class='legendShowAllRight'>&nbsp;</span>";
					dateString+="<span class='legendBottom'>&nbsp;</span>";
					dateString+="</div><p class='legendText activeText'>Show All</p></span>";
				}
				if(onReqCountDate==0 || availableCountDate==0)
					dateString+="<span class='blankHeader' style='width:355px;'>&nbsp;</span></span></div>";
				else
					dateString+="<span class='blankHeader'>&nbsp;</span></span></div>";
				dateString+="<div class='calBody'>";
				
					dateString+="</div>";
					dateString+="<div class='calRightBorder'></div>";
					dateString+="<div class='calBottomBorder'></div>";
					dateString+="</div>";
					$g("#ui-datepicker-div").html(dateString);
					///displayDate(3);
					if(allCountDate>0 && availableCountDate>0 && onReqCountDate>0)
						showAll();
					if(onReqCountDate==0)
						showAvailable();

					if(availableCountDate==0)
						showOnRequest();

					$g(".ui-datepicker").css("padding-left","0px");
					$g(".ui-datepicker").css("padding-right","0px !important");
					$g(".ui-datepicker").css("padding-top","0px");
					$g(".ui-datepicker").css("padding-bottom","0px");
					$g(".ui-datepicker").css("width","0");
					$g(".ui-datepicker").css("height","0");
										
					var topPos = $g(".ui-datepicker").position().top;
					var leftPos = $g(".ui-datepicker").position().left;
					
					$g(".ui-datepicker").css("left",leftPos-123);
					$g(".ui-datepicker").css("top",topPos+23);
					
					$g(".monthDiv").animate({
					   	scrollLeft:  -629
					},50);
				 }, 0);
		}
		
		});
	}
	else
	{
		$g(".pckgdate").datepicker({
		
			buttonImageOnly: true,
			buttonImage: '/tcportal/images/orange_calender.gif',
			showOn: 'both',
			numberOfMonths: 2,
			dateFormat: 'dd-mm-yy',
			showOtherMonths: true,
			beforeShow:function(date,inst){
			
			if(!noDatesFlag)
			{
				clearForm();
			}
					
				//if(!intlFit){
					setTimeout(function() {
						$g(".legend").remove();
						var div = document.getElementById("ui-datepicker-div");
						div.innerHTML+='<div class="legend"> <span class="legendOnRequestText"> </span>&nbsp;On Request | <span class="legendBookableText"> </span>&nbsp;Available</div>';
					 }, 80);
				//	}
					/*else
			  	   {
			  		  setTimeout(function() {
							$g(".legend").remove();
							var div = document.getElementById("ui-datepicker-div");
							div.innerHTML+='<div class="legend"> </div>';
						 }, 50);
			  		  
			  	  }*/
			
		},
			beforeShowDay: function(date) {
	         // prepend values lower than 10 with 0
	         function addZero(no) 
	         {
	         	if (no < 10)
	         	{
	                return "0" + no;
	            }
	            else 
	            {
	                return no; 
	            }
	         }
	
	         var date_str = [
	             addZero(date.getFullYear()),
	             addZero(date.getMonth() + 1),
	             addZero(date.getDate())      
	             ].join('-');
	         
	         var flag;
	         var returnArray =new Array();
	         for(var i=0;i<ar.length;i++)
	         {
	           if (ar[i]==date_str)
	           {
	        	flag=true;
	        	var dArray=ar[i].split(",");
				var def=new Array();
				def=dArray[0].split("-");
				var year=def[0];
				var month=def[1];
				var day=def[2];
				var date=new Date(year,month-1,day);
				var blk = blockDate.split(",");
				var sDate =new Date(
				        date.getFullYear(), 
				        date.getMonth(), 
				        date.getDate() - parseInt(blk[i]),
				        date.getHours(),
				        date.getMinutes(),
				        date.getSeconds(),
				        date.getMilliseconds())
				//if(!intlFit){
					if(sDate < new Date()) 
		        	{
		        	  returnArray = [flag, 'highlightDates', ''];
		        	}
		        	else
		        	{
		        	  returnArray = [flag, 'onlineBook', ''];
		        	}
				//}
				/*else
				{
					returnArray = [flag, '', ''];
				}*/
	           } 
	         }
	         return returnArray;
	      },
		onChangeMonthYear:function(year, month, inst){
	    	  //if(!intlFit){
				setTimeout(function() {
					$g(".legend").remove();
					var div = document.getElementById("ui-datepicker-div");
					div.innerHTML+='<div class="legend"> <span class="legendOnRequestText"> </span>&nbsp;On Request | <span class="legendBookableText"> </span>&nbsp;Available</div>';
				 }, 80);
	    	 // }
	    	 /* else
	      	  {
	      		  setTimeout(function() {
	    				$g(".legend").remove();
	    				var div = document.getElementById("ui-datepicker-div");
	    				div.innerHTML+='<div class="legend"> </div>';
	    			 }, 50);
	      		  
	      	  }*/
	    	  
	      }
	      
	    });
	}
	/** Set datepicker end**/
	
	/** Continue button click **/
	$g(".bookOnlineLink").click(function(){
		var departDate=document.getElementById("departDate").value;
		if(departDate==null || departDate=="")
	 	{
	 	    alert("Please select date");
	 	    return false;
	    }
	 	else if(priceData==null || priceData=="")
	 	{
	 		alert("Please wait for pricing to be displayed");
	 		return false;
	 	}
	 	else
	 	{
	 		$g(this).parent().next().toggle();
			
			$g("html,body").animate({
				scrollTop:$g(this).offset().top
			},1000);
	 	}
	 	
	  	//$g(".number_rooms p").addClass('selected');
		//$g(".number_rooms p").parent().siblings('.Outer_roomsdetails').css("display","block"); 
		
	});
	/** Continue button click end**/
	
	
	/** open datepicker on hub selection **/
	$g(".pckDates").change(function(){
		if(this.value=='select'){
			$g(".pckgdate").datepicker("hide");	
		}
		/*else{
			setTimeout(function(){
			$g(".pckgdate").datepicker("refresh");
			$g(".pckgdate").datepicker("show");
			},100);
		 }*/	
	   });
	/** open datepicker on hub selection end**/
	/** open inclusion lytebox**/
	$g(".price_includes").click(function(){
		$g(".footerWrapper").css("z-index","-1");
		$g('.totalprice_popup').not($g(this).next('.totalprice_popup')).slideUp();
		$g(this).next('.totalprice_popup').slideDown();
	});
	/** open inclusion lytebox end**/
	/** close button **/
	$g(".close").click(function(){
		setTimeout(function() {
			$g(".footerWrapper").css("z-index","0");
			}, 500);
		$g(this).parents('.roomtype_popup, .child_details_popup, .totalprice_popup').slideUp();
	});
	/** close button end**/
	/** No. of rooms tab **/
	//$g(".number_rooms p").click(function(){
		//$g(this).toggleClass('selected');
		//$g(this).parent().siblings('.Outer_roomsdetails').slideToggle(); 
	//});
	/** No. of rooms tab end**/
	/** Addon Tours tab **/
	$g(".add_on_tours p").click(function(){
		$g(this).toggleClass('selected');
		$g(this).parent().siblings('.outer_addtours').slideToggle();
	});
	/** Addon Tours tab end**/
	/** offer tab **/
	$g(".offer p").click(function(){
		$g(this).toggleClass('selected');
		$g(this).parent().siblings('.offout').slideToggle(); 
	});
	/** offer tab end**/
	/** fare price breakup open**/
	$g(".fareprice").click(function(){
		$g(this).toggleClass('sel').next().slideToggle();
	});
	/** fare price breakup open ends**/
	$g(".ui-datepicker-trigger").click(function(){
		if(pkgSubType!='GIT' || fitFixed)
		{
			//if(!intlFit){
			setTimeout(function() {
				$g(".legend").remove();
				var div = document.getElementById("ui-datepicker-div");
				div.innerHTML+='<div class="legend"> <span class="legendOnRequestText"> </span>&nbsp;On Request | <span class="legendBookableText"> </span>&nbsp;Available</div>';
			 }, 70);
			//}
			/*else {
	  		setTimeout(function() {
				$g(".legend").remove();
				var div = document.getElementById("ui-datepicker-div");
				div.innerHTML+='<div class="legend"> </div>';
			 }, 50);
	  	  	}*/
		}
	
	});
		
	$g(".hel").click(function(){

  		$g(".hel").addClass('active').next(".helpus_booking").slideDown();
  		$g(".hel").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+25+"px"});
  		$g('html, body').animate({
  		scrollTop: $g(this).next(".helpus_booking").offset().top -40
  		}, 500);

  	$g(".close").click(function(){	
  		 $g(this).parents(".helpus_booking").slideUp()
  		$g(".hel").next(".helpus_booking").prev().removeClass('active');
  		});	

  	});
	
	if(pkgSubType=='FIT' || pkgSubType=='Addon')
	{
		var std = pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_STANDARD");
		var del = pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_DELUXE");
		var pre = pkgDetails.getElementsByTagName("PACKAGE_PRICING")[0].getElementsByTagName("DEPARTURE_DATE")[0].getElementsByTagName("DATES_PREMIUM");
		
		if(document.getElementById("pricestandard")!=null)
		{
			accomtype=0;
			document.getElementById("pricestandard").checked=true;
			$g("#pricestdLbl1").removeClass('label-unchecked').addClass('label-checked');
			if(std[0]==null)
				changeHub(0);
			else
				changedate(0);
		}
		else
		{
			if(document.getElementById("pricedeluxe")!=null)
			{
				accomtype=1;
				document.getElementById("pricedeluxe").checked=true;
				$g("#pricedlxLbl2").removeClass('label-unchecked').addClass('label-checked');
				if(del[0]==null)
					changeHub(1);
				else
					changedate(1);
			}
			else
			{
				if(document.getElementById("pricepremium")!=null)
				{
					accomtype=2;
					document.getElementById("pricepremium").checked=true;
					$g("#pricepremiumLbl").removeClass('label-unchecked').addClass('label-checked');
					if(pre[0]==null)
						changeHub(2);
					else
						changedate(2);
				}
			}
		}
	}
	
	$g(".SendQuery").click(function(){
		$g(".footerWrapper").css("z-index","-1");		
		if(!($g(".SendQuery").next(".helpus_booking").is(":visible"))){
			$g(".helpus_booking").slideUp();
			$g(".SendQuery").addClass('active').next(".helpus_booking").slideDown();
			$g(".SendQuery").addClass('active').next(".helpus_booking").css({"top":$g(this).position().top+37+"px"});
			$g('html, body').animate({
				scrollTop: $g(".SendQuery").next(".helpus_booking").offset().top -40
			}, 500);
		}
		$g(".close").click(function(){	
			$g(".footerWrapper").css("z-index","0");
			 $g(".close").parents(".helpus_booking").slideUp()
			$g(".SendQuery").next(".helpus_booking").prev().removeClass('active');
			});	
	});

	/* to disable datepicker before selection fly from option */
	if(pkgSubType=='GIT')
	{
		$g(".pckgdate").datepicker("disable");
		$g(".pckgdate").datepicker("hide");
	}
	
}

/**** holidays page optimization ends ****/

/** Brochure Function starts **/
function clearMail(field)
{
	 
	  document.getElementById(field).value="";
}
function populateMail(field)
{
	  if(document.getElementById(field).value==null || document.getElementById(field).value=="")
		  document.getElementById(field).value=document.getElementById(field).defaultValue;
}


function mailBrochure(type,path,pdfname)
{
	var mailStr='';
	mailStr+="<div class=\"helptop\"> </div><div class=\"helpmid\"><div class=\"close\"> <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/close.gif\" alt=\"Close\" /> </div>";
	mailStr+="<div class=\"inner_booking\">  <div class=\"inner_topcurve\"> </div>  <div class=\"inner_mid helpMsg\">";   
	mailStr+="<fieldset style='float:left;'><label>To : </label><input type=\"text\" id=\"to\" style=\"width:250px;color: #666666;\" value=\"Please enter recipient email address here\" onclick=\"clearMail('to');\" onblur=\"populateMail('to');\" />";
	mailStr+="<br/><br/><label>From : </label><input type=\"text\" id=\"frombr\" style=\"width:250px;color: #666666;\" value=\"Please enter sender email address here\" onclick=\"clearMail('frombr');\" onblur=\"populateMail('frombr');\"/>";
	mailStr+="<br/><br/><label>Subject : </label><input  type=\"text\" id=\"subject\" style=\"width:250px;color: #666666;\" value=\"Please enter subject here\" onclick=\"clearMail('subject');\" onblur=\"populateMail('subject');\"/>";  
	mailStr+="<br/><br/><center><a href=\"javascript:void(0)\" onclick=\"sendBrochure('"+type+"','"+path+"','"+pdfname+"');\">  <button type=\"button\" class=\"brochureSendButton\" alt=\"Send \" title=\"Send \"><font color=\"ffffff\">Send </font> </button> </a></center>  </fieldset>";
	mailStr+="</div> <div class=\"inner_btmcurve\"> </div></div>";
	mailStr+="</div><div class=\"helpbtm\">";
	if(type=='mail_str')
	{
		  document.getElementById('mail_str').innerHTML=mailStr;
	    	$g(".mail_str").prev().addClass('active').next(".mail_str").slideDown();   	   	
			$g('html, body').animate({
			scrollTop: $g(".mail_str").offset().top -40
			}, 500);
	
	
		  $g(".close").click(function(){	
		   	 $g(this).parents(".mail_str").slideUp()
		   	$g(".mail_str").prev().removeClass('active');
		   	});
	}
	else
	{
			  document.getElementById(type).innerHTML=mailStr;
				$g("."+type).prev().addClass('active').next("."+type).slideDown();
				$g('html, body').animate({
				scrollTop: $g("."+type).offset().top -40
				}, 500);
		  	  
			  $g(".close").click(function(){	
			   	 $g(this).parents("."+type).slideUp()
			   	$g("."+type).prev().removeClass('active');
			   	});
}

}

function createBrochure(id,path,bchrpath,pkgName)
{
	globalPkgId=id;
	bchrpath=bchrpath.split("=");
	var dbstring='';
	dbstring+="<div class=\"helptop helptopFliped\"> </div>"+ "<div class=\"helpmid\">";
			 dbstring+="<h3>Email/Download details</h3>";
			 dbstring+="<div class=\"close\"> <img src=\"/tcportal/images/holiAbroad/searchResult/images/search/holiday/close.gif\" alt=\"Close\" /> </div>";
			 dbstring+="<div  class=\"inner_booking\">"+"<div class=\"inner_topcurve\"> </div>"+"<div class=\"inner_mid\">";
			 dbstring+="<div class=\"name\"><a href='/tcportal"+path+"' target='_blank'>"+ pkgName +"</a>"+"</div>";
			 dbstring+="<div class=\"download act\"><a href='/tcportal"+path+"' target='_blank'>Download</a></div>"+"<div class=\"mail\"><a href=\"javascript:void(0)\" onclick=\"mailBrochure('mail_str','"+path+"','"+pkgName+"'); \">"+"Mail"+"</a>"+ "<div id='mail_str' class='mail_str' style=\"top:110px;position: absolute;right:0px;width: 577px;z-index: 99999;\"></div></div>";
			 dbstring+="<div class=\"\">"+ "</div>"+"</div>";
			 dbstring+="<div class=\"inner_btmcurve\"> </div>"+"</div>";
			 for(var i=0;i<bchrpath.length/2;i++){
	         if(bchrpath[i]!=undefined && bchrpath[i]!=''){
			 dbstring+="<div class=\"downloading pt10\">"+"You can also download"+"</div>";
	         dbstring+="<div class=\"package_name pt10\">"+"Interactive Brochure (.swf) for the same package)"+" </div>";
	         dbstring+="<div  class=\"inner_booking\">";
	         dbstring+="<div class=\"inner_topcurve\"> </div>";
	         dbstring+="<div class=\"inner_mid\">";
	         dbstring+="<div class=\"name\"> <a href='/tcportal"+bchrpath[i+1]+"' target='_blank'>"+bchrpath[i]+"</a> </div>"
	         dbstring+="<div class=\"download\"> <a href='/tcportal"+bchrpath[i+1]+"' target='_blank'>"+"Download"+"</a> </div>";
	         dbstring+="<div class=\"mail\"> <a href=\"javascript:void(0)\" onclick=\"mailBrochure('mail_str"+i+"','"+bchrpath[i+1]+"','"+bchrpath[i]+"'); \">"+"Mail"+"</a><div id=\"mail_str"+i+"\" class=\"mail_str"+i+"\" style=\"position: absolute;right:0px;width: 577px;z-index: 99999;\"></div> </div>";
	         dbstring+="<div class=\"\"> </div>";
	         dbstring+="</div>"
	         dbstring+="<div class=\"inner_btmcurve\"> </div>";
	         dbstring+="</div>";
	         }}
			 
	         dbstring+="<div class=\"line w547\"> </div>";
	         dbstring+="<br /> <br /> <span id=\"brochureMailMsg\" style=\"font-size:1.1em;\"> </span>";
	         dbstring+="</div>";
	         dbstring+="<div class=\"helpbtm\">"
	         dbstring+="</div>"
	         
	document.getElementById('helpus_booking').innerHTML=dbstring;
	$g(".close").click(function()
	{								
		$g(this).parents(".helpus_booking").slideUp()
		$g(this).parents(".helpus_booking").prev().removeClass('active');
	});
} 
/** Brochure Function ends **/

function helpMail(pkgType,pkgId,type,pkgSubType,holidayChoice,utmcv)
{
	var pageType="Domestic Holidays";
	if(document.getElementById("pkgtype")!=null){
		var pkgType=document.getElementById("pkgtype").value;
		if(pkgType==1){	
			pageType = "International Holidays Detail Page";
			
		} else if(pkgType==0){	
			pageType = "Domestic Holidays Detail Page";
			
		}
	}
	var subject="";
	var from="";
	var to="";
	var packageName="";
	var name="";
	var city="";
	var mobile="";
	var email="";
	var query="";
	var comments="";
	var destination="";
	var budget="";
	var url="";
	var phone2 = /^[0-9 ]{6,10}$/;
	globalType=type;
	var formType="";
	var departDate="";
	pkgTypeglobal=pkgType;
	pkgSubTypeglobal=pkgSubType;
	if(type=='package')
	{
		subject="Web Query";
			packageName=document.getElementById("pkgName").value;
			packageName=packageName.replace("&","and");
			name=document.getElementById("cName").value;
			city=document.getElementById("city").value;
			mobile=document.getElementById("mobileNo").value;
			email=document.getElementById("email").value;
			if(pkgSubType=='FIT' && holidayChoice=='0')
				query=document.getElementById("query").value;
			comments=document.getElementById("comments").value;
		if(name=="")
		{
			alert("Please enter name");
			document.getElementById("cName").focus();
			return false;
		}
		
		else if(mobile=="")
		{
			alert("Please enter mobile number");
			document.getElementById("mobile").focus();
			return false;
		}
		else if(email=="")
		{
			alert("Please enter email");
			document.getElementById("email").focus();
			return false;
		}
		else if(!echeckMail(email))
		{
			alert("Please enter valid email address");
			document.getElementById("email").focus();
			return false;
		}
		else
		{
			var addon='false';
			var addonPkgString="",addonPkgId="",addonCount=0;
			var addonChkBox=document.getElementsByName("addon");
			addonPkgName=document.getElementsByName("addonPkgName");
			if(addonChkBox!=null)
			{
				for(var adn=0;adn<addonChkBox.length;adn++)
				{
					if(addonChkBox[adn].checked)
					{
						addonCount=addonCount+1;
						addon='true';
						var adddonPkgData=addonChkBox[adn].value.split(",")
						addonPkgString+=adddonPkgData[0];
						addonPkgString+=","
						addonPkgId+=adddonPkgData[1];
						addonPkgId+=","
					}
					
				}			
				addonPkgString=addonPkgString.substr(0,addonPkgString.length-1);
				addonPkgId=addonPkgId.substr(0,addonPkgId.length-1);
			}
			var subType = "";
			if(pkgSubType=='FIT Fixed')
				subType='GIT';
			else
				subType=pkgSubType;
					
			url="/tcportal/px/tcportal/holidays/domHolidays/helpMail.do?pkgSubType="+subType+"&name="+name+"&city="+city+"&mobile="+mobile+"&email="+email+"&query="+query+"&comments="+comments+"&packageName="+packageName+"&subject="+subject+"&type="+type+"&addon="+addon+"&addonPkgString="+addonPkgString+"&addonPkgId="+addonPkgId+"&pageType="+pageType+"&pkgId="+pkgId+"&pkgType="+pkgType+utmcv+"";
			//url+="&utmcsr="+utmcsr+"&utmccn="+utmccn+"&utmcmd="+utmcmd+"&utmctr="+utmctr+"&utmcct="+utmcct+"&utmgclid="+utmgclid;
			document.getElementById("waitMsg").style.display='block';
			name="";
			city="";
			mobile="";
			email="";
			if(pkgSubType=='FIT' && holidayChoice=='0')
				query="";
			comments="";
		}
	}
	else if(type=='packageDetail')
	{ 
		subject="Web Query";
		packageName=document.getElementById("pdpkgName").value;
		packageName=packageName.replace("&","and");
		name=document.getElementById("pdName").value;
//		city=document.getElementById("pdcity").value;
		mobile=document.getElementById("pdmobile").value;
		email=document.getElementById("pdemail").value;
		if(document.getElementById("formType")!==null && document.getElementById("formType")!=='undefined'){
			formType=document.getElementById("formType").value;
		}
		else{
			formType="";
		}

		if(pkgSubType=='FIT' && holidayChoice=='0'){
			if(document.getElementById("pdquery")!==null && document.getElementById("pdquery")!=='undefined'){
				query=document.getElementById("pdquery").value;
			}
		}
		if(document.getElementById("pdcomments")!==null && document.getElementById("pdcomments")!=='undefined'){
			comments=document.getElementById("pdcomments").value;
		}
		if(name=="")
		{
			alert("Please enter name");
			document.getElementById("pdName").focus();
			return false;
		}
		
		else if(mobile=="")
		{
			alert("Please enter mobile number");
			document.getElementById("pdmobile").focus();
			return false;
		}
		else if(email=="")
		{
			alert("Please enter email");
			document.getElementById("pdemail").focus();
			return false;
		}
		else if(!echeckMail(email))
		{
			alert("Please enter valid email address");
			document.getElementById("pdemail").focus();
			return false;
		}
		else
		{
			var addon='false';
			var addonPkgString="",addonPkgId="",addonCount=0;
			var addonChkBox=document.getElementsByName("addon");
			addonPkgName=document.getElementsByName("addonPkgName");
			if(addonChkBox!=null)
			{
				for(var adn=0;adn<addonChkBox.length;adn++)
				{
					if(addonChkBox[adn].checked)
					{
						addonCount=addonCount+1;
						addon='true';
						var adddonPkgData=addonChkBox[adn].value.split(",")
						addonPkgString+=adddonPkgData[0];
						addonPkgString+=","
						addonPkgId+=adddonPkgData[1];
						addonPkgId+=","
					}
					
				}			
				addonPkgString=addonPkgString.substr(0,addonPkgString.length-1);
				addonPkgId=addonPkgId.substr(0,addonPkgId.length-1);
			}
			var subType = "";
			if(pkgSubType=='FIT Fixed')
				subType='GIT';
			else
				subType=pkgSubType;
			url="/tcportal/px/tcportal/holidays/domHolidays/helpMail.do?pkgSubType="+subType+"&name="+name+"&city="+city+"&mobile="+mobile+"&email="+email+"&query="+query+"&comments="+comments+"&packageName="+packageName+"&subject="+subject+"&type="+type+"&addon="+addon+"&addonPkgString="+addonPkgString+"&addonPkgId="+addonPkgId+"&pageType="+pageType+"&pkgId="+pkgId+"&pkgType="+pkgType+"&formType="+formType+"&departDate="+departDate+utmcv;
			//url+="&utmcsr="+utmcsr+"&utmccn="+utmccn+"&utmcmd="+utmcmd+"&utmctr="+utmctr+"&utmcct="+utmcct+"&utmgclid="+utmgclid;
			document.getElementById("waitMsg").style.display='block';
			document.getElementById("pdName").value="";
//			document.getElementById("pdcity").value="";
			document.getElementById("pdmobile").value="";
			document.getElementById("pdemail").value="";
			//if(pkgSubType=='FIT' && holidayChoice=='0')
				//document.getElementById("pdquery").value="";
			//document.getElementById("pdcomments").value="";
		}
	}
			
	if (window.XMLHttpRequest)
	{
        http1 = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        http1 = new ActiveXObject("Microsoft.XMLHTTP");
    }  	
	http1.open("GET", url, true);
    http1.onreadystatechange=getMailResponse;
 	http1.send("");
 	
 	var email=$g("#email").val();
 	var traceEmail="";
 	
 	if(pkgType==0)
 	{
	 	var srci = "http://pixel.affcamp.co.in/thomascookcpl.php?o="+email+"&g=dompackage";
 	}
 	else
 	{ 
 		if(pkgSubType=='GIT')
 		{
		 	var srci = "http://pixel.affcamp.co.in/thomascookcpl.php?o="+email+"&g=intpackage";
 		}
 		else
 		{
 			var srci = "http://pixel.affcamp.co.in/thomascookcpl.php?o="+email+"&g=intpackage";
 		}
 	}

 	ifrm = document.createElement("IFRAME");
 	ifrm.setAttribute("src", srci);
 	document.body.appendChild(ifrm); 
 	$g("iframe").css("display","none");
 	traceEmail+="<iframe src='"+srci+"' style='display:none;' width='0' height='0' frameborder='0' marginheight='0' marginwidth='0'> </iframe>";
 	document.getElementById("traceData").innerHTML=traceEmail;

}
function getMailResponse(){	
	if (http1.readyState == 4) {
	    if (http1.status == 200) {	
	    	
	    	var respText=http1.responseText;
	    	var response_text="";
	    	if(respText=='success')
	    	{
		    	response_text+="<span style=\"font-size: 1.3em;font-weight: bold;\">Thank You for writing to Thomascook.in</span></b> <br /> <br />";
		    	response_text+="<span style=\"font-size: 1.1em;\">Your query has been submitted successfully. Our support team will get back to you within the next 48 hours."; 
		    	response_text+=" Please check your email for the reference id of your query."; 
		    	response_text+=" If you require any urgent assistance, kindly call us at 1800 2099 100 (Toll free).</span>";
		    	var btocUserValue=document.getElementById("isbtocuser").value;
		    	if(btocUserValue=='true')
		    	{
		     	if(pkgTypeglobal==0)
		     	{
		     		_gaq.push(['_trackPageview', '/Holidays/India/Package/Query']);
		     	}
		     	else
		     	{ 
		     		if(pkgSubTypeglobal=='GIT')
		     		{
		     			_gaq.push(['_trackPageview', '/Holidays/Abroad/GIT/Package/Query']);
		     		}
		     		else
		     		{
		     			_gaq.push(['_trackPageview', '/Holidays/Abroad/FIT/Package/Query']);
		     		}
		     	 }
		    	}
	    	}
	    	else 
	    	{
	    		response_text+="<span style=\"font-size: 1.3em;font-weight: bold;\">Unable to send your request, please try again.</span>";
	    	}
	    	$g(".call").css("display","none");
	    	$g(".helpmid h3").css("display","none");
	    	$g("#rgrtId").css("display","none");
	    	$g(".inner_mid").html(response_text);
	    }
	}
}
 /**
 * mail for brochure
 */

function echeckMail(str)
{
	var at="@"
	var dot="."
	var lat=str.indexOf(at)
	var lstr=str.length
	var ldot=str.indexOf(dot)
	if (str.indexOf(at)==-1){
	   //alert("Invalid E-mail ID")
	   return false
	}

	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   //alert("Invalid E-mail ID")
	   return false
	}

	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    //alert("Invalid E-mail ID")
	    return false
	}

	 if (str.indexOf(at,(lat+1))!=-1){
	    //alert("Invalid E-mail ID")
	    return false
	 }

	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    //alert("Invalid E-mail ID")
	    return false
	 }

	 if (str.indexOf(dot,(lat+2))==-1){
	    //alert("Invalid E-mail ID")
	    return false
	 }
	
	 if (str.indexOf(" ")!=-1){
	    //alert("Invalid E-mail ID")
	    return false
	 }
	return true;					
}
function sendBrochure(type,path,pdfname)
{
	var from = document.getElementById("frombr").value;
	var to = document.getElementById("to").value;
	var subject = document.getElementById("subject").value;
	var url="";
	
	if(to==document.getElementById("to").defaultValue)
	{
		alert("Please enter recipient email address");
		document.getElementById("to").focus();
		return false;
	}
	else if(!echeckMail(to))
	{
		alert("Please enter valid recipient email address");
		document.getElementById("to").focus();
		return false;
	}
	else if(from==document.getElementById("frombr").defaultValue)
	{
		alert("Please enter sender email address");
		document.getElementById("frombr").focus();
		return false;
	}
	else if(!echeckMail(from))
	{
		alert("Please enter valid sender email address");
		document.getElementById("frombr").focus();
		return false;
	}
	else if(subject==document.getElementById("subject").defaultValue)
	{
		alert("Please enter subject");
		document.getElementById("subject").focus();
		return false;
	}
	else
		url="/tcportal/px/tcportal/holidays/domHolidays/helpMail.do?from="+from+"&to="+to+"&subject="+subject+"&path="+path+"&pdfname="+pdfname+"&mail=brochure&pkgId="+globalPkgId+utmcv+"";
	//url+="&utmcsr="+utmcsr+"&utmccn="+utmccn+"&utmcmd="+utmcmd+"&utmctr="+utmctr+"&utmcct="+utmcct+"&utmgclid="+utmgclid;
	if (window.XMLHttpRequest)
	{
        http1 = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        http1 = new ActiveXObject("Microsoft.XMLHTTP");
    }  	
	$g(".helpMsg").html("<center>Processing your request, Kindly wait.</center>");
  	http1.open("GET", url, true);
    http1.onreadystatechange=getBrochureMailResponse;
 	http1.send("");
 	
}

function getBrochureMailResponse(){	
	if (http1.readyState == 4) {
	    if (http1.status == 200) {	
	    	
	    	var respText=http1.responseText;
	    	if(respText=='success')
	    	{
	    		respText="<span style=\"font-size: 1.3em;font-weight: bold;\">Thank you for using Thomas Cook for your holiday requirements</span></b> <br /> <br />";
	    		respText+="<span style=\"font-size: 1.1em;\">The package brochure has been mailed to you."; 
	    		respText+=" If you require any urgent assistance, kindly call us at 1800 2099 100 (Toll free) or write to sales@thomascook.in"; 
	    		respText+=" <br />Warm Regards,<br /> Thomascook.in</span>";
	    	}
	    	else 
	    	{
	    		respText="<span style=\"font-size: 1.3em;font-weight: bold;\">Unable to send your request, please try again.</span>";
	    	}
	    	$g(".helpMsg").html(respText);
	    }
	}
}

function rearrangeFooter(){
	var offerFlag=false,addonFlag=false;
	
	if(pkgSubType=='FIT')
	{
		if(pkgDetails.getElementsByTagName("OFFERS")[0]!=null)
		{
			if(pkgDetails.getElementsByTagName("DISCOUNT_OFFERS")[0]!=null)
			{
				offerFlag=true;
				document.getElementById("notificationFooter").style.marginTop='55px';
			}
		}
	}else{    									//git package			
		document.getElementById("notificationFooter").style.marginTop='75px';  
	}
	
	if(pkgDetails.getElementsByTagName("ADDON")[0]!=null)
	{
		if(pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON")[0]!=null)
		{	
					
			var addonPkgLen=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON").length;
			var addonPkgName=pkgDetails.getElementsByTagName("ADDON")[0].getElementsByTagName("PACKAGE_ADDON")[0].getElementsByTagName("PACKAGE_NAME")[0].firstChild;
			
			if(addonPkgName!=null && addonPkgName.nodeValue!="")
			{
				addonFlag=true;
				//document.getElementById("notificationFooter").style.marginTop='130px';
			}
		}
	}

	
	if(offerFlag && addonFlag)
	{
		document.getElementById("notificationFooter").style.marginTop='0px';
		return false;
	}
	if(!offerFlag && !addonFlag)
	{
		if(pkgSubType=='FIT')
		{
			if(browser_version=='MSIE 7.0')
				document.getElementById("notificationFooter").style.marginTop='205px';
			else
				document.getElementById("notificationFooter").style.marginTop='172px';
		}
		else
			document.getElementById("notificationFooter").style.marginTop='110px';
		return false;
	}
	
	if(offerFlag)
	{
		if(browser_version=='MSIE 7.0')
			document.getElementById("notificationFooter").style.marginTop='140px';
		else
			document.getElementById("notificationFooter").style.marginTop='110px';
		return false;
	}
	if(addonFlag)
	{
		if(pkgSubType=='FIT')
		{
			if(browser_version=='MSIE 7.0')
				document.getElementById("notificationFooter").style.marginTop='165px';
			else
				document.getElementById("notificationFooter").style.marginTop='125px';
		}
		else
			document.getElementById("notificationFooter").style.marginTop='80px';
		return false;
	}
}
//var isFullPayment;
 function changePrice(){
	 if(document.getElementById("masterCheckBox").checked==true){
		 document.getElementById("advDiv").style.display='none';
		 document.getElementById("balPayable").style.display='none';
		 document.getElementById("bookingAmountPrice").value=Math.round(totalPriceValue);
		 document.getElementById("balPayablePrice").value=Math.round(0);
		 
		 }else{
		 document.getElementById("advDiv").style.display='block';
		 document.getElementById("balPayable").style.display='block';
		 document.getElementById("bookingAmountPrice").value=Math.round(advPayValue);
		 }
 
 }
 function checkPaybleAmount(){
 var count=0;
 var userDefineAmmount=document.getElementById("amountText").value;
 var balPayablePrice;
 
 if(userDefineAmmount<advPayValue&&userDefineAmmount!=""){
 document.getElementById("amountText").value=advPayValue;
 document.getElementById("amountText").focus();
 alert("Amount should be more than advance payable amount");
 //document.getElementById("bookingAmountPrice").value=Math.round(advPayValue);
 //document.getElementById("balPayablePrice").value=Math.round(advPayValue);
 count++;
 }
 if(userDefineAmmount>=totalPriceValue&&userDefineAmmount!=""){
 document.getElementById("amountText").value=advPayValue;
 document.getElementById("amountText").focus();
 alert("Amount should not be more than total amount");
 //document.getElementById("bookingAmountPrice").value=Math.round(userDefineAmmount);
 //document.getElementById("balPayablePrice").value=Math.round(balPayablePrice);
 count++
 }
 if(count>0){
 document.getElementById("balPayable").innerHTML="<strong>Balance payable  "+"<span class=\"WebRupee\" style=\"color:#222222 !important;\">Rs. </span> "+Math.round(balPayableValue)+"/- </strong>"; 
 document.getElementById("bookingAmountPrice").value=advPayValue;
 document.getElementById("balPayablePrice").value=balPayableValue;
 }else{
 balPayablePrice=Number(totalPriceValue)-Number(userDefineAmmount);
 document.getElementById("balPayable").innerHTML="<strong>Balance payable  "+"<span class=\"WebRupee\" style=\"color:#222222 !important;\">Rs. </span> "+Math.round(balPayablePrice)+"/- </strong>"; 
 document.getElementById("bookingAmountPrice").value=Math.round(userDefineAmmount);
 document.getElementById("balPayablePrice").value=Math.round(balPayablePrice);
 if(userDefineAmmount==""){
 document.getElementById("amountText").value=advPayValue;
 document.getElementById("balPayable").innerHTML="<strong>Balance payable  "+"<span class=\"WebRupee\" style=\"color:#222222 !important;\">Rs. </span> "+Math.round(balPayableValue)+"/- </strong>"; 
 document.getElementById("bookingAmountPrice").value=advPayValue;
 document.getElementById("balPayablePrice").value=balPayableValue;
}
 
 }
 
 
 
 
 }
function holidayChangeTab(_id)	{
	$g(".saveAndContinueButton").hide();
	var getTab='maintab'+_id;
	var getLiTab='li_maintab_'+_id;
	var getDocTab=document.getElementById(getTab);
	var getDocLi=document.getElementById(getLiTab);
		for(i=1; i<=100;i++){
			
			var chkTab = 'maintab'+i;
			var chkLiTab = 'li_maintab_'+i;
			var selDocTab = document.getElementById(chkTab);
			var selDocLi = document.getElementById(chkLiTab);
			if(selDocTab!=null){
			
			selDocTab.style.display='none';
			selDocLi.className='';
			}
			else{break;}
		}
		
		getDocTab.style.display='block';
		if($g('.srcoll').length)
		{
			$g('.srcoll').jScrollPane();
		}
	
		getDocLi.className='selected';
}
function setDate(year,month,date)
{
	if(month<10)
		month = "0"+month;
	
	document.getElementById("departDate").value=date+"-"+month+"-"+year;
	$g(".pckgdate").datepicker("hide");
	getAccomType();
}

/** function to show bed if child age is 2-5 yrs only for domestic start **/
function showBed(age,bedValue)
{
	if(parseInt(age.charAt(0))>=2 && parseInt(age.charAt(0))<=4)
	{
		document.getElementById("bedText"+bedValue).style.display="none";
		$g("input[id=bedOption"+bedValue+"]").removeAttr("checked").parent().siblings().find('label').removeClass('label-checked').addClass('label-unchecked');
	}
	else
	{
		document.getElementById("bedText"+bedValue).style.display="block";
	}
}

/** function to show bed if child age is 2-5 yrs only for domestic end **/
function validateAllFields(){
	
	var deptDate = $g("#departDate").val();
	if(deptDate=="" || deptDate==null){
		alert("Please select a departure date.");
		return false;
	}
	if(priceData==null || priceData=="")
 	{
 		alert("Please wait for pricing to be displayed");
 		return false;
 	}
	
	if(!validateEmail("#emailID")){
		var wrongEmailText = "";
		wrongEmailText+="<td>  <img src=\"/tcportal/images/forex_new/wrong_icon.png\" alt=\"correct\" width=\"20\" height=\"20\" />  </td>";
		wrongEmailText+="<td class=\"blackcontent\">  </td>"; 
		$g("#validateEmai").html(wrongEmailText);
		return false;
	}else{
		var wrongEmailText = "";
		wrongEmailText+="<td> <img src=\"/tcportal/images/forex_new/correct_icon.png\" alt=\"correct\" width=\"20\" height=\"20\" /> </td>";
		wrongEmailText+="<td class=\"blackcontent\">  </td>"; 
		$g("#validateEmai").html(wrongEmailText);
	}
	if(!validateMobile("#mobileNoNew")){
		var wrongEmailText = "";
		wrongEmailText+="<td>  <img src=\"/tcportal/images/forex_new/wrong_icon.png\" alt=\"correct\" width=\"20\" height=\"20\" />  </td>";
		wrongEmailText+="<td class=\"blackcontent\">  </td>"; 
		$g("#validateMobol").html(wrongEmailText);
		return false;
	}else{
		var wrongEmailText = "";
		wrongEmailText+="<td> <img src=\"/tcportal/images/forex_new/correct_icon.png\" alt=\"correct\" width=\"20\" height=\"20\" /> </td>";
		wrongEmailText+="<td class=\"blackcontent\"> </td>"; 
		$g("#validateMobol").html(wrongEmailText);
	}
	return true;
}
function validateEmail(emailFieldID){
	var email = $g(emailFieldID).val();
	if (email==null || email==""){
		alert("Please enter a valid email id.");
		$g(emailFieldID).focus();
		return false;
	}  

	if (email.indexOf(' ')==-1 && 0<email.indexOf('@')&& email.indexOf('@')+1 < email.length && 0<email.indexOf('.') )
	{}
	else{
		alert ('Please enter a valid email id.');
		$g(emailFieldID).focus();
		return false;
	}
	return true;
}

function validateMobile(mobileFieldID){
	var mobile = $g(mobileFieldID).val();
	if(mobile.charAt(0)=='0'){
		document.getElementById('mobileNoNew').length=11;
	}
    else{
    	$g("#mobileNoNew").attr("maxlength","10");
    	document.getElementById('mobileNoNew').length=10;
    }
	
	if (mobile==null || mobile=="" || mobile.length<10){
		alert("Please enter a valid phone number.");
		$g(mobileFieldID).focus();
		return false;
	} 
	if (mobile.charAt(0)=='0' ){
	    if(mobile.length!=11)
	    {
		alert("Please enter a valid phone number.");
		$g(mobileFieldID).focus();
		return false;
		}
	} 
	if (mobile.charAt(0)!='0' ){
	    if(mobile.length!=10)
	    {
		alert("Please enter a valid phone number.");
		$g(mobileFieldID).focus();
		return false;
		}
	} 
	if(isNaN(mobile)){
		alert("Please enter a valid phone number.");
		$g(mobileFieldID).focus();
		return false;
	}
	
	return true;
}


var discountCodeValue = "";
var addonPriceMsgValue="";
var adnChkBoxNameValue="";

function saveForm(type)
{
	if(type!=="sendMail"){
		if(!validateAllFields()){
			return false;
		}
	}
	isBookable = pkgDetails.getElementsByTagName("ONLINE_BOOKING")[0].firstChild.nodeValue; 
	call();
	scrollDown();
	var hldname="";
	var departureDate=document.getElementById("departDate").value;
	var noOfRooms=document.getElementById("noOfRooms").value;
	var emailID=document.getElementById("emailID").value;
	var mobileNoNew=document.getElementById("mobileNoNew").value;
	var pkgid=document.getElementById("pkgId").value;
	var hldType=document.getElementById("hldType").value;
	var hlddest=document.getElementById("hlddest").value;
	/*if(pkgSubType=='FIT')
	{
		if(document.getElementById("pricestandard")!==null && document.getElementById("pricestandard")!=='undefined'){
			var hubValue = document.getElementById("pricestandard").value;
		}
	}
	else 
	{*/
		var hubValue = document.getElementById("hub");
		var index =0;
		var departureCity = "";
		if(hubValue!=null)
		{
			hubValue = hubValue.value;
			index = document.getElementById("hub").selectedIndex;
			departureCity = document.getElementById("hub").options[index].text;
		}
		else
			hubValue = "";
	//	var index = document.getElementById("hub").selectedIndex;
	//	var departureCity = document.getElementById("hub").options[index].text;
	//}
	if(hldType=='india-holidays')
	{
		hldname=document.getElementById("hldname").value;
	}
	else
	{
		hldname=document.getElementById("intDest").value;
	}
	
	var bookingAmountPriceValue=document.getElementById("bookingAmountPrice").value;
	var isAddonChecked = $g("input[name=addon]").attr("checked");
	if(isAddonChecked){
		addonPriceMsgValue=$g("input[name=addonMsgPre]").val();
		$g("input[name=addon]").each(function(){
			adnChkBoxNameValue+=$g(this).val();
			adnChkBoxNameValue+="#";
		});
	}
	if(document.getElementById("discountCode")!=null){
		discountCodeValue=document.getElementById("discountCode").value;
	}
	var isDataSave = $g("#isDataSaved").val();
	
	
	if(departureDate!==null && departureDate!=='' && emailID!==null && emailID!==''){
		try{
			pkgSubTypeglobal = $g("#pkgsubtype").val();

			var holidayDetail = {
					"departureCity": departureCity,
					"departureDate": departureDate,
					"noOfRooms": noOfRooms,
					"adultValue": adultValue,
					"childValue": childValue,
					"infantValue": infantValue,
					"noOfAdultValue": noOfAdultValue,
					"noOfChildrenValue": noOfChildrenValue,
					"noOfInfantValue": noOfInfantValue,
					"emailID": emailID,
					"mobileNoNew": mobileNoNew,
					"pkgid": pkgid,
					"hldname": hldname,
					"hldType": hldType,
					"hlddest": hlddest,
					"tcBrkUpValue": tcBrkUpValue,
					"tcBrkUpPriceValue": tcBrkUpPriceValue,
					"totalPriceValue": totalPriceValue,
					"tourCostValue": tourCostValue,
					"discount": discount,
					"serviceTaxValue": serviceTaxValue,
					"bookingAmtValue": bookingAmtValue,
					"advPayableValue": advPayableValue,
					"balPayableValue": balPayableValue,
					"adultPriceValue": adultPriceValue,
					"childPriceValue": childPriceValue,
					"infantPriceValue": infantPriceValue,
					"valValue": valValue,
					"priceSlabValue": priceSlabValue,
					"roomingValue": roomingValue,
					"roomTypeValue": roomTypeValue,
					"roomDetailsValue": roomDetailsValue,
					"accomtypeValue": accomtypeValue,
					"hubValue": hubValue,
					"productCodeValue": productCodeValue,
					"currencyListValue": currencyListValue,
					"curencyRateListValue": curencyRateListValue,
					"addonPriceMsgValue": addonPriceMsgValue,
					"adnChkBoxNameValue": adnChkBoxNameValue,
					"discountCodeValue": discountCodeValue,
					"pkgSubTypeglobal":pkgSubTypeglobal,
					"isDataSave": isDataSave
			}
			var urlNew='/tcportal/px/tcportal/ins_new/insurancesavedetail.do';

			if(isDataSave!=='dataSaved'){
			
				$g.ajax({
					async: false,
					type: 'POST',
					url: urlNew,
					data: holidayDetail,
					success:function(data){
					var sd = data.split("<");
					refnoValue = sd[0];
					$g("#isDataSaved").val("dataSaved");
					//$g("#refernceno").val(refnoValue);
					
				},
				error:function(){
				}
				});
			}else{
				if(type=="sendMail"){
					callbackSaveForm(refnoValue);
				}
			}
			
			
			
		}catch(e){

		}
	}
}

var url="";
function callbackSaveForm(data)
{
	refnoValue=data;
	var hldType=document.getElementById("hldType").value;
	var hlddest=document.getElementById("hlddest").value;
	var hldname=document.getElementById("hldname").value;
	var pkgid=document.getElementById("pkgId").value;
	var tabValue=document.getElementById("tabValue").value;
	var intDest=document.getElementById("intDest").value;

	var selectedPackage = '';
	
	if(isBookable=='0'){
		if(hldType=='personalised-holidays' || hldType=='group-holidays')
		{
			if(!ishighlightFlag && !(istotalPassengerCount>=isinventryCount) && pkgSubType=='GIT'){
				url='/tcportal/international-holidays/'+hldType+'/'+hlddest+'/'+intDest+'/Book?typeID='+pkgid;//+'&bookCont='+1+'&refValue='+refnoValue;
				selectedPackage = intDest;
			}else if(!ishighlightFlag && pkgSubType=='FIT'){
				url='/tcportal/international-holidays/'+hldType+'/'+hlddest+'/'+intDest+'/Book?typeID='+pkgid;//+'&bookCont='+1+'&refValue='+refnoValue;
				selectedPackage = intDest;
			}else{
				isBookable = "1";
				url='/tcportal/international-holidays/'+hldType+'/'+hlddest+'/'+intDest+'?hldID='+pkgid+'&tabValue=1';//+'&bookCont='+1+'&refValue='+refnoValue;
				selectedPackage = intDest;				
			}
		}
		else
		{
			if(!ishighlightFlag && !(istotalPassengerCount>=isinventryCount) && pkgSubType=='GIT'){
				url='/tcportal/'+hldType+'/'+hlddest+'/'+hldname+'/Book?typeID='+pkgid;//+'bookCont='+1+'refValue='+refnoValue;
				selectedPackage = hldname;
			}
			else if(!ishighlightFlag && pkgSubType=='FIT'){
				url='/tcportal/'+hldType+'/'+hlddest+'/'+hldname+'/Book?typeID='+pkgid;//+'bookCont='+1+'refValue='+refnoValue;
				selectedPackage = hldname;
			}else{
				isBookable = "1";
				url='/tcportal/'+hldType+'/'+hlddest+'/'+hldname+'?hldID='+pkgid+'&tabValue=1';//+'bookCont='+1+'refValue='+refnoValue;
				selectedPackage = hldname;
			}
		}
	}else{
		if(hldType=='personalised-holidays' || hldType=='group-holidays')
		{
			url='/tcportal/international-holidays/'+hldType+'/'+hlddest+'/'+intDest+'?hldID='+pkgid+'&tabValue=1';//+'&bookCont='+1+'&refValue='+refnoValue;
			selectedPackage = intDest;
		}
		else
		{
			url='/tcportal/'+hldType+'/'+hlddest+'/'+hldname+'?hldID='+pkgid+'&tabValue=1';//+'bookCont='+1+'refValue='+refnoValue;
			selectedPackage = hldname;
		}

	}
	
	document.getElementById("refernceno").value=refnoValue;
	
	var emailIdValue=document.getElementById("emailID").value;
	document.getElementById('emailIDValue1').value=emailIdValue;
	var mobileNoValue=document.getElementById("mobileNoNew").value;

	var urlNew='/tcportal/px/tcportal/ins_new/insurancesavedetail.do?pageStatusValue=continueNew&selectedPackage='+selectedPackage+'&emailIdValue='+emailIdValue+'&mobileNoValue='+mobileNoValue+'&urlValue='+url+'&bookCont='+1+'&refValue='+refnoValue+'&isBookable='+isBookable+'&ajax=true';

	if(refnoValue!=='dataNotSaved'){
		$g.ajax({
			async: false,
			type: 'GET',
			url: urlNew,
			data: '',
			success:function(data){

		},
		error:function(){
		}
		});
	}
}

function getMailResponseDropOut(){
	if (http1.readyState == 4) {
		if (http1.status == 200) {
		}
	}
}

	$g(document).ready(function(){
		var isHrefClicked = false;
		$g(window).bind('beforeunload', function(){
			
			/** to prevent href clicks to trigger beforeunload event **/
			//var allLinks = document.links;
			//Bind the event handler to each link individually
			/*for (var i = 0, n = allLinks.length; i < n; i++) {
			    allLinks[i].onclick = function () {
			    	//alert("href clicked");
			    	isHrefClicked = true;
			    };
			}*/
			/** to prevent href clicks to trigger beforeunload event **/
			
			if(refnoValue!==null && refnoValue!==''){
			
			//document.getElementById("test").value=refnoValue;
				callbackSaveForm(refnoValue);
			}else{
				//if(!isHrefClicked)
			//	{
					saveForm("sendMail");
			//	}
			}
			
		});
	});
	
	function DropOutCallBack(){
		//console.log('Window was refreshed zzzzzzz DropOutCallBack==='+data);
		//return data+"test";
	}



/** function to show bed if child age is 2-5 yrs only for domestic end **/

/** function to show bed if child age is 2-5 yrs only for domestic end **/

/** function for new calendar of dates start **/
function showOnRequest()
{
	$g(".calOnRequest").removeClass('calHeaderInactive').addClass('calHeaderActive');
	$g(".legendText").removeClass('activeText');
	$g(".calOnRequest p").addClass('activeText');
	$g(".calAvailable").removeClass('calHeaderActive').addClass('calHeaderInactive');
	$g(".calAll").removeClass('calHeaderActive').addClass('calHeaderInactive');
	displayDate(1);
}
function showAvailable()
{
	$g(".calOnRequest").removeClass('calHeaderActive').addClass('calHeaderInactive');
	$g(".calAvailable").removeClass('calHeaderInactive').addClass('calHeaderActive');
	$g(".legendText").removeClass('activeText');
	$g(".calAvailable p").addClass('activeText');
	$g(".calAll").removeClass('calHeaderActive').addClass('calHeaderInactive');
	displayDate(2);
}
function showAll()
{
	$g(".calOnRequest").removeClass('calHeaderActive').addClass('calHeaderInactive');
	$g(".calAvailable").removeClass('calHeaderActive').addClass('calHeaderInactive');
	$g(".calAll").removeClass('calHeaderInactive').addClass('calHeaderActive');
	$g(".legendText").removeClass('activeText');
	$g(".calAll p").addClass('activeText');
	displayDate(3);
}

function displayDate(tab)
{
	var globalChldCount=0;
	var globalAdtCount=0;
	var noOfRooms=parseInt(document.getElementById("noOfRooms").value);
	for(var n=0;n<noOfRooms;n++)
	{
		
		var adult=document.getElementById("adult"+n).value;		
		var child=document.getElementById("child"+n).value;
		globalChldCount+=parseInt(child);
		globalAdtCount+=parseInt(adult);
	}
	var totalPaxCount=(globalAdtCount+globalChldCount);
	var yearArray = year1.split("|");
	var days= ["SUN","MON","TUE","WED","THU","FRI","SAT"];
	var months= ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
	var tempDateCount=0;
	var invDates = inventoryDates[0].split("|");
	
	var dateString="";
	var counterString="";
	var countMonth=0;
	//var invDateLoopCnt=0;
	//var secDateLoopCnt=0;
	//var thrDateLoopCnt=0;
	
	for(var i=0;i<yearArray.length;i++)
	{
		var monthArray = yearArray[i].split("-")
		var trimmedmonth = "";
		var onReqCount=0;
		var availCount=0;
		var monthFlag =false;
		var dateArray = monthArray[2].substr(0,monthArray[2].length-1).split(",");
		if(dateArray.length>tempDateCount)
			tempDateCount=dateArray.length;
		
		for(var k=0;k<dateArray.length;k++)
		{
			var date =new Date(monthArray[0],monthArray[1]-1,dateArray[k]);
			if(dateArray[k]!=tempDate)
			{
				var dateDataArray = invDates[k].split(",");
				var tdLength = tempDateCount - dateArray.length;
				tempDate=dateArray[k];
				var blk = blockDate.split(",");
				var sDate =new Date(
				        date.getFullYear(), 
				        date.getMonth(), 
				        date.getDate() - parseInt(blk[k]),
				        date.getHours(),
				        date.getMinutes(),
				        date.getSeconds(),
				        date.getMilliseconds())
			}
			var month = yearArray[i].split("-")[1];
			if(tab==1 )
			{
				
				if(sDate < new Date() || parseInt(dateDataArray[0])<totalPaxCount)
				{
					onReqCount++;
					if(month<10)
					{
						if(month.length)
						{
							trimmedMonth =month.substr(1,2); 
						}
					}
					else
						trimmedMonth = month;
					monthFlag=true;
					
				}
				//else
				//	monthFlag=false;
				
			}
			if(tab==2)
			{
				if(sDate > new Date() && parseInt(dateDataArray[0])>=totalPaxCount)
				{
					availCount++;
					if(month<10)
					{
						if(month.length)
						{
							trimmedMonth =month.substr(1,2); 
						}
					}
					else
						trimmedMonth = month;
					monthFlag=true;
					
				}
				//else
				//	monthFlag=false;
			}
			if(tab==3)
			{
				if(month<10)
				{
					if(month.length)
					{
						trimmedMonth =month.substr(1,2); 
					}
				}
				else
					trimmedMonth = month;
				monthFlag=true;
			}
			//invDateLoopCnt++;
	}
		if(monthFlag)
			countMonth++;
	}
	//if(countMonth>3)
		dateString+="<div class='topArrowContent'><span class=topArrow onclick='scrollUp();'></span></div>";
	//else
	//	dateString+="<div class='topArrowContent'>&nbsp;</div>";
	dateString+="<div class='cover'>";
	dateString+="<table class='calTb' style='background-color: #FFFFFF;border-collapse: collapse !important;'>";
	//var invDateLoopCount1=0;
	//var invDateLoopCount2=0;
	for(var i=0;i<yearArray.length;i++)
	{
		dateString+="<tr class='calRow'>";
		var monthArray = yearArray[i].split("-")
		var trimmedmonth = "";
		var monthFlag =false;
		var dateArray = monthArray[2].substr(0,monthArray[2].length-1).split(",");
		for(var k=0;k<dateArray.length;k++)
		{
			var date =new Date(monthArray[0],monthArray[1]-1,dateArray[k]);
			if(dateArray[k]!=tempDate)
			{
				var dateDataArray = invDates[k].split(",");
				var tdLength = tempDateCount - dateArray.length;
				tempDate=dateArray[k];
				var blk = blockDate.split(",");
				var sDate =new Date(
				        date.getFullYear(), 
				        date.getMonth(), 
				        date.getDate() - parseInt(blk[k]),
				        date.getHours(),
				        date.getMinutes(),
				        date.getSeconds(),
				        date.getMilliseconds())
			}
			var month = yearArray[i].split("-")[1];
			if(tab==1)
			{
				if(sDate < new Date() || parseInt(dateDataArray[0])<totalPaxCount)
				{
					if(month<10)
					{
						if(month.length)
						{
							trimmedMonth =month.substr(1,2); 
						}
					}
					else
						trimmedMonth = month;
					monthFlag=true;
				}
				//else
				//	monthFlag=false;
				
			}
			if(tab==2)
			{
				if(sDate > new Date() && parseInt(dateDataArray[0])>=totalPaxCount)
				{
					if(month<10)
					{
						if(month.length)
						{
							trimmedMonth =month.substr(1,2); 
						}
					}
					else
						trimmedMonth = month;
					monthFlag=true;
					
				}
				//else
				//	monthFlag=false;
			}
			if(tab==3)
			{
				if(month<10)
				{
					if(month.length)
					{
						trimmedMonth =month.substr(1,2); 
					}
				}
				else
					trimmedMonth = month;
				monthFlag=true;
			}
			//secDateLoopCnt++;
		}
		var tempDate="";
		
		if(monthFlag)
		{
			var dateLen = parseInt($g("."+months[trimmedMonth-1]+" table td").length);
			if(tab==1)
			{
				//if(dateLen>6)
					dateString+="<td><span class=\"leftArrow\" onclick=\"scrollLeftSide('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
				//else
				//	dateString+="<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			}
			if(tab==2)
			{
				//if(dateLen>6)
					dateString+="<td><span class=\"leftArrow\" onclick=\"scrollLeftSide('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
			//	else
			//		dateString+="<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			}
			if(tab==3)
			{
				if(dateArray.length>6)
					dateString+="<td><span class=\"leftArrow\" onclick=\"scrollLeftSide('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
				else
					dateString+="<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			}
			if(browser_version=='MSIE 7.0')
				dateString+="<td class='calMonth'>"+months[trimmedMonth-1]+"&nbsp;"+monthArray[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
			else
			{
				if(dateArray.length>3)
					dateString+="<td width='20%' class='calMonth'>"+months[trimmedMonth-1]+"&nbsp;"+monthArray[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
				else
				{
					if(browser_version=='MSIE 8.0')
					{
						if(dateArray.length==3)
							dateString+="<td width='20%' class='calMonth'>"+months[trimmedMonth-1]+"&nbsp;"+monthArray[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
						else
							dateString+="<td width='20%' class='calMonth'>"+months[trimmedMonth-1]+"&nbsp;"+monthArray[0]+"</td>";
					}
					else
						dateString+="<td width='20%' class='calMonth'>"+months[trimmedMonth-1]+"&nbsp;"+monthArray[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
				}
			}
	
			if(browser_version=='MSIE 7.0')
			{
				if(dateArray.length>3)
					dateString+="<td><div id='"+months[trimmedMonth-1]+"' class='"+months[trimmedMonth-1]+" monthDiv mDiv"+i+"' style='width:465px;overflow:hidden;'><table style='margin-bottom: 0;margin-top:5px;width:0px !important;border-collapse: separate;'><tr>";
				else
					dateString+="<td width='70%'><div id='"+months[trimmedMonth-1]+"' class='"+months[trimmedMonth-1]+" monthDiv mDiv"+i+"' style='width:465px;overflow:hidden;'><table style='margin-bottom: 0;margin-top:5px;width:0px !important;border-collapse: separate;'><tr>";
			}
			else
				dateString+="<td><div id='"+months[trimmedMonth-1]+"' class='"+months[trimmedMonth-1]+" monthDiv mDiv"+i+"' style='width:467px;overflow:hidden;'><table style='margin-bottom: 0;margin-top:5px;width:0px !important;border-collapse: separate;'><tr>";
			for(var j=0;j<dateArray.length;j++)
			{
				var date =new Date(monthArray[0],monthArray[1]-1,dateArray[j]);
				if(dateArray[j]!=tempDate)
				{
					var dateDataArray = invDates[j].split(",");
					var tdLength = tempDateCount - dateArray.length;
					tempDate=dateArray[j];
					var blk = blockDate.split(",");
					
					var sDate =new Date(
					        date.getFullYear(), 
					        date.getMonth(), 
					        date.getDate() - parseInt(blk[j]),
					        date.getHours(),
					        date.getMinutes(),
					        date.getSeconds(),
					        date.getMilliseconds())
				
					if(tab==1)
					{
						if(sDate < new Date() || parseInt(dateDataArray[0])<totalPaxCount) 
			        	{
							
			        	  	dateString+="<td width='25px'><span style='cursor:pointer;padding:0!important;line-height:1.2;width:6.4em!important;' class='domGithighlightDates' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'>"+days[date.getDay()]+" - "+dateArray[j]+"</span>";
			        	  	if(parseInt(dateDataArray[2])>0)
			        		{
			        			dateString+="<span style='cursor:pointer;padding: 4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'><strike>Rs.&nbsp;</strike></p><strike class='calStrike'>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])))+"</strike><br /><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg((Math.round(parseFloat(dateDataArray[1]))-Math.round(parseFloat(dateDataArray[2]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        				dateString+="<br><div class='lowInventory' style='margin-top: 1px;'>Few seats Left!</div>";
			        			dateString+="</span></td>";
			        		}
			        		else
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])));
			        			if(dateDataArray[0]==totalPaxCount)
			        	  			dateString+="<br><div class='lowInventory'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        	}
					}
					if(tab==2)
					{
						if(sDate > new Date() && parseInt(dateDataArray[0])>=totalPaxCount) 
			        	{
			        		dateString+="<td width='25px'><span style='cursor:pointer;padding:0px;line-height:1.2;width:6.4em!important;' class='domGitonlineBook' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'>"+days[date.getDay()]+" - "+dateArray[j]+"</span>";
			        		if(parseInt(dateDataArray[2])>0)
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0!important;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'><strike>Rs.&nbsp;</strike></p><strike class='calStrike'>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])))+"</strike><br /><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg((Math.round(parseFloat(dateDataArray[1]))-Math.round(parseFloat(dateDataArray[2]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        				dateString+="<br><div class='lowInventory' style='margin-top: 1px;'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        		else
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg(parseInt(Math.round(parseFloat(dateDataArray[1]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        	  			dateString+="<br><div class='lowInventory'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        	}
					}
					if(tab==3)
					{
						if(sDate < new Date() || parseInt(dateDataArray[0])<totalPaxCount) 
			        	{
			        	  	dateString+="<td width='25px'><span style='cursor:pointer;padding:0!important;line-height:1.2;width:6.4em!important;' class='domGithighlightDates' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'>"+days[date.getDay()]+" - "+dateArray[j]+"</span>";
			        	  	if(parseInt(dateDataArray[2])>0)
			        		{
			        			dateString+="<span style='cursor:pointer;padding: 4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'><strike>Rs.&nbsp;</strike></p><strike class='calStrike'>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])))+"</strike><br /><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg((Math.round(parseFloat(dateDataArray[1]))-Math.round(parseFloat(dateDataArray[2]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        				dateString+="<br><div class='lowInventory' style='margin-top: 1px;'>Few seats Left!</div>";
			        			dateString+="</span></td>";
			        		}
			        		else
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])));
			        			if(dateDataArray[0]==totalPaxCount)
			        	  			dateString+="<br><div class='lowInventory'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        	}
			        	else
			        	{
			        		dateString+="<td width='25px'><span style='cursor:pointer;padding:0px;line-height:1.2;width:6.4em!important;' class='domGitonlineBook' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'>"+days[date.getDay()]+" - "+dateArray[j]+"</span>";
			        		if(parseInt(dateDataArray[2])>0)
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0!important;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'><strike>Rs.&nbsp;</strike></p><strike class='calStrike'>"+formatPriceWithoutImg(Math.round(parseFloat(dateDataArray[1])))+"</strike><br /><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg((Math.round(parseFloat(dateDataArray[1]))-Math.round(parseFloat(dateDataArray[2]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        				dateString+="<br><div class='lowInventory' style='margin-top: 1px;'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        		else
			        		{
			        			dateString+="<span style='cursor:pointer;padding:4px 0 0;line-height:1.2;width:6.4em!important;height:42px;' class='calDate' onclick='setDate("+monthArray[0]+","+monthArray[1]+","+dateArray[j]+");'><p class='WebRupee calPrice' style='font-size: 12px;'>Rs.&nbsp;</p>"+formatPriceWithoutImg(parseInt(Math.round(parseFloat(dateDataArray[1]))));
			        			if(dateDataArray[0]==totalPaxCount)
			        	  			dateString+="<br><div class='lowInventory'>Few seats Left!</div>";
			        	  		dateString+="</span></td>";
			        		}
			        	}
					}
				}
				//thrDateLoopCnt++;
			}
			
			dateString+="</tr></table></div></td>";
			if(tab==1)
			{
				//if(dateLen>6)
					dateString+="<td><span class=\"rightArrow\" onclick=\"scrollRight('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
				//else
				//	dateString+="<td>&nbsp;</td>";
			}
			if(tab==2)
			{
				//if(dateLen>6)
					dateString+="<td><span class=\"rightArrow\" onclick=\"scrollRight('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
				//else
				//	dateString+="<td>&nbsp;</td>";
			}
			if(tab==3)
			{
				if(dateArray.length>6)
					dateString+="<td><span class=\"rightArrow\" onclick=\"scrollRight('"+months[trimmedMonth-1]+"','"+i+"');\"></span></td>";
				else
					dateString+="<td>&nbsp;</td>";
			}
		}
		invDates.splice(0,dateArray.length);
		dateString+="</tr>";
		
	}
	dateString+="</table></div>";
	//if(countMonth>3)
		dateString+="<div class='bottomArrowContent'><span class=bottomArrow onclick='scrollDown();'></span></div>";
	//else
	//	dateString+="<div class='topArrowContent'>&nbsp;</div>";
	$g(".calBody").html(dateString);
	
	var janLen = $g("#Jan table td").length;
	var febLen = $g("#Feb table td").length;
	var marLen = $g("#Mar table td").length;
	var aprLen = $g("#Apr table td").length;
	var mayLen = $g("#May table td").length;
	var junLen = $g("#Jun table td").length;
	var julLen = $g("#Jul table td").length;
	var augLen = $g("#Aug table td").length;
	var sepLen = $g("#Sep table td").length;
	var octLen = $g("#Oct table td").length;
	var novLen = $g("#Nov table td").length;
	var decLen = $g("#Dec table td").length;
	
	var monthLen = $g(".calMonth").length;
	if(monthLen<=6)
		globalMonthLen = 223;
	else if(monthLen<=9)
		globalMonthLen = 446;
	else if(monthLen<=12)
		globalMonthLen = 669;
	else if(monthLen<=15)
		globalMonthLen = 892;
	else if(monthLen<=18)
		globalMonthLen = 1115;
	
	if(monthLen<=3)
	{
		$g(".topArrow").css("visibility","hidden");
		$g(".bottomArrow").css("visibility","hidden");
	}
	
	if(janLen<=6 ){
		$g("#Jan").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Jan").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	if(febLen<=6 ){
		$g("#Feb").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Feb").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(marLen<=6 ){
		$g("#Mar").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Mar").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	if(aprLen<=6 ){
		$g("#Apr").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Apr").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	if(mayLen<=6 ){
		$g("#May").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#May").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	if(junLen<=6 ){
		$g("#Jun").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Jun").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(julLen<=6 ){
		$g("#Jul").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Jul").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(augLen<=6 ){
		$g("#Aug").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Aug").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	if(sepLen<=6 ){
		$g("#Sep").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Sep").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(octLen<=6 ){
		$g("#Oct").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Oct").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(novLen<=6 ){
		$g("#Nov").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Nov").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	if(decLen<=6 ){
		$g("#Dec").closest("tr").find(".leftArrow").css("visibility","hidden");
		$g("#Dec").closest("tr").find(".rightArrow").css("visibility","hidden");
	}
	
	scrolled=0;
	counter=1;
	glovalDivId="";
	horzScrolled=0;
	scroll =0;
	$g(".monthDiv").animate({
    	scrollLeft:  -629
    },50);
	$g(".cover").animate({
	      scrollTop:  0
	},10);
	//var tabHeight = $g(".calTb").css("height");
	//tableheight = parseInt(tabHeight.substr(0,tabHeight.length-2))/2;
}
var scrolled=0;
//var tableheight=0;
var globalMonthLen;
var tablewidth=0;

function scrollUp()
{
	/*if(scrolled>$g(".cover").scrollTop())
	{
		scrolled=$g(".cover").scrollTop();
		tableheight=scrolled;
	}*/
	//if(scrolled>=tableheight && $g(".cover").scrollTop()>=tableheight)
	if(scrolled>=223)
	{
		scrolled=scrolled-223;
	    $g(".cover").animate({
	      scrollTop:  scrolled
	    },500);
	}
}
function scrollDown()
{
	if(scrolled<globalMonthLen)
	{	
		scrolled=scrolled+223;
	    $g(".cover").animate({
	      scrollTop:  scrolled
	    },500);
	}
}

function scrollLeftSide(divId,no)
{
		if(divId!=glovalDivId)
		{
			counter=1;
			glovalDivId=divId;
			horzScrolled=0;
			var monthDivLen = $g(".monthDiv").length;
			for(var i=0;i<monthDivLen;i++)
			{
				if(no!=i)
				{
					$g(".mDiv"+i).animate({
				    	scrollLeft:  -629
				    },50);
				}
			}
			
		}
		var tdLength = $g("#"+divId+" table td").length;
		tdLength = tdLength/6;
		if(counter>1){
			if($g.browser.mozilla || browser_version=='MSIE 8.0' || browser_version=='MSIE 7.0')			
				horzScrolled=horzScrolled-310;
			else if(browser_version=='MSIE 7.0')
				horzScrolled=horzScrolled-308;
			else
				horzScrolled=horzScrolled-314;
			counter--;
		    $g("."+divId).animate({
		    	scrollLeft:  horzScrolled
		    },500);
		}
}

function scrollRight(divId,no)
{
	if(divId!=glovalDivId)
	{
		counter=1;
		glovalDivId=divId;
		horzScrolled=0
		var monthDivLen = $g(".monthDiv").length;
		for(var i=0;i<monthDivLen;i++)
		{
			if(no!=i)
			{
				$g(".mDiv"+i).animate({
			    	scrollLeft:  -629
			    },50);
			}
		}
	}
	var tdLength = $g("#"+divId+" table td").length;
	tdLength = Math.round(tdLength/6);
	if(counter<=tdLength){
		if($g.browser.mozilla || browser_version=='MSIE 8.0')
			horzScrolled=horzScrolled+310;
		else if(browser_version=='MSIE 7.0')
			horzScrolled=horzScrolled+308;
		else
			horzScrolled=horzScrolled+314;
		counter++;
	    $g("."+divId).animate({
	    	scrollLeft:  horzScrolled
	    },500);
	}
}

/** function for new calendar of dates end **/
function setFieldLength(){
	            forEditLength();
	if (document.getElementById('mobileNoNew').value.charAt(0) == '0') {
		$g("#mobileNoNew").attr("maxlength","11")
	}else{
		$g("#mobileNoNew").attr("maxlength","10")
	}
}
function forEditLength(){
	$g(".saveAndContinueButton").hide();
	$g("#calculateButton").show();
}


/** function for new calendar of dates end **/
function getUrlParameter( name1 )
{
	name1 = name1.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regexS = "[\\?&]"+name1+"=([^&#]*)";
	var regex = new RegExp( regexS );
	var results = regex.exec( window.location.href );
	if( results == null )
		return "";
	else
		return results[1];
}
