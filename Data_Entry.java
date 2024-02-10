 import java.io.*;
import java.sql.ResultSet;
 import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
 import vmm.DB_Loader;

public class Data_Entry extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Login Check</title>");
        out.println("</head>");
        out.println("<body>");
         
        String username=request.getParameter("user");
        String destination=request.getParameter("destination");
        String location =request.getParameter("location");
        //JDBC Code
        
        try
        {/*
            
            Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver Loading Done");
             
             Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rehnoor","root","1234");
             System.out.println("Connection Done");
                
             
            PreparedStatement stmt=conn.prepareStatement("update emp set location='"+location+"',destination='"+destination+"' where email='"+username+"'");

stmt.executeUpdate();
            */
            
            out.println("<h1 style=color:green; >Login Successfull!!!</h1>");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    out.println("</body>");
    out.println("</html>");
}
}
