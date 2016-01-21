import DAO.Move;
import DAO.Reservation;
import DAO.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        String QUERY = "SELECT Id, Name, Pass, Rank FROM users WHERE Name =? AND Pass =?";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,name);
            statement.setString(2,pass);
            resultSet = statement.executeQuery();
            if(resultSet.next())
                User.createInstance(Integer.parseInt(resultSet.getString("Id").trim()), resultSet.getString("Name").trim(), resultSet.getString("Rank").trim());

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
    public static List<Move> getMoves() throws SQLException {
        String QUERY = "SELECT Id, Name, Date, Time FROM Moves";
        try {
            List<Move> moves = new ArrayList<>();
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moves.add(new Move(Integer.parseInt(resultSet.getString("Id")), resultSet.getString("Name"), resultSet.getString("Date"),resultSet.getString("Time")));
            }
            return moves;
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

    public static Move getMove(Integer id) throws SQLException {
        String QUERY = "SELECT Id, Name, Date, Time FROM Moves WHERE Id = (?)";
        try {
            Move move=null;
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);
            Integer param = 1;
            statement.setInt(param, id);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                move =new Move(Integer.parseInt(resultSet.getString("Id")), resultSet.getString("Name"), resultSet.getString("Date"),resultSet.getString("Time"));
            }
            return move;
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

    public static void createReservation(String user, String move, String row, String place) throws SQLException {
        String QUERY = "INSERT INTO reservations (User, Move, Row, Place) VALUES(?, ?, ?, ?)";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,"root",password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,user);
            statement.setString(2,move);
            statement.setString(3,row);
            statement.setString(4,place);

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


    public static void deleteReservation(Integer idReservation) throws SQLException {
        String QUERY = "DELETE FROM reservations WHERE reservations.Id = ?";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,"root",password);
            statement= connection.prepareStatement(QUERY);

            statement.setInt(1,idReservation);

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

    public static List<Reservation> getMyReservations(String userId) throws SQLException {
        String QUERY = "SELECT * FROM reservations JOIN moves on reservations.Move = moves.Id WHERE User = (?) && reservations.Move = moves.Id";
//        SELECT * FROM reservations, moves WHERE reservations.User = 6 && reservations.Move = moves.Id
        try {
            List<Reservation> reservations = new ArrayList<>();
            List<Move> moves = new ArrayList<>();
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);
            statement.setString(1,userId);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
//                Integer id, Integer user, Integer move, Integer row, Integer place
                Move move = new Move(Integer.parseInt(resultSet.getString("moves.Id")), resultSet.getString("moves.Name"), resultSet.getString("moves.Date"),resultSet.getString("Time"));
                reservations.add(new Reservation(Integer.parseInt(resultSet.getString("reservations.Id")), Integer.parseInt(resultSet.getString("reservations.user")),
                                                 Integer.parseInt(resultSet.getString("reservations.move")),Integer.parseInt(resultSet.getString("reservations.row")),
                                                 Integer.parseInt(resultSet.getString("reservations.place")),move));
            }
            return reservations;
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


    public static Reservation getOneReservation(Integer reservationId) throws SQLException {
        String QUERY = "SELECT * FROM reservations JOIN moves on reservations.Move = moves.Id WHERE reservations.Id = (?) && reservations.Move = moves.Id";
//        SELECT * FROM reservations, moves WHERE reservations.User = 6 && reservations.Move = moves.Id
        try {
            Reservation reservations = null;
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);
            statement.setInt(1,reservationId);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
//                Integer id, Integer user, Integer move, Integer row, Integer place
                Move move = new Move(Integer.parseInt(resultSet.getString("moves.Id")), resultSet.getString("moves.Name"), resultSet.getString("moves.Date"),resultSet.getString("Time"));
                reservations=new Reservation(Integer.parseInt(resultSet.getString("reservations.Id")), Integer.parseInt(resultSet.getString("reservations.user")),
                        Integer.parseInt(resultSet.getString("reservations.move")),Integer.parseInt(resultSet.getString("reservations.row")),
                        Integer.parseInt(resultSet.getString("reservations.place")),move);
            }
            return reservations;
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


    public static List<Reservation> getPlace(String moveId) throws SQLException {
        String QUERY = "SELECT * FROM reservations JOIN moves on reservations.Move = moves.Id WHERE  reservations.Move= (?) && reservations.Move = moves.Id";
//        SELECT * FROM reservations, moves WHERE reservations.User = 6 && reservations.Move = moves.Id
        try {
            List<Reservation> reservations = new ArrayList<>();
            List<Move> moves = new ArrayList<>();
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);
            statement.setString(1,moveId);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
//                Integer id, Integer user, Integer move, Integer row, Integer place
                Move move = new Move(Integer.parseInt(resultSet.getString("moves.Id")), resultSet.getString("moves.Name"), resultSet.getString("moves.Date"),resultSet.getString("Time"));
                reservations.add(new Reservation(Integer.parseInt(resultSet.getString("reservations.Id")), Integer.parseInt(resultSet.getString("reservations.user")),
                        Integer.parseInt(resultSet.getString("reservations.move")),Integer.parseInt(resultSet.getString("reservations.row")),
                        Integer.parseInt(resultSet.getString("reservations.place")),move));
            }
            return reservations;
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

    public static void createMove(String name, String date, String time) throws SQLException {
        String QUERY = "INSERT INTO moves (Name, Date,Time) VALUES(?, ?, ?)";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,name);
            statement.setString(2,date);
            statement.setString(3,time);
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

    public static void deleteMove(Integer idMove) throws SQLException {
        String QUERY = "DELETE FROM moves WHERE moves.Id = ?";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,"root",password);
            statement= connection.prepareStatement(QUERY);

            statement.setInt(1,idMove);

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

    public static void updateMove(String name, String date, String time, Integer id) throws SQLException {
        String QUERY = "UPDATE moves Set moves.Name=?,moves.Date=?,moves.Time=? where moves.Id=?";
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,user,password);
            statement= connection.prepareStatement(QUERY);

            statement.setString(1,name);
            statement.setString(2,date);
            statement.setString(3,time);
            statement.setInt(4,id);
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
}
