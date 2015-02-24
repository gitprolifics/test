package com.ibm.travelbookingportlet.cons;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ibm.travelbookingportlet.vo.DestinationDetailsBookingVO;
import com.ibm.travelbookingportlet.vo.HotelInfoVO;
import com.ibm.travelbookingportlet.vo.ItenaryInfoVO;
import com.ibm.travelbookingportlet.vo.MainDestinationVO;
import com.ibm.travelbookingportlet.vo.PassengersDetailsVO;

public class ThomasUtil {

	
	private static Integer AGE_LIMIT_INFANT = 2;
	private static Integer AGE_LIMIT_CHILDREN = 17;
	
	
	public static List<PassengersDetailsVO> getDummyPassengerDetailsVOList(){
		
		List<PassengersDetailsVO> passList = new ArrayList<PassengersDetailsVO>();
		PassengersDetailsVO pass = new PassengersDetailsVO();
		pass.setAge(25);
		PassengersDetailsVO pass2 = new PassengersDetailsVO();
		pass2.setAge(25);
		PassengersDetailsVO pass3 = new PassengersDetailsVO();
		pass3.setAge(25);
		PassengersDetailsVO pass4 = new PassengersDetailsVO();
		pass4.setAge(25);
		
		
		passList.add(pass);
		passList.add(pass2);
		passList.add(pass3);		
		passList.add(pass4);
		
		return passList;
		
	}
	
	public static MainDestinationVO getDummyMainDestinationVO(){
		MainDestinationVO destinationVO = new MainDestinationVO();
		destinationVO.setArrivalDate("12/06/2014");
		destinationVO.setDepartureDate("16/06/2014");
		
		return destinationVO;
	}
	
	
	public static MainDestinationVO setArrivalDepartureDatesForSubDest(MainDestinationVO mainDestinationVO){
		
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date date1 = null;
		Date date2 = null;
		int noOfDays = 0;
		//Step 1 - get the different number of days
		try 
		{
			date1 = formatter.parse(mainDestinationVO.getDepartureDate());
			date2 = formatter.parse(mainDestinationVO.getArrivalDate());
			
			//Step 2
			
				mainDestinationVO.setDepartureDateSubDest1(mainDestinationVO.getDepartureDate());
				//We are increment the arrival date of the sub destination 1
				
				System.out.println(mainDestinationVO.getDays() + " mainDestinationVO.getDays()");
				date1.setDate(date1.getDate()+mainDestinationVO.getDays());
				
				
				System.out.println("***********   date1.toString() : " + formatter.format(date1).toString());
				mainDestinationVO.setArriavlDateSubDest1(formatter.format(date1).toString());
				
				mainDestinationVO.setDepartureDateSubDest2(mainDestinationVO.getArriavlDateSubDest1());
				
				System.out.println("********************** mainDestinationVO.getDepartureDateSubDest2() : " + mainDestinationVO.getDepartureDateSubDest2());
				//We are increment the arrival date of the sub destination 2
				mainDestinationVO.setArriavlDateSubDest2(mainDestinationVO.getArrivalDate());

				
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return mainDestinationVO;
	}
	
	
	/**
	 * Dummy data for itenary page
	 * @param mainDestinationVO
	 * @return
	 */
	public static List<ItenaryInfoVO> getItenaryInfo(MainDestinationVO mainDestinationVO, String subDestination){
		
		
		List<ItenaryInfoVO> itenaryList = new ArrayList<ItenaryInfoVO>();
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date date1 = null;
		Date date2 = null;
		int noOfDays = 0;
		//Step 1 - get the different number of days
		try 
		{
			date1 = formatter.parse(mainDestinationVO.getDepartureDate());
			date2 = formatter.parse(mainDestinationVO.getArrivalDate());
			/*date1 = formatter.parse(mainDestinationVO.getArrivalDate());
			date2 = formatter.parse(mainDestinationVO.getDepartureDate());*/
		   // date2.setDate(date2.getDate()+1);
		//	noOfDays = (int)( (date2.getTime() - date1.getTime()) / (1000 * 60 * 60 * 24));
			
			if(mainDestinationVO.getSubdestination1().equals(subDestination)){
				noOfDays = mainDestinationVO.getDays();
			}
			
			if(mainDestinationVO.getSubdestination2().equals(subDestination)){
				noOfDays =  mainDestinationVO.getDays1();
			}
			
			
			
			System.out.println(" **** noOfDays "+ noOfDays);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//int noOfDays = 4;
		//Step 2
		for(int i=0; i < noOfDays; i++){
			
			ItenaryInfoVO itenary = new ItenaryInfoVO();
			date1.setDate(date1.getDate()+1);
			itenary.setDate(formatter.format(date1).toString());
			itenary.setDay("Day"+(i+1));
		//	itenary.setHotelImage("");
		//	itenary.setHotelInfo("");
			itenaryList.add(itenary);
		}
		
		System.out.println( " ***** getItenaryInfo.size : "+ itenaryList.size());
		
		return itenaryList;
	}
	
	/**
	 * Dummy data for Hotel Info
	 * @return
	 */
	public static List<HotelInfoVO> getHotelInfo(MainDestinationVO mainDestinationVO, String subDestination){
		
		List<HotelInfoVO> hotelList = new ArrayList<HotelInfoVO>();
		
		int noOfDaysFrance = 0;
		int noOfDaysGermany = 0;
		
		//if(subDestination.equals("France")){
		if(mainDestinationVO.getSubdestination1().equals(subDestination)){
			noOfDaysFrance = mainDestinationVO.getDays();
		}
		
		if(mainDestinationVO.getSubdestination2().equals(subDestination)){
			noOfDaysFrance =  mainDestinationVO.getDays1();
		}
		//}
		//else {
			if(mainDestinationVO.getSubdestination1().equals(subDestination)){
				noOfDaysGermany = mainDestinationVO.getDays();
			}
			
			if(mainDestinationVO.getSubdestination2().equals(subDestination)){
				noOfDaysGermany =  mainDestinationVO.getDays1();
			}
		//	}
			if(subDestination.equals("France")){
		
				HotelInfoVO hotel = new HotelInfoVO();
				hotel.setHotelname("Avoriaz");
				hotel.setDescription("Great Place");
				hotel.setImageUrl("Avoriaz.jpg");
				hotel.setHotelid(01);
				
				HotelInfoVO hotel2 = new HotelInfoVO();
				hotel2.setHotelname("Arvillard");
				hotel2.setDescription("Awesome place to explore and kids enjoy the atmosphere");
				hotel2.setImageUrl("Arvillard.jpg");
				hotel2.setHotelid(02);
				HotelInfoVO hotel3 = new HotelInfoVO();
				hotel3.setHotelname("Detrier");
				hotel3.setDescription("Marvolous inn in Paris");
				hotel3.setImageUrl("Detrier.jpg");
				hotel3.setHotelid(03);
				
				HotelInfoVO hotel5 = new HotelInfoVO();
				hotel5.setHotelname("Ferney-Voltaire");
				hotel5.setDescription("Awesome place to explore and kids enjoy the atmosphere");
				hotel5.setImageUrl("Ferney-Voltaire.jpg");
				hotel5.setHotelid(05);
				
				
				HotelInfoVO hotel4 = new HotelInfoVO();
				hotel4.setHotelname("La Rochette");
				hotel4.setDescription("Great hotel to stay in. Choose your convinient options.");
				hotel4.setImageUrl("La Rochette.jpg");
				hotel4.setHotelid(04);
				
				HotelInfoVO hotel6 = new HotelInfoVO();
				hotel6.setHotelname("Nice");
				hotel6.setDescription("Marvolous stay and accommodation and also very near to famous sight seeings.");
				hotel6.setImageUrl("nice_day4.jpg");
				hotel6.setHotelid(06);
				
				if(noOfDaysFrance > 1){
				hotelList.add(hotel);
				hotelList.add(hotel2);
				}
				if(noOfDaysFrance > 2){
				hotelList.add(hotel3);
				}
				if(noOfDaysFrance > 3){
				hotelList.add(hotel5);
				}
				if(noOfDaysFrance > 4){
				hotelList.add(hotel4);
				}
				if(noOfDaysFrance > 5){
				hotelList.add(hotel6);
				}
			}
			else{
				
				HotelInfoVO hotel7 = new HotelInfoVO();
				hotel7.setHotelname("Arrive Frankfurt");
				hotel7.setImageUrl("Germany_day1.jpg");
				hotel7.setHotelid(07);
				
				HotelInfoVO hotel8 = new HotelInfoVO();
				hotel8.setHotelname("Frankfurt : City Tour");
				hotel8.setImageUrl("Germany_day2.jpg");
				hotel8.setHotelid(8);
				HotelInfoVO hotel9 = new HotelInfoVO();
				hotel9.setHotelname("Frankfurt – Stuttgart (1 hour 30 mins)");
				hotel9.setImageUrl("Germany_day3.jpg");
				hotel9.setHotelid(9);
				HotelInfoVO hotel10 = new HotelInfoVO();
				hotel10.setHotelname("Stuttgart : Hop on Hop off City Tour");
				hotel10.setImageUrl("Germany_day4.jpg");
				hotel10.setHotelid(10);
				HotelInfoVO hotel11 = new HotelInfoVO();
				hotel11.setHotelname("Stuttgart - Munich (2 hours 15 mins)");
				hotel11.setImageUrl("Germany_day.jpg");
				hotel11.setHotelid(11);
				HotelInfoVO hotel12 = new HotelInfoVO();
				hotel12.setHotelname("Munich : Hop on Hop off City Tour");
				hotel12.setImageUrl("Germany_day6.jpg");
				hotel12.setHotelid(12);
				
				if(noOfDaysGermany > 1){
				hotelList.add(hotel7);
				hotelList.add(hotel8);
				}
				if(noOfDaysGermany > 2){
				hotelList.add(hotel9);
				}
				if(noOfDaysGermany > 3){
				hotelList.add(hotel10);
				}
				if(noOfDaysGermany > 4){
				hotelList.add(hotel11);
				}
				if(noOfDaysGermany > 5){
				hotelList.add(hotel12);
				}
			}
		return hotelList;
	}
	
	/**
	 * 
	 * @param passengersDetailsVOList
	 * @return
	 */
	public static DestinationDetailsBookingVO getNoOfChidrenAdultsInfants(List<PassengersDetailsVO> passengersDetailsVOList, DestinationDetailsBookingVO destinationDetailsBookingVO){
		Integer noOfChildren = 0;
		Integer noOfAdult = 0;
		Integer noOfInfant = 0;
		Integer noOfChildrenAbove10Years = 0;
		
		if(passengersDetailsVOList != null && !passengersDetailsVOList.isEmpty()){
			for(PassengersDetailsVO passengersDetailsVO : passengersDetailsVOList )
			{
				if(passengersDetailsVO.getAge() > 0 && passengersDetailsVO.getAge() <= AGE_LIMIT_INFANT){
					noOfInfant++;
				}
				if(passengersDetailsVO.getAge() > AGE_LIMIT_INFANT && passengersDetailsVO.getAge() <= AGE_LIMIT_CHILDREN){
					noOfChildren++;
				}
				if(passengersDetailsVO.getAge() > 10 && passengersDetailsVO.getAge() <= AGE_LIMIT_CHILDREN){
					noOfChildrenAbove10Years++;
				}
				if(passengersDetailsVO.getAge() > AGE_LIMIT_CHILDREN){
					noOfAdult++;
				}
			}
		}
				
		destinationDetailsBookingVO.setNoOfAdults(noOfAdult);
		destinationDetailsBookingVO.setNoOfChildren(noOfChildren);
		destinationDetailsBookingVO.setNoOfInfants(noOfInfant);
		destinationDetailsBookingVO.setNoOfChildrenAbove10Years(noOfChildrenAbove10Years);
		
		
		
		return destinationDetailsBookingVO;
		
	}
	
	
	 public static void emailNotification(String fromSender, String toRecipient, String userName, String id) {
		   final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		   boolean sent = true;
		   String  smtpServer = "smtp.gmail.com";
		   try {
	        	
	        	Properties props = System.getProperties();
	            props.put("mail.smtp.auth", "true");
	            //props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.ssl.enable", "true");
	            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	            props.setProperty("mail.smtp.socketFactory.fallback", "false");
	            props.put("mail.smtp.host", smtpServer);
	            props.put("mail.smtp.port", "465");
	            props.setProperty("mail.smtp.socketFactory.port", "465");
	            // -- Attaching to default Session, or we could start a new one --

	             
	            System.out.println("Mail.send()-> SMTP_SERVER:: " + smtpServer);
	            
	            //Session session = Session.getDefaultInstance(props,null);
	           Session session = Session.getInstance(props,
	      			  new javax.mail.Authenticator() {
	      				protected PasswordAuthentication getPasswordAuthentication() {
	      					return new PasswordAuthentication("testemailpoc@gmail.com", "testpwdpoc");
	      				}
	      			  });

	            System.out.println("Mail.send()-> session:: " + session);
	            // -- Create a new message --
	            Message msg = new MimeMessage(session);
	            msg.setHeader("Content-Type", "text/html");

	            // -- Set the FROM and TO fields --
	            msg.setFrom(new InternetAddress(fromSender,false));
	            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toRecipient, false));

	            
	            // -- Set the subject and body text --
	            msg.setSubject("Booking Confirmation");

	            msg.setText("Dear " +userName+","
	    			+ "\n\n\tThank you for booking with us, we look forward to have you as our guest. Your booking confirmation number is "+ id+"."
	    			+ "\n\nRegards,\nThomas Cook Team");

	            // -- Set some other header information --
	            msg.setSentDate(new Date());

	            System.out.println("Mail.send()-> sending the mail now:: ");
	            // -- Send the message --
	            Transport.send(msg);
	            System.out.println("End of send Method ");
	        	
	        	
	        	} catch (AddressException ex) {
	        	 ex.printStackTrace();
	            sent = false;
	        } catch (SendFailedException sfex) {
	        	
	                 
	            sent = false;
	            sfex.printStackTrace();
	        } catch (MessagingException mex) {
	        	
	       mex.printStackTrace();
	            sent = false;
	        } catch (Exception exp) {
	          exp.printStackTrace();
	            sent = false;
	        }

	}

}
