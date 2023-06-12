
package beanPack;

/**
 *
 * @author Abrham
 */
import java.sql.*;

public class StoreUser {
    
     private PreparedStatement pstmt;
     
    public StoreUser(){
       initializeJdbc(); 
    }
    
     private void initializeJdbc() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/hospital" , "abrish", "1234");
            pstmt = connection.prepareStatement("insert into login values(? , ?)");
        }
        catch (Exception ex) {
            System.out.println(ex);
        }
    }
      public void storeStudent(UserBean userBean) throws SQLException {
        pstmt.setString(1, userBean.getUsername());
        pstmt.setString(2, userBean.getPassword());
        pstmt.executeUpdate();
    }
    
}
