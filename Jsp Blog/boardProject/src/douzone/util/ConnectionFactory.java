package douzone.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost/boardproject?serverTimezone=UTC";
			String user = "root";
			String password = "root";
			
			con = DriverManager.getConnection(url, user, password);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}


/*cj.
&useSSL=false*/