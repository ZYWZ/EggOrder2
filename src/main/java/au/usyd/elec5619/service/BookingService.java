package au.usyd.elec5619.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.elec5619.dao.BookingDao;
import au.usyd.elec5619.domain.Booking;

@Service(value="bookingService")
// @Transactional
public class BookingService {
	private List<Booking> bookings;

    @Autowired
    private BookingDao bookingDao;
    
    public List<Booking> getBookings() {
    	return bookings;
    }
    
    public void setBookings(List<Booking> bookings) {
    	this.bookings = bookings;
    }
    
    public void registerBooking(Booking booking) {
        bookingDao.saveBooking(booking);
    }
    
    public void deleteBookingByID(int id) {
		bookingDao.deleteBookingById(id);
	}
    
    
    public List<Booking> getBookingByStudentId(int id) {
		return bookingDao.getBookingByStudentId(id);
	}
    
}