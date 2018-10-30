package au.usyd.elec5619.domain;

import junit.framework.TestCase;

public class ClassroomTest extends TestCase{

	private Classroom classroom;
	
	protected void setUp() throws Exception{
		classroom = new Classroom();
	}
	
	public void testSetAndGetClassroomId() {
		int testId = 111111;
		assertEquals(0, 0, 0);
		classroom.setClassroomId(testId);
		assertEquals(testId, classroom.getClassroomId(),0);
	}
	
	public void testSetAndGetClassroomName() {
		String testName = "TESTNAME";
		assertNull(classroom.getClassroomName());
		classroom.setClassroomName(testName);
		assertEquals(testName, classroom.getClassroomName());
	}
	
	public void testSetAndGetClassroomSize() {
		String testSize = "TESTSIZE";
		assertNull(classroom.getClassroomSize());
		classroom.setClassroomSize(testSize);
		assertEquals(testSize, classroom.getClassroomSize());
	}
	
	public void testSetAndGetClassroomLocation() {
		String testLocation = "TESTLOCATION";
		assertNull(classroom.getLocation());
		classroom.setLocation(testLocation);
		assertEquals(testLocation, classroom.getLocation());
	}
	
	public void testSetAndGetClassroomAddress() {
		String testAddress = "TESTADDRESS";
		assertNull(classroom.getAddress());
		classroom.setAddress(testAddress);
		assertEquals(testAddress, classroom.getAddress());
	}
}
