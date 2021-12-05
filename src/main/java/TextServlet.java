import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/TextServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class TextServlet extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/appintment";
    private String dbUser = "root";
    private String dbPass = "";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String firstname = request.getParameter("firstname");
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
        
       
       
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("picture");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO doctor_table values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, null);
            statement.setString(2,firstname);
            statement.setString(3,lastname);
            statement.setString(4,phone);
            statement.setString(5,nationality);
            statement.setString(6,gender);
            statement.setString(7,title);
            statement.setString(8,department);
            statement.setString(9,email);
            statement.setString(10,location);
            statement.setString(11,username);
            statement.setString(12,password);
          
            
            
            
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(13, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Information saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Doctor.jsp").forward(request, response);
        }
        try {
            String[] rows = new String[1];
    FileWriter f=new FileWriter("C:/sers/Students/eclipse-workspace/doctorProject/Backup/backupdoctor.csv",true);
    BufferedWriter br=new BufferedWriter(f);
    PrintWriter pw=new PrintWriter(br);

     
       for(int p = 1; p<rows.length; p++){
         pw.append(rows[p]);
       }

    pw.println(firstname+ ","+lastname+","+phone+","+nationality+","+gender+","+title+","+department+","+email+","+location+","+username+","+password);

    pw.flush();
    f.close();


    } catch (IOException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
    }
        }

        
    }

