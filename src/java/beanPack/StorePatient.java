
package beanPack;

/**
 *
 * @author Abrham
 */
import java.sql.*;
public class StorePatient {
    
        
     private Connection connection = null;
     
    public StorePatient(){
      
    }
    
     public Connection initializeJdbc() {
         
        try {
            if(connection == null){
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/hospital" , "abrish", "1234");
            }
            else 
            {
                 return connection;
            }
            
        }
        catch (Exception ex) {
            System.out.println(ex);
        }
        return connection;
    }

}
