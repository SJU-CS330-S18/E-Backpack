package user;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import entity.Student;

public class loginTest {
		private Student s;

		@Before
		public void setUp() throws Exception {
			s = new Student();
		}
		
		@Test
		public void testCreatePerson() {
			assertTrue("Person p is not null", !(s == null));
		}

		
		@Test 
		public void testSetters(){
			
			s.setFname("fname");
			s.setLname("lname");
			s.setUsername("username1");
			s.setPassword("password1");
			
			assertTrue("first name works", s.getFname().equals("fname"));
			assertTrue("last name works", s.getLname().equals("lname"));
			assertTrue("username works", s.getUsername().equals("username1"));
			assertTrue("password works", s.getPassword().equals("password1"));
			
			
		}
		


	}


