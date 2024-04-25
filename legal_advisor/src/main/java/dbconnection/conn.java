package dbconnection;

import java.sql.*;

public class conn 
{
	Connection con=null;
    public Connection connect()
    {
        try
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/legal_advisor_new","root","12345");
    }
        catch(Exception e)
        {
            System.out.println("Exception in connection"+e);
        }
    return con;
}
   
}
