package com.visa.prj.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visa.prj.dao.BookingDao;
import com.visa.prj.entity.Booking;
import com.visa.prj.entity.Hotel;
import com.visa.prj.entity.User;

@Service
public class BookingService {
	
	@Autowired
	private BookingDao bookingDao;
	
	public List<Hotel> findHotels(String criteria){
		return bookingDao.findHotels(criteria);
	}
	 
	public Hotel findHotelById(long id) {
		return bookingDao.findHotelById(id);
	}
	public User getUser(String email, String password) {
		return bookingDao.getUser(email, password);
	}
	
	@Transactional
	public long createBooking(Booking booking) {
		
		bookingDao.createBooking(booking);
		return booking.getId();
	}
	
	public List<Booking> getAllBookingsOfUser(User user){
		return bookingDao.getAllBookingsOfUser(user);
	}

}
