package database;

//Connection : Interface 
//used to create connection with database
import java.sql.Connection;
//DriverManager : Class
//used to manage JDBC drivers and established a connection
import java.sql.DriverManager;

//its Class , whose job is to provide an manage DB connection
public class DBConnection {

//	static  : a single copy created at the class level and share among multiple objects
//	static : One connection shared across app - (best for DAO/Servlet)
	
//	Connection : used to execute Sql Queries and statements on DB
	
//	con :  this holds your DB connection once its established
//	int a = 10 ;  -> int is type , a is var
//	Connection con : -> connection is type (interface) , con is var .
//	static keeps only one copy of connection and by calling getCon() return the same object
	
	static Connection con;
	
//	public : accessible from anywhere throughout the app - other Classes
//  static : can access / call the getCon() method without creating the object 
//Returntype : Connection : this is a returntype JDBC connection
	
//	getCon(): this  method calls from DAO/ servlets  classes to get connection to MySql DB
	public static Connection getCon() {
		
//		if con is null, means no connection is established ,then execute if block
		if(con==null) {
			try {
//				Class.forName() : dynamically loads the driver
				Class.forName("com.mysql.cj.jdbc.Driver"); //its a name of MySql driver
//				DriverManager.getConnection() - built in method in sql package
//				jdbc:mysql -> tells java to use MySql JDBC driver
//				localhost : your DB is on local machine
//				3306 : default port for MySQL
//				dbname,username,password
//				con: inside this the Db connection is store
				con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","root");//creates connection to DB using JDBC and store it inside con
			}
//			this handles any exception occurs during connection
//			like wron url , Db not running ,driver not found - it print stack trace for debugging
			catch(Exception e){
				e.printStackTrace();
			}
		}
//		else , returns connection object if connection is already established
		return con;
		
	}
}
//we are not creating the new connection everytime 
//we are just fetching the existing connection 
//same connection object is reused everytime
