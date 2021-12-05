package doctorProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DoctorConnection {
	private String dbUrl="jdbc:mysql://localhost:3306/appintment";
	private String dbUser="root";
	private String dbPass="";
	private String dbDriver="com.mysql.cj.jdbc.Driver";


	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Connection getConnection()
	{
	Connection con=null;
	try
	{
	con=DriverManager.getConnection(dbUrl,dbUser,dbPass);

	}
	catch(SQLException e)
	{
	e.printStackTrace();	
	}
	return con;
	}
	public boolean checkCredentials(String username,String password)
	{
		loadDriver(dbDriver);
		Connection con=getConnection();
		String query="SELECT * FROM usertable WHERE username= ? AND password= ?";
		
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeQuery();
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	return false;	
	}
	public boolean checkCredentialPatient(String username,String password)
	{
		loadDriver(dbDriver);
		Connection con=getConnection();
		String query="SELECT * FROM patient_table WHERE username= ? AND password= ?";
		
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeQuery();
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	return false;	
	}
	public String insertpatient(PatientRegisterClass patient) throws SQLException

	{
		
		
	loadDriver(dbDriver);

	 Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String query= "INSERT INTO patient_table VALUES(?,?,?,?,?,?,?,?,?)";

	String message="Record register successfully";
	


	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, null);
		ps.setString(2, patient.getFirstname());
		ps.setString(3, patient.getLastname());
		ps.setString(4, patient.getLocation());
		ps.setInt(5, patient.getAge());
		ps.setString(6, patient.getGender());
		ps.setString(7, patient.getUsername());
		ps.setString(8, patient.getPassword());
		ps.setString(9, patient.getDate());
		
		
		
		ps.executeUpdate();
	} catch (SQLException e) {
		
		message="Record not registered"+e;
		e.printStackTrace();
	}
	return message;
	}

	private String alert(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	public String insertdoctor(DoctorRegisterClass doctor) throws SQLException

	{
		
		
	loadDriver(dbDriver);

	 Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String query= "INSERT INTO doctor_table VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

	String message="Record register successfully";
	


	try {
		
		
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, null);
		ps.setString(2, doctor.getFirstname());
		ps.setString(3, doctor.getLastname());
		ps.setString(4, doctor.getPhone());
		ps.setString(5, doctor.getNationality());
		ps.setString(6, doctor.getGender());
		ps.setString(7, doctor.getTitle());
		ps.setString(8, doctor.getDepartment());
		ps.setString(9, doctor.getEmail());
		ps.setString(10, doctor.getLocation());
		ps.setString(11, doctor.getUsername());
		ps.setString(12, doctor.getPassword());
		ps.setString(13, doctor.getPicture());
		
		ps.executeUpdate();
	} catch (SQLException e) {
		message="Record not registered"+e;
		e.printStackTrace();
	}
	return message;
	}
	
	public boolean checkCredentialDoctor(String username,String password)
	{
		loadDriver(dbDriver);
		Connection con=getConnection();
		String query="SELECT * FROM doctor_table WHERE username= ? AND password= ?";
		
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeQuery();
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	return false;	
	}
	
	public String UpdateDoctor(DoctorUpdateClass doctor) throws SQLException

	{
		
		
	loadDriver(dbDriver);

	 Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String query= "Update doctor_table set doctor_id=?,firstname=?,lastname=?,phone=?,nationality=?,gender=?,title=?,department=?,email=?,username=?,password=?,picture=? where  doctor_id='"+doctor.getId()+"'";

	String message="Update successfully";
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, doctor.getId());
		ps.setString(2, doctor.getFirstname());
		ps.setString(3, doctor.getLastname());
		ps.setString(4, doctor.getPhone());
		ps.setString(5, doctor.getNationality());
		ps.setString(6, doctor.getGender());
		ps.setString(7, doctor.getTitle());
		ps.setString(8, doctor.getDepartment());
		ps.setString(9, doctor.getEmail());
		ps.setString(10, doctor.getUsername());
		ps.setString(11, doctor.getPassword());
		ps.setString(12, doctor.getPicture());
		
		
		ps.executeUpdate();
	} catch (SQLException e) {
		message="Update not successfull"+e;
		e.printStackTrace();
	}
	return message;
	}
	
	public String UpdatePatient(UpdatePatientClass patient) throws SQLException

	{
		
		
	loadDriver(dbDriver);

	 Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String query= "Update patient_table set patient_id=?,firstname=?,lastname=?,location=?,age=?,gender=?,username=?,password=?,date=? where  patient_id='"+patient.getId()+"'";

	String message="Update successfully";
	try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, patient.getId());
		ps.setString(2, patient.getFirstname());
		ps.setString(3, patient.getLastname());
		ps.setString(4, patient.getLocation());
		ps.setInt(5, patient.getAge());
		ps.setString(6, patient.getGender());
		ps.setString(7, patient.getUsername());
		ps.setString(8, patient.getPassword());
		ps.setString(9, patient.getDate());
		
		
		ps.executeUpdate();
	} catch (SQLException e) {
		message="Update not successfull"+e;
		e.printStackTrace();
	}
	return message;
	}
}


