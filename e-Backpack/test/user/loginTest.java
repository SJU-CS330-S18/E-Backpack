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
			assertTrue("Student s is not null", !(s == null));
		}

		
		@Test
		public void testLogOn(){

			boolean log = s.login();
			assertTrue("login is working", log==true);
			


		}
		


	}


