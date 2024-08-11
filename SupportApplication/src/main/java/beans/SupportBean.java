package beans;

import java.io.Serializable;

public class SupportBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4802768438449489442L;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private boolean isLoggedIn = false;
	
	public SupportBean() {
		
	}
	public SupportBean (String username, String password, String firstName, String lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public boolean isLoggedIn() {
		return isLoggedIn;
	}
	public void setLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}
	
	
}
