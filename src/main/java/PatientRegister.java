

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doctorProject.DoctorConnection;
import doctorProject.PatientRegisterClass;

/**
 * Servlet implementation class PatientRegister
 */
@WebServlet("/PatientRegister")
public class PatientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String location=request.getParameter("location");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String date=request.getParameter("date");
		
		
		PatientRegisterClass patient = new PatientRegisterClass(firstname,lastname,location,gender,username,password,date,age);
		
		DoctorConnection dbcon=new DoctorConnection();
		String results="";
		try {
			results = dbcon.insertpatient(patient);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().print(results);

		try {
	        String[] rows = new String[1];
	FileWriter f=new FileWriter("C:/Users/Students/eclipse-workspace/doctorProject/Backup/backupregister.csv",true);
	BufferedWriter br=new BufferedWriter(f);
	PrintWriter pw=new PrintWriter(br);

	 
	   for(int p = 1; p<rows.length; p++){
	     pw.append(rows[p]);
	   }

	pw.println(firstname+ ","+lastname+","+location+","+age+","+gender+","+username+","+password+","+date);

	pw.flush();
	f.close();


	} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	    }

		
	}
 
