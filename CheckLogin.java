 import java.io.*;
import java.sql.ResultSet;
 import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
 import vmm.DB_Loader;

public class CheckLogin extends HttpServlet 
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
         
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        //JDBC Code
        try
        {
            ResultSet rs=DB_Loader.executeSQL("select * from tms where email=\'"+username+"\' and password=\'"+password+"\'");
            if(rs.next())
            {
                out.println("<h1 style=color:green; >Login Successfull!!!</h1>");
                out.println("<script>location.href='http://localhost:5173/'</script>");
            }
            else
            {
                out.println("<h1 style=color:red; >Please Enter Valid Username/Password</h1>");
                
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    out.println("</body>");
    out.println("</html>");
}
}
