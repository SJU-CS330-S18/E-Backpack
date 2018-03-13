
import java.util.List;

import cmc.mario.entities.Account;
import cmc.mario.entities.Admin;
import cmc.mario.interfaces.AdminUI;
import cmc.mario.entities.User;
import cmc.mario.interfaces.UserUI;

/**
 * AccountController - Controller to control account functionality.
 * 
 * @author Mario Party 4: Kalila Moua
 * @modify Yidan Zhang
 * @version 3/26/2017
 */
public class AccountController {
	  /**
	   * Account object for account controller to communicate to
	   */
	  private Account acct;
	  /**
	   * DBController object for account controller to search data
	   */
	  private DBController database;
	  
	  /**
	   * error reason for login
	   */
	  private int error;
	  
//	  /**
//	   * Default constructor
//	   */
//	  public AccountController(){
//	
//	  }
	  
	  /**
	   * constructor
	   * @param acct the account who is using currently 
	   */
	  public AccountController(Account acct){
		this.setAcct(acct);
		this.database = new DBController();
	  }
	  
	  /**
	   * This method is to test if the user is logged off or not. //update in class diagram - Yidan
	   * @return true if user is logged off, false otherwise
	   */ 
	  public boolean logOff(){
		  if (this.getAcct()==null){
			  return false;
		  }
		this.getAcct().setActive(false);
		return true;
	  }
	  
	  /**
	   * This method is to logon to the cmc system. - Kalila (White box)
	   * @param username the username the user puts in
	   * @param password the password the user enters in
	   * @throws IllegalArgumentException if username or password is wrong 
	   * @return true if the user is logged on and authentication is confirmed, otherwise return false
	   */
	  public int logOn(String username, String password){
	  int status = 4;
	  List<Account> acctList = database.getAccountList();
	  Account a = database.getSpecificUser(username);
	  if(a!=null){
			  if(a.getPassword().equals(password)){
				  if(a.getStatus()=='Y'){
					  if(a.getTypeOfUser()=='a'){
						  Admin adm =new Admin(a.getFirstName(),a.getLastName(),a.getUsername(),a.getPassword());
						  adm.setActive(true);
						  this.acct=adm;
						  new AdminUI(adm);
						  status=0;
					  }
					  else{
						  User u = new User(a.getFirstName(),a.getLastName(),a.getUsername(),a.getPassword());
						  u.setActive(true);
						  this.acct=u;
						  new UserUI(u);
						  status=1;
					  }
				  }
				  else{
					  
					  status =2;
					  throw new IllegalArgumentException("Deactiated Account!");
					  //deactive
				  }
			  }
			  else{
				  status=3;
				  throw new IllegalArgumentException("Incorrect Password!");
				  //password
			  }
	  }
	  else{
		  status=4;
		  throw new IllegalArgumentException("Incorrect Username!");
	  }
      	return status;
      	}
	  
	  /**
	   * This method identifies the type of user the user is: 'a' or 'u'. -  Tre
	   * @param username the username the user puts in
	   * @return the character 'a' for admin, or 'u' for user
	   */
	  public char typeOfUser(String username){
		  Account person = database.getSpecificUser(username);
		  if(person==null){
			  throw new IllegalArgumentException("The account does not exist");
		  }
		if(person.getTypeOfUser()=='u'){
			return 'u';
		}
		else{
	    return 'a';
		}
	  }


	/**
	 * Method to return account object
	 * @return the acct
	 */
	public Account getAcct() {
		return acct;
	}


	/**
	 * Method to set account object
	 * @param acct the acct to set
	 */
	public void setAcct(Account acct) {
		this.acct = acct;
	}
}