package folder;

import java.sql.Connection;
import java.sql.DriverManager;



public class DatabaseUtil {
	public static Connection getConnection() {
		Connection con;
		try {
			
			String dbURL="jdbc:mysql://localhost:3306/WEB_1?serverTimezone=UTC";
			String dbID="root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =  DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			System.out.println("DB 연결 성공");
			return con;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
