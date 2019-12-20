package myPackage;

import java.sql.*;

public class connection
{
	public static Connection getCon()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dforme","root","");
			return con;
		}
		catch(Exception e)
		{
			return null;
		}
	}
}
