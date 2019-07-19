package com.visa.prj.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import com.visa.prj.entity.Booking;
import com.visa.prj.entity.Hotel;
import com.visa.prj.entity.User;

@Repository

public class BookingDaoJpaImpl implements BookingDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Hotel> findHotels(String criteria) {
		String jpql = " from Hotel h where h.name='"+criteria+"' ";
		TypedQuery<Hotel> query = em.createQuery(jpql, Hotel.class);
		return query.getResultList();
	}

	@Override
	public Hotel findHotelById(long id) {
		String jpql = "from Hotel h where h.id='"+id+" '";
		TypedQuery<Hotel> query = em.createQuery(jpql, Hotel.class);
		return query.getResultList().get(0);
	}

	@Override
	public User getUser(String email, String password) {
		TypedQuery<User> query = em.createQuery("from User where email=:e and password=:p", User.class);
		query.setParameter("e", email);
		query.setParameter("p", password);
		return query.getResultList().get(0);

	}

	@Override
	public long createBooking(Booking booking) {
		em.persist(booking);
		return booking.getId();
	}

	@Override
	public List<Booking> getAllBookingsOfUser(User user) {

		String s = user.getEmail();
		String jpql = "from Booking b where b.user_email='"+s+"'";
		TypedQuery<Booking> query = em.createQuery(jpql, Booking.class);
		return query.getResultList();
	}

}
