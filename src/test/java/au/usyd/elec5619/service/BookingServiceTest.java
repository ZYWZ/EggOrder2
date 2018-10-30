package au.usyd.elec5619.service;

import junit.framework.TestCase;

import java.util.List;
import java.util.ArrayList;

import au.usyd.elec5619.domain.Booking;

public class BookingServiceTest extends TestCase{
	private BookingService bookingService;
	private List<Booking> bookings;
	
	private static int BOOKING_COUNT = 2;
	
	private static int BOOKING_1_STUDENT = 100001;
	private static int BOOKING_1_CLASSROOM = 1;
	private static String BOOKING_1_DATE = "2018-10-30";
	private static String BOOKING_1_START = "2018-10-30 08:00:00";
	private static String BOOKING_1_FINISH = "2018-10-30 20:00:00";
	
	private static int BOOKING_2_STUDENT = 100002;
	private static int BOOKING_2_CLASSROOM = 2;
	private static String BOOKING_2_DATE = "2018-10-31";
	private static String BOOKING_2_START = "2018-10-31 09:00:00";
	private static String BOOKING_2_FINISH = "2018-10-31 22:00:00";
	
	protected void setUp() throws Exception {
		bookingService = new BookingService();
		bookings = new ArrayList<Booking>();
		
		Booking booking1 = new Booking();
		booking1.setStudentId(100001);
		booking1.setClassroomId(1);
		booking1.setBookingDate("2018-10-30");
		booking1.setStartTime("2018-10-30 08:00:00");
		booking1.setFinishTime("2018-10-30 20:00:00");
		bookings.add(booking1);
		
		Booking booking2 = new Booking();
		booking2.setStudentId(100002);
		booking2.setClassroomId(2);
		booking2.setBookingDate("2018-10-31");
		booking2.setStartTime("2018-10-31 09:00:00");
		booking2.setFinishTime("2018-10-31 22:00:00");
		bookings.add(booking2);
		
		bookingService.setBookings(bookings);
	}
	
	public void testGetBookingWithNoBookings() {
		bookingService = new BookingService();
		assertNull(bookingService.getBookings());
	}
	
	public void testGetBookings() {
		List<Booking> bookings = bookingService.getBookings();
		assertNotNull(bookings);
		assertEquals(BOOKING_COUNT,bookings.size());
		
		Booking booking1 = bookings.get(0);
		assertEquals(BOOKING_1_STUDENT,booking1.getStudentId());
		assertEquals(BOOKING_1_CLASSROOM,booking1.getClassroomId());
		assertEquals(BOOKING_1_DATE,booking1.getBookingDate());
		assertEquals(BOOKING_1_START,booking1.getStartTime());
		assertEquals(BOOKING_1_FINISH,booking1.getFinishTime());
		
		Booking booking2 = bookings.get(1);
		assertEquals(BOOKING_2_STUDENT,booking2.getStudentId());
		assertEquals(BOOKING_2_CLASSROOM,booking2.getClassroomId());
		assertEquals(BOOKING_2_DATE,booking2.getBookingDate());
		assertEquals(BOOKING_2_START,booking2.getStartTime());
		assertEquals(BOOKING_2_FINISH,booking2.getFinishTime());
	}
}
