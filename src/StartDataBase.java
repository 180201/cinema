import DAO.Move;
import DAO.Reservation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Winiu on 31-12-2015.
 */
public class StartDataBase {
    public static void main(String[] args) {

        String myID ="1";
        String lastName = null;
        List<Reservation> moves = new ArrayList<>();
        System.out.println("sadasdsad");
        try {
            moves = Database.getMyReservations("6");
        }catch (SQLException e){
            System.err.println("dupa nie dziala");
            e.printStackTrace();
        }
        System.out.println(moves);

    }
}
