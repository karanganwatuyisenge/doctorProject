package doctorProject;

public class PatientRegisterClass {
	private String firstname,lastname,location,gender,username,password,date;
	private int age;
	
	public PatientRegisterClass(String firstname, String lastname, String location, String gender,String username,String password,
			String date, int age) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.location = location;
		this.gender = gender;
		this.username = username;
		this.password = password;
		this.date = date;
	
		this.age = age;
		
	}
	
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	

}


