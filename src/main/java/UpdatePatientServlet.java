

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doctorProject.DoctorConnection;
import doctorProject.DoctorUpdateClass;
import doctorProject.UpdatePatientClass;

/**
 * Servlet implementation class UpdatePatientServlet
 */
@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientServlet() {
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
		String id=request.getParameter("id");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String location = request.getParameter("location");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String username=request.getParameter("username");
		String password = request.getParameter("password");
		String date=request.getParameter("date");
		
		
		UpdatePatientClass patient = new UpdatePatientClass(id,firstname,lastname,location,gender,username,password,date,age);
		
		DoctorConnection dbcon=new DoctorConnection();
		String results="";
		try {
			results = dbcon.UpdatePatient(patient);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().print(results);
	}


}
