package com.visa.prj.client;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.visa.prj.entity.Booking;
import com.visa.prj.entity.Hotel;
import com.visa.prj.entity.User;
import com.visa.prj.service.BookingService;

public class BookingClient {
	public static void main(String[] args) {
	
	AnnotationConfigApplicationContext ctx=new AnnotationConfigApplicationContext();
	ctx.scan("com.visa");
	ctx.refresh();
	
	BookingService service=ctx.getBean("bookingService",BookingService.class);
	
	User u1=service.getUser("nan@gmail.com","123");
	User u2=service.getUser("nik@gmail.com","123");
	System.out.println(u1);
	
	List<Hotel> hotel1=service.findHotels("W Hotel");
	System.out.println(hotel1.size());
	
	Hotel hotel2=service.findHotelById(1);
	
	System.out.println(hotel2);
	
	
	Booking b1=new Booking(hotel1.get(0),u1);
	System.out.println(service.createBooking(b1));
	Booking b2=new Booking(hotel2,u1);
	System.out.println(service.createBooking(b2));
	Booking b3=new Booking(hotel1.get(0),u2);
	System.out.println(service.createBooking(b3));
	Booking b4=new Booking(hotel1.get(1),u2);
	System.out.println(service.createBooking(b4));
	
	
	///////List<Booking> b=service.getAllBookingsOfUser(u1);
    //System.out.println(b);
	
	}
	
}
