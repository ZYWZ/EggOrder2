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

    @Autowired
    private BookingDao bookingDao;
    
    // business logic of registering a Person into the database
    public void registerBooking(Booking booking) {
        
        // Step 1: check whether this person is already in the database
        
        // Step 2: if not, save this person into the database
        bookingDao.saveBooking(booking);
    }
    
    public void deleteBookingByID(int id) {
		bookingDao.deleteBookingById(id);
	}
    
    
    public List<Booking> getBookingByStudentId(int id) {
		return bookingDao.getBookingByStudentId(id);
	}
    
}