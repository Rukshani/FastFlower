package fastflower1;

import java.sql.Connection;
import java.sql.DriverManager;

public class connection {

	public static Connection getcon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("okkk");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fastflower", "root", "");
			System.out.println("ok");
			return con;
			
		} catch (Exception e) {
			System.out.println("not okkk");
		}
		return null;

	}

}
