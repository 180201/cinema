import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Winiu on 31-12-2015.
 */
public class TestDatabase {
    public static String lookUpFullname (String ID) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String firstName="";

        String DRIVER ="com.mysql.jdbc.Driver";
        String URL="jdbc:mysql://localhost:3306/base_cinema";
        String QUERY = "SELECT FirstName FROM PERSONS WHERE Id =? ";

        String user="user_cinema";
        String password  = "12345";

        try {
            System.out.println("1111");
            Class.forName(DRIVER);
            System.out.println("2222");
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,ID);
            resultSet= statement.executeQuery();

            if(resultSet.next())
                firstName= resultSet.getString("FirstName").trim();


        }catch (ClassNotFoundException e) {
            System.err.println("Dupa nie dziala klasa database");

        }finally {
            if(resultSet!=null)
                resultSet.close();
            if(statement !=null)
                statement.close();
            if(connection !=null)
                connection.close();
        }



        return firstName;
    }
}
