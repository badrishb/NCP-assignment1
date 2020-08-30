package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.Properties;

public class CSE17314_NCP {

	private final String userName = "root";

	private final String password = "Cse@5791";

	private final String serverName = "localhost";

	private final int portNumber = 3306;

	private final String dbName = "test";

	

	public Connection getConnection() throws SQLException {
		Connection conn = null;
		Properties connectionProps = new Properties();
		connectionProps.put("user", this.userName);
		connectionProps.put("password", this.password);

		conn = DriverManager.getConnection("jdbc:mysql://"
				+ this.serverName + ":" + this.portNumber + "/" + this.dbName,
				connectionProps);

		return conn;
	}


	public ResultSet select(Connection conn,String command) throws SQLException
	{
		int temp=0;
		Statement stmt=null;
		try
		{
			stmt=conn.createStatement();
			stmt.executeQuery(command);
			temp=1;
			return stmt.getResultSet();
		}
		finally {
			if(temp==0)
			return null;
		}
	}

	public void run() {

		Connection conn = null;
		try {
			conn = this.getConnection();
			System.out.println("Connected to database");
		} catch (SQLException e) {
			System.out.println("ERROR: Could not connect to the database");
			e.printStackTrace();
			return;
		}
		System.out.println("-------Created Table-------");

		try
		{
			System.out.println("The names and roll numbers of all placed students");
			System.out.println("Name  -  RNo  -  Age - CGPA - Company");
			String q="select * from placed";
			ResultSet temp=this.select(conn, q);
//			System.out.println(temp);
			int ind=temp.findColumn("sname");
			while(temp.next())
			{
				String val=temp.getString(ind);
				String roll=temp.getString(ind+1);
				String age=temp.getString(ind+2);
				String cgpa=temp.getString(ind+3);
				String company=temp.getString(ind+4);
				System.out.println(val+"-"+roll+"-"+age+"-"+cgpa+"-"+company);
			}

		}catch(SQLException e)
		{
			System.out.println("There was an error in displaying the results");
		}
		System.out.println("-------Question 1-------");
		try
		{
			System.out.println("The names and roll numbers of students with cgpa>=8");
			String q="select * from placed where cgpa>=8";
			ResultSet temp=this.select(conn, q);
//			System.out.println(temp);
			int ind=temp.findColumn("sname");
			while(temp.next())
			{
				String val=temp.getString(ind);
				String roll=temp.getString(ind+1);
				System.out.println(val+" "+roll);
			}

		}catch(SQLException e)
		{
			System.out.println("There was an error in displaying the results");
		}
		System.out.println("------Question 2--------");
		try
		{
			System.out.println("The names and roll numbers of students who are placed in Infosys");
			String q="select * from placed where company=?";
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setString(1, "Infosys");
//			System.out.println(q);
			ResultSet temp=ps.executeQuery();
			int ind=temp.findColumn("sname");
			while(temp.next())
			{
				String val=temp.getString(ind);
				String roll=temp.getString(ind+1);
				System.out.println(val+" "+roll);
			}

		}catch(SQLException e)
		{
			System.out.println("There was an error in displaying the results");
		}
		System.out.println("-------Question 3-------");
		try
		{
			System.out.println("The names of students sorted by Rollno");
			System.out.println("Name  -  RNo  -  Age - CGPA - Company");
			String q="select * from placed order by rno";
			ResultSet temp=this.select(conn, q);
//			System.out.println(temp);
			int ind=temp.findColumn("sname");
			while(temp.next())
			{
				String val=temp.getString(ind);
				String roll=temp.getString(ind+1);
				String age=temp.getString(ind+2);
				String cgpa=temp.getString(ind+3);
				String company=temp.getString(ind+4);
				System.out.println(val+"-"+roll+"-"+age+"-"+cgpa+"-"+company);
			}

		}catch(SQLException e)
		{
			System.out.println("There was an error in displaying the results");
		}
	}
	public static void main(String[] args) {
		CSE17314_NCP app = new CSE17314_NCP();
		app.run();
	}
}

