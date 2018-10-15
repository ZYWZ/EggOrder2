package au.usyd.elec5619.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
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
}
