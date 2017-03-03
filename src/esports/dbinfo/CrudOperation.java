package esports.dbinfo;

import java.sql.*;

public class CrudOperation 
{
	private static Connection con=null;
	private static ResultSet rs=null;
	private static PreparedStatement ps=null;
	
	public static Connection createConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");//load driver class
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eclub","root","root");
		}
		catch (ClassNotFoundException|SQLException cse)
		{
			System.out.println(cse);
		}
		return con;
	}
	public static ResultSet getData(String sql,String data)
	{
		con=createConnection();//calling above method
		try
		{
			ps=con.prepareStatement(sql);
			ps.setString(1,data);
			rs=ps.executeQuery();
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		return rs;
	}//------------>  New
	public static ResultSet getData(String sql)
	{
		con=createConnection();//calling above method
		try
		{
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		return rs;
	}//---------------> new
	public static ResultSet getData(String sql,int data)
	{
		con=createConnection();//calling above method
		try
		{
			ps=con.prepareStatement(sql);
			ps.setInt(1, data);
			rs=ps.executeQuery();
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		return rs;
	}//------------>  New
	
}
