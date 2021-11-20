package englishcenter.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionSigleton {
    private static Connection connection;
    private static String URL = "jdbc:mysql://localhost:3306/englishcenter";
    private static String username = "root";
    private static String password = "Weedfromcalifornia1107@@";//anh em tự thay đổi password nhé

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, username, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println("da ket noi");
        return connection;
    }
}
