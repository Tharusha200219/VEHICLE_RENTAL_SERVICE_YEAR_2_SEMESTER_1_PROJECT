package booking;

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
    
    public static Connection getConnection() {
        Connection connection = null;
        
        try {
        	
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
        	
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
                
                
            }
        }
    }
}
