import singleton.User;

import java.sql.*;

/**
 * Created by Michał on 2016-01-04.
 */
public class Database {
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    private static Integer id = null;
    public static String DRIVER ="com.mysql.jdbc.Driver";
    private static String URL="jdbc:mysql://localhost:3306/base_cinema";
    private static String user="root";
    private static String password  = "";

    public static void create(String name, String pass) throws SQLException {
        String QUERY = "INSERT INTO users (Name, Pass) VALUES(?, ?)";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,name);
            statement.setString(2,pass);
            id = statement.executeUpdate();// executeQuery();
        }catch (ClassNotFoundException e) {
            e.printStackTrace();

        }finally {
            if(resultSet!=null)
                resultSet.close();
            if(statement !=null)
                statement.close();
            if(connection !=null)
                connection.close();
        }

    }

    public static String login(String name, String pass) throws SQLException {
        String QUERY = "SELECT Id, Name, Pass FROM users WHERE Name =? AND Pass =?";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,name);
            statement.setString(2,pass);
            resultSet = statement.executeQuery();
            if(resultSet.next())
                User.createInstance(Integer.parseInt(resultSet.getString("Id").trim()), resultSet.getString("Name").trim());

            return resultSet.getString("Name").trim();
        }catch (ClassNotFoundException e) {
            e.printStackTrace();

        }finally {
            if(resultSet!=null)
                resultSet.close();
            if(statement !=null)
                statement.close();
            if(connection !=null)
                connection.close();
        }
        return null;
    }
}
