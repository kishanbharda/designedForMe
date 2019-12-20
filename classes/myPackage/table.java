package myPackage;

import java.sql.*;

public class table
{
	
	
	public static Connection connect()
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
	
	public static ResultSet show(String query)
	{
		
		try
		{	
			Connection con=connect();
			PreparedStatement pst=con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			return rs;
		}
		catch(Exception e)
		{
			return null;
		}
		
	}
	
	public static boolean perform(String query)
	{
		try
		{
			Connection con=connect();
			PreparedStatement pst=con.prepareStatement(query);
			int res=pst.executeUpdate();
			if(res>0){
				return true;
			}
			else{
				return false;
			}
				
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	
}