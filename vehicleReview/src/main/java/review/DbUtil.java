package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;
//IT22225788
//SANDAKELUM P.A.T.R
public class DbUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/review"; 
    private static final String USERNAME = "root"; 
    private static final String PASSWORD = "tharusha"; 
    private static final Logger logger = Logger.getLogger(DbUtil.class.getName());
    
    
    
    public static final String ERROR_DB_CONNECTION = "Error getting the database connection: ";
    public static final String ERROR_DB_CLOSE = "Error while closing the database connection: ";
    public static final String ERROR_DATA_INSERT = "Data not inserted: ";
    public static final String ERROR_DATA_UPDATE = "Data not updated: ";
    public static final String ERROR_DATA_DELETE = "Data not deleted: ";
    public static final String ERROR_GET_ALL = "There is an error in getAllPayments: ";
    public static final String ERROR_GET_BY_ID = "There is an error: ";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            logger.severe("Error getting the database connection: " + e.getMessage());
        }
        return connection;
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
            	logger.severe("Error while closing the database connection: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
