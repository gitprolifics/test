package com.ibm.travelbookingportlet.controller;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.portlet.util.PortletUtils;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ibm.travelbookingportlet.cons.InclusionItems;
import com.ibm.travelbookingportlet.cons.ThomasUtil;
import com.ibm.travelbookingportlet.vo.DestinationDetailsBookingVO;
import com.ibm.travelbookingportlet.vo.FlightInfoVO;
import com.ibm.travelbookingportlet.vo.HotelInfoVO;
import com.ibm.travelbookingportlet.vo.ItenaryInfoVO;
import com.ibm.travelbookingportlet.vo.MainDestinationVO;
import com.ibm.travelbookingportlet.vo.PassengersDetailsVO;
import com.ibm.travelbookingportlet.vo.TripInclusionsVO;
import com.ibm.wps.propertybroker.common.property.BaseController;
import com.ibm.www.rules.decisionservice.thomascookruleapp.param.Request;
import com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.ThomascookruleappThomascookrulesBindingStub;
import com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.ThomascookrulesDecisionService_ServiceLocator;
import com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.ThomascookrulesRequest;
import com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.ThomascookrulesResponse;



@Controller("TravelBookingController")
@RequestMapping("VIEW")
public class TravelBookingController extends BaseController {
	private static final String VIEW_MAINPAGE = "maindestination";
	private static final String PASSENGER_PAGE = "passengerdetails";
	private static final String DESTINATIONS_PAGE = "destinations";
	private static final String DESTINATION_DETAILS_PAGE = "destinationsdetails";
	private static final String DESTINATION_DETAILS_BOOKING_PAGE = "destinationdetailsbooking";
	private static final String VIEW_CONFIRM_DETAILSPAGE = "confirmdetails";
	private static final String VIEW_CONFIRMATION = "confirmation";

	private Integer progressBar = 0;
	
	
	private List<String> includedItems;
	private String excludedItem;
	
	//private ITravelBookingService travelBookingService;
	private List<TripInclusionsVO> inclusionItems;
	private static final Logger LOGGER = LoggerFactory.getLogger(TravelBookingController.class);

	/**
	 * This is the default render method for the distributor estimator portlet
	 * 
	 * @param request framework provided request object
	 * @param response framework provided response object
	 * @return object representing models and view
	 */
	@RenderMapping
	public ModelAndView displayMainPage(final RenderRequest request, final RenderResponse response) {
		final ModelAndView mav = new ModelAndView(VIEW_MAINPAGE );
		mav.addObject("mainDestinationVO", new MainDestinationVO());

		List<MainDestinationVO> mainDestinations = new ArrayList<MainDestinationVO>();
		MainDestinationVO mainDestination = new MainDestinationVO();

		mainDestination.setMaindestination("Europe");
		mainDestination.setSubdestination1("France");
		mainDestination.setSubdestination2("Germany");

		mainDestinations.add(mainDestination);
		mav.addObject("mainDestinations", mainDestinations);

		mav.setView(VIEW_MAINPAGE);
		
		//added code by krishna
		request.getPortletSession().setAttribute("mainDestinations", mainDestinations);

		try{
			LOGGER.debug("displayMainPage() - estimator page");
			System.err.println("before calling view RenderMapping  - TravelBookingController");
			return mav;
		}catch (Exception e){
			System.err.println("Exception occured:"+ e.getMessage());
			return mav;
		}
	}

	/**
	 * This method is to save destination
	 * 
	 * @param timePeriod the duration
	 * @param dps the network
	 * @param source the source 
	 * @param response framework provided response object
	 * @return void
	 */
	@ActionMapping(params = "action=saveMainDestination")
	public void  submitMainDestiantion(@ModelAttribute("mainDestinationVO")  MainDestinationVO mainDestinationVO, ActionRequest request, ActionResponse response, Model model) {
		System.out.println("*************** inside submitMainDestiantion sub1***********" + mainDestinationVO.getSubdestination1());
		System.out.println("************* inside submitMainDestiantion arrivalDate**********" + mainDestinationVO.getArrivalDate());
		final ModelAndView mav = new ModelAndView(PASSENGER_PAGE );
		mav.setView(PASSENGER_PAGE);
		try {
			//Incrementing the progress bar
			progressBar++;
			mav.addObject("progressBar", progressBar);

			response.setRenderParameter("next", "nextPage");
		}catch(Exception e){
		}
		// Set arrival departure dates for subdestinations
		mainDestinationVO = ThomasUtil.setArrivalDepartureDatesForSubDest(mainDestinationVO);
				
		request.getPortletSession().setAttribute("mainDestinationVO", mainDestinationVO);
		PortletUtils.setSessionAttribute(request,"mainDestinationVO", mainDestinationVO);
		PortletUtils.setSessionAttribute(request,"progressBar", progressBar);
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
	}

	@ActionMapping(params = "action=showMainDestination")
	public void  showMainDestiantion(@ModelAttribute("mainDestinationVO") final MainDestinationVO mainDestinationVO, ActionRequest request, ActionResponse response, Model model) {
		try{
			response.setRenderParameter("nextPage", "showMain");
		}catch(Exception e){
		}
	}
	@ActionMapping(params = "action=showPassengerDetails")
	public void  showPassengerDetails(@ModelAttribute("mainDestinationVO") final MainDestinationVO mainDestinationVO, ActionRequest request, ActionResponse response, Model model) {
		try{
			model.addAttribute("progressBar", progressBar);
			request.setAttribute("progressBar", progressBar);
			response.setRenderParameter("next", "nextPage");
		}catch(Exception e){
		}
	}
	
	@ActionMapping(params = "action=showCofirmDetails")
	public void  showCofirmDetails(ActionRequest request, ActionResponse response, Model model) {
		try{
			final ModelAndView mav = new ModelAndView(VIEW_CONFIRM_DETAILSPAGE );
			model.addAttribute("progressBar", progressBar);
			request.setAttribute("progressBar", progressBar);
			
			response.setRenderParameter("confirm", "confirmpage");
		}catch(Exception e){
		}
	}
	
	@ActionMapping(params = "action=showCofirmation")
	public void  showCofirmation(ActionRequest request, ActionResponse response, Model model) {
		try{
			final ModelAndView mav = new ModelAndView(VIEW_CONFIRMATION);
			model.addAttribute("progressBar", progressBar);
			request.setAttribute("progressBar", progressBar);
			
			response.setRenderParameter("confirmation", "confirmationpage");
		}catch(Exception e){
		}
	}
	
	@ResourceMapping(value="hotelInfo")
	@ResponseBody
	public View getHotelInfo(final PortletRequest request,@RequestParam final String hotelId){
		System.out.println("--****------getHotelInfo---*******---------------");
		MappingJacksonJsonView view = new MappingJacksonJsonView();
		System.out.println("hotelId:       "+hotelId);
		MainDestinationVO mainDestinationVO = (MainDestinationVO)PortletUtils.getSessionAttribute(request,"mainDestinationVO");
		String subDestination = (String)PortletUtils.getSessionAttribute(request,"subDestination");
		System.out.println(" ********** Sub Destination: "+ subDestination);
		List<HotelInfoVO> hotelList = ThomasUtil.getHotelInfo(mainDestinationVO, subDestination);
		for(HotelInfoVO hotel: hotelList){
			
			if(hotel.getHotelid() == Integer.parseInt(hotelId)){
				view.addStaticAttribute("hotel", hotel);
				break;
			}
		}
		
		
		
		return view;
	}
	
	@ResourceMapping(value="accomodation")
	@ResponseBody
	public View getAccomodationInfo(final PortletRequest request,@RequestParam final String inclusions){
		System.out.println("--****------getAccomodationInfo---*******---------------"+inclusions);
		List<String> itemsList = null;
		if(inclusions != null && !inclusions.equals("")){
			String [] inclusionItems = inclusions.split(",");
			itemsList = Arrays.asList(inclusionItems);
			Collections.sort(itemsList);
		}
		
		MappingJacksonJsonView view = new MappingJacksonJsonView();
		/*.out.println("hotelId:       "+hotelId);
		MainDestinationVO mainDestinationVO = (MainDestinationVO)PortletUtils.getSessionAttribute(request,"mainDestinationVO");
		String subDestination = (String)PortletUtils.getSessionAttribute(request,"subDestination");
		System.out.println(" ********** Sub Destination: "+ subDestination);
		List<HotelInfoVO> hotelList = ThomasUtil.getHotelInfo(mainDestinationVO, subDestination);
		for(HotelInfoVO hotel: hotelList){
			
			if(hotel.getHotelid() == Integer.parseInt(hotelId)){
				view.addStaticAttribute("hotel", hotel);
				break;
			}
		}*/
		
		//KOTI - BEGIN 
				try{
					List<HotelInfoVO> hotels = getHotelInfos();
					List<HotelInfoVO> hotelsInfos = new ArrayList<HotelInfoVO>();
					for (HotelInfoVO hotelInfoVO : hotels) {
						List<String> selectedItems = hotelInfoVO.getItemsSelected();
						System.out.println(itemsList + " : itemsList ******************************************");
						System.out.println(selectedItems + " : selectedItems ************************************ : "+ (itemsList.equals(selectedItems)));
						Collections.sort(selectedItems);
						if(itemsList.equals(selectedItems)){
							hotelsInfos.add(hotelInfoVO);
						}
					}
					
					//model.addAttribute("hotelsInfos", hotelsInfos);
				//	request.setAttribute("hotelsInfos", hotelsInfos);
					view.addStaticAttribute("hotelsInfos", hotelsInfos);
				}
				catch(Exception e){
					e.printStackTrace();
				}
				//KOTI -END
				
		return view;
	}
	
	
	@RenderMapping(params = "action=savePassengersDetails")
	public ModelAndView submitPassengerDetails(@ModelAttribute("flightInfoVO") final FlightInfoVO flightInfoVO, final RenderRequest request, @RequestParam("jsonString") String jsonString, RenderResponse response,final Model model){
		System.out.println("--****------submitPassengerDetails---*******---------------");
		System.out.println("jsonString:       "+jsonString);
		Gson gson = new Gson();
		Type listType = new TypeToken<List<PassengersDetailsVO>>(){}.getType();
		List<PassengersDetailsVO> passengers = gson.fromJson(jsonString, listType);
		for (PassengersDetailsVO passenger : passengers) {
			System.out.println("firstName:   "+passenger.getFirstName());
		}
		Map<String, FlightInfoVO> flightsInfoMap = new HashMap<String, FlightInfoVO>();
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		//Added by Krishna Vidala
		System.out.println("******value of subdest: " + mainDestinationVO.getSubdestination1()+" and subdest2="+mainDestinationVO.getSubdestination2());
	
		List<FlightInfoVO> flightsInfo1 = new ArrayList<FlightInfoVO>();
		List<FlightInfoVO> flightsInfo2 = new ArrayList<FlightInfoVO>();
	
		FlightInfoVO flightInfo1 = new FlightInfoVO();
		
		flightInfo1.setFlightid(101);
		flightInfo1.setFlightname("MB-FR");
		flightInfo1.setDeparturedate(mainDestinationVO.getDepartureDate());
		flightInfo1.setArrivaldate(mainDestinationVO.getArrivalDate());
		flightInfo1.setDeparturetime("11:00 AM");
		flightInfo1.setArrivaltime("8:00 PM");
		flightInfo1.setFare(new BigDecimal(15000));
		
		flightsInfoMap.put("101", flightInfo1);
	
		FlightInfoVO flightInfo2 = new FlightInfoVO();
		flightInfo2.setFlightid(102);
		flightInfo2.setFlightname("MB-FR");
		flightInfo2.setDeparturedate(mainDestinationVO.getDepartureDate());
		flightInfo2.setArrivaldate(mainDestinationVO.getArrivalDate());
		flightInfo2.setDeparturetime("3:00 PM");
		flightInfo2.setArrivaltime("10:00 PM");
		flightInfo2.setFare(new BigDecimal(18000));
		
		flightsInfoMap.put("102", flightInfo2);
	
		FlightInfoVO flightInfo3 = new FlightInfoVO();
		flightInfo3.setFlightid(103);
		flightInfo3.setFlightname("FR-GR");
		flightInfo3.setDeparturedate(mainDestinationVO.getDepartureDate());
		flightInfo3.setArrivaldate(mainDestinationVO.getArrivalDate());
		flightInfo3.setDeparturetime("11:00 AM");
		flightInfo3.setArrivaltime("8:00 PM");
		flightInfo3.setFare(new BigDecimal(7000));
		
		flightsInfoMap.put("103", flightInfo3);
	
		FlightInfoVO flightInfo4 = new FlightInfoVO();
		flightInfo4.setFlightid(104);
		flightInfo4.setFlightname("FR-GR");
		flightInfo4.setDeparturedate(mainDestinationVO.getDepartureDate());
		flightInfo4.setArrivaldate(mainDestinationVO.getArrivalDate());
		flightInfo4.setDeparturetime("12:00 PM");
		flightInfo4.setArrivaltime("4:00 PM");
		flightInfo4.setFare(new BigDecimal(12000));
		
		flightsInfoMap.put("104", flightInfo4);
	
		flightsInfo1.add(flightInfo1);
		flightsInfo1.add(flightInfo2);
	
		flightsInfo2.add(flightInfo3);
		flightsInfo2.add(flightInfo4);
		final ModelAndView mav = new ModelAndView(DESTINATIONS_PAGE );
		model.addAttribute("flightsInfo1", flightsInfo1);
		model.addAttribute("flightsInfo2", flightsInfo2);
		model.addAttribute("flightInfoVO", flightInfoVO);
		request.setAttribute("mainDestinationVO", mainDestinationVO);
		PortletUtils.setSessionAttribute(request,"flightsInfoMap", flightsInfoMap);
		PortletUtils.setSessionAttribute(request,"passengersDetailsList", passengers);
		progressBar++;
		PortletUtils.setSessionAttribute(request,"progressBar", progressBar);
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
		mav.setView(DESTINATIONS_PAGE);
		
		
		ThomascookruleappThomascookrulesBindingStub stub;
		java.net.URL endpoint;
		try {
			endpoint = new URL("http://220.225.238.20:9082/DecisionService/ws/thomascookruleapp/thomascookrules?WSDL");
			ThomascookrulesDecisionService_ServiceLocator locator = new ThomascookrulesDecisionService_ServiceLocator();
			stub = new ThomascookruleappThomascookrulesBindingStub(endpoint, null );
			ThomascookrulesRequest thomasCookRequest = new ThomascookrulesRequest();
			thomasCookRequest.setDecisionID("11");
			Request req = new Request();
			com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.param.Request paramRequest = new com.ibm.www.rules.decisionservice.thomascookruleapp.thomascookrules.param.Request();
			System.out.println("Destination val in service= "+mainDestinationVO.getMaindestination());
			req.setLocation(mainDestinationVO.getMaindestination());
			paramRequest.setRequest(req);
			thomasCookRequest.setRequest(paramRequest);
			ThomascookrulesResponse thomasCookResponse;
			thomasCookResponse = stub.thomascookrules(thomasCookRequest);

			System.out.println("Air val="+ String.valueOf(thomasCookResponse.getRequest().getRequest().getIsAir())
					+"Bus val="+ String.valueOf(thomasCookResponse.getRequest().getRequest().getIsBus())+
					"Train val="+ String.valueOf(thomasCookResponse.getRequest().getRequest().getIsTrain())
					);
			mainDestinationVO.setAir(String.valueOf(thomasCookResponse.getRequest().getRequest().getIsAir()));
			mainDestinationVO.setBus(String.valueOf(thomasCookResponse.getRequest().getRequest().getIsBus()));
			mainDestinationVO.setTrain(String.valueOf(thomasCookResponse.getRequest().getRequest().getIsTrain()));
			mainDestinationVO.setCruise(String.valueOf(thomasCookResponse.getRequest().getRequest().getIsCruise()));

		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		return mav;
	}
	
	/**
	 * Destinations screen
	 * @param mainDestinationVO
	 */
	@ActionMapping(params = "action=showDestinationDetailsBooking")
	public void showDestinationDetailsBooking(@ModelAttribute("destinationDetailsBookingVO") DestinationDetailsBookingVO destinationDetailsBookingVO,  @RequestParam("subDestination") String subDestination, final ActionRequest request, final ActionResponse response, final Model model){
		System.out.println("inside showDestinationDetailsBooking ******** "+ subDestination);
		final ModelAndView mav = new ModelAndView(DESTINATION_DETAILS_BOOKING_PAGE );
		inclusionItems = new ArrayList<TripInclusionsVO>();
		InclusionItems [] items = InclusionItems.values();
		for (int i = 0; i < items.length; i++) {
			TripInclusionsVO inclusionsVO = new TripInclusionsVO();
			inclusionsVO.setItemName(items[i].getItemName());
			inclusionItems.add(inclusionsVO);

		}
		//mav.addObject("inclusionItems", inclusionItems);
		request.setAttribute("inclusionItems", inclusionItems);
		
		
		// BEGIN - code for showing in destination details booking screen
		MainDestinationVO mainDestinationVO = (MainDestinationVO)PortletUtils.getSessionAttribute(request,"mainDestinationVO");
		
		if(subDestination != null && !subDestination.equals("")){
			PortletUtils.setSessionAttribute(request,"subDestination", subDestination);
		}
		else if(subDestination == null){
			subDestination = (String)PortletUtils.getSessionAttribute(request,"subDestination");
		}
		
		
		//MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		//List<PassengersDetailsVO> passengersDetailsVOList = (List<PassengersDetailsVO>) request.getPortletSession(true).getAttribute("passengerDetailsVOList");
		//MainDestinationVO mainDestinationVO = ThomasUtil.getDummyMainDestinationVO();
		
		System.out.println("---------------------------------------------------------------");
		System.out.println(" mainDestinationVO: "+ mainDestinationVO.getArrivalDate());
		//List<PassengersDetailsVO> passengersDetailsVOList = ThomasUtil.getDummyPassengerDetailsVOList();
		List<PassengersDetailsVO> passengersDetailsVOList = (List<PassengersDetailsVO>)PortletUtils.getSessionAttribute(request,"passengersDetailsList");
		
		System.out.println("passenger list size: "+ passengersDetailsVOList.size());
		//Adding the Itenary Info to model object
		model.addAttribute("itenaryInfoList", ThomasUtil.getItenaryInfo(mainDestinationVO, subDestination));
		//Adding hotel info. to the model object
		model.addAttribute("hotelList", ThomasUtil.getHotelInfo(mainDestinationVO, subDestination));
		//Caclulate the age and add to model object
		destinationDetailsBookingVO = ThomasUtil.getNoOfChidrenAdultsInfants(passengersDetailsVOList, destinationDetailsBookingVO);
		destinationDetailsBookingVO.setArrivalDate(mainDestinationVO.getArrivalDate());
		destinationDetailsBookingVO.setDepartureDate(mainDestinationVO.getDepartureDate());
		destinationDetailsBookingVO.setArriavlDateSubDest1(mainDestinationVO.getArriavlDateSubDest1());
		destinationDetailsBookingVO.setArriavlDateSubDest2(mainDestinationVO.getArriavlDateSubDest2());
		destinationDetailsBookingVO.setDepartureDateSubDest1(mainDestinationVO.getDepartureDateSubDest1());
		destinationDetailsBookingVO.setDepartureDateSubDest2(mainDestinationVO.getDepartureDateSubDest2());
		
		request.getPortletSession().setAttribute("destinationDetailsBookingVO", destinationDetailsBookingVO);
		mav.addObject("destinationDetailsBookingVO", destinationDetailsBookingVO);
		model.addAttribute("destinationDetailsBookingVO", destinationDetailsBookingVO);
		model.addAttribute("subDestination", subDestination);
		
		//KOTI - BEGIN 
		try{
			List<HotelInfoVO> hotelsInfos = getHotelInfos();
			
			
			model.addAttribute("hotelsInfos", hotelsInfos);
			request.setAttribute("hotelsInfos", hotelsInfos);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//KOTI -END
		
		
		
		
		
		System.out.println("---------------------------------------------------------------");
		// END - code for showing in destination details booking screen
		request.setAttribute("mainDestinationVO", mainDestinationVO);
		request.setAttribute("destinationDetailsBookingVO", destinationDetailsBookingVO);
		request.setAttribute("subDestination", subDestination);
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
		//PortletUtils.setSessionAttribute(request,"flightsInfoMap", flightsInfoMap);
		response.setRenderParameter("pageDestBooking", "destinationDetailsBooking");
		//return mav;
	}
	
	private List<HotelInfoVO> getHotelInfos(){
		List<HotelInfoVO> hotelInfoVOs = new ArrayList<HotelInfoVO>();
		List<String> itemsSelected = new ArrayList<String>();
		itemsSelected.add("Lunch");
		itemsSelected.add("Breakfast");
		String excludedItem = "Dinner";
		HotelInfoVO hotelInfoVO = new HotelInfoVO("Renaissance","threestar","Renaissance.jpg","Renaissance_Exterior.jpg","Renaissance_Interior.jpg",itemsSelected,excludedItem,201.00);
		
		List<String> itemsSelected1 = new ArrayList<String>();
		itemsSelected1.add("Breakfast");
		itemsSelected1.add("Dinner");
		String excludedItem1 = "Lunch";
		HotelInfoVO hotelInfoVO1 = new HotelInfoVO("Courtyard Paris","fivestar","Courtyard_Paris.jpg","Courtyard_Paris_Exterior.jpg","Courtyard_Paris_Interior.jpg",itemsSelected1,excludedItem1,202.00);
		
		List<String> itemsSelected2 = new ArrayList<String>();
		itemsSelected2.add("Breakfast");
		itemsSelected2.add("Lunch");
		String excludedItem2 = "Dinner";
		HotelInfoVO hotelInfoVO2 = new HotelInfoVO("Riviera Marriott","threestar","Riviera_Marriott.jpg","Riviera_Marriott_Exterior.jpg","Riviera_Marriott_Interior.jpg",itemsSelected2,excludedItem2,203.00);
		
		hotelInfoVOs.add(hotelInfoVO);
		hotelInfoVOs.add(hotelInfoVO1);
		hotelInfoVOs.add(hotelInfoVO2);
		return hotelInfoVOs;
	}
	@ActionMapping(params = "action=saveDestination")
	public void submitDestination(@ModelAttribute("flightInfoVO") final FlightInfoVO flightInfoVO, final ActionRequest request, ActionResponse response,final Model model){
		System.out.println("--****------Inside submitDestination---*******---------------");
		//MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		//Added by Krishna Vidala
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		System.out.println("Flight Id in dest1= "+flightInfoVO.getDestinationOne());
		System.out.println("Flight Id in dest2= "+flightInfoVO.getDestinationTwo());
		Map<String, FlightInfoVO> flightsInfoMap  = (HashMap)PortletUtils.getSessionAttribute(request,"flightsInfoMap");
		System.out.println("flightsInfoMap size= "+flightsInfoMap.size());
		FlightInfoVO selectedFirstFlightInfo = flightsInfoMap.get(flightInfoVO.getDestinationOne());
		FlightInfoVO selectedSecondFlightInfo = flightsInfoMap.get(flightInfoVO.getDestinationTwo());
		
		selectedFirstFlightInfo.setArrivaldate(mainDestinationVO.getArriavlDateSubDest1());
		selectedSecondFlightInfo.setArrivaldate(mainDestinationVO.getArriavlDateSubDest2());
		
		selectedFirstFlightInfo.setDeparturedate(mainDestinationVO.getDepartureDateSubDest1());
		selectedSecondFlightInfo.setDeparturedate(mainDestinationVO.getDepartureDateSubDest2());
		
		
		request.getPortletSession().setAttribute("selectedFirstFlightInfo", selectedFirstFlightInfo);
		request.getPortletSession().setAttribute("selectedSecondFlightInfo", selectedSecondFlightInfo);
		
		final ModelAndView mav = new ModelAndView(DESTINATION_DETAILS_PAGE );
		System.out.println("****************** Going to destination details page**********" + selectedFirstFlightInfo.getFlightname());
		model.addAttribute("selectedFirstFlightInfo", selectedFirstFlightInfo);
		model.addAttribute("selectedSecondFlightInfo", selectedSecondFlightInfo);
		model.addAttribute("localTravel", flightInfoVO.getLocalTravel());
		
		request.getPortletSession().setAttribute("flightInfoVO", flightInfoVO);
		request.setAttribute("mainDestinationVO", mainDestinationVO);
		System.out.println("arrival Date in submitDestination------= "+mainDestinationVO.getArrivalDate());
		System.out.println("arrival Date in submitDestination------= "+mainDestinationVO.getDepartureDate());
		
		progressBar++;
		PortletUtils.setSessionAttribute(request,"progressBar", progressBar);
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
	
		
		mav.setView(DESTINATION_DETAILS_PAGE);
		try {
			//Incrementing the progress bar
			progressBar++;
			mav.addObject("progressBar", progressBar);
			response.setRenderParameter("pageDest", "destinationDetails");
		}catch(Exception e){
		}
	}
	
	@ActionMapping(params = "action=saveDestinationDetails")
	public void submitDestinationDetails(@ModelAttribute("flightInfoVO") final FlightInfoVO flightInfoVO, final ActionRequest request, ActionResponse response,final Model model){
		System.out.println("--****------Inside submitDestinationDetails---*******---------------");
		final ModelAndView mav = new ModelAndView(DESTINATION_DETAILS_BOOKING_PAGE );
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		request.setAttribute("mainDestinationVO", mainDestinationVO);
		mav.setView(DESTINATION_DETAILS_BOOKING_PAGE);
		try {
			//Incrementing the progress bar
			progressBar++;
			mav.addObject("progressBar", progressBar);
			response.setRenderParameter("pageDestBooking", "destinationDetailsBooking");
		}catch(Exception e){
		}
	}
	/**
	 * Destinations screen
	 * @param mainDestinationVO
	 */
	@ActionMapping(params = "action=showDestinations")
	public void showDestinations( ActionRequest request, ActionResponse response, Model model) {
		System.out.println("inside showDestinations");
		final ModelAndView mav = new ModelAndView(DESTINATIONS_PAGE );
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
		response.setRenderParameter("page", "destinations");
	}
	/**
	 * Destinations screen
	 * @param mainDestinationVO
	 */
	@ActionMapping(params = "action=showDestinationDetails")
	public void showDestinationDetails(@ModelAttribute("destinationDetailsBookingVO") final DestinationDetailsBookingVO destinationDetailsBookingVO, ActionRequest request, ActionResponse response, Model model) {
		System.out.println("inside showDestinationDetails");
		
		System.out.println(" ******************************************************************************* ");
		System.out.println(destinationDetailsBookingVO.toString());
		System.out.println(" ******************************************************************************* ");
		//BEGIN - putting destination in session
		if(PortletUtils.getSessionAttribute(request,"destinationDetailsBookingVO2") != null){
			//destinationDetailsBookingVO2 = (DestinationDetailsBookingVO)PortletUtils.getSessionAttribute(request,"destinationDetailsBookingVO2");
			PortletUtils.setSessionAttribute(request,"destinationDetailsBookingVO3", destinationDetailsBookingVO);
			
			
		}else{
			PortletUtils.setSessionAttribute(request,"destinationDetailsBookingVO2", destinationDetailsBookingVO);
		}
		//END - putting destination in session
		
		
		
		
		final ModelAndView mav = new ModelAndView(DESTINATION_DETAILS_PAGE );
		
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession().getAttribute("mainDestinationVO");
		
		System.out.println(mainDestinationVO.getSubdestination1() + " : mainDestinationVO.getSubdestination1()");
		FlightInfoVO flightInfoVO = (FlightInfoVO) request.getPortletSession().getAttribute("flightInfoVO");
		
		System.out.println("--------In showDestinationDetails() Flight Id in dest1= "+flightInfoVO.getDestinationOne());
		Map<String, FlightInfoVO> flightsInfoMap  = (HashMap)PortletUtils.getSessionAttribute(request,"flightsInfoMap");
		FlightInfoVO selectedFirstFlightInfo = flightsInfoMap.get(flightInfoVO.getDestinationOne());
		FlightInfoVO selectedSecondFlightInfo = flightsInfoMap.get(flightInfoVO.getDestinationTwo());
		
		selectedFirstFlightInfo.setArrivaldate(mainDestinationVO.getArriavlDateSubDest1());
		selectedSecondFlightInfo.setArrivaldate(mainDestinationVO.getArriavlDateSubDest2());
		
		selectedFirstFlightInfo.setDeparturedate(mainDestinationVO.getDepartureDateSubDest1());
		selectedSecondFlightInfo.setDeparturedate(mainDestinationVO.getDepartureDateSubDest2());
		
		
		request.getPortletSession().setAttribute("selectedFirstFlightInfo", selectedFirstFlightInfo);
		request.getPortletSession().setAttribute("selectedSecondFlightInfo", selectedSecondFlightInfo);
		
		model.addAttribute("selectedFirstFlightInfo", selectedFirstFlightInfo);
		model.addAttribute("selectedSecondFlightInfo", selectedSecondFlightInfo);
		model.addAttribute("localTravel", flightInfoVO.getLocalTravel());
		
		
		request.setAttribute("mainDestinationVO", mainDestinationVO);
		
		model.addAttribute("progressBar", progressBar);
		request.setAttribute("progressBar", progressBar);
		response.setRenderParameter("pageDest", "destinationDetails");
	}
	

	@RenderMapping(params = "nextPage=showMain")
	public String showMainPage(RenderRequest request, final RenderResponse response, final Model model) {
		//get list from session
		final ModelAndView mav = new ModelAndView(VIEW_MAINPAGE );
		List<MainDestinationVO> mainDestinations =  (List<MainDestinationVO>) request.getPortletSession().getAttribute("mainDestinations");
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession(true).getAttribute("mainDestinationVO");
		mav.addObject("mainDestinations", mainDestinations);
		model.addAttribute("mainDestinationVO", mainDestinationVO);
		model.addAttribute("mainDestinations", mainDestinations);
		mav.setView(VIEW_MAINPAGE);
		System.out.println("****************** Going to main destination page");
		return VIEW_MAINPAGE;
	}

	@RenderMapping(params = "next=nextPage")
	public String myMethod(final RenderResponse response, final Model model) {
		System.out.println("****************** Going to passenger details page");
		model.addAttribute("progressBar", progressBar);
		return PASSENGER_PAGE;
	}

	@RenderMapping(params = "page=destinations")
	public String showDestinationsPage(final RenderResponse response, final Model model) {
		System.out.println("****************** Going to destinations page");
		return DESTINATIONS_PAGE;
	}

	@RenderMapping(params = "pageDest=destinationDetails")
	public String showDestinationDetailsPage(RenderRequest request, RenderResponse response, final Model model) {
		
		FlightInfoVO firstFlightInfo = (FlightInfoVO) request.getPortletSession().getAttribute("selectedFirstFlightInfo");
		FlightInfoVO secondFlightInfo = (FlightInfoVO) request.getPortletSession().getAttribute("selectedSecondFlightInfo");
		
		//System.out.println("****************** Going to destination details page**********" + firstFlightInfo.getFlightname());
		return DESTINATION_DETAILS_PAGE;
	}
	@RenderMapping(params = "pageDestBooking=destinationDetailsBooking")
	public String showDestinationDetailsBookingPage(final RenderResponse response, final Model model) {
		System.out.println("****************** Going to showDestinationDetailsBookingPage");
		
		return DESTINATION_DETAILS_BOOKING_PAGE;
	}
	
	@RenderMapping(params = "confirm=confirmpage")
	public String showConfirmDetailsPage(final RenderRequest request, final RenderResponse response, final Model model) {
		System.out.println("****************** Going to confirm details page");
		
		final ModelAndView mav = new ModelAndView(VIEW_CONFIRM_DETAILSPAGE );
		MainDestinationVO mainDestinationVO = (MainDestinationVO) request.getPortletSession().getAttribute("mainDestinationVO");
		model.addAttribute("mainDestinationVO", mainDestinationVO);
		mav.addObject("mainDestinationVO", mainDestinationVO);
		
		DestinationDetailsBookingVO destinationDetailsBookingVO = (DestinationDetailsBookingVO) request.getPortletSession().getAttribute("destinationDetailsBookingVO");
		DestinationDetailsBookingVO destinationDetailsBookingVO2 = (DestinationDetailsBookingVO) request.getPortletSession().getAttribute("destinationDetailsBookingVO2");
		DestinationDetailsBookingVO destinationDetailsBookingVO3 = (DestinationDetailsBookingVO) request.getPortletSession().getAttribute("destinationDetailsBookingVO3");
		System.out.println("------------------destinationDetailsBookingVO------------" + destinationDetailsBookingVO.getNoOfAdults());
		System.out.println("----------mainDestinationVO no. of days for 2nd destination------------" + mainDestinationVO.getDays1());
		
		System.out.println(" ******************************************************************************* ");
		System.out.println(destinationDetailsBookingVO2.toString());
		System.out.println(destinationDetailsBookingVO3.toString());
		
		//Get the selectedhotel info
		
		destinationDetailsBookingVO2.setHotelURL(getHotelURL(destinationDetailsBookingVO2.getHotelChecked()));
		destinationDetailsBookingVO3.setHotelURL(getHotelURL(destinationDetailsBookingVO3.getHotelChecked()));
	//	destinationDetailsBookingVO2.setHotelURL(getHotelURL(destinationDetailsBookingVO2.getHotelName()));
		//destinationDetailsBookingVO3.setHotelURL(getHotelURL(destinationDetailsBookingVO3.getHotelName()));
		
		destinationDetailsBookingVO2.setSubDestination(mainDestinationVO.getSubdestination1());
		destinationDetailsBookingVO3.setSubDestination(mainDestinationVO.getSubdestination2());
		
		
		destinationDetailsBookingVO2.setIntDays(mainDestinationVO.getDays());
		destinationDetailsBookingVO3.setIntDays(mainDestinationVO.getDays1());
		destinationDetailsBookingVO2.setIntNights(mainDestinationVO.getNights());
		destinationDetailsBookingVO3.setIntNights(mainDestinationVO.getNights1());
		
		destinationDetailsBookingVO2.setItenaryInfoList(getItenaryInfoList(mainDestinationVO, destinationDetailsBookingVO2, mainDestinationVO.getSubdestination1()));
		
		destinationDetailsBookingVO3.setItenaryInfoList(getItenaryInfoList(mainDestinationVO, destinationDetailsBookingVO3, mainDestinationVO.getSubdestination2()));
		System.out.println(" ******************************************************************************* ");
		
		
		
		List<DestinationDetailsBookingVO> destinationDetailsBookingVOList = new ArrayList<DestinationDetailsBookingVO>();
		destinationDetailsBookingVOList.add(destinationDetailsBookingVO2);
		destinationDetailsBookingVOList.add(destinationDetailsBookingVO3);
		model.addAttribute("destinationDetailsBookingVOList", destinationDetailsBookingVOList);
		mav.addObject("destinationDetailsBookingVOList", destinationDetailsBookingVOList);
		
		
		
		int days = mainDestinationVO.getDays() + mainDestinationVO.getDays1();
		Double hotelCost = (double) (days * 10000);
		
		Double localTransportaion = 6000d;
		Double tax = (hotelCost + localTransportaion)/10;
		
		destinationDetailsBookingVO.setHotelCost(hotelCost);
		destinationDetailsBookingVO.setTax(tax);
		destinationDetailsBookingVO.setTotalCost(hotelCost + localTransportaion + tax);
		
		System.out.println("------------Total cost---------------" + destinationDetailsBookingVO.getTotalCost());
		
		model.addAttribute("destinationDetailsBookingVO", destinationDetailsBookingVO);
		mav.addObject("destinationDetailsBookingVO", destinationDetailsBookingVO);
		
		return VIEW_CONFIRM_DETAILSPAGE;
	}

	
	private String getHotelURL(String hotelName){
		
		String hotelURL = null;
		
		for(HotelInfoVO hotel: getHotelInfos()){
			
			if(hotel.getHotelname().equals(hotelName)){
			hotelURL = hotel.getHotelImage();
			break;
			}
		}
		return hotelURL;
		
	}
	
	private List<ItenaryInfoVO> getItenaryInfoList(MainDestinationVO mainDestinationVO,
			DestinationDetailsBookingVO destinationDetailsBookingVO2, String subDestination) {
		//Get Itenary Info for the selected
		List<ItenaryInfoVO> itemInfoList = new ArrayList<ItenaryInfoVO>();
		if(destinationDetailsBookingVO2.getDay0() != null){
			ItenaryInfoVO itenary = new ItenaryInfoVO();
			itenary.setDay(destinationDetailsBookingVO2.getDay0());
			itenary.setDate(destinationDetailsBookingVO2.getDepDate0());
			//Get hotel info
			int hotelId = Integer.parseInt(destinationDetailsBookingVO2.getHotel0());
			
			    List<HotelInfoVO> hotelInfoList = ThomasUtil.getHotelInfo(mainDestinationVO, subDestination);
			    for(HotelInfoVO hotel: hotelInfoList){
			    	if(hotel.getHotelid() == hotelId){
			    		itenary.setHotelImage(hotel.getImageUrl());
			    		itenary.setHotelInfo(hotel.getDescription());
			    		itenary.setHotelName(hotel.getHotelname());
			    	}
			    }
			
			itemInfoList.add(itenary);
		}
		if(destinationDetailsBookingVO2.getDay1() != null){
			ItenaryInfoVO itenary = new ItenaryInfoVO();
			itenary.setDay(destinationDetailsBookingVO2.getDay1());
			itenary.setDate(destinationDetailsBookingVO2.getDepDate1());
			//Get hotel info
			int hotelId = Integer.parseInt(destinationDetailsBookingVO2.getHotel1());
			
			    List<HotelInfoVO> hotelInfoList = ThomasUtil.getHotelInfo(mainDestinationVO, subDestination);
			    for(HotelInfoVO hotel: hotelInfoList){
			    	if(hotel.getHotelid() == hotelId){
			    		itenary.setHotelImage(hotel.getImageUrl());
			    		itenary.setHotelInfo(hotel.getDescription());
			    		itenary.setHotelName(hotel.getHotelname());
			    	}
			    }
			
			itemInfoList.add(itenary);
		}
		
		if(destinationDetailsBookingVO2.getDay2() != null){
			ItenaryInfoVO itenary = new ItenaryInfoVO();
			itenary.setDay(destinationDetailsBookingVO2.getDay2());
			itenary.setDate(destinationDetailsBookingVO2.getDepDate2());
			//Get hotel info
			int hotelId = Integer.parseInt(destinationDetailsBookingVO2.getHotel2());
			
			    List<HotelInfoVO> hotelInfoList = ThomasUtil.getHotelInfo(mainDestinationVO, subDestination);
			    for(HotelInfoVO hotel: hotelInfoList){
			    	if(hotel.getHotelid() == hotelId){
			    		itenary.setHotelImage(hotel.getImageUrl());
			    		itenary.setHotelInfo(hotel.getDescription());
			    		itenary.setHotelName(hotel.getHotelname());
			    	}
			    }
			
			itemInfoList.add(itenary);
		}
		
		return itemInfoList;
	}
	
	@RenderMapping(params = "confirmation=confirmationpage")
	public String showConfirmationPage(final RenderRequest request, final RenderResponse response, final Model model) {
		
		final ModelAndView mav = new ModelAndView(VIEW_CONFIRMATION );
		
		ThomasUtil.emailNotification("testemailpoc@gmail.com", "sgaddam@prolifics.com", request.getUserPrincipal().getName(), "BR43524624");
		return VIEW_CONFIRMATION;
	}

	/**
	 * This method is to save destination
	 * 
	 * @param timePeriod the duration
	 * @param dps the network
	 * @param source the source 
	 * @param response framework provided response object
	 * @return void
	 */

	@ResourceMapping("saveDestinationInfo")
	public void usePreviousAddress(@RequestParam(value = "destid") final String timePeriod,
			@RequestParam(value = "subdestid1") final String dps,
			@RequestParam(value = "subdestid2") final String fromDate, final String toDate,
			final ResourceResponse response) {
		final ModelAndView mav = new ModelAndView(PASSENGER_PAGE );
		mav.addObject("pageURI", "travelbooking/passsengerdetails");
		try {
		}catch(Exception e){
		}
	}
	
	private void getHotelItems(){
		includedItems = new ArrayList<String>();
		includedItems.add("Break Fast");
		includedItems.add("Lunch");
		excludedItem = "Dinner";
	}

	/**
	 * To display data in accommodation tab
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ActionMapping(params = "action=displayAccommodation")
	public String displayAccommodation(ActionRequest request, ActionResponse response, Model model) {
		try {
			List<HotelInfoVO> hotelsInfos = new ArrayList<HotelInfoVO>();
			
			model.addAttribute("hotelsInfo", hotelsInfos);
		} catch (Exception e) {
		}
		return DESTINATION_DETAILS_BOOKING_PAGE;
	}
	
	

}
