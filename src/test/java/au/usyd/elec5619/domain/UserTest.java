package au.usyd.elec5619.domain;

import junit.framework.TestCase;

public class UserTest extends TestCase{
private User user ;
	
	protected void setUp() throws Exception{
		user = new User();
	}
	
	public void testSetAndGetStudentId() {
		String testId = "111111";
		assertNull(user.getStudentId());
		user.setStudentId(testId);
		assertEquals(testId, user.getStudentId(),0);
	}
	
	public void testSetAndGetUserFullName() {
		String testName = "TESTNAME";
		assertNull(user.getFullName());
		user.setFullName(testName);
		assertEquals(testName, user.getFullName());
	}
	
	public void testSetAndGetUserBirthday() {
		String testBirthday = "TESTBIRTHDAY";
		assertNull(user.getBiirthdate());
		user.setBirthdate(testBirthday);
		assertEquals(testBirthday, user.getBiirthdate());
	}
	
	public void testSetAndGetUserEmail() {
		String testEmail = "EMAIL";
		assertNull(user.getEmail());
		user.setEmail(testEmail);
		assertEquals(testEmail, user.getEmail());
	}
	
	public void testSetAndGetUser() {
		String testPassword = "TESTPASSWORD";
		assertNull(user.getPassword());
		user.setPassword(testPassword);
		assertEquals(testPassword, user.getPassword());
	}
}
