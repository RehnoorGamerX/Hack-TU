package vmm;

import java.sql.*;
/**
 *
 * @author aulak
 */
public class DB_Loader 
{
    public static Connection conn;
    public static ResultSet executeSQL(String sql) throws Exception
    {
        //##Code//
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver Loading Done");
             
             conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rehnoor","root","1234");
             System.out.println("Connection Done");
                
             Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             System.out.println("Statement Done");
             
             ResultSet rs = stmt.executeQuery(sql);
             System.out.println("Result Set Created");
             
             return rs;
    }
    
}
