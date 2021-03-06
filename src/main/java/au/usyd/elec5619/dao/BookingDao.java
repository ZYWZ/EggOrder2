package au.usyd.elec5619.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.Booking;

@Repository(value = "bookingDao")
public class BookingDao {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void saveBooking(Booking booking) {
        sessionFactory.getCurrentSession().save(booking);
    }
    
    public void deleteBooking(Booking booking) {
    	sessionFactory.getCurrentSession().delete(booking);
	}
    
    public void deleteBookingById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Booking booking = (Booking) currentSession.get(Booking.class, id);
		currentSession.delete(booking);
	}
    
    public List<Booking> getBookingByStudentId(int id) {
    	Session currentSession = this.sessionFactory.getCurrentSession();
		Query query2 = currentSession.createQuery("from Booking b where b.studentId = :studentId");
		query2.setInteger("studentId", id);
		List<Booking> result = (List<Booking>) query2.list();
		return result;
		
	}
    
}
