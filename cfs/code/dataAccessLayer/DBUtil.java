package dataAccessLayer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	static Connection connection;
	static

	{
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
			connection.setAutoCommit(false);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public static Connection getConnection() {
		return connection;
	}

}