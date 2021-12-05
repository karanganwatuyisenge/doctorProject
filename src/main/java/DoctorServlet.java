

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doctorProject.DoctorConnection;
import doctorProject.DoctorRegisterClass;



/**
 * Servlet implementation class DoctorServlet
 */
@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorServlet() {
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
		String phone=request.getParameter("phone");
		String nationality=request.getParameter("nationality");
		String gender=request.getParameter("gender");
		String title=request.getParameter("title");
		String department=request.getParameter("department");
		String email=request.getParameter("email");
		String location=request.getParameter("location");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String picture=request.getParameter("picture");
		
		
		
		DoctorRegisterClass doctor = new DoctorRegisterClass(firstname,lastname,phone,nationality,gender,title,department,email,location,username,password,picture);
		
		DoctorConnection dbcon=new DoctorConnection();
		String results="";
		try {
			results = dbcon.insertdoctor(doctor);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().print(results);

		
		
	}
}
