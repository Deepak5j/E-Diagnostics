package esportsclub.scr;
	import java.sql.*;
	public class CrudOperation
	{
		private static Connection con=null;
		public static Connection createConnection()
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");//load the driver class
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eclub","root","root");
			}
			catch(ClassNotFoundException|SQLException cse)
			{
				System.out.println(cse);
			}
			return con;
		}
	}
