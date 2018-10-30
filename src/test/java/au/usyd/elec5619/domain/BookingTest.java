package au.usyd.elec5619.domain;

import junit.framework.TestCase;

public class BookingTest extends TestCase{
	
	private Booking booking;
	
	protected void setUp() throws Exception{
		booking = new Booking();
	}
	
	public void testSetAndGetId() {
		int testId = 1;
		assertEquals(booking.getId(),0);
		booking.setId(testId);
		assertEquals(0, booking.getStudentId());
	}
	
	public void testSetAndGetStudentId() {
		int testId = 1;
		assertEquals(booking.getStudentId(),0);
		booking.setStudentId(testId);
		assertEquals(testId, booking.getStudentId());
	}
	
	public void testSetAndGetClassroomId() {
		int testId = 1;
		assertEquals(booking.getClassroomId(),0);
		booking.setClassroomId(testId);
		assertEquals(testId, booking.getClassroomId());
	}
	
	public void testSetAndGetBookingDate() {
		String testDate = "2018-08-20";
		assertNull(booking.getBookingDate());
		booking.setBookingDate(testDate);
		assertEquals(testDate, booking.getBookingDate());
	}
	
	public void testSetAndGetStartTime() {
		String testDate = "2018-08-20 08:00:00";
		assertNull(booking.getStartTime());
		booking.setStartTime(testDate);
		assertEquals(testDate, booking.getStartTime());
	}
	
	public void FinishTime() {
		String testDate = "2018-08-20 20:00:00";
		assertNull(booking.getStartTime());
		booking.setFinishTime(testDate);
		assertEquals(testDate, booking.getFinishTime());
	}

}
