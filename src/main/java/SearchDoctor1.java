

import java.io.IOException;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchDoctor1
 */
@WebServlet("/SearchDoctor1")
public class SearchDoctor1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDoctor1() {
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
		response.setContentType(""); 
		HttpSession session = request.getSession(true);
		List bookdoctor=new ArrayList();
		Connection con = null;

		String url = "jdbc:mysql://localhost:3306/";
		String db = "appintment";
		String driver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "";

		
		String bookdepartment="";
		
		bookdepartment=request.getParameter("department");
		String sqlqueary="SELECT * FROM doctor_table WHERE department LIKE '%%' ";
		
		if(bookdepartment!=null && !(bookdepartment.equals("-1"))){
		sqlqueary+=" and department='"+bookdepartment+"'";
		}
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url+db, user, pass);
			try{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sqlqueary);
			while (rs.next()) {
			List book=new ArrayList();
			book.add(rs.getString(1));
			book.add(rs.getString(2));
			book.add(rs.getString(3));
			book.add(rs.getString(4));
			book.add(rs.getString(5));
			book.add(rs.getString(6));
			bookdoctor.add(book);
			}
			}catch (SQLException s){
			System.out.println("SQL statement is not executed!");
			}
			}
			catch (Exception e){
			e.printStackTrace();
			}
			request.setAttribute("department",bookdepartment); 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("SearchDoctor1.jsp");
			dispatcher.forward(request, response);
	}
}
